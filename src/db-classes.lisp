;;;; db-classes.lisp
;;;; Test
;;;; Test 2

(in-package #:dxf)

(defun make-slot (el)
  "Вспмогательная функция для формирования слотов"
  (list  el
	 :accessor el
	 :initarg (read-from-string (concatenate 'string ":"(symbol-name el)))
	 :initform nil
	 :documentation (symbol-name el)))

(defparameter *radian-to-degree* (/ 180 pi))

(defparameter *degree-to-radian* (/ pi 180))

(defclass ge-point-3d ()
    ((point-3d :accessor point-3d :initarg :point-3d :initform (vector 0 0 0))))

(defmethod write-dxf-binary (code (point-3d ge-point-3d) stream)
  (dxf-out-binary-double (+ 00 code) (svref (point-3d point-3d) 0) stream)
  (dxf-out-binary-double (+ 10 code) (svref (point-3d point-3d) 1) stream)
  (dxf-out-binary-double (+ 20 code) (svref (point-3d point-3d) 2) stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass rx-object ()
  ((name :accessor name :initarg :name :initform "")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass dxf-pairs ()
  ((pairs :accessor pairs        :initarg :pairs        :initform nil :documentation "pairs"))
  (:documentation
   "Содержит dxf-представление объекта"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(export 'dxf-in-text)

(defgeneric dxf-in-text (object pairs)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-in-text) считывает данные из
@b(pairs) в @b(object).
")
  )

(defmethod  dxf-in-text ((object dxf-pairs) (pairs cons))
;;; (break "dxf-in-text ((object dxf-pairs) (pairs cons))")
  object)

(defmethod  dxf-in-text :after ((object dxf-pairs) (pairs cons))
;;; (break "dxf-in-text :after ((object dxf-pairs) (pairs cons))")
  (setf (pairs object) (copy-list pairs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass object () ())

(defparameter *object-properties* '())
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Acad-Object-class-marker* "OBJECT")

(defparameter *Acad-Object-subclass-marker* "AcDbObject")

(defclass acad-object (object)
  ((ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
   (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
   (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "Код   5. Дескриптор ac-handle  -> Handle") 
   (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
   (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
   (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
   (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "Код 330. ac-owner-id -> Owner-ID")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (next-handle      :accessor next-handle   :initarg :next-handle   :initform 1   :allocation :class))
  (:documentation "The standard interface for a basic AutoCAD object."))

(defparameter *acad-object-properties* '(Application Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(mapcar #'make-slot (set-difference *acad-object-properties* *object-properties*))

(export 'dxf-out-text)

(defgeneric dxf-out-text (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в текстовом формате."))

(defmethod dxf-out-text ((x Acad-Object) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-text :after ((x Acad-Object) stream)
  (let (
	(hdl (Handle x))
	(own (Owner-ID x)))
    (when hdl (dxf-out-t-hex   5 hdl stream))
    (when own (dxf-out-t-hex 330 own stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric dxf-out-binary (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в двоичном формате."))

(defmethod dxf-out-binary ((x Acad-Object) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x Acad-Object) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf-out-t-hex 330 own stream))
    (when hdl (dxf-out-t-hex   5 hdl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text ((object acad-object) (pairs cons))
;;; (break "dxf-in-text ((object acad-object) (pairs cons))")
    )

(defmethod  dxf-in-text :after ((object acad-object) (pairs cons))
;;; (break "dxf-in-text :after ((object acad-object) (pairs cons))")

  (let ((c-5   (cadr (assoc   5 pairs :test #'equal)))
	(c-330 (cadr (assoc 330 pairs :test #'equal))))
    ;;    (break "~A ~A"  c-5 c-330)
    (when c-5   (setf (Handle   object) c-5))
    (when c-330 (setf (Owner-ID object) c-330))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-entity-class-marker* "ENTITY")

(defparameter *acad-entity-subclass-marker* "AcDbEntity")

(defclass acad-entity (acad-object)
  ((layer                :accessor layer           :initarg :layer  :initform "0" :documentation "Код   8. Имя слоя  entity-layer -> Layer" )
   (entity-transparency)
   (line-type            :accessor line-type       :initarg :line-type  :initform "BYLAYER" :documentation "Код   6. Linetype name (present if not BYLAYER). The special name BYBLOCK indicates a floating linetype (optional) | BYLAYER |" )
   (hyperlinks)
   (line-type-scale      :accessor line-type-scale :initarg :line-type-scale  :initform 1.0d0 :documentation "Код 48")
   (line-weight          :accessor line-weight     :initarg :line-weight      :initform -1    :documentation "| 370 | Lineweight enum value. Stored and moved around as a 16-bit integer. | not omitted |")
   (material)
   (PlotStyleName)
   (truecolor            :accessor truecolor       :initarg :truecolor :initform *color-bylayer* :documentation "Код   62 и 420" )
   (visible              :accessor visible         :initarg :visible :initform t :documentation " 60 | Object visibility (optional): 0 = Visible 1 = Invisible | 0"))
; (plotstylename :accessor plotstylename :initarg :plotstylename :initform nil :documentation "plotstylename")
; (material :accessor material :initarg :material :initform nil :documentation "material")

  (:documentation "См. ./dbmain.h:class ADESK_NO_VTABLE AcDbEntity: public AcDbObject

"))

(defparameter *acad-entity-properties* '(Application Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-entity-properties* *acad-object-properties*)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-text ((x acad-entity) stream)
  (dxf-out-t-string 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-entity) stream)
  (dxf-out-t-string 100 *acad-entity-subclass-marker* stream)
  (let ((la  (Layer  x))
	(cl  (truecolor x))
	(lt  (line-type  x))
	(vi  (visible   x))
	(lts (line-type-scale x))
	(lw  (line-weight x))
	)
    (dxf-out-t-string 8 la stream)
    (unless (string= "BYLAYER" lt ) (dxf-out-t 6 lt stream))
    (cond
      ((= 256 (first cl)))
      ((= 0   (first cl)) (dxf-out-t 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf-out-t-int16 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf-out-t-int16 62  (first cl) stream)
       (dxf-out-t-int32 420 (color-rgb-to-truecolor (second cl)) stream)))
    (unless (= lts 1.d0) (dxf-out-t 48 lts stream))
    (unless (= lw -1) (dxf-out-t-int16  370 lw stream))
    (unless vi  (dxf-out-t 60 1   stream))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LLLL;;

(defmethod dxf-out-binary ((x acad-entity) stream)
  (dxf-out-b-string 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-entity) stream)
  (dxf-out-b-string 100 *acad-entity-subclass-marker* stream)
  (let ((hdl (Handle x))
	(la (Layer x))
	(cl (truecolor x)))
    (when hdl (dxf-out-b-hex 5 hdl stream))
    (dxf-out-b-string 8 la stream)
    (unless (= 256 cl) (dxf-out-b-int16 62  cl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text :after ((object acad-entity) (pairs cons))
  (let ((c-8   (cadr (assoc   8 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal)))
	(c-60  (cadr (assoc  60 pairs :test #'equal)))
	(c-48  (cadr (assoc  48 pairs :test #'equal)))
	(c-370 (cadr (assoc 370 pairs :test #'equal)))
	)
    (when c-8   (setf (layer     object) c-8))
    (when c-6   (setf (line-type  object) c-6))
    (cond
      ((and c-62 c-420)
       (setf (truecolor object)
	     (list c-62 (color-truecolor-to-rgb   c-420))))
      (c-62
       (setf (truecolor object)
	     (list c-62 nil)))
      (t
       (setf (truecolor object) (list 256 nil))))
    (cond
      ((numberp c-48) (setf (line-type-scale  object) c-48))
      ((null    c-48) (setf (line-type-scale  object) 1.d0))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-48 value ~A" c-48)))
    (cond
      ((null    c-370) (setf (line-weight object) -1))
      ((numberp c-370) (setf (line-weight object) c-370))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-370 value ~A" c-370)))
    (cond
      ((null c-60)           (setf (visible object) t))
      ((and c-60 (= c-60 0)) (setf (visible object) t))
      ((and c-60 (= c-60 1)) (setf (visible object) nil))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-60 value ~A" c-60)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-curve-class-marker* "CURVE")

(defparameter *db-curve-subclass-marker* "AcDbCurve")

(defclass db-curve (acad-entity) ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-line-class-marker* "LINE")

(defparameter *acad-line-subclass-marker* "AcDbLine")

(defclass acad-line (acad-entity)
  ((StartPoint :accessor StartPoint  :initarg :StartPoint  :initform (vector 0d0 0d0 0d0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (EndPoint   :accessor EndPoint    :initarg :EndPoint    :initform (vector 0d0 0d0 0d0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (Thickness  :accessor Thickness   :initarg :thickness   :initform 0d0                   :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (Normal     :accessor Normal      :initarg :Normal      :initform (vector 0d0 0d0 1d0)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (Angle)
   (Delta)
   (Length))

  (:documentation "См. ./dbents.h:class AcDbLine: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66

LINE (DXF)
К объектам линии применяются следующие групповые коды.
Групповые коды линии
|---------------+---------------------------------------------------------------------------|
| Групповой код | Описание                                                                  |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLine)                                               |
|---------------+---------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Начальная точка (в МСК)                                                   |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начальной точки (в МСК)                      |
|---------------+---------------------------------------------------------------------------|
|            11 | Конечная точка (в МСК)                                                    |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z конечной точки (в МСК)                           |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|---------------+---------------------------------------------------------------------------|

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
"))

(defmethod dxf-out-text ((x Acad-Line) stream)
  (dxf-out-t-string 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-text :after ((x Acad-Line) stream)
  (dxf-out-t-string 100 *Acad-Line-subclass-marker* stream)
  (let ((th  (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-s stream)
    (dxf-out-t-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf-out-t-point-3d nrm 210 stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Acad-Line) stream)
  (dxf-out-b-string 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-binary :after ((x Acad-Line) stream)
  (dxf-out-b-string 100 *Acad-Line-subclass-marker* stream)
  (let ((th (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-s stream)
    (dxf-out-b-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf-out-b-point-3d nrm 210 stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-line) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-line-class-marker*)))

(defmethod  dxf-in-text :after ((object Acad-Line) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	(c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (StartPoint object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (StartPoint object) (vector c-10 c-20 0d0)))
      (t                           (setf  (StartPoint object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (EndPoint   object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (EndPoint   object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (EndPoint   object) (vector 0.d0 0.d0 0.d0))))
    (cond
      (c-39     (setf  (thickness   object) c-39))
      (t        (setf  (thickness   object) 0.0d0)))
    (cond
      ((and c-210 c-220 c-230)     (setf  (normal   object) (vector c-210 c-220 c-230)))
      (t                           (setf  (normal   object) (vector 0.0d0 0.0d0 1.0d0))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-point-class-marker* "POINT")

(defparameter *acad-point-subclass-marker* "AcDbPoint")

(defclass acad-point (acad-entity)
  ((coordinates :accessor coordinates :initarg :coordinates    :initform (vector 0.0d0 0.0d0 0.0d0) :documentation "Код  10. Положение точки")
   (thickness   :accessor thickness   :initarg :thickness      :initform 0.0d0                      :documentation "Код  39. Высота выдавливания")
   (normal      :accessor normal      :initarg :normal         :initform (vector 0.0d0 0.0d0 1.0d0) :documentation "Код 210. Направление выдавливания")
   (ecs-angle   :accessor ecs-angle   :initarg :ecs-angle      :initform 0.0d0                      :documentation "Код  50. Поворот системы координат объекта"))

  (:documentation "См. ./dbents.h:class AcDbPoint: public AcDbEntity
		  http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317
		  http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317

POINT (DXF)
К точечным объектам применяются следующие групповые коды.
Групповые коды точки 
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbPoint)                                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            10 | Местоположение точки (в МСК)                                                                                                              |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для местоположения точки (в МСК)                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                                                                                        |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                                                                 |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Угол оси X для ПСК, используемый при построении точки (необязательно, по умолчанию = 0); используется, если параметр PDMODE не равен нулю |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
"))

(defparameter *acad-point-properties* '(Application Coordinates Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Thickness TrueColor Visible))

(mapcar #'make-slot (set-difference *acad-point-properties* *acad-entity-properties*))

(defmethod dxf-out-text ((x acad-point) stream)
    (dxf-out-t-string 0 *acad-point-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-point) stream)
  (dxf-out-t-string 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th  0) (dxf-out-t-double  39 th stream))
    (dxf-out-t-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-t-double 50 ecs stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-point) stream)
  (dxf-out-b-string 0 *acad-point-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-point) stream)
  (dxf-out-b-string 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-b-double 50 ecs stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-point) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-point-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-point) (pairs cons))
  (let ((c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	(c-50  (cadr (assoc  50 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (coordinates object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (coordinates object) (vector c-10 c-20 0.d0)))
      (t                           (setf  (coordinates object) (vector 0.d0 0.d0 0.d0))))
    (cond
      (c-39     (setf  (thickness   object) c-39))
      (t        (setf  (thickness   object) 0.0d0)))
    (cond
      ((and c-210 c-220 c-230)     (setf  (normal   object) (vector c-210 c-220 c-230)))
      (t                           (setf  (normal   object) (vector 0.0d0 0.0d0 1.0d0))))
    (cond
      (c-50     (setf  (ecs-angle   object) c-50))
      (t        (setf  (ecs-angle   object) 0.0d0)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-ray-class-marker* "RAY")

(defparameter *acad-ray-subclass-marker* "AcDbRay")

(defclass acad-ray (acad-entity)
  ((base-point       :accessor base-point       :initarg :base-point       :initform (vector 0.0d0 0.0d0 0.0d0) :documentation "Код 10. Базовая точка")
   (direction-vector :accessor direction-vector :initarg :direction-vector :initform (vector 1.0d0 0.0d0 0.0d0) :documentation "Код 11. Едининчный вектор в МСК, задающий направление")
;;;; (second-point :accessor second-point :initarg :second-point :initform nil :documentation "second-point")
   )
  (:documentation "См. ./dbray.h:class AcDbRay: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415

RAY (DXF)
К объектам луча применяются следующие групповые коды.
Групповые коды луча 
|---------------+--------------------------------------------------------------|
| Групповой код | Описание                                                     |
|---------------+--------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbRay)                                   |
|---------------+--------------------------------------------------------------|
|            10 | Начальная точка (в МСК)                                      |
|               | Файл DXF: значение X; приложение: 3D-точка                   |
|---------------+--------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начальной точки (в МСК)         |
|---------------+--------------------------------------------------------------|
|            11 | Вектор единичного направления (в МСК)                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                  |
|---------------+--------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z вектора направления единицы (в МСК) |
|---------------+--------------------------------------------------------------|
"))

(defparameter *acad-ray-properties* '(Application BasePoint DirectionVector Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName SecondPoint TrueColor Visible))

(mapcar #'make-slot (set-difference *acad-ray-properties* *acad-entity-properties*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-text ((x acad-ray) stream)
  (dxf-out-t-string 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-text  :after ((x acad-ray) stream)
  (dxf-out-t-string 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-t-point-3d 10 b-p stream)
    (dxf-out-t-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x acad-ray) stream)
  (dxf-out-b-string 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-binary  :after ((x acad-ray) stream)
  (dxf-out-b-string 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-b-point-3d 10 b-p stream)
    (dxf-out-b-point-3d 11 u-d stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-ray) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-ray-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-ray) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (base-point object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (base-point object) (vector c-10 c-20 0d0)))
      (t                           (setf  (base-point object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (direction-vector object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (direction-vector object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (direction-vector object) (vector 1.d0 0.d0 0.d0))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-xline-class-marker* "XLINE")

(defparameter *acad-xline-subclass-marker* "AcDbXline")

(defclass acad-xline (acad-entity)
  ((base-point :accessor base-point :initarg :base-point :initform (vector 0 0 0) :documentation "Код 10. Первая точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (direction-vector   :accessor direction-vector   :initarg :direction-vector   :initform (vector 1 0 0) :documentation "Код 40. Вектор единичного направления (в МСК). Файл DXF: значение X; приложение: 3D-вектор")
;;; (secondpoint :accessor secondpoint :initarg :secondpoint :initform nil :documentation "secondpoint")
   )
  (:documentation "См. ./dbxline.h:class AcDbXline: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A

XLINE (DXF)
К объектам XLINE применяются следующие групповые коды.
Групповые коды XLINE
|---------------+--------------------------------------------------------------|
| Групповой код | Описание                                                     |
|---------------+--------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbXline)                                 |
|---------------+--------------------------------------------------------------|
|            10 | Первая точка (в МСК)                                         |
|               | Файл DXF: значение X; приложение: 3D-точка                   |
|---------------+--------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z первой точки (в МСК)                |
|---------------+--------------------------------------------------------------|
|            11 | Вектор единичного направления (в МСК)                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                  |
|---------------+--------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z вектора направления единицы (в МСК) |
|---------------+--------------------------------------------------------------|
"))


(defparameter *acad-xline-properties* '(Application BasePoint DirectionVector Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName SecondPoint TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-xline-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x acad-xline) stream)
  (dxf-out-t-string 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-text  :after ((x acad-xline) stream)
  (dxf-out-t-string 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-t-point-3d 10 b-p stream)
    (dxf-out-t-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x acad-xline) stream)
  (dxf-out-b-string 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-binary  :after ((x acad-xline) stream)
  (dxf-out-b-string 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-b-point-3d 10 b-p stream)
    (dxf-out-b-point-3d 11 u-d stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-xline) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-xline-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-xline) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (base-point object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (base-point object) (vector c-10 c-20 0d0)))
      (t                           (setf  (base-point object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (direction-vector object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (direction-vector object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (direction-vector object) (vector 1.d0 0.d0 0.d0))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Acad-Circle-class-marker* "CIRCLE")

(defparameter *Acad-Circle-subclass-marker* "AcDbCircle")

(defclass  acad-circle (acad-entity) 
  ((center    :accessor center     :initarg :center    :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius    :accessor radius     :initarg :radius    :initform 1              :documentation "Код 40. Радиус")
   (thickness :accessor thickness  :initarg :thickness :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal    :accessor normal     :initarg :normal    :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (area)
   (circumference)
   (diameter) 
   )
  (:documentation
   "См. ./dbents.h:class AcDbCircle: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18

CIRCLE (DXF)
К объектам CIRCLE применяются следующие групповые коды.
Групповые коды CIRCLE 
| Групповой код | Описание                                                                  |
|           100 | Маркер подкласса (AcDbCircle)                                             |
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Центральная точка (в ОСК)                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в ОСК)                    |
|            40 | Радиус                                                                    |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|               | Понятия, связанные с данным                                               |
|---------------+---------------------------------------------------------------------------|
"))

(defmethod dxf-out-text ((x Acad-Circle) stream)
  (dxf-out-t-string 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-text  :after ((x Acad-Circle) stream)
  (dxf-out-t-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Acad-Circle) stream)
  (dxf-out-b-string 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-binary :after ((x Acad-Circle) stream)
  (dxf-out-b-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object Acad-Circle) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *Acad-Circle-class-marker*))))

(defmethod  dxf-in-text :after ((object Acad-Circle) (pairs cons))
  (let ((c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (if  c-39 (setf  (thickness object) c-39)
	 (setf  (thickness object) 0.0d0))
    (if  c-40 (setf  (radius object) c-40)
	 (setf  (radius object) 1.0d0))
    (if (and c-10 c-20 c-30)
	(setf  (center object) (vector c-10 c-20 c-30))
	(setf  (center object) (vector 0.0d0 0.0d0 0.0d0)))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-arc-class-marker* "ARC")

(defparameter *acad-arc-subclass-marker* "AcDbArc")

(defclass acad-arc (acad-entity)
  ((center      :accessor center      :initarg :center      :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius      :accessor radius      :initarg :radius      :initform 1              :documentation "Код 40. Радиус")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-angle :accessor start-angle :initarg :start-angle :initform 0              :documentation "Код 50. Начальный угол")
   (end-angle   :accessor end-angle   :initarg :end-angle   :initform (* -1 pi)      :documentation "Код 51. Конечный угол")
;(totalangle :accessor totalangle :initarg :totalangle :initform nil :documentation "totalangle")
;(startpoint :accessor startpoint :initarg :startpoint :initform nil :documentation "startpoint")
;(endpoint :accessor endpoint :initarg :endpoint :initform nil :documentation "endpoint")
;(area :accessor area :initarg :area :initform nil :documentation "area")
;(arclength :accessor arclength :initarg :arclength :initform nil :documentation "arclength")
   )

  (:documentation "./dbents.h:class AcDbArc: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8

ARC (DXF)
К объектам дуги применяются следующие групповые коды.
Групповые коды дуги 
|---------------+---------------------------------------------------------------------------|
| Групповой код | Описание                                                                  |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbCircle)                                             |
|---------------+---------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Центральная точка (в ОСК)                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в ОСК)                    |
|---------------+---------------------------------------------------------------------------|
|            40 | Радиус                                                                    |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbArc)                                                |
|---------------+---------------------------------------------------------------------------|
|            50 | Начальный угол                                                            |
|---------------+---------------------------------------------------------------------------|
|            51 | Конечный угол                                                             |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|---------------+---------------------------------------------------------------------------|

"))

(defparameter *acad-arc-properties* '(Application ArcLength Area Center Document EndAngle EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Radius StartAngle StartPoint Thickness TotalAngle TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-arc-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x acad-arc) stream)
  (dxf-out-t-string 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-arc) stream)
  (dxf-out-t-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-double 40 rad stream)
    (dxf-out-t-string 100 *acad-arc-subclass-marker* stream)
    (dxf-out-t-double 50 s-a stream)
    (dxf-out-t-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))))

(dxf-out-t-point-3d 210 (vector 1 2 3)t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-arc) stream)
  (dxf-out-b-string 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-arc) stream)
  (dxf-out-b-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-double 40 rad stream)
    (dxf-out-b-string 100 *acad-arc-subclass-marker* stream)
    (dxf-out-b-double 50 s-a stream)
    (dxf-out-b-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-arc) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-arc-class-marker*))))

(defmethod  dxf-in-text :after ((object acad-arc) (pairs cons))
  (let (
	(c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-50  (cadr (assoc  50 pairs :test #'equal)))
	(c-51  (cadr (assoc  51 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (if  c-39 (setf  (thickness object) c-39)
	 (setf  (thickness object) 0.0d0))
    (cond
      ((and c-10 c-20 c-30)
       (setf  (center object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30))
       (setf  (center object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object acad-arc) (pairs cons)): wrong values c-10 c-20 c-30 ~A ~A ~A" c-10 c-20 c-30)))
    (if  c-40 (setf  (radius object) c-40)
	 (setf  (radius object) 1.0d0))
    (if  c-50 (setf  (start-angle object) c-50)
	 (error "dxf-in-text :after ((object acad-arc) (pairs cons)) c-50 not defined"))
    (if  c-51 (setf  (end-angle object) c-51)
	 (error "dxf-in-text :after ((object acad-arc) (pairs cons)) c-51 not defined"))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-text-class-marker* "TEXT")

(defparameter *acad-text-subclass-marker* "AcDbText")

(defclass acad-text (acad-entity)
  ((thickness            :accessor thickness            :initarg :thickness            :initform 0              :documentation "Код  39. Thickness (optional; default = 0)")
   (insertion-point      :accessor insertion-point      :initarg :insertion-point      :initform (vector 0 0 0) :documentation "Код  10. First alignment point (in OCS) DXF: X value; APP: 3D point")
   (height               :accessor height               :initarg :height               :initform 3.5            :documentation "Код  40. Text height")
   (text-string          :accessor text-string          :initarg :text-string          :initform ""             :documentation "Код   1. Default value (the string itself)")
   (rotation             :accessor rotation             :initarg :rotation             :initform 0              :documentation "Код  50. Text rotation (optional; default = 0)")
   (scale-factor         :accessor scale-factor         :initarg :scale-factor         :initform 1              :documentation "Код  41. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (oblique-angle        :accessor oblique-angle        :initarg :oblique-angle        :initform 0              :documentation "Код  51. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (style-name           :accessor style-name           :initarg :style-name           :initform "STANDARD"     :documentation "Код   7. Text style name (optional, default = STANDARD")
   (mirror-in-xy         :accessor mirror-in-xy         :initarg :mirror-in-xy         :initform 0              :documentation "Код  71. Text generation flags (optional, default = 0): 2 = Text is backward (mirrored in X) ; 4 = Text is upside down (mirrored in Y)")
;;;(backward :accessor backward :initarg :backward :initform nil :documentation "backward")  
;;;(upsidedown :accessor upsidedown :initarg :upsidedown :initform nil :documentation "upsidedown")
   (text-alignment-point :accessor text-alignment-point :initarg :text-alignment-point :initform (vector 0 0 0) :documentation "Код  11. Second alignment point (in OCS) (optional). DXF: X value; APP: 3D point. This value is meaningful only if the value of a 72 or 73 group is nonzero (if the justification is anything other than baseline/left)")
   (normal               :accessor normal               :initarg :normal               :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (hor-justification    :accessor hor-justification    :initarg :hor-justification    :initform 0              :documentation "Код  72. Horizontal text justification type (optional, default = 0) integer codes (not bit-coded). 0 = Left; 1= Center; 2 = Right; 3 = Aligned (if vertical alignment = 0); 4 = Middle (if vertical alignment = 0); 5 = Fit (if vertical alignment = 0). See the Group 72 and 73 integer codes table for clarification")
   (ver-justification    :accessor ver-justification    :initarg :ver-justification    :initform 0              :documentation "Код  73. Vertical text justification type (optional, default = 0): integer codes (not bit-coded): 0 = Baseline; 1 = Bottom; 2 = Middle; 3 = Top. See the Group 72 and 73 integer codes table for clarification")
;;;;(alignment :accessor alignment :initarg :alignment :initform nil :documentation "alignment")
;;;;(textgenerationflag :accessor textgenerationflag :initarg :textgenerationflag :initform nil :documentation "textgenerationflag")   
   )

  (:documentation "См. ./dbents.h:class AcDbText: public AcDbEntity
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363

TEXT (DXF)
К объектам текста применяются следующие групповые коды.
Групповые коды текста
| Групповой код | Описание                                                                                                                                          |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbText)                                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                                                                                                |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            10 | Первая точка выравнивания (в ОСК)                                                                                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z первой точки выравнивания (в ОСК)                                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            40 | Высота текста                                                                                                                                     |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|             1 | Значение по умолчанию (сама строка)                                                                                                               |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Поворот текста (необязательно; значение по умолчанию = 0)                                                                                         |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            41 | Относительный масштабный коэффициент по оси X: ширина (необязательно; значение по умолчанию = 1)                                                  |
|               | Это значение также корректируется при использовании вписываемого текста                                                                           |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            51 | Угол наклона (необязательно; значение по умолчанию = 0)                                                                                           |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|             7 | Имя стиля текста (необязательно, значение по умолчанию = STANDARD)                                                                                |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            71 | Флаги создания текста (необязательно, значение по умолчанию = 0):                                                                                 |
|               | 2 = текст в обратном направлении (зеркально отражен по X)                                                                                         |
|               | 4 = текст перевернут (зеркально отражен по Y)                                                                                                     |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            72 | Тип выравнивания текста по горизонтали (необязательно, значение по умолчанию = 0); целочисленные коды (не битовые):                               |
|               | 0 = слева                                                                                                                                         |
|               | 1 = по центру                                                                                                                                     |
|               | 2 = справа                                                                                                                                        |
|               | 3 = параллельно (если выравнивание по вертикали = 0)                                                                                              |
|               | 4 = посередине (если выравнивание по вертикали = 0)                                                                                               |
|               | 5 = вписать (если выравнивание по вертикали = 0)                                                                                                  |
|               | Подробности см. в таблице целочисленных групповых кодов 72 и 73                                                                                   |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            11 | Вторая точка выравнивания (в ОСК) (необязательно)                                                                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                        |
|               | Это значение имеет смысл, только если значение групп 72 или 73 не равно нулю (если выравнивание не является выравниванием по базовой линии/слева) |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z второй точки выравнивания (в ОСК) (необязательно)                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                                                                         |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                                                                             |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbText)                                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            73 | Тип выравнивания текста по вертикали (необязательно, значение по умолчанию = 0); целочисленные коды (не битовые):                                 |
|               | 0 = по базовой линии                                                                                                                              |
|               | 1 = снизу                                                                                                                                         |
|               | 2 = посередине                                                                                                                                    |
|               | 3 = сверху                                                                                                                                        |
|               | Подробности см. в таблице целочисленных групповых кодов 72 и 73                                                                                   |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|

В следующей таблице подробно описываются групповые коды 72 (выравнивание по горизонтали) и 73 (выравнивание по вертикали). 
Целочисленные групповые коды 72 и 73 
|----------------------+----------+----------+----------+--------------+----------+-----------|
| Группа с кодом 73    | Группа с | Группа с | Группа с | Группа с     | Группа с | Группа с  |
|                      | кодом 72 | кодом 72 | кодом 72 | кодом 72     | кодом 72 | кодом 72  |
|                      | 0        | 1        | 2        | 3            | 4        | 5         |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 3 (сверху)           | ВЛ       | ВЦ       | ВП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 2 (посередине)       | СЛ       | СЦ       | СП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 1 (снизу)            | НЛ       | НЦ       | НП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 0 (по базовой линии) | Левая    | Центр    | Справа   | Параллельный | Середина | По ширине |
|----------------------+----------+----------+----------+--------------+----------+-----------|
Если значения групп с кодом 72 и (или) 73 не равны нулю, то значения первой точки выравнивания игнорируются, 
и приложением AutoCAD рассчитываются новые значения на основе второй точки выравнивания и длины и высоты 
самой текстовой строки (после применения стиля текста). Если значения групп с кодами 72 и 73 равны нулю или 
отсутствуют, то вторая точка выравнивания является нерелевантной. 

"))

(defparameter *acad-text-properties* '(Alignment Application Backward Document EntityTransparency Handle HasExtensionDictionary Height Hyperlinks InsertionPoint Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor StyleName TextAlignmentPoint TextGenerationFlag TextString Thickness TrueColor UpsideDown Visible))

(mapcar #'make-slot (set-difference *acad-text-properties* *acad-entity-properties*))


(defmethod dxf-out-text ((x acad-text) stream)
    (dxf-out-t-string 0 *acad-text-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-text) stream)
  (dxf-out-t-string 100 *acad-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (insertion-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (scale-factor x))
	(ob  (oblique-angle x))
	(st  (style-name x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (text-alignment-point x))
	;;(a-p-x (svref (normal x) 0))
	;;(a-p-y (svref (normal x) 1))
	;;(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-p stream)
    (dxf-out-t-double 40 h stream)
    (dxf-out-t-string 1 t-s stream)
    (dxf-out-t-double 50 (* *radian-to-degree* rot) stream)
    (dxf-out-t-double 41 w-f stream)
    (dxf-out-t-double 51 (* *radian-to-degree* ob) stream)
    (dxf-out-t-string 7 st stream)
    (unless (= mir 0) (dxf-out-t-int16 71 mir stream))
    (unless (= h-j 0) (dxf-out-t-int16 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf-out-t-point-3d 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))
    (dxf-out-t-string 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf-out-t-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-text) stream)
  (dxf-out-b-string 0 *acad-text-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-text) stream)
  (dxf-out-b-string 100 *acad-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (insertion-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (scale-factor x))
	(ob  (oblique-angle x))
	(st  (style-name x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (text-alignment-point x))
	;(a-p-x (svref (normal x) 0))
	;(a-p-y (svref (normal x) 1))
	;(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-p stream)
    (dxf-out-b-double 40 h stream)
    (dxf-out-b-string 1 t-s stream)
    (dxf-out-b-double 50 (* *radian-to-degree* rot) stream)
    (dxf-out-b-double 41 w-f stream)
    (dxf-out-b-double 51 (* *radian-to-degree* ob) stream)
    (dxf-out-b-string 7 st stream)
    (unless (= mir 0) (dxf-out-b-int16 71 mir stream))
    (unless (= h-j 0) (dxf-out-b-int16 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf-out-b-point-3d 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (dxf-out-b-string 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf-out-b-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-ellipse-class-marker* "ELLIPSE")

(defparameter *acad-ellipse-subclass-marker* "AcDbEllipse")

(defclass acad-ellipse (acad-entity)
  (
;;;(area         :accessor area         :initarg :area         :initform nil            :documentation "area")
   (center       :accessor center       :initarg :center       :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (major-axis   :accessor major-axis   :initarg :major-axis   :initform (vector 1 0 0) :documentation "Код 11. Конечная точка главной оси относительно центральной точки (в МСК) (mapcar #'+ center major-axis)")
;;;(majorradius :accessor majorradius :initarg :majorradius :initform nil :documentation "majorradius")
;;;(minoraxis :accessor minoraxis :initarg :minoraxis :initform nil :documentation "minoraxis")
;;;(minorradius :accessor minorradius :initarg :minorradius :initform nil :documentation "minorradius")

   (normal          :accessor normal          :initarg :normal          :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-parameter :accessor start-parameter :initarg :start-parameter :initform 0.0d0 :documentation "startparameter")
;;;(startangle :accessor startangle :initarg :startangle :initform nil :documentation "startangle")
;;;(startpoint :accessor startpoint :initarg :startpoint :initform nil :documentation "startpoint"))
   (end-parameter   :accessor end-parameter   :initarg :end-parameter    :initform (* 2.0d0 pi)       :documentation "Код 42. Конечный параметр")
;;;(endangle :accessor endangle :initarg :endangle :initform nil :documentation "endangle")
;;;(endpoint :accessor endpoint :initarg :endpoint :initform nil :documentation "endpoint")
   (radius-ratio :accessor radius-ratio :initarg :radius-ratio :initform 0.5d0          :documentation "Код 40. Соотношение малой и главной осей"))
  (:documentation "См. ./dbelipse.h:class AcDbEllipse: public  AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB

ELLIPSE (DXF)
К объектам эллипса применяются следующие групповые коды.
Групповые коды эллипса
|---------------+------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                       |
|---------------+------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbEllipse)                                                                 |
|---------------+------------------------------------------------------------------------------------------------|
|            10 | Центральная точка (в МСК)                                                                      |
|               | Файл DXF: значение X; приложение: 3D-точка                                                     |
|---------------+------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в МСК)                                         |
|---------------+------------------------------------------------------------------------------------------------|
|            11 | Конечная точка главной оси относительно центральной точки (в МСК)                              |
|               | Файл DXF: значение X; приложение: 3D-точка                                                     |
|---------------+------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z для конечной точки главной оси относительно центральной точки (в МСК) |
|---------------+------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                      |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                    |
|---------------+------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                          |
|---------------+------------------------------------------------------------------------------------------------|
|            40 | Соотношение малой и главной осей                                                               |
|---------------+------------------------------------------------------------------------------------------------|
|            41 | Начальный параметр (значение для полного эллипса — 0,0)                                        |
|---------------+------------------------------------------------------------------------------------------------|
|            42 | Конечный параметр (значение для полного эллипса — 2 пи)                                        |
|---------------+------------------------------------------------------------------------------------------------|

"))


(defparameter *acad-acad-ellipse-properties* '(Application Area Center Document EndAngle EndParameter EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight MajorAxis MajorRadius Material MinorAxis MinorRadius Normal ObjectID ObjectName OwnerID PlotStyleName RadiusRatio StartAngle StartParameter StartPoint TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-acad-ellipse-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x acad-ellipse) stream)
  (dxf-out-t-string 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-ellipse) stream)
  (dxf-out-t-string 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf-out-t-point-3d 210 u-n stream))
    (dxf-out-t-double 40 r-r stream)
    (dxf-out-t-double 41 s-p stream)
    (dxf-out-t-double 42 e-p stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-ellipse) stream)
  (dxf-out-b-string 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-ellipse) stream)
  (dxf-out-b-string 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf-out-b-point-3d 210 u-n stream))
    (dxf-out-b-double 40 r-r stream)
    (dxf-out-b-double 41 s-p stream)
    (dxf-out-b-double 42 e-p stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-ellipse) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*))))

(defmethod  dxf-in-text :after ((object acad-ellipse) (pairs cons))
  (let ((c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-41  (cadr (assoc  41 pairs :test #'equal)))
	(c-42  (cadr (assoc  42 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (cond
      ((and c-10 c-20 c-30)
       (setf  (center object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30))
       (setf  (center object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): wrong values c-10 c-20 c-30 ~A ~A ~A" c-10 c-20 c-30)))
    (cond
      ((and c-11 c-21 c-31)
       (setf  (major-axis object) (vector c-10 c-20 c-30)))
      ((and c-11 c-21 (null c-31))
       (setf  (major-axis object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): wrong values c-11 c-21 c-31 ~A ~A ~A" c-11 c-21 c-31)))
    (if  c-40
	 (setf  (radius-ratio object) c-40)
	 (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): c-40 not defined"))
    (if  c-41
	 (setf  (start-parameter object) c-41)
	 (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): c-41 not defined"))
    (if  c-42   (setf  (end-parameter object) c-42)
	 (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): c-42 not defined"))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-symboltablerecord-subclass-marker* "AcDbSymbolTableRecord")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-layer-class-marker* "LAYER")

(defparameter *acad-layer-subclass-marker* "AcDbLayerTableRecord")

(defclass acad-layer (acad-object)
;;;;"AcDbLayerTableRecord"
  ((name             :accessor name            :initarg :name            :initform "LAYER1"       :documentation "name")
   (description      :accessor description     :initarg :description     :initform nil            :documentation "description")
   (truecolor        :accessor truecolor       :initarg :truecolor       :initform '(7 nil)       :documentation "Код  62. Номер цвета (если значение отрицательное, слой отключен)")
   (line-type        :accessor line-type       :initarg :line-type       :initform "Continuous"   :documentation "Код   6. Имя типа линий")
   (plottable        :accessor plottable       :initarg :plottable       :initform t              :documentation "Код 290. Флаг печати. Если задано значение 0, этот слой не выводится на печать")
   (plotstylename    :accessor plotstylename   :initarg :plotstylename   :initform nil            :documentation "Код 390. Идентификатор/дескриптор жесткого указателя на объект PlotStyleName")
   (line-weight      :accessor line-weight     :initarg :line-weight     :initform -3             :documentation "Код 370. Значение из перечисления весов линии")
   (material         :accessor material        :initarg :material        :initform nil            :documentation "Код 347. Идентификатор/дескриптор жесткого указателя на объект материала")
   (freeze           :accessor freeze          :initarg :freeze          :initform nil            :documentation "freeze")
   (layeron          :accessor layeron         :initarg :layeron         :initform t              :documentation "layeron")
   (lock             :accessor lock            :initarg :lock            :initform nil            :documentation "lock")
   (used             :accessor used            :initarg :used            :initform nil            :documentation "used")
   (viewportdefault  :accessor viewportdefault :initarg :viewportdefault :initform nil            :documentation "viewportdefault")
;;;   (layer-tr-visual-style  :accessor layer-tr-visual-style :initarg :layer-tr-visual-style :initform nil            :documentation "Код 348? Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)?")
   )

  (:documentation "
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
====================================================================================================
" ))

(defparameter *acad-layer-properties* '(Application Description Document Freeze Handle HasExtensionDictionary LayerOn Linetype Lineweight Lock Material Name ObjectID ObjectName OwnerID PlotStyleName Plottable TrueColor Used  ViewportDefault ))

(reverse (mapcar #'make-slot (set-difference *acad-layer-properties* *acad-object-properties*)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-text ((x acad-layer) stream)
  (dxf-out-t-string 0 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-layer) stream)
  (dxf-out-t-string 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf-out-t-string 100 *acad-layer-subclass-marker* stream)
  (let ((name            (name            x))
	(freeze          (freeze          x))
	(viewportdefault (viewportdefault x))
	(lock            (lock x))
	(used            (used            x))
	(layeron         (if (layeron x) 1 -1))
	(plottable       (if (null (plottable x)) 0 1))
	(cl              (truecolor x))
        (l-ltype         (line-type x))
	(l-lweight       (line-weight x))
	(l-pstyle        (plotstylename x))
	(l-mat           (material x))
;;;	(l-vstyle        (layer-tr-visual-style x))
	(c-70            0))
    (block c-70
      (when freeze          (setf c-70 (dpb 1 (byte 1 0) c-70)))
      (when viewportdefault (setf c-70 (dpb 1 (byte 1 1) c-70)))
      (when lock            (setf c-70 (dpb 1 (byte 1 2) c-70)))
;;; (when lock            (setf c-70 (dpb 1 (byte 1 3) c-70)))
;;; (when lock            (setf c-70 (dpb 1 (byte 1 4) c-70)))
      (when used            (setf c-70 (dpb 1 (byte 1 5) c-70))))
    (dxf-out-t-string  2 name   stream)
    (dxf-out-t-int16  70 c-70   stream)
    (cond
      ((= 0   (first cl)) (dxf-out-t 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf-out-t-int16 62 (* (first cl) layeron) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf-out-t-int16 62  (* (first cl) layeron) stream)
       (dxf-out-t-int32 420 (color-rgb-to-truecolor (second cl)) stream)))
    (dxf-out-t         6 l-ltype   stream)
    (dxf-out-t       290 plottable stream)
    (dxf-out-t       370 l-lweight stream)
    (dxf-out-t       390 l-pstyle  stream)
    (dxf-out-t       347 l-mat     stream)
;;; (dxf-out-t       348 l-vstyle  stream)
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-layer) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-layer-class-marker*))
;;; (break "dxf-in-text  ((object acad-layer) (pairs cons))")
  )

(defmethod  dxf-in-text :after ((object acad-layer) (pairs cons))
;;; (break "dxf-in-text :after ((object acad-layer) (pairs cons))")
  (let ((c-2   (cadr (assoc   2 pairs :test #'equal)))
	(c-70  (cadr (assoc  70 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-290 (cadr (assoc 290 pairs :test #'equal)))
	(c-370 (cadr (assoc 370 pairs :test #'equal)))
	(c-390 (cadr (assoc 390 pairs :test #'equal)))
	(c-347 (cadr (assoc 347 pairs :test #'equal)))
	;; (c-348 (cadr (assoc 348 pairs :test #'equal)))
	)
    (cond
      (c-2 (setf  (name object) c-2))
      ((error "dxf-in-text :after ((object acad-layer) (pairs cons)): c-2 not exist.")))
    (cond
      (c-390 (setf  (plotstylename object) c-390))
      ((error "dxf-in-text :after ((object acad-layer) (pairs cons)): c-390 not exist.")))
    (cond
      (c-347 (setf  (material object) c-347))
      ((error "dxf-in-text :after ((object acad-layer) (pairs cons)): c-347 not exist.")))
    (when c-70
      (setf  (freeze          object) (= 1 (ldb (byte 1 0) c-70)))
      (setf  (viewportdefault object) (= 1 (ldb (byte 1 1) c-70)))
      (setf  (lock            object) (= 1 (ldb (byte 1 2) c-70)))
;;;; (setf  (lock            object) (= 1 (ldb (byte 1 3) c-70)))
;;;; (setf  (lock            object) (= 1 (ldb (byte 1 4) c-70)))
      (setf  (used            object) (= 1 (ldb (byte 1 5) c-70))))
    (cond
      ((and c-62 c-420)
       (setf (truecolor object)
	     (list (abs c-62) (color-truecolor-to-rgb   c-420))))
      (c-62
       (setf (truecolor object)
	     (list (abs c-62) nil)))
      (t
       (setf (truecolor object) (list 256 nil))))
    (when c-62  (setf (layeron    object) (not (minusp c-62))))
    (when c-6   (setf (line-type  object) c-6))
    (when c-290 (setf (plottable  object) (if (/= 0 c-290) t nil)))
    (cond
      ((null    c-370) (setf (line-weight object) -3))
      ((numberp c-370) (setf (line-weight object) c-370))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-370 value ~A" c-370)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-symboltable-subclass-marker* "AcDbSymbolTable")

(defclass acad-layers (acad-object)
  ((count  :accessor a-count :initarg :count :initform 0   :documentation "70 count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)")
   )
  (:documentation "
"))

(defparameter *acad-layers-properties* '(Application Count Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(reverse (mapcar #'make-slot (set-difference *acad-layers-properties* *acad-object-properties*)))

(defmethod dxf-out-text ((x acad-layers) stream)
  (dxf-out-t-string 2 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-layers) stream)
  (dxf-out-t-string 100 *acad-symboltable-subclass-marker* stream)
  (let ((a-count (a-count x))
	(items   (items   x)))
    (dxf-out-t-int16  70 a-count   stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) items)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-in-text  ((object acad-layers) (tables cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object)

(defmethod dxf-in-text :after ((object acad-layers) (tables cons))
  (multiple-value-bind (items-data list-item-data) (table-and-items *acad-layer-class-marker* tables)
    (setf (items object)
	  (mapcar
	   #'(lambda (item-data)
	       (let ((it (make-instance 'acad-layer)))
		 (dxf-in-text it item-data)
		 it))
	   list-item-data)
	  (a-count  object ) (length (items object)))))
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass acad-documents (acad-object)
  ((ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
   (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count"))
  (:documentation "The collection of all AutoCAD drawings that are open in the current session."))

(defclass acad-database (object)
  ((ac-blocks                   :accessor ac-blocks                   :initarg :ac-blocks                   :initform nil :documentation "ac-blocks")
   (ac-dictionaries             :accessor ac-dictionaries             :initarg :ac-dictionaries             :initform nil :documentation "ac-dictionaries")
   (ac-dim-styles               :accessor ac-dim-styles               :initarg :ac-dim-styles               :initform nil :documentation "ac-dim-styles")
   (ac-elevation-model-space    :accessor ac-elevation-model-space    :initarg :ac-elevation-model-space    :initform nil :documentation "ac-elevation-model-space")
   (ac-elevation-paper-space    :accessor ac-elevation-paper-space    :initarg :ac-elevation-paper-space    :initform nil :documentation "ac-elevation-paper-space")
   (ac-groups                   :accessor ac-groups                   :initarg :ac-groups                   :initform nil :documentation "ac-groups")
   (ac-layers                   :accessor ac-layers                   :initarg :ac-layers                   :initform (make-instance 'acad-layers) :documentation "ac-layers")
   (ac-layouts                  :accessor ac-layouts                  :initarg :ac-layouts                  :initform nil :documentation "ac-layouts")
   (ac-limits                   :accessor ac-limits                   :initarg :ac-limits                   :initform nil :documentation "ac-limits")
   (ac-linetypes                :accessor ac-linetypes                :initarg :ac-linetypes                :initform (make-instance 'acad-linetypes) :documentation "ac-linetypes")
   (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
   (ac-model-space              :accessor ac-model-space              :initarg :ac-model-space              :initform nil :documentation "ac-model-space")
   (ac-paper-space              :accessor ac-paper-space              :initarg :ac-paper-space              :initform nil :documentation "ac-paper-space")
   (ac-plot-configurations      :accessor ac-plot-configurations      :initarg :ac-plot-configurations      :initform nil :documentation "ac-plot-configurations")
   (ac-preferences              :accessor ac-preferences              :initarg :ac-preferences              :initform nil :documentation "ac-preferences")
   (ac-registered-applications  :accessor ac-registered-applications  :initarg :ac-registered-applications  :initform nil :documentation "ac-registered-applications")
   (ac-section-manager          :accessor ac-section-manager          :initarg :ac-section-manager          :initform nil :documentation "ac-section-manager")
   (ac-summary-info             :accessor ac-summary-info             :initarg :ac-summary-info             :initform nil :documentation "ac-summary-info")
   (ac-text-styles              :accessor ac-text-styles              :initarg :ac-text-styles              :initform nil :documentation "ac-text-styles")
   (ac-user-coordinate-systems  :accessor ac-user-coordinate-systems  :initarg :ac-user-coordinate-systems  :initform nil :documentation "ac-user-coordinate-systems")
   (ac-viewports                :accessor ac-viewports                :initarg :ac-viewports                :initform nil :documentation "ac-viewports")
   (ac-views                    :accessor ac-views                    :initarg :ac-views                    :initform nil :documentation "ac-views"))
  (:documentation "The contents of an XRef block."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-database-properties* '(Blocks Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace Groups Layers Layouts Limits Linetypes Material ModelSpace PaperSpace PlotConfigurations Preferences RegisteredApplications SectionManager SummaryInfo TextStyles UserCoordinateSystems Viewports Views))

(mapcar #'make-slot (set-difference *acad-database-properties* nil))

(defclass acad-document (acad-database)
  ((active                :accessor active                :initarg :active                :initform nil :documentation "active")
   (activedimstyle        :accessor activedimstyle        :initarg :activedimstyle        :initform nil :documentation "activedimstyle")
   (activelayer           :accessor activelayer           :initarg :activelayer           :initform nil :documentation "activelayer")
   (activelayout          :accessor activelayout          :initarg :activelayout          :initform nil :documentation "activelayout")
   (activelinetype        :accessor activelinetype        :initarg :activelinetype        :initform nil :documentation "activelinetype")
   (activematerial        :accessor activematerial        :initarg :activematerial        :initform nil :documentation "activematerial")
   (activepviewport       :accessor activepviewport       :initarg :activepviewport       :initform nil :documentation "activepviewport")
   (activeselectionset    :accessor activeselectionset    :initarg :activeselectionset    :initform nil :documentation "activeselectionset")
   (activespace           :accessor activespace           :initarg :activespace           :initform nil :documentation "activespace")
   (activetextstyle       :accessor activetextstyle       :initarg :activetextstyle       :initform nil :documentation "activetextstyle")
   (activeucs             :accessor activeucs             :initarg :activeucs             :initform nil :documentation "activeucs")
   (activeviewport        :accessor activeviewport        :initarg :activeviewport        :initform nil :documentation "activeviewport")
   (application           :accessor application           :initarg :application           :initform nil :documentation "application")
   (database              :accessor database              :initarg :database              :initform nil :documentation "database")
   (fullname              :accessor fullname              :initarg :fullname              :initform nil :documentation "fullname")
   (height                :accessor height                :initarg :height                :initform nil :documentation "height")
   (hwnd                  :accessor hwnd                  :initarg :hwnd                  :initform nil :documentation "hwnd")
   (materials             :accessor materials             :initarg :materials             :initform nil :documentation "materials")
   (mspace                :accessor mspace                :initarg :mspace                :initform nil :documentation "mspace")
   (name                  :accessor name                  :initarg :name                  :initform nil :documentation "name")
   (objectsnapmode        :accessor objectsnapmode        :initarg :objectsnapmode        :initform nil :documentation "objectsnapmode")
   (path                  :accessor path                  :initarg :path                  :initform nil :documentation "path")
   (pickfirstselectionset :accessor pickfirstselectionset :initarg :pickfirstselectionset :initform nil :documentation "pickfirstselectionset")
   (plot                  :accessor plot                  :initarg :plot                  :initform nil :documentation "plot")
   (readonly              :accessor readonly              :initarg :readonly              :initform nil :documentation "readonly")
   (saved                 :accessor saved                 :initarg :saved                 :initform nil :documentation "saved")
   (selectionsets         :accessor selectionsets         :initarg :selectionsets         :initform nil :documentation "selectionsets")
   (utility               :accessor utility               :initarg :utility               :initform nil :documentation "utility")
   (width                 :accessor width                 :initarg :width                 :initform nil :documentation "width")
   (windowstate           :accessor windowstate           :initarg :windowstate           :initform nil :documentation "windowstate")
   (windowtitle           :accessor windowtitle           :initarg :windowtitle           :initform nil :documentation "windowtitle")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (sec-header            :accessor sec-header            :initarg :sec-header            :initform nil :documentation "header      - Представление секции HEADER")
   (sec-classes           :accessor sec-classes           :initarg :sec-classes           :initform nil :documentation "classes     - Представление секции CLASSES")
   (sec-table-appid       :accessor sec-table-appid       :initarg :sec-table-appid       :initform nil :documentation "table-appid - Представление секции TABLE-APPID")

   )
  (:documentation "
 "))

(defparameter *acad-document-properties* '( Active ActiveDimStyle ActiveLayer ActiveLayout ActiveLinetype ActiveMaterial ActivePViewport ActiveSelectionSet ActiveSpace ActiveTextStyle ActiveUCS ActiveViewport Application Blocks Database Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace FullName Groups Height HWND Layers Layouts Limits Linetypes Materials ModelSpace MSpace Name ObjectSnapMode PaperSpace Path PickfirstSelectionSet Plot PlotConfigurations Preferences ReadOnly RegisteredApplications Saved SectionManager SelectionSets SummaryInfo TextStyles UserCoordinateSystems Utility Viewports Views Width WindowState WindowTitle))

(reverse (mapcar #'make-slot (set-difference *acad-document-properties* *acad-database-properties*)) )


(defmethod  dxf-in-text  ((object acad-document) (sections cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object
  )

(defmethod  dxf-in-text :after ((object acad-document) (sections cons))
	    (let ((header  (split-header   sections))
		  (classes (split-classes  sections))
		  (tables  (split-tables   sections))
		  )
	      (setf (activedimstyle  object) (get-acad-variable-as-list "DIMSTYLE"   header))
	      (setf (activelayer     object) (get-acad-variable-as-list "CLAYER"     header))

	      (setf (activelinetype  object) (get-acad-variable-as-list "CELTYPE"    header))
	      (setf (activematerial  object) (get-acad-variable-as-list "CMATERIAL"  header))
	      (setf (activespace     object) (get-acad-variable-as-list "TILEMODE"   header))
	      (setf (activetextstyle object) (get-acad-variable-as-list "TEXTSTYLE"  header))
;;;;
;;;    (setf (activelayout       object) (get-acad-variable-as-list "CLAYOUT"  header))    
;;;    (setf (activeviewport     object) (get-acad-variable-as-list "CLAYOUT"  header))
;;;    (setf (activepviewport    object) (get-acad-variable-as-list "CLAYOUT"  header))    
;;;    (setf (activeselectionset object) (get-acad-variable-as-list "CLAYOUT"  header))
;;;;	      
	      (setf  (layers      object) (dxf-in-text (layers    object) tables))
	      (setf  (linetypes   object) (dxf-in-text (linetypes object) tables))
;;;;	      
	      (setf  (sec-header  object) header)
      	      (setf  (sec-classes object) classes)
	      ))

(defmethod dxf-out-text ((x acad-document) stream))

(defmethod dxf-out-text :after ((x acad-document) stream)
  (block section-header
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "HEADER"  stream)
    (mapc #'(lambda (header)
	      (mapc #'(lambda (el) (dxf-out-t (first el) (second el) stream)) header))
	  (sec-header x))
    (dxf-out-t 0 "ENDSEC" stream))
  (block section-classes
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "CLASSES" stream)
    (mapc #'(lambda (class)
	      (mapc #'(lambda (el) (dxf-out-t (first el) (second el) stream)) class))
	  (sec-classes x))
    (dxf-out-t 0 "ENDSEC" stream))
  (block section-tables
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "TABLES" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
  (block section-blocks
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "BLOCKS" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
  (block section-entities
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "ENTITIES" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
  (block section-objects
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "OBJECTS" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
    (block section-objects
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "ACDSDATA" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
    
    (dxf-out-t 0 "EOF" stream)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-linetype-class-marker* "LTYPE")

(defparameter *acad-linetype-subclass-marker* "AcDbLinetypeTableRecord")

(defclass acad-linetype  (acad-object)
  ((name        :accessor name        :initarg :name        :initform "CONTINUOUS" :documentation "name")
   (description :accessor description :initarg :description :initform ""           :documentation "description"))
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================

"))

(defparameter *acad-linetype-properties* '(Application Description Document Handle HasExtensionDictionary Name ObjectID ObjectName OwnerID))

(mapcar #'make-slot (set-difference *acad-linetype-properties* *acad-object-properties*))

(defmethod dxf-out-text ((x acad-linetype) stream)
  (dxf-out-t-string 0 *acad-linetype-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-linetype) stream)
  (dxf-out-t-string 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf-out-t-string 100 *acad-linetype-subclass-marker* stream)
  (let ((name            (name            x))
	(description     (description     x))
	(pairs           (pairs           x)))
    (dxf-out-t-string  2 name   stream)
    (dxf-out-t-int16  70 (cadr (assoc 70 pairs))   stream)
    (dxf-out-t-string  3 description stream)
    (mapcar
     #'(lambda (el)
	 (dxf-out-t (car el) (cadr el) t))
     (member (assoc 72 pairs) pairs))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-linetype) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-linetype) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf-out-t-hex 330 own stream))
    (when hdl (dxf-out-t-hex   5 hdl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-linetype) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-linetype-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-linetype) (pairs cons))
  (setf (pairs object) (copy-list pairs))
  (let ((c-2   (cadr (assoc   2 pairs :test #'equal)))
	(c-3   (cadr (assoc   3 pairs :test #'equal))))
    (when c-2   (setf (name        object) c-2))
    (when c-3   (setf (description object) c-3))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass acad-linetypes (acad-object)
  ((count  :accessor a-count :initarg :count :initform 0   :documentation "70 count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)"))
  (:documentation "
"))

(defparameter *acad-linetypes-properties* '(Application Count Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(reverse (mapcar #'make-slot (set-difference *acad-linetypes-properties* *acad-object-properties*)))

(defmethod dxf-in-text  ((object acad-linetypes) (tables cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object)

(defmethod dxf-in-text :after ((object acad-linetypes) (tables cons))
      (multiple-value-bind (items-data list-item-data) (table-and-items *acad-linetype-class-marker* tables)
      (setf (items object)
	    (mapcar
	     #'(lambda (item-data)
		 (let ((it (make-instance 'acad-linetype)))
		   (dxf-in-text it item-data)
		   it))
	     list-item-data)
	    (a-count  object ) (length (items object)))))

(defmethod dxf-in-text :after ((object acad-linetypes) (pairs cons))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

'(
  acad-documents
  acad-document
  acad-database
  
  acad-linetypes
  acad-layers

  acad-layer
  acad-linetype
  
  ge-point-3d
  rx-object
  dxf-pairs
  
  acad-object
  acad-entity
  
  db-curve
  acad-line
  acad-point
  acad-ray
  acad-xline
  acad-circle
  acad-arc
  acad-text
  acad-ellipse
  )

