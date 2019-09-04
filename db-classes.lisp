;;;; db-classes.lisp

(in-package #:dxf)

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

(defparameter *Acad-Object-class-marker* "OBJECT")

(defparameter *Acad-Object-subclass-marker* "AcDbObject")

(defclass Acad-Object ()
  ((Application)
   (Document)
   (Object-Name      :accessor Object-Name   :initarg :Object-Name   :initform nil :documentation "")
   (Object-ID        :accessor Object-ID     :initarg :Object-ID     :initform nil :documentation "")
   (Owner-ID         :accessor Owner-ID      :initarg :Owner-ID      :initform nil :documentation "Код 330.  object-owner -> Owner-ID")
   (Handle           :accessor Handle        :initarg :object-handle :initform nil :documentation "Код   5. Дескриптор object-handle -> Handle")
   (HasExtensionDictionary)
   (next-handle      :accessor next-handle   :initarg :next-handle   :initform 1   :allocation :class))
  (:documentation "
db-object -> Acad-Object
См. ./dbmain.h:class ADESK_NO_VTABLE AcDbObject: public AcGiDrawable, public AcHeapOperators
* Object inheritance
Object
   AcadObject

*Methods
Delete
GetExtensionDictionary
GetXData
SetXData
*Properties
Application
Document
Handle
HasExtensionDictionary
ObjectID
ObjectName
OwnerID
* Events
Modified

"))

(defmethod dxf-out-text ((x Acad-Object) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-text :after ((x Acad-Object) stream)
  (let (
	(hdl (Handle x))
	(own (Owner-ID x)))
    (when hdl (dxf-out-t-hex   5 hdl stream))
    (when own (dxf-out-t-hex 330 own stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Acad-Object) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x Acad-Object) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf-out-t-hex 330 own stream))
    (when hdl (dxf-out-t-hex   5 hdl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text :after ((object Acad-Object) (pairs cons))
  (let ((c-5   (cadr (assoc   5 pairs :test #'equal)))
	(c-330 (cadr (assoc 330 pairs :test #'equal))))
;;    (break "~A ~A"  c-5 c-330)
    (when c-5   (setf (Handle   object) c-5))
    (when c-330 (setf (Owner-ID object) c-330))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Acad-Entity-class-marker* "ENTITY")

(defparameter *Acad-Entity-subclass-marker* "AcDbEntity")

(defclass acad-entity (acad-object)
  ((Layer               :accessor Layer    :initarg :Layer  :initform "0" :documentation "Код   8. Имя слоя  entity-layer -> Layer" )

   (Entity-Transparency)
   (Linetype            :accessor Linetype :initarg :Layer  :initform "BYLAYER" :documentation "Код   6. Linetype name (present if not BYLAYER). The special name BYBLOCK indicates a floating linetype (optional) | BYLAYER |" )
   (Hyperlinks)
   (LinetypeScale)
   (Lineweight)
   (Material)
   (PlotStyleName)
   (TrueColor           :accessor TrueColor :initarg :TrueColor :initform '(256 nil) :documentation "Код   62 и 420" )
   ;;   (entity-color      :accessor entity-color      :initarg :entity-color      :initform 256 :documentation "Код  62. 16-битный цвет")
   ;;   (entity-true-color :accessor entity-true-color :initarg :entity-true-color :initform nil :documentation "Код 420. 32-битный цвет")
   (Visible)
   )
  (:documentation "См. ./dbmain.h:class ADESK_NO_VTABLE AcDbEntity: public AcDbObject

* Members
These members are part of this object:
** Methods
ArrayPolar ArrayRectangular Copy Delete GetBoundingBox GetExtensionDictionary GetXData Highlight IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy Update
** Properties
Application Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName TrueColor Visible
** Events
Modified

* DXF

| Group code | Description                                                                                                                                                                   | If omitted, defaults to… |
|         -1 | APP: entity name (changes each time a drawing is opened)                                                                                                                      | not omitted              |
|          0 | Entity type                                                                                                                                                                   | not omitted              |
|          5 | Handle                                                                                                                                                                        | not omitted              |
|        102 | Start of application-defined group “{application_name” (optional)                                                                                                             | no default               |
|      a-d-c | Codes and values within the 102 groups are application-defined (optional)                                                                                                     | no default               |
|        102 | End of group, “}” (optional)                                                                                                                                                  | no default               |
|        102 | “{ACAD_REACTORS” indicates the start of the AutoCAD persistent reactors group.                                                                                                | no default               |
|        330 | This group exists only if persistent reactors have been attached to this object (optional) Soft-pointer ID/handle to owner dictionary (optional)                              | no default               |
|        102 | End of group, “}” (optional)                                                                                                                                                  | no default               |
|        102 | “{ACAD_XDICTIONARY” indicates the start of an extension dictionary group. This group exists only if an extension dictionary has been attached to the object (optional)        | no default               |
|        360 | Hard-owner ID/handle to owner dictionary (optional)                                                                                                                           | no default               |
|        102 | End of group, “}” (optional)                                                                                                                                                  | no default               |
|        330 | Soft-pointer ID/handle to owner BLOCK_RECORD object                                                                                                                           | not omitted              |
|        100 | Subclass marker (AcDbEntity)                                                                                                                                                  | not omitted              |
|         67 | Absent or zero indicates entity is in model space. 1 indicates entity is in paper space (optional).                                                                           | 0                        |
|        410 | APP: layout tab name                                                                                                                                                          | not omitted              |
|          8 | Layer name                                                                                                                                                                    | not omitted              |
|          6 | Linetype name (present if not BYLAYER). The special name BYBLOCK indicates a floating linetype (optional)                                                                     | BYLAYER                  |
|        347 | Hard-pointer ID/handle to material object (present if not BYLAYER)                                                                                                            | BYLAYER                  |
|         62 | Color number (present if not BYLAYER); zero indicates the BYBLOCK (floating) color; 256 indicates BYLAYER; a negative value indicates that the layer is turned off (optional) | BYLAYER                  |
|        370 | Lineweight enum value. Stored and moved around as a 16-bit integer.                                                                                                           | not omitted              |
|         48 | Linetype scale (optional)                                                                                                                                                     | 1.0                      |
|         60 | Object visibility (optional): 0 = Visible 1 = Invisible                                                                                                                       | 0                        |
|         92 | Number of bytes in the proxy entity graphics represented in the subsequent 310 groups, which are binary chunk records (optional)                                              | no default               |
|        310 | Proxy entity graphics data (multiple lines; 256 characters max. per line) (optional)                                                                                          | no default               |
|        420 | A 24-bit color value that should be dealt with in terms of bytes with values of 0 to 255.                                                                                     | no default               |
|        430 | The lowest byte is the blue value, the middle byte is the green value, and the third byte is the red value.                                                                   | no default               |
|        440 | The top byte is always 0. The group code cannot be used by custom entities for their own data because                                                                         | no default               |
|        390 | the group code is reserved for AcDbEntity, class-level color data and AcDbEntity, class-level                                                                                 | no default               |
|        284 | transparency data Color name. The group code cannot be used by custom entities for their own                                                                                  | no default               |
|            | data because the group code is reserved for AcDbEntity, class-level color data and AcDbEntity,                                                                                |                          |
|            | class-level transparency data Transparency value. The group code cannot be used by custom entities                                                                            |                          |
|            | for their own data because the group code is reserved for AcDbEntity, class-level color data and AcDbEntity,                                                                  |                          |
|            | class-level transparency data Hard-pointer ID/handle to the plot style object Shadow mode 0 = Casts                                                                           |                          |
|            | and receives shadows 1 = Casts shadows 2 = Receives shadows 3 = Ignores shadows NOTE:Starting                                                                                 |                          |
|            | with AutoCAD 2016-based products, this property is obsolete but still supported for backwards compatibility.                                                                  |                          |

"))

(defmethod dxf-out-text ((x Acad-Entity) stream)
  (dxf-out-t-string 0 *Acad-Entity-class-marker* stream))

(defmethod dxf-out-text :after ((x Acad-Entity) stream)
  (dxf-out-t-string 100 *Acad-Entity-subclass-marker* stream)
  (let ((la  (Layer  x))
	(cl  (truecolor x))
	(lt  (linetype  x)))
    (dxf-out-t-string 8 la stream)
    (unless (string= "BYLAYER" lt ) (dxf-out-t 6 lt stream))
    (cond
      ((= 256 (first cl)))
      ((= 0   (first cl)) (dxf-out-t 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf-out-t-int16 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf-out-t-int16 62  (first cl) stream)
       (dxf-out-t-int32 420 (color-rgb-to-truecolor (second cl)) stream)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LLLL;;

(defmethod dxf-out-binary ((x Acad-Entity) stream)
  (dxf-out-b-string 0 *Acad-Entity-class-marker* stream))

(defmethod dxf-out-binary :after ((x Acad-Entity) stream)
  (dxf-out-b-string 100 *Acad-Entity-subclass-marker* stream)
  (let ((hdl (Handle x))
	(la (Layer x))
	(cl (truecolor x)))
    (when hdl (dxf-out-b-hex 5 hdl stream))
    (dxf-out-b-string 8 la stream)
    (unless (= 256 cl) (dxf-out-b-int16 62  cl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text :after ((object Acad-Entity) (pairs cons))
  (let ((c-8   (cadr (assoc   8 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal))))
    (when c-8   (setf (layer     object) c-8))
    (when c-6   (setf (linetype  object) c-6))
    (cond
      ((and c-62 c-420)
       (setf (truecolor object)
	     (list c-62 (color-truecolor-to-rgb   c-420))))
      (c-62
       (setf (truecolor object)
	     (list c-62 nil)))
      (t
       (setf (truecolor object) (list 256 nil))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-curve-class-marker* "CURVE")

(defparameter *db-curve-subclass-marker* "AcDbCurve")

(defclass db-curve (Acad-Entity) ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Acad-Line-class-marker* "LINE")

(defparameter *Acad-Line-subclass-marker* "AcDbLine")

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

* Object Inheritance
Object
   AcadObject AcadEntity
         AcadLine

* Members
These members are part of this object:
** Methods 
ArrayPolar ArrayRectangular Copy Delete GetBoundingBox GetExtensionDictionary GetXData Highlight IntersectWith Mirror Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData TransformBy Update
** Properties 
Angle Application Delta Document EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Length Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName StartPoint Thickness TrueColor Visible
** Events 
Modified


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

(defmethod  dxf-in-text  ((object Acad-Line) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) '(0 "LINE"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(defparameter *db-point-class-marker* "POINT")

(defparameter *db-point-subclass-marker* "AcDbPoint")

(defclass db-point (Acad-Entity)
  ((position-point    :accessor position-point    :initarg :position-point :initform (vector 0 0 0) :documentation "Код  10. Положение точки")
   (thickness         :accessor thickness         :initarg :thickness      :initform 0              :documentation "Код  39. Высота выдавливания")
   (normal            :accessor normal            :initarg :normal         :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания")
   (ecs-rotation      :accessor ecs-rotation      :initarg :ecs-rotation   :initform 0              :documentation "Код  50. Поворот системы координат объекта"))
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
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|"))

(defmethod dxf-out-text ((x db-point) stream)
    (dxf-out-t-string 0 *db-point-class-marker* stream))

(defmethod dxf-out-text :after ((x db-point) stream)
  (dxf-out-t-string 100 *db-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (position-point x))
	(ecs (ecs-rotation x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-t-double 50 ecs stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-point) stream)
  (dxf-out-b-string 0 *db-point-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-point) stream)
  (dxf-out-b-string 100 *db-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (position-point x))
	(ecs (ecs-rotation x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-b-double 50 ecs stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-ray-class-marker* "RAY")

(defparameter *db-ray-subclass-marker* "AcDbRay")

(defclass db-ray (db-curve)
  ((base-point   :accessor base-point   :initarg :base-point   :initform (vector 0 0 0) :documentation "Код 10. Базовая точка")
   (unit-dir     :accessor unit-dir     :initarg :unit-dir     :initform (vector 1 0 0) :documentation "Код 11. Едининчный вектор в МСК, задающий направление"))
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

(defmethod dxf-out-text ((x db-ray) stream)
  (dxf-out-t-string 0 *db-ray-class-marker* stream))

(defmethod dxf-out-text  :after ((x db-ray) stream)
  (dxf-out-t-string 100 *db-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (unit-dir x)))
    (dxf-out-t-point-3d 10 b-p stream)
    (dxf-out-t-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x db-ray) stream)
  (dxf-out-b-string 0 *db-ray-class-marker* stream))

(defmethod dxf-out-binary  :after ((x db-ray) stream)
  (dxf-out-b-string 100 *db-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (unit-dir x)))
    (dxf-out-b-point-3d 10 b-p stream)
    (dxf-out-b-point-3d 11 u-d stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-xline-class-marker* "XLINE")

(defparameter *db-xline-subclass-marker* "AcDbXline")

(defclass db-xline (db-curve)
  ((base-point :accessor base-point :initarg :base-point :initform (vector 0 0 0) :documentation "Код 10. Первая точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (unit-dir   :accessor unit-dir   :initarg :unit-dir   :initform (vector 1 0 0) :documentation "Код 40. Вектор единичного направления (в МСК). Файл DXF: значение X; приложение: 3D-вектор"))
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
|---------------+--------------------------------------------------------------|"))

(defmethod dxf-out-text ((x db-xline) stream)
  (dxf-out-t-string 0 *db-xline-class-marker* stream))

(defmethod dxf-out-text  :after ((x db-xline) stream)
  (dxf-out-t-string 100 *db-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (unit-dir x)))
    (dxf-out-t-point-3d 10 b-p stream)
    (dxf-out-t-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x db-xline) stream)
  (dxf-out-b-string 0 *db-xline-class-marker* stream))

(defmethod dxf-out-binary  :after ((x db-xline) stream)
  (dxf-out-b-string 100 *db-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (unit-dir x)))
    (dxf-out-b-point-3d 10 b-p stream)
    (dxf-out-b-point-3d 11 u-d stream)))

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

* Object Inheritance
 Object
   AcadObject AcadEntity
         AcadCircle
* Members
These members are part of this object:
** Methods
ArrayPolar ArrayRectangular Copy Delete GetBoundingBox GetExtensionDictionary GetXData Highlight IntersectWith Mirror Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData TransformBy Update
** Properties
Application Area Center Circumference Diameter Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Radius Thickness TrueColor Visible
** Events
Modified
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
  (let (
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	
	)
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

(defparameter *db-arc-class-marker* "ARC")

(defparameter *db-arc-subclass-marker* "AcDbArc")

(defclass db-arc (db-curve)
  ((center      :accessor center      :initarg :center      :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius      :accessor radius      :initarg :radius      :initform 1              :documentation "Код 40. Радиус")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-angle :accessor start-angle :initarg :start-angle :initform 0              :documentation "Код 50. Начальный угол")
   (end-angle   :accessor end-angle   :initarg :end-angle   :initform (* -1 pi)      :documentation "Код 51. Конечный угол"))
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
|---------------+---------------------------------------------------------------------------|"))

(defmethod dxf-out-text ((x db-arc) stream)
  (dxf-out-t-string 0 *db-arc-class-marker* stream))

(defmethod dxf-out-text :after ((x db-arc) stream)
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
    (dxf-out-t-string 100 *db-arc-subclass-marker* stream)
    (dxf-out-t-double 50 s-a stream)
    (dxf-out-t-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-arc) stream)
  (dxf-out-b-string 0 *db-arc-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-arc) stream)
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
    (dxf-out-b-string 100 *db-arc-subclass-marker* stream)
    (dxf-out-b-double 50 s-a stream)
    (dxf-out-b-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))

;;(dxf-out-binary *a-0* *o*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-text-class-marker* "TEXT")

(defparameter *db-text-subclass-marker* "AcDbText")

(defclass db-text (Acad-Entity)
  ((thickness         :accessor thickness         :initarg :thickness           :initform 0              :documentation "Код  39. Thickness (optional; default = 0)")
   (position-point    :accessor position-point    :initarg :position-point      :initform (vector 0 0 0) :documentation "Код  10. First alignment point (in OCS) DXF: X value; APP: 3D point")
   (height            :accessor height            :initarg :height              :initform 3.5            :documentation "Код  40. Text height")
   (text-string       :accessor text-string       :initarg :text-string         :initform ""             :documentation "Код   1. Default value (the string itself)")
   (rotation          :accessor rotation          :initarg :rotation            :initform 0              :documentation "Код  50. Text rotation (optional; default = 0)")
   (width-factor      :accessor width-factor      :initarg :width-factor        :initform 1              :documentation "Код  41. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (oblique           :accessor oblique           :initarg :oblique             :initform 0              :documentation "Код  51. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (text-style        :accessor text-style        :initarg :text-style          :initform "STANDARD"     :documentation "Код   7. Text style name (optional, default = STANDARD")
   (mirror-in-xy      :accessor mirror-in-xy      :initarg :mirror-in-xy        :initform 0              :documentation "Код  71. Text generation flags (optional, default = 0): 2 = Text is backward (mirrored in X) ; 4 = Text is upside down (mirrored in Y)")
   (hor-justification :accessor hor-justification :initarg :hor-justification   :initform 0              :documentation "Код  72. Horizontal text justification type (optional, default = 0) integer codes (not bit-coded). 0 = Left; 1= Center; 2 = Right; 3 = Aligned (if vertical alignment = 0); 4 = Middle (if vertical alignment = 0); 5 = Fit (if vertical alignment = 0). See the Group 72 and 73 integer codes table for clarification")
   (alignment-point   :accessor alignment-Point   :initarg :alignment-Point     :initform (vector 0 0 0) :documentation "Код  11. Second alignment point (in OCS) (optional). DXF: X value; APP: 3D point. This value is meaningful only if the value of a 72 or 73 group is nonzero (if the justification is anything other than baseline/left)")
   (normal            :accessor normal            :initarg :normal              :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (ver-justification :accessor ver-justification :initarg :ver-justification   :initform 0              :documentation "Код  73. Vertical text justification type (optional, default = 0): integer codes (not bit-coded): 0 = Baseline; 1 = Bottom; 2 = Middle; 3 = Top. See the Group 72 and 73 integer codes table for clarification"))
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

(defmethod dxf-out-text ((x db-text) stream)
    (dxf-out-t-string 0 *db-text-class-marker* stream))

(defmethod dxf-out-text :after ((x db-text) stream)
  (dxf-out-t-string 100 *db-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (position-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (width-factor x))
	(ob  (oblique x))
	(st  (text-style x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (alignment-point x))
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
    (dxf-out-t-string 100 *db-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf-out-t-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-text) stream)
  (dxf-out-b-string 0 *db-text-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-text) stream)
  (dxf-out-b-string 100 *db-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (position-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (width-factor x))
	(ob  (oblique x))
	(st  (text-style x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (alignment-point x))
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
    (dxf-out-b-string 100 *db-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf-out-b-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-ellipse-class-marker* "ELLIPSE")

(defparameter *db-ellipse-subclass-marker* "AcDbEllipse")

(defclass db-ellipse (db-curve)
  ((center       :accessor center       :initarg :center       :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (major-axis   :accessor major-axis   :initarg :major-axis   :initform (vector 1 0 0) :documentation "Код 11. Конечная точка главной оси относительно центральной точки (в МСК) (mapcar #'+ center major-axis)")
   (unit-normal  :accessor unit-normal  :initarg :unit-normal  :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (radius-ratio :accessor radius-ratio :initarg :radius-ratio :initform 0.5d0          :documentation "Код 40. Соотношение малой и главной осей")
   (start-param  :accessor start-param  :initarg :start-param  :initform 0              :documentation "Код 41. Начальный параметр")
   (end-param    :accessor end-param    :initarg :end-param    :initform (* 2 pi)       :documentation "Код 42. Конечный параметр"))
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
|---------------+------------------------------------------------------------------------------------------------|"))

(defmethod dxf-out-text ((x db-ellipse) stream)
  (dxf-out-t-string 0 *db-ellipse-class-marker* stream))

(defmethod dxf-out-text :after ((x db-ellipse) stream)
  (dxf-out-t-string 100 *db-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (unit-normal x))
	(u-n-x (svref (unit-normal x) 0))
	(u-n-y (svref (unit-normal x) 1))
	(u-n-z (svref (unit-normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-param x))
	(e-p (end-param   x)))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf-out-t-point-3d 210 u-n stream))
    (dxf-out-t-double 40 r-r stream)
    (dxf-out-t-double 41 s-p stream)
    (dxf-out-t-double 42 e-p stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-ellipse) stream)
  (dxf-out-b-string 0 *db-ellipse-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-ellipse) stream)
  (dxf-out-b-string 100 *db-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (unit-normal x))
	(u-n-x (svref (unit-normal x) 0))
	(u-n-y (svref (unit-normal x) 1))
	(u-n-z (svref (unit-normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-param x))
	(e-p (end-param   x)))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf-out-b-point-3d 210 u-n stream))
    (dxf-out-b-double 40 r-r stream)
    (dxf-out-b-double 41 s-p stream)
    (dxf-out-b-double 42 e-p stream)))

(defclass AcadDatabase ()
  (
   (Blocks                  :accessor Blocks                 :initarg :Blocks :initform nil :documentation "")
   (Dictionaries            :accessor Dictionaries           :initarg :Dictionaries :initform nil :documentation "")
   (DimStyles               :accessor DimStyles              :initarg :DimStyles :initform nil :documentation "")
   (Groups                  :accessor Groups                 :initarg :Groups :initform nil :documentation "")
   (Layers                  :accessor Layers                 :initarg :Layers :initform nil :documentation "")
   (Layouts                 :accessor Layouts                :initarg :Layouts :initform nil :documentation "")
   (Limits                  :accessor Limits                 :initarg :Limits :initform nil :documentation "") ;;;;;
   (Linetypes               :accessor Linetypes              :initarg :Linetypes :initform nil :documentation "")
   (Materials               :accessor Materials              :initarg :Materials :initform nil :documentation "")
   (PlotConfigurations      :accessor PlotConfigurations     :initarg :PlotConfigurations :initform nil :documentation "")
   (RegisteredApplications  :accessor RegisteredApplications :initarg :RegisteredApplications :initform nil :documentation "")
   (TextStyles              :accessor TextStyles             :initarg :TextStyles :initform nil :documentation "")
   (UserCoordinateSystems   :accessor UserCoordinateSystems  :initarg :UserCoordinateSystems :initform nil :documentation "")
   (Viewports               :accessor Viewports              :initarg :Viewports :initform nil :documentation "" )
   (Views                   :accessor Views                  :initarg :Views :initform nil :documentation "")
   (ElevationModelSpace)
   (ElevationPaperSpace)
   (ModelSpace)
   (PaperSpace)
   (Preferences)
   (SectionManager)
   (SummaryInfo)
   )
  (:documentation
   "
* Object Inheritance
 Object
  AcadDatabase
* Members
These members are part of this object:
** Methods
CopyObjects
HandleToObject
ObjectIdToObject
** Properties
Blocks
Dictionaries
DimStyles
ElevationModelSpace
ElevationPaperSpace
Groups
Layers
Layouts
Limits
Linetypes
Material
ModelSpace
PaperSpace
PlotConfigurations
Preferences
RegisteredApplications
SectionManager
SummaryInfo
TextStyles
UserCoordinateSystems
Viewports
Views
** Events
None
"))

(defclass AcadDocument (AcadDatabase)
  (
   (Active)
   (ActiveDimStyle)
   (ActiveLayer)
   (ActiveLayout)
   (ActiveLinetype)
   (ActiveMaterial)
   (ActivePViewport)
   (ActiveSelectionSet)
   (ActiveSpace)
   (ActiveTextStyle)
   (ActiveUCS)
   (ActiveViewport)
   (Application)
   (Database)
   (FullName)
   (Height)
   (HWND)
   (MSpace)
   (Name)
   (ObjectSnapMode)
   (Path)
   (PickfirstSelectionSet)
   (Plot)
   (ReadOnly)
   (Saved)
   (SelectionSets)
   (Utility)
   (Width)
   (WindowState)
   (WindowTitle))
  (:documentation "
* Object Inheritance
 Object
   AcadDatabase
      AcadDocument
Members
These members are part of this object:
** Methods
 Activate
 AuditInfo
 Close
 CopyObjects
 EndUndoMark
 Export
 GetVariable
 HandleToObject
 Import
 LoadShapeFile
 New
 ObjectIDToObject
 Open
 PostCommand
 PurgeAll
 Regen
 Save
 SaveAs
 SendCommand
 SetVariable
 StartUndoMark
 WBlock
** Properties
 Active
 ActiveDimStyle
 ActiveLayer
 ActiveLayout
 ActiveLinetype
 ActiveMaterial
 ActivePViewport
 ActiveSelectionSet
 ActiveSpace
 ActiveTextStyle
 ActiveUCS
 ActiveViewport
 Application
 Blocks
 Database
 Dictionaries
 DimStyles
 ElevationModelSpace
 ElevationPaperSpace
 FullName
 Groups
 Height
 HWND
 Layers
 Layouts
 Limits
 Linetypes
 Materials
 ModelSpace
 MSpace
 Name
 ObjectSnapMode
 PaperSpace
 Path
 PickfirstSelectionSet
 Plot
 PlotConfigurations
 Preferences
 ReadOnly
 RegisteredApplications
 Saved
 SectionManager
 SelectionSets
 SummaryInfo
 TextStyles
 UserCoordinateSystems
 Utility
 Viewports
 Views
 Width
 WindowState
 WindowTitle
** Events
 Activate
 BeginClose
 BeginCommand
 BeginDocClose
 BeginDoubleClick
 BeginLISP
 BeginPlot
 BeginRightClick
 BeginSave
 BeginShortcutMenuCommand
 BeginShortcutMenuDefault
 BeginShortcutMenuEdit
 BeginShortcutMenuGrip
 BeginShortcutMenuOSnap
 Deactivate
 EndCommand
 EndLISP
 EndPlot
 EndSave
 EndShortcutMenu
 LayoutSwitched
 LISPCancelled
 ObjectAdded
 ObjectErased
 ObjectModified
 SelectionChanged
 WindowChanged
 WindowMovedOrResized
 "))

 ;====================================================================================================

 ;;;; http://help.autodesk.com/view/ACD/2017/RUS/

 ;;;;AcRxObject
 ;;;;  AcDbObject
 ;;;;     AcDbEntity
 ;;;;      AcDbText -
 ;;;;        AcDbAttribute
 ;;;;        AcDbAttributeDefinition
 ;;;;      AcDbBlockBegin
 ;;;;      AcDbBlockEnd
 ;;;;      AcDbSequenceEnd
 ;;;;      AcDbBlockReference
 ;;;;        AcDbMInsertBlock
 ;;;;      AcDbVertex
 ;;;;        AcDb2dVertex
 ;;;;        AcDb3dPolylineVertex
 ;;;;        AcDbPolygonMeshVertex
 ;;;;        AcDbPolyFaceMeshVertex
 ;;;;        AcDbFaceRecord
 ;;;;      AcDbCurve
 ;;;;        AcDb2dPolyline                  ./dbents.h:class AcDb2dPolyline: public AcDbCurve 
 ;;;;        AcDb3dPolyline                  ./dbents.h:class AcDb3dPolyline: public AcDbCurve 
 ;;;;        AcDbArc                +        ./dbents.h:class AcDbArc: public AcDbCurve 
 ;;;;        AcDbCircle             +        ./dbents.h:class AcDbCircle: public AcDbCurve 
 ;;;;        AcDbLine               +        ./dbents.h:class AcDbLine: public AcDbCurve 
 ;;;;        AcDbRay                -        ./dbray.h:class AcDbRay: public AcDbCurve 
 ;;;;        AcDbXline              -        ./dbxline.h:class AcDbXline: public AcDbCurve
 ;;;;        AcDbPolyline                    ./dbpl.h:class AcDbPolyline : public AcDbCurve
 ;;;;        AcDbSpline                      ./dbspline.h:class AcDbSpline: public AcDbCurve
 ;;;;        AcDbEllipse                     ./dbelipse.h:class AcDbEllipse: public  AcDbCurve
 ;;;;        AcDbLeader                      ./dblead.h:class AcDbLeader: public  AcDbCurve  
 ;;;;      AcDbPoint                +        ./dbents.h:class AcDbPoint: public AcDbEntity
 ;;;;      AcDbFace
 ;;;;      AcDbPolyFaceMesh
 ;;;;      AcDbPolygonMesh
 ;;;;      AcDbTrace
 ;;;;      AcDbSolid
 ;;;;      AcDbShape
 ;;;;      AcDbViewport
