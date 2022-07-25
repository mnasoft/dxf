(defpackage #:dxf/template
  (:use #:cl)
  (:intern load-data
           )
  (:export *table-classes-rought*
           *classes-db*
           *active-x-object-graph*
           )
  (:export *table-methods-rought*
           *table-properties-rought*
           *table-events-rought*
           )
  (:export find-parents
           find-parent
           find-properties
           find-methods
           find-events
           find-documentation
           )
  (:export find-rou-methods
           find-rou-properties
           find-rou-events
           )
  (:export absend-methods
           absend-properties
           absend-events
           )
  (:documentation
   "@b(Описание:) пакет @b(dxf/template) содержит методы для построения
   шаблонов классов, методов, свойств и событий, получение которых
   ведется на основе базы данных ActiveX объектов AutoCAD.
"))

(in-package :dxf/template)

(defun load-data (sys sub-pathname)
  (let ((system sys )
        (sub-pathname sub-pathname))
    (loop :for file :in (uiop:directory-files
                         (asdf:system-relative-pathname system sub-pathname)
                         "*.lisp")
          :collect
          (with-open-file (stream file)
            (read stream)))))

(defparameter *table-methods-rought*
  (load-data :dxf "src/template/methods/"))

(defparameter *table-methods*
  (loop :for (name doc) :in (apply #'append *table-methods-rought*)
        :collect
        (list  (dxf/utils:make-method-name name) doc)))

(defparameter *table-properties-rought*
  (load-data :dxf "src/template/properties/"))

(defparameter *table-properties*
  (loop :for (name doc) :in (apply #'append *table-properties-rought*)
        :collect
        (list  (dxf/utils:make-proprety-name name) doc)))

(defparameter *table-events-rought*
  (load-data :dxf "src/template/events/"))

(defparameter *table-events*
  (loop :for (name doc) :in (apply #'append *table-properties-rought*)
        :collect
        (list  (dxf/utils:make-event-name name) doc)))

(defparameter *table-classes-rought*
  (load-data :dxf "src/template/classes/")
  "@b(Описание:) переменная @b(*table-classes-rought*) содержит базу данных
 классов объектов ActiveX системы AutoCAD.

 @b(Пример записи БД:)
@begin[lang=lisp](code)
  ((:DEFCLASS \"AcadEntity\")
   (:PARENTS \"AcadObject\")
   (:DOCUMENTATION \"@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCA7867D-E354-4F48-9C47-DB22C53A3460\"](IAcadEntity Interface (ActiveX))\")
   (:METHODS \"ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
  GetExtensionDictionary GetXData Highlight IntersectWith Mirror
  Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
  Update\")
   (:PROPERTIES \"Application Document EntityTransparency Handle
  HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
  Lineweight Material ObjectID ObjectName OwnerID PlotStyleName
  TrueColor Visible\")
   (:EVENTS \"Modified\"))
@end(code)

 @b(Поля БД)
@begin(enum)
@item(DEFCLASS - имя класса. Подлежит разделению на слова: из
      AcadEntity в acad-entity;)
@item(PARENTS - имя родительск(ого)(их) класс(а)(ов). Подлежит
      разделению на слова.)
@item(DOCUMENTATION - ссылка на документацию;)
@item(METHODS - список методов;)
@item(PROPERTIES - список свойств. Для конкретного класса необходимо
      исключить свойства, относящиеся к его родителям. Имена свойств
      подлежит разделению на слова.)
@item(EVENTS - список событий, обрабарываемых системой.)
@end(enum)

 Если поле PARENTS, METHODS, PROPERTIES или EVENTS содержит None, то
это поле считается пустым.
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun convert-db (a-lst)
  "@b(Описание:) функция @b(convert-db) возвращает список,
   представляющий БД ActiveX представления AutoCAD в
   преобразованном (чистовом) формате.
"
  (let ((class   (assoc :DEFCLASS a-lst))
        (parents #+nil (assoc :PARENTS a-lst)
                 (loop :for a :in (mnas-string:split
                                   (format nil " ~%")
                                   (second (assoc :PARENTS a-lst)))
                       :collect
                       (dxf/utils:make-class-name a)))
        (documentation (assoc :DOCUMENTATION a-lst))
        (methods (loop :for m :in (mnas-string:split
                                   (format nil " ~%")
                                   (second (assoc :METHODS a-lst)))
                       :collect
                       (dxf/utils:make-method-name m)))
        (properties (loop :for p :in (mnas-string:split
                                      (format nil " ~%")
                                      (second (assoc :PROPERTIES a-lst)))
                          :collect
                          (dxf/utils:make-proprety-name p)) )
        (events (loop :for e :in (mnas-string:split
                                  (format nil " ~%")
                                  (second (assoc :EVENTS a-lst)))
                      :collect
                      (dxf/utils:make-event-name e))))
    (list
     (list (first class)
           (dxf/utils:make-class-name (second class)))
     (list :PARENTS parents)
     #+nil (list (first parents)
                 (dxf/utils:make-class-name (second parents)))
     documentation
     (list :METHODS (set-difference methods '("md-none") :test #'equal))
     (list :PROPERTIES (set-difference properties '("pr-none") :test #'equal))
     (list :EVENTS (set-difference events '("ev-none") :test #'equal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *classes-db*
    (loop :for i :in *table-classes-rought* 
        :collect
        (convert-db i))
  "@b(Описание:) переменная @b(*classes-db*) содержит базу данных
 классов объектов ActiveX системы AutoCAD в преобразованном (чистовом)
 формате.
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *active-x-object-graph*
  (mnas-graph:make-graph
   (let ((rez))
     (loop :for i :in *classes-db* :do
       (loop :for a :in (second (assoc :parents i)) :do
         (push (list a (second (assoc :defclass i))) rez)))
     rez))
  "@b(Описание:) переменная @b(*active-x-object-graph*) представляет
   граф дерева наследования объектов ActiveX системы AutoCAD.")

(defun find-class-parents ()
  "@b(Описание:) функция @b(find-class-parents) 
"
  (let ((ht-nodes (mnas-graph:nodes *active-x-object-graph*)))
    (loop :for node :being :the :hash-keys :in ht-nodes
          :collect
          (loop :for i :in 
                         (mnas-graph/alg:path 
                          node
                          (mnas-graph:find-node "<object>" *active-x-object-graph*)
                          *active-x-object-graph*
                          :direction :backward)
                  :collect
                  (mnas-graph:name i)))))

(defparameter *class-parents*
  (find-class-parents)
  "@b(Описание:) переменная @b(*class-parents*) содержит список каждым
   элементом которого является путь от конкретного элемента к
   базовому.
")

(defun find-defclass (class-name)
  (assoc (list :DEFCLASS class-name)
         *classes-db* :test #'equal))

(defun find-rou-defclass (class-name)
  (assoc (list :DEFCLASS class-name)
         *table-classes-rought* :test #'equal))

(defun find-class-data (class-name data)
  (assert
   (member data
           '(:DEFCLASS :PARENTS :DOCUMENTATION :METHODS :PROPERTIES :EVENTS)))
  (second (assoc data (find-defclass class-name))))

(defun find-rou-class-data (class-name data)
  (assert
   (member data
           '(:DEFCLASS :PARENTS :DOCUMENTATION :METHODS :PROPERTIES :EVENTS)))
  (second (assoc data (find-rou-defclass class-name))))

(defun find-classes-properties (class-names)
  (remove-duplicates 
   (apply #'append
          (loop :for i :in class-names
                :collect (find-class-data i :PROPERTIES)))
   :test #'equal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun find-parents (class-name)
  
  (cdr (assoc class-name *class-parents* :test #'equal)))

(defun find-parent (class-name)
  "@b(Описание:) функция @b(find-parent) возвращает  ближайшего предка класса.
"
  (second (find-parents class-name)))


(defun find-methods (class-name)
  (find-class-data class-name :METHODS))

(defun find-properties (class-name)
  (let* ((parents (cdr (assoc class-name *class-parents* :test #'equal))))
    (set-difference (find-classes-properties (list class-name))
                    (find-classes-properties parents)
                    :test #'equal)))

(defun find-events (class-name)
  (find-class-data class-name :EVENTS))

(defun find-documentation (class-name)
  (find-class-data class-name :DOCUMENTATION))

;;;;;;;;;;

(defun find-rou-methods (rou-class-name)
  (remove "None"
          (mnas-string:split
           `,(format nil " ~%")
           (find-rou-class-data rou-class-name :METHODS))
          :test #'equal))

(defun find-rou-properties (rou-class-name)
  (remove "None"
          (mnas-string:split
           `,(format nil " ~%")
           (find-rou-class-data rou-class-name :PROPERTIES))
          :test #'equal))

(defun find-rou-events (rou-class-name)
  (remove "None"
          (mnas-string:split
           `,(format nil " ~%")
           (find-rou-class-data rou-class-name :EVENTS))
          :test #'equal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(loop :for i :in *classes-db* :do
  (let ((class-name (cadr (assoc :DEFCLASS i))))
    (let ((md (find-methods        class-name))
          (pr (find-properties     class-name))
          (ev (find-events         class-name))
          (doc (find-documentation class-name))
          (pars (let ((par
                        (find-parent class-name)))
                  (if par (list par ) par))))
      (format t "(defclass ~A ~A~%" class-name pars doc)
      (format t "()~%")
      (format t "(:documentation ~S)~%~%" doc))))

;;md pr ev

(find-properties "<acad-line>")

(find-classes-properties )

(defclass <acad-line> (<acad-entity>)
  ((StartPoint :accessor StartPoint  :initarg :StartPoint  :initform (vector 0d0 0d0 0d0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (EndPoint   :accessor EndPoint    :initarg :EndPoint    :initform (vector 0d0 0d0 0d0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (Thickness  :accessor Thickness   :initarg :thickness   :initform 0d0                   :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (Normal     :accessor Normal      :initarg :Normal      :initform (vector 0d0 0d0 1d0)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   ;;;; (Angle) (Delta) (Length)
   )

  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66\"](LINE (DXF))
@begin[lang=txt](code)
См. ./dbents.h:class AcDbLine: public AcDbCurve
@end(code)
@begin[lang=txt](code)
;   Angle (RO) = 2.54047
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff77d4470f8>
;   Delta (RO) = (-1.58936 1.08997 0.0)
;   Document (RO) = #<VLA-OBJECT IAcadDocument 00000142daa47188>
;   EndPoint = (-1.58936 1.09759 0.0)
;   EntityTransparency = \"ByLayer\"
;   Handle (RO) = \"162\"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 00000142eeeb8188>
;   Layer = \"0\"
;   Length (RO) = 1.9272
;   Linetype = \"ByLayer\"
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = \"ByBlock\"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 42
;   ObjectName (RO) = \"AcDbLine\"
;   OwnerID (RO) = 43
;   PlotStyleName = \"ByLayer\"
;   StartPoint = (0.0 0.00762657 0.0)
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 00000142eeebf020>
;   Visible = -1
@end(code)
"))
