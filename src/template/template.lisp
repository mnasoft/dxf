(defpackage #:dxf/template
  (:use #:cl)
  (:export between
           after)
  (:export select-section)
  (:export split-by-sections
           split-section
           split-entities
           split-blocks
           split-objects
           split-acdsdata
           )
  (:documentation
   "@b(Описание:) пакет @b(dxf/template) содержит методы для построения
   шаблонов классов, методов, свойств и событий, получение которых
   ведется на основе базы данных ActiveX объектов AutoCAD.
"))

(in-package :dxf/template)

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
      
#+nil
(mnas-graph:connected-nodes 
 (mnas-graph:find-node "<acad-xline>" *active-x-object-graph*)
 *active-x-object-graph* :direction :backward )

(mnas-graph/alg:path 
 (mnas-graph:find-node "<acad-xline>" *active-x-object-graph*)
 (mnas-graph:find-node "<object>" *active-x-object-graph*)
 *active-x-object-graph*
 :direction :backward)

(defun find-class-parents ()
  "@b(Описание:) функция @b(find-class-parents) 
"
  (let ((ht-nodes (mnas-graph:nodes *active-x-object-graph*)))
    (loop :for node :being :the :hash-keys :in ht-nodes
          :collect
          (let ((class (assoc (list :DEFCLASS (mnas-graph:name node))
                              *classes-db* :test #'equal)))
            (loop :for i :in 
                         (mnas-graph/alg:path 
                          node
                          (mnas-graph:find-node "<object>" *active-x-object-graph*)
                          *active-x-object-graph*
                          :direction :backward)
                  :collect
                  (mnas-graph:name i))))))

(defparameter *class-parents*
  (find-class-parents)
  "@b(Описание:) переменная @b(*class-parents*) содержит список каждым
   элементом которого является путь от конкретного элемента к
   базовому.
")

(defun find-defclass (class-name)
  (assoc (list :DEFCLASS class-name)
         *classes-db* :test #'equal))

(defun find-parents (class-name)
  (cdr (assoc class-name *class-parents* :test #'equal)))


(defun find-class-data (class-name data)
  (assert
   (member data
           '(:DEFCLASS :PARENTS :DOCUMENTATION :METHODS :PROPERTIES :EVENTS)))
  (second (assoc data (find-defclass class-name))))

(defun find-classes-properties (class-names)
  (remove-duplicates 
   (apply #'append
          (loop :for i :in class-names
                :collect (find-class-data i :PROPERTIES)))
   :test #'equal))

(defun find-defclass-properties (class-name)
  (let ((parents (assoc class-name *class-parents* :test #'equal)))
    parents))

(defun foo ()

(find-classes-properties '("<acad-object>"  "<object>"))

"<acad-entity>"
"<acad-solid>"
(find-parents "<acad-solid>")

(find-defclass "<acad-xline>")

(find-class-data "<acad-xline>"  :PROPERTIES )

(find-class-parents)
