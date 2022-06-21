(in-package :dxf)

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

(ql:quickload :mnas-string)

(defun convert-db (a-lst)
  "@b(Описание:) функция @b(convert-db) возвращает список,
представляющий БД ActiveX представления AutoCAD в преобразованном (чистовом) формате.
"
  (let ((class   (assoc :DEFCLASS a-lst))
        (parents (assoc :PARENTS a-lst))
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
     (list (first parents)
           (dxf/utils:make-class-name (second parents)))
     documentation
     (list :METHODS (set-difference methods '("md-none") :test #'equal))
     (list :PROPERTIES (set-difference properties '("pr-none") :test #'equal))
     (list :EVENTS (set-difference events '("ev-none") :test #'equal)))))

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
(ql:quickload :mnas-graph)

(defparameter *g*
 (mnas-graph:make-graph
  (set-difference
   (loop :for i :in *classes-db*
         :collect
         (list (cadr (assoc :parents i))
               (cadr (assoc :defclass i))
               ))
   '((""))
   :key #'first :test  #'equal)))

(mnas-graph/view:view-graph *g*)
      
(ql:quickload :mnas-graph)

(mnas-graph:connected-nodes 
 (mnas-graph:find-node *g* "AcadObject"))

(dxf/utils:make-class-name "AcadObjectID")
(dxf/utils:make-method-name "AcadObjectID")
(dxf/utils:make-proprety-name "AcadObjectID")
(dxf/utils:make-e-name "AcadObjectID")

((:DEFCLASS "Acad3DFace") (:PARENTS "AcadEntity")
  (:DOCUMENTATION
   "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DAB32FC-8C8A-4116-BD3A-CF733740DF8F\"](3DFace Object (ActiveX))")
  (:METHODS "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetInvisibleEdge GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetInvisibleEdge SetXData TransformBy Update")
  (:PROPERTIES "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName TrueColor VisibilityEdge1 VisibilityEdge2
   VisibilityEdge3 VisibilityEdge4 Visible")
  (:EVENTS "Modified"))
