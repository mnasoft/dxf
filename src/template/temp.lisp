(in-package :dxf/template)

(defun stream->vector-of-lines (stream)
  "@b(Описание:) функция @b(stream->vector-of-lines) возвращает вектор
строк, которые можно считать из потока @b(stream) при последовательном
считывании."
  (coerce 
   (loop
     :for line = (read-line stream nil 'eof)
     :until (eq line 'eof)
     :collect line)
   'vector))

(defun method-signature (method-name
                         &aux
                           (method-data (find method-name *table-methods-rought* :key #'first :test #'equal))
                           (method-description (third method-data))
                           (vector-of-lines (stream->vector-of-lines (make-string-input-stream method-description))))
  (labels
      ((signature-pos ()
         (loop :for i :from 0
               :for s :across vector-of-lines
               :when (string= "Signature" (first (mnas-string:split " -" s)))
                 :collect i))
       (classes (p)
         (let ((class (second (mnas-string:split "-" (svref  vector-of-lines p)))))
           (cond
             ((stringp class) (mnas-string:split " ," class))
             (t ""))))
       (args (p)
         (remove-duplicates
          (mnas-string:split
           " ,]"
           (string-trim
            "()"
            (subseq
             (second
              (mnas-string:split
               "." 
               (svref vector-of-lines
                      (1+ (position "VBA:" vector-of-lines :test #'equal :start p )))))
             (length method-name))))
          :test #'equal :from-end t))
       (args-to-string (lst)
         (format nil "(~{~A~^ ~})"
         (loop :for i :in lst
               :collect (if (string= "[" i) "&optional" i))))
       (signature ()
         (let ((pos (signature-pos)))
           (loop :for p :in pos
                 :collect
                 (list
                  (classes p) (args-to-string (args p)))))))
    (signature)))

(method-signature "Rotate")
(method-signature "Add")
(method-signature "Update")
(method-signature "AddLeader")
(method-signature "AddLine")



(make-generic-all)
(make-generic-methods  )
(make-classes)


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

