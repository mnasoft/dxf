(defpackage #:dxf/template
  (:use #:cl)
  (:intern load-data
           )
  (:export *table-classes*
           *table-methods*
           *table-properties*
           *table-events*
           *active-x-object-graph*
           *class-parents*
           )
  (:export *table-classes-rought*
           *table-methods-rought*
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
  (:export make-generic-property
           make-generic-properties
           make-generic-method
           make-generic-methods
           make-generic-event
           make-generic-events
           make-generic-all
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
  (load-data :dxf "src/template/methods/")
  "@b(Описание:) переменная @b(*table-methods-rought*) содержт список
 методов системы AutoCAD.  Каждый элемент состоит из имени метода и
 ссылки на его описание.  Имена методов здесь находятся в первозданном
 виде (как это есть в ActiveX).")

(defparameter *table-methods*
  (loop :for (name doc) :in (apply #'append *table-methods-rought*)
        :collect
        (list  (dxf/utils:make-method-name name) doc))
  "@b(Описание:) переменная @b(*table-methods-rought*) содержт список
 методов системы AutoCAD.  Каждый элемент состоит из имени метода и
 ссылки на его описание.  Имена методов здесь находятся в
 преобразованном виде (согласно традиций Common Lisp).")

(defparameter *table-properties-rought*
  (load-data :dxf "src/template/properties/")
  "@b(Описание:) переменная @b(*table-properties-rought*) содержт список
 свойств системы AutoCAD.  Каждый элемент состоит из имени свойства и
 ссылки на его описание.  Имена свойств здесь находятся в первозданном
 виде (как это есть в ActiveX).")

(defparameter *table-properties*
  (loop :for (name doc) :in (apply #'append *table-properties-rought*)
        :collect
        (list  (dxf/utils:make-proprety-name name) doc))
    "@b(Описание:) переменная @b(*table-properties*) содержт
 список свойств системы AutoCAD.  Каждый элемент состоит из имени
 свойства и ссылки на его описание.  Имена свойств здесь находятся в
 преобразованном виде (согласно традиций Common Lisp).")

(defparameter *table-events-rought*
  (load-data :dxf "src/template/events/")
  "@b(Описание:) переменная @b(*table-events-rought*) содержт список
 событий системы AutoCAD.  Каждый элемент состоит из имени события и
 ссылки на его описание.  Имена событий здесь находятся в первозданном
 виде (как это есть в ActiveX).")

(defparameter *table-events*
  (loop :for (name doc) :in (apply #'append *table-events-rought*)
        :collect
        (list  (dxf/utils:make-event-name name) doc))
    "@b(Описание:) переменная @b(*table-events*) содержт список
 событий системы AutoCAD.  Каждый элемент состоит из имени события и
 ссылки на его описание.  Имена событий здесь находятся в первозданном
 виде (как это есть в ActiveX).")

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

(defparameter *table-classes*
    (loop :for i :in *table-classes-rought* 
        :collect
        (convert-db i))
  "@b(Описание:) переменная @b(*table-classes*) содержит базу данных
 классов объектов ActiveX системы AutoCAD в преобразованном (чистовом)
 формате.
")

(defparameter *active-x-object-graph*
  (mnas-graph:make-graph
   (let ((rez))
     (loop :for i :in *table-classes* :do
       (loop :for a :in (second (assoc :parents i)) :do
         (push (list a (second (assoc :defclass i))) rez)))
     rez))
  "@b(Описание:) переменная @b(*active-x-object-graph*) представляет
   граф дерева наследования объектов ActiveX системы AutoCAD.")

(defun make-class-parents-table ()
  "@b(Описание:) функция @b(make-class-parents-table) возвращает
 список каждым элементом которого является путь от конкретного
 элемента к базовому - <object>.

 Например для объекта \"<acad-line>\" запись будет иметь следующий
 вид: 
 (\"<acad-line>\" \"<acad-entity>\" \"<acad-object>\" \"<object>\")."
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
  (make-class-parents-table)
  "@b(Описание:) переменная @b(*class-parents*) содержит список каждым
   элементом которого является путь от конкретного элемента к
   базовому.")

(defun find-defclass (class-name)
  "@b(Описание:) функция @b(find-defclass) возвращает преобразованную
  запись соответствующую преобразованному имени класса.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (find-defclass \"<acad-section>\")
@end(code)"
  (assoc (list :DEFCLASS class-name)
         *table-classes* :test #'equal))

(defun find-rou-defclass (rought-class-name)
    "@b(Описание:) функция @b(find-defclass) возвращает первозданную
  запись соответствующую имени класса.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (find-rou-defclass \"AcadSection\")
@end(code)"
  (assoc (list :DEFCLASS rought-class-name)
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

(defun find-parents (class-name)
  (cdr (assoc class-name *class-parents* :test #'equal)))

(defun find-parent (class-name)
  "@b(Описание:) функция @b(find-parent) возвращает  ближайшего предка класса.
"
  (first (find-parents class-name)))

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

(defun make-generic-property (property-record)
  (format t "(defgeneric ~A (obj)
  (:documentation ~S))~2%" (first property-record) (second property-record)))

(defun make-generic-properties ()
  (loop :for i :in *table-properties* :do
    (make-generic-property i)))

(defun make-generic-method (method-record)
  (format t "(defgeneric ~A (obj &rest args)
  (:documentation ~S))~2%" (first method-record) (second method-record)))

(defun make-generic-methods ()
  (loop :for i :in *table-methods* :do
    (make-generic-method i)))

(defun make-generic-event (event-record)
  (format t "(defgeneric ~A (obj &rest args)
  (:documentation ~S))~2%" (first event-record) (second event-record)))

(defun make-generic-events ()
  (loop :for i :in *table-events* :do
    (make-generic-method i)))

(defun make-generic-all ()
  (make-generic-properties)
  (make-generic-methods)
  (make-generic-events))
