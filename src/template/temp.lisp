(in-package :dxf/template)

(loop :for i :in *table-classes* :do
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
      (format t "(:documentation ~S)~%~%" doc)
      )))

(let ((rez nil))
  (defun foo (graph)
    (let ((lst (mnas-hash-table:keys
                (mnas-graph:outlet-nodes graph))))
      (map nil
           #'(lambda (el)
               (mnas-graph:remove-from el graph))
           lst)
      (setf rez (append rez lst))
      rez)))

(hash-table-count (mnas-graph:outlet-nodes *active-x-object-graph*))

(let ((graph *active-x-object-graph*))
  (foo graph))

(mnas-graph:inlet-edges
 (mnas-graph:find-node "<acad-object>" *active-x-object-graph* )
 *active-x-object-graph*)

(mnas-graph/view:view-graph *active-x-object-graph*)
  
(let ((class-name "<acad-line>"))
  (let ((md (find-methods        class-name))
        (pr (find-properties     class-name))
        (ev (find-events         class-name))
        (doc (find-documentation class-name))
        (pars (let ((par
                      (find-parent class-name)))
                (if par (list par ) par))))
    (format t "(defclass ~A ~A~%" class-name pars doc)
    (format t "()~%")
    (format t "(:documentation ~S))~%~%" doc)
    (format t ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;~%" )
    (format t ";;;; properties~%")
    (loop :for i :in pr :do
      (format t "(defmethod ~A ((~A ~A)))~1%" i (string-trim "<>" class-name) class-name)
      (format t "(defmethod (setf ~A) (value (~A ~A)))~2%" i (string-trim "<>" class-name) class-name))
    (format t ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;~%" )
    (format t ";;;; methods~%")
    (loop :for i :in md :do
      (format t "(defmethod ~A ((~A ~A) &rest args))~1%" i (string-trim "<>" class-name) class-name))
    (format t ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;~%" )
    (format t ";;;; events~%" )
    (loop :for i :in ev :do
      (format t "(defmethod ~A ((~A ~A) &rest args))~1%" i (string-trim "<>" class-name) class-name))))

(make-generic-all)


(defclass <acad-line> (<acad-entity>)
  ((StartPoint :accessor StartPoint  :initarg :StartPoint  :initform (vector 0d0 0d0 0d0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (EndPoint   :accessor EndPoint    :initarg :EndPoint    :initform (vector 0d0 0d0 0d0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (Thickness  :accessor Thickness   :initarg :thickness   :initform 0d0                   :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (Normal     :accessor Normal      :initarg :Normal      :initform (vector 0d0 0d0 1d0)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   ;;;; (Angle) (Delta) (Length)
   )

  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66\"](LINE (DXF))
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

