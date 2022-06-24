(defpackage #:dxf/template
  (:use #:cl)
  (:export *classes-db-rought*
           *classes-db*
           *active-x-object-graph*)
  (:export find-parents
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

(defparameter *m-renaming*
  '(("ARX" "Arx")
    ("DVB" "Dvb")))


(defun class-files ()
  "@b(Описание:) функция @b(class-files) возвращает список путей к
 файлам с расшиением *.lisp в подкаталоге src/template/classes системы
 dxf.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (class-files) 
@end(code)

"
  (uiop:directory-files
   (asdf:system-relative-pathname :dxf "src/template/classes/")
   "*.lisp"))

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

(defparameter *classes-db-rought* 
  (loop :for file :in (class-files)
        :collect
        (with-open-file (stream file)
          (read stream)
          (read stream)))
  "@b(Описание:) переменная @b(*classes-db-rought*) содержит базу данных
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

(defparameter *classes-db*
    (loop :for i :in *classes-db-rought* 
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

(mnas-graph/view:view-graph *active-x-object-graph*)

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
         *classes-db-rought* :test #'equal))

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

(defun absend-properties ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-properties (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *properties-db-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

(defun absend-methods ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-methods (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *methods-db-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

(defun absend-events ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-events (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *events-db-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(absend-methods)
(absend-properties)
(absend-events)

