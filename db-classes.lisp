;;;; db-classes.lisp

(in-package #:dxf)

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
;;;;        AcDb2dPolyline
;;;;        AcDb3dPolyline
;;;;        AcDbArc +
;;;;        AcDbCircle +
;;;;        AcDbLine +
;;;;      AcDbPoint +
;;;;      AcDbFace
;;;;      AcDbPolyFaceMesh
;;;;      AcDbPolygonMesh
;;;;      AcDbTrace
;;;;      AcDbSolid
;;;;      AcDbShape
;;;;      AcDbViewport

(defparameter *radian-to-degree* (/ 180 pi))

(defparameter *degree-to-radian* (/ pi 180))

(defclass Ge-Point-3d ()
    ((point-3d :accessor point-3d :initarg :point-3d :initform (vector 0 0 0))))

(defmethod write-dxf-binary (code (point-3d Ge-Point-3d) stream)
  (dxf-out-binary-double (+ 00 code) (svref (point-3d point-3d) 0) stream)
  (dxf-out-binary-double (+ 10 code) (svref (point-3d point-3d) 1) stream)
  (dxf-out-binary-double (+ 20 code) (svref (point-3d point-3d) 2) stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Rx-Object ()
  ((name :accessor name :initarg :name :initform "")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Object ()
  ((object-id :accessor object-id :initarg :object-id :initform nil :documentation "")
   (owner-id :accessor owner-id :initarg :owner-id :initform nil :documentation "")
   (db-handle :accessor db-handle :initarg :db-handle :initform "0" :documentation "Код 5. Дескриптор")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Entity (Db-Object)
  ((layer      :accessor layer :initarg :layer :initform "0" :documentation "Код 8. Имя слоя")
   (color      :accessor color :initarg :color :initform 256 :documentation "Код 62. 16-битный цвет")
   (true-color :accessor true-color :initarg :color :initform "0" :documentation "Код 420. 32-битный цвет")))

(defmethod dxf-out-text ((x Db-Entity) stream) (format stream "   0~%~A~%" "Entity"))

(defmethod dxf-out-text :after ((x Db-Entity) stream)
  (format stream "100~%~A~%" "AcDbEntity")
  (format stream "   8~%~A~%" (layer x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Db-Entity) stream)
  (dxf-out-b-string 0 "ENTITY" stream))

(defmethod dxf-out-binary :after ((x Db-Entity) stream)
  (let ((la  (layer x))
	(cl (color x)))
    (dxf-out-b-string 100 "AcDbEntity" stream)
    (dxf-out-b-string 8 la stream)
    (unless (= 256 cl) (dxf-out-b-int16 62  cl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Line (Db-Entity)
  ((start-point :accessor start-point :initarg :start-point :initform (vector 0 0 0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (end-point   :accessor end-point   :initarg :end-point   :initform (vector 0 0 0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0               :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")))

(defmethod dxf-out-text ((x Db-Line) stream) (format stream "   0~%~A~%" "LINE"))

(defmethod dxf-out-text  :after ((x Db-Line) stream)
  (let ((th (thickness x))
	(x-s (svref (start-point x) 0))
	(y-s (svref (start-point x) 1))
	(z-s (svref (start-point x) 2))
	(x-e (svref (end-point x) 0))
	(y-e (svref (end-point x) 1))
	(z-e (svref (end-point x) 2))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (format stream "100~%~A~%" "AcDbLine")
    (unless (= th 0) (format stream "  39~%~A~%" th))
    (format stream "  10~%~A~%  20~%~A~%  30~%~A~%" x-s y-s z-s )
    (format stream "  11~%~A~%  21~%~A~%  31~%~A~%" x-e y-e z-e )
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream " 210~%~A~% 220~%~A~% 230~%~A~%" x-n y-n z-n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Db-Line) stream)
  (dxf-out-b-string 0 "LINE" stream))

(defmethod dxf-out-binary :after ((x Db-Line) stream)
  (let ((th (thickness x))
        (p-s (start-point x))
	(p-e (end-point x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (dxf-out-b-string 100 "AcDbLine" stream)
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-s stream)
    (dxf-out-b-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf-out-b-double 210 x-n stream)
      (dxf-out-b-double 220 y-n stream)
      (dxf-out-b-double 230 z-n stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Point (Db-Entity)
  ((position-point    :accessor position-point    :initarg :position-point    :initform (vector 0 0 0) :documentation "Код 10. Положение точки")
   (thickness    :accessor thickness    :initarg :thickness    :initform 0              :documentation "Код 39. Высота выдавливания")
   (normal       :accessor normal       :initarg :normal       :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания")
   (ecs-rotation :accessor ecs-rotation :initarg :ecs-rotation :initform 0              :documentation "Код 50. Поворот системы координат объекта")))

(defmethod dxf-out-text ((x Db-Point) stream) (format stream "   0~%~A~%" "POINT"))

(defmethod dxf-out-text  :after ((x Db-Point) stream)
  (let ((x (svref (position-point x) 0))
	(y (svref (position-point x) 1))
	(z (svref (position-point x) 2))
	(th (thickness x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(ecs (ecs-rotation x)))
    (format stream " 100~%~A~%" "AcDbPoint")
    (format stream "  10~%~A~%  20~%~A~%  30~%~A~%" x y z)
    (unless (= th 0) (format stream "  39~%~A~%" th))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream " 210~%~A~% 220~%~A~% 230~%~A~%" x-n y-n z-n))
    (unless (= ecs 0) (format stream "  50~%~A~%" ecs))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Db-Point) stream)
  (dxf-out-b-string 0 "POINT" stream))

(defmethod dxf-out-binary :after ((x Db-Point) stream)
  (let ((th  (thickness x))
        (pos (position-point x))
	(ecs (ecs-rotation x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (dxf-out-b-string 100 "AcDbPoint" stream)
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-b-double 50 ecs stream))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Ray (Db-Entity)
  ((base-point   :accessor base-point   :initarg :base-point   :initform (vector 0 0 0) :documentation "Код 10. Базовая точка")
   (unit-dir     :accessor unit-dir     :initarg :unit-dir     :initform (vector 1 0 0) :documentation "Код 11. Едининчный вектор в МСК, задающий направление")))

(defmethod dxf-out-text ((x Db-Ray) stream) (format stream "   0~%~A~%" "RAY"))

(defmethod dxf-out-text  :after ((x Db-Ray) stream)
  (format stream "100~%~A~%" "AcDbRay")
  (let ((x-b-p (svref (base-point x) 0))
	(y-b-p (svref (base-point x) 1))
	(z-b-p (svref (base-point x) 2))
	(x-u-d (svref (unit-dir x) 0))
	(y-u-d (svref (unit-dir x) 1))
	(z-u-d (svref (unit-dir x) 2)))
    (format stream "  10~%~A~%  20~%~A~%  30~%~A~%" x-b-p y-b-p z-b-p)
    (format stream "  11~%~A~%  21~%~A~%  31~%~A~%" x-u-d y-u-d z-u-d)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Circle (Db-Entity)
  ((center    :accessor center     :initarg :center    :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius    :accessor radius     :initarg :radius    :initform 1              :documentation "Код 40. Радиус")
   (thickness :accessor thickness  :initarg :thickness :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal    :accessor normal     :initarg :normal    :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")))

(defmethod dxf-out-text ((x Db-Circle) stream) (format stream "   0~%~A~%" "CIRCLE"))

(defmethod dxf-out-text  :after ((x Db-Circle) stream)
  (let ((x-c (svref (center x) 0))
	(y-c (svref (center x) 1))
	(z-c (svref (center x) 2))
	(th (thickness x))
	(r (radius x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (format stream " 100~%~A~%" "AcDbCircle")
    (unless (= (thickness x) 0) (format stream "  39~%~A~%" th))
    (format stream "  10~%~A~%  20~%~A~%  30~%~A~%" x-c y-c z-c)
    (format stream "  40~%~A~%" r)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream " 210~%~A~% 220~%~A~% 230~%~A~%" x-n y-n z-n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Db-Circle) stream)
  (dxf-out-b-string 0 "CIRCLE" stream))

(defmethod dxf-out-binary :after ((x Db-Circle) stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	)
    (dxf-out-b-string 100 "AcDbCircle" stream)
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Arc (Db-Entity)
  ((center      :accessor center      :initarg :center      :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius      :accessor radius      :initarg :radius      :initform 1              :documentation "Код 40. Радиус")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-angle :accessor start-angle :initarg :start-angle :initform 0              :documentation "Код 50. Начальный угол")
   (end-angle   :accessor end-angle   :initarg :end-angle   :initform (* -1 pi)       :documentation "Код 51. Конечный угол")))

(defmethod dxf-out-text ((x Db-Arc) stream) (format stream "   0~%~A~%" "ARC"))

(defmethod dxf-out-text :after ((x Db-Arc) stream)
  (let ((x-c (svref (center x) 0))
	(y-c (svref (center x) 1))
	(z-c (svref (center x) 2))
	(th (thickness x))
	(r (radius x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (format stream " 100~%~A~%" "AcDbCircle")
    (format stream "  10~%~A~%  20~%~A~%  30~%~A~%" x-c y-c z-c)
    (unless (= (thickness x) 0) (format stream "  39~%~A~%" th))
    (format stream "  40~%~A~%" r)
    (format stream " 100~%~A~%" "AcDbArc")
    (format stream "  50~%~A~%" s-a)
    (format stream "  51~%~A~%" e-a)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream " 210~%~A~% 220~%~A~% 230~%~A~%" x-n y-n z-n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Db-Arc) stream)
  (dxf-out-b-string 0 "ARC" stream))

(defmethod dxf-out-binary :after ((x Db-Arc) stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (dxf-out-b-string 100 "AcDbCircle" stream)
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-double 40 rad stream)
    (dxf-out-b-string 100 "AcDbArc" stream)
    (dxf-out-b-double 50 s-a stream)
    (dxf-out-b-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass Db-Text (Db-Entity)
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
   (ver-justification :accessor ver-justification :initarg :ver-justification   :initform 0              :documentation "Код  73. Vertical text justification type (optional, default = 0): integer codes (not bit-coded): 0 = Baseline; 1 = Bottom; 2 = Middle; 3 = Top. See the Group 72 and 73 integer codes table for clarification")))

(defmethod dxf-out-text ((x Db-Text) stream) (format stream "   0~%~A~%" "TEXT"))

(defmethod dxf-out-text :after ((x Db-Text) stream)
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
	(a-p (alignment-point x)) (a-p-x (svref (normal x) 0)) (a-p-y (svref (normal x) 1)) (a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (format stream "  39~%~A~%" th))
    (format stream " 100~%~A~%" "AcDbText")
    (format stream "  10~%~A~%  20~%~A~%  30~%~A~%" (svref p-p 0) (svref p-p 1) (svref p-p 2))
    (format stream "  40~%~A~%" h)
    (format stream "  1~%~A~%" t-s)
    (format stream "  50~%~A~%" (* *radian-to-degree* rot))
    (unless (= w-f 1) (format stream "  41~%~A~%" w-f))
    (unless (= ob 0) (format stream "  51~%~A~%" (* *radian-to-degree* ob)))
    (format stream "  7~%~A~%" st)
    (unless (= mir 0) (format stream "  71~%~A~%" mir))
    (unless (= h-j 0) (format stream "  72~%~A~%" h-j))
    (when   (or (/= h-j 0) (/= v-j 0)) (format stream " 11~%~A~% 21~%~A~% 31~%~A~%" a-p-x a-p-y a-p-z))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream " 210~%~A~% 220~%~A~% 230~%~A~%" x-n y-n z-n))
    (format stream " 100~%~A~%" "AcDbText")
    (unless (= v-j 0) (format stream "  73~%~A~%" v-j))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Db-Text) stream)
  (dxf-out-b-string 0 "TEXT" stream))

(defmethod dxf-out-binary :after ((x Db-Text) stream)
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
	(a-p-x (svref (normal x) 0))
	(a-p-y (svref (normal x) 1))
	(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (dxf-out-b-string 100 "AcDbText" stream)
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
    (dxf-out-b-string 100 "AcDbText" stream)
    (unless (= v-j 0) (dxf-out-b-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass Db-Symbol-Table-Record ()
  ((table-name        :accessor table-name        :initarg :table-name          :initform "Undefined"    :documentation "Имя таблицы")
   (is-dependent      :accessor is-dependent      :initarg :is-dependent        :initform nil            :documentation "Является-ли имя таблицы зависимым")
   (is-resolved       :accessor is-resolved       :initarg :is-resolved         :initform t              :documentation "Вычислено-ли имя таблицы")
   (is-renamable      :accessor is-renamable      :initarg :is-renamable        :initform t              :documentation "Допускается-ли переименовывать таблицу")
  ))

(defclass Db-Layer-TableRecord (Db-Symbol-Table-Record)
;;;;"AcDbLayerTableRecord"
  ((is-frozen         :accessor is-frozen         :initarg :is-frozen           :initform nil            :documentation "Код  70. 1 = Layer is frozen; otherwise layer is thawed")
   (is-vp-frozen      :accessor is-vp-frozen      :initarg :is-vp-frozen        :initform nil            :documentation "Код  70. 2 = Layer is frozen by default in new viewports")
   (is-locked         :accessor is-locked         :initarg :is-locked           :initform nil            :documentation "Код  70. 4 = Layer is locked")
   (is-hidden         :accessor is-hidden         :initarg :is-hidden           :initform nil            :documentation "Код  70. 4 = Layer is locked")   
   (color             :accessor color             :initarg :color               :initform ""             :documentation "Код  62. Номер цвета (если значение отрицательное, слой отключен)")
   (line-type-id      :accessor line-type-id      :initarg :line-type-id        :initform nil            :documentation "Код   6. Имя типа линий")
   (is-plottable      :accessor is-plottable      :initarg :is-plottable        :initform t              :documentation "Код 290. Флаг печати. Если задано значение 0, этот слой не выводится на печать")
   (line-weight       :accessor line-weight       :initarg :line-weight         :initform 0.25           :documentation "Код 370. Значение из перечисления весов линии")
   (plot-style-name   :accessor plot-style-name   :initarg :plot-style-name     :initform 0.25           :documentation "Код 390. Hard-pointer ID/handle of PlotStyleName object")
   (material-id       :accessor material-id       :initarg :plot-style-name     :initform nil            :documentation "Код 347. Идентификатор/дескриптор жесткого указателя на объект материала"))
 
  (:documentation "
LAYER (DXF)

К записям таблицы обозначений LAYER применяются следующие групповые коды.

Групповые коды LAYER
|---------------+-------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLayerTableRecord)                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             2 | Имя слоя                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|            70 | Стандартные флаги (битовые кодовые значения):                                                         |
|               | 1 = слой заморожен; в противном случае слой разморожен                                                |
|               | 2 = слой заморожен по умолчанию на новых видовых экранах                                              |
|               | 4 = слой заблокирован                                                                                 |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                       |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается            |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,          |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.       |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, |
|               | записывающих файлы DXF)                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|            62 | Номер цвета (если значение отрицательное, слой отключен)                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|             6 | Имя типа линий                                                                                        |
|---------------+-------------------------------------------------------------------------------------------------------|
|           290 | Флаг печати. Если задано значение 0, этот слой не выводится на печать                                 |
|---------------+-------------------------------------------------------------------------------------------------------|
|           370 | Значение перечня веса линий                                                                           |
|---------------+-------------------------------------------------------------------------------------------------------|
|           390 | Идентификатор/дескриптор жесткого указателя на объект PlotStyleName                                   |
|---------------+-------------------------------------------------------------------------------------------------------|
|           347 | Идентификатор/дескриптор жесткого указателя на объект материала                                       |
|---------------+-------------------------------------------------------------------------------------------------------|

Слои, зависимые от внешних ссылок, выводятся при выполнении команды СОХРАНИТЬКАК. Для этих слоев соответствующее имя типа линий в файле DXF всегда — CONTINUOUS.
" ))

