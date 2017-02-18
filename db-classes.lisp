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

(defclass db-object ()
  ((object-id        :accessor object-id     :initarg :object-id     :initform nil :documentation "")
   (object-owner     :accessor object-owner  :initarg :object-owner  :initform nil :documentation "")
   (object-handle    :accessor object-handle :initarg :object-handle :initform nil :documentation "Код 5. Дескриптор")
   (next-handle      :accessor next-handle   :initarg :next-handle   :initform 1   :allocation :class)))
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-entity-class-marker* "ENTITY")

(defparameter *db-entity-subclass-marker* "AcDbEntity")

(defclass db-entity (db-object)
  ((entity-layer      :accessor entity-layer      :initarg :entity-layer      :initform "0" :documentation "Код   8. Имя слоя")
   (entity-color      :accessor entity-color      :initarg :entity-color      :initform 256 :documentation "Код  62. 16-битный цвет")
   (entity-true-color :accessor entity-true-color :initarg :entity-true-color :initform nil :documentation "Код 420. 32-битный цвет"))
  (:documentation "См. dbmain.h"))

(defmethod dxf-out-text ((x db-entity) stream)
  (format stream "~A~%~A~%" (dxf-code 0) *db-entity-class-marker*))

(defmethod dxf-out-text :after ((x db-entity) stream)
  (let (
	(hdl (object-handle x))
	(la  (entity-layer  x))
	(cl  (entity-color  x))
	)
    (format stream "~A~%~A~%" (dxf-code 100) *db-entity-class-marker*)
    (when hdl (format stream "~A~%~X~%" (dxf-code   5) hdl))
    (format stream "~A~%~A~%" (dxf-code   8) la)
    (unless (= 256 cl) (format stream "~A~%~A~%" (dxf-code  62) cl))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-entity) stream)
  (dxf-out-b-string 0 *db-entity-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-entity) stream)
  (let ((la (entity-layer x))
	(cl (entity-color x)))
    (dxf-out-b-string 100 *db-entity-subclass-marker* stream)
    (dxf-out-b-string 8 la stream)
    (unless (= 256 cl) (dxf-out-b-int16 62  cl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-curve-class-marker* "CURVE")

(defparameter *db-curve-subclass-marker* "AcDbCurve")

(defclass db-curve (db-entity) ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-line-class-marker* "LINE")

(defparameter *db-line-subclass-marker* "AcDbLine")

(defclass db-line (db-curve)
  ((start-point :accessor start-point :initarg :start-point :initform (vector 0 0 0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (end-point   :accessor end-point   :initarg :end-point   :initform (vector 0 0 0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0               :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор"))
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
|---------------+---------------------------------------------------------------------------|"))

(defmethod dxf-out-text ((x db-line) stream)
  (format stream "~A~%~A~%" (dxf-code   0) *db-line-class-marker*))

(defmethod dxf-out-text  :after ((x db-line) stream)
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
    (format stream "~A~%~A~%" (dxf-code 100) *db-line-subclass-marker*)
    (unless (= th 0) (format stream "~A~%~A~%" (dxf-code 39) th))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) x-s (dxf-code 20) y-s (dxf-code 30) z-s)
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 11) x-e (dxf-code 21) y-e (dxf-code 31) z-e)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 210) x-n (dxf-code 220) y-n (dxf-code 230) z-n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-line) stream)
  (dxf-out-b-string 0 *db-line-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-line) stream)
  (let ((th (thickness x))
        (p-s (start-point x))
	(p-e (end-point x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (dxf-out-b-string 100 *db-line-subclass-marker* stream)
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-s stream)
    (dxf-out-b-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf-out-b-double 210 x-n stream)
      (dxf-out-b-double 220 y-n stream)
      (dxf-out-b-double 230 z-n stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-point-class-marker* "POINT")

(defparameter *db-point-subclass-marker* "AcDbPoint")

(defclass db-point (db-entity)
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
  (format stream "~A~%~A~%" (dxf-code 0) *db-point-class-marker*))

(defmethod dxf-out-text :after ((x db-point) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-point-subclass-marker*)
  (let ((x-p (svref (position-point x) 0))
	(y-p (svref (position-point x) 1))
	(z-p (svref (position-point x) 2))
	(th (thickness x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(ecs (ecs-rotation x)))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) x-p (dxf-code 20) y-p (dxf-code 30) z-p)
    (unless (= th 0) (format stream "~A~%~A~%" (dxf-code 39) th))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 210) x-n (dxf-code 220) y-n (dxf-code 230) z-n))
    (unless (= ecs 0) (format stream "~A~%~A~%" (dxf-code 50) ecs))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-point) stream)
  (dxf-out-b-string 0 *db-point-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-point) stream)
  (let ((th  (thickness x))
        (pos (position-point x))
	(ecs (ecs-rotation x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (dxf-out-b-string 100 *db-point-subclass-marker* stream)
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-b-double 50 ecs stream))
    ))

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
  (format stream "~A~%~A~%" (dxf-code 0) *db-ray-class-marker*))

(defmethod dxf-out-text  :after ((x db-ray) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-ray-subclass-marker*)
  (let ((x-b-p (svref (base-point x) 0))
	(y-b-p (svref (base-point x) 1))
	(z-b-p (svref (base-point x) 2))
	(x-u-d (svref (unit-dir x) 0))
	(y-u-d (svref (unit-dir x) 1))
	(z-u-d (svref (unit-dir x) 2)))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) x-b-p (dxf-code 20) y-b-p (dxf-code 30) z-b-p)
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 11) x-u-d (dxf-code 21) y-u-d (dxf-code 31) z-u-d)))



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
  (format stream "~A~%~A~%" (dxf-code 0) *db-xline-class-marker*))

(defmethod dxf-out-text  :after ((x db-xline) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-xline-subclass-marker*)
  (let ((x-b-p (svref (base-point x) 0))
	(y-b-p (svref (base-point x) 1))
	(z-b-p (svref (base-point x) 2))
	(x-u-d (svref (unit-dir x) 0))
	(y-u-d (svref (unit-dir x) 1))
	(z-u-d (svref (unit-dir x) 2)))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) x-b-p (dxf-code 20) y-b-p (dxf-code 30) z-b-p)
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 11) x-u-d (dxf-code 21) y-u-d (dxf-code 31) z-u-d)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-circle-class-marker* "CIRCLE")

(defparameter *db-circle-subclass-marker* "AcDbCircle")

(defclass db-circle (db-curve)
  ((center    :accessor center     :initarg :center    :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius    :accessor radius     :initarg :radius    :initform 1              :documentation "Код 40. Радиус")
   (thickness :accessor thickness  :initarg :thickness :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal    :accessor normal     :initarg :normal    :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор"))
  (:documentation "См. ./dbents.h:class AcDbCircle: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18

CIRCLE (DXF)
К объектам CIRCLE применяются следующие групповые коды.
Групповые коды CIRCLE 
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
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|               | Понятия, связанные с данным                                               |
|---------------+---------------------------------------------------------------------------|
"))

(defmethod dxf-out-text ((x db-circle) stream)
  (format stream "~A~%~A~%" (dxf-code 0) *db-circle-class-marker*))

(defmethod dxf-out-text  :after ((x db-circle) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-circle-subclass-marker*)
  (let ((x-c (svref (center x) 0))
	(y-c (svref (center x) 1))
	(z-c (svref (center x) 2))
	(th (thickness x))
	(r (radius x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= (thickness x) 0) (format stream "~A~%~A~%" (dxf-code 39) th))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) x-c (dxf-code 20) y-c (dxf-code 30) z-c)
    (format stream "~A~%~A~%" (dxf-code 40) r)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 210) x-n (dxf-code 220) y-n (dxf-code 230) z-n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-circle) stream)
  (dxf-out-b-string 0 *db-circle-class-marker*  stream))

(defmethod dxf-out-binary :after ((x db-circle) stream)
  (dxf-out-b-string 100 *db-circle-subclass-marker* stream)
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
  (format stream "~A~%~A~%" (dxf-code 0) *db-arc-class-marker*))

(defmethod dxf-out-text :after ((x db-arc) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-circle-subclass-marker*)
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
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) x-c (dxf-code 20) y-c (dxf-code 30) z-c)
    (unless (= (thickness x) 0) (format stream "~A~%~A~%" (dxf-code 39) th))
    (format stream "~A~%~A~%" (dxf-code 40) r)
    (format stream "~A~%~A~%" (dxf-code 50) s-a)
    (format stream "~A~%~A~%" (dxf-code 51) e-a)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 210) x-n (dxf-code 220) y-n (dxf-code 230) z-n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x db-arc) stream)
  (dxf-out-b-string 0 *db-arc-class-marker* stream))

(defmethod dxf-out-binary :after ((x db-arc) stream)
  (dxf-out-b-string 100 *db-circle-subclass-marker* stream)
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
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    ))

;;(dxf-out-binary *a-0* *o*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-text-class-marker* "TEXT")

(defparameter *db-text-subclass-marker* "AcDbText")

(defclass db-text (db-entity)
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
  (format stream "~A~%~A~%" (dxf-code 0) *db-text-class-marker*))

(defmethod dxf-out-text :after ((x db-text) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-text-subclass-marker*)
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
	;(a-p (alignment-point x))
	(a-p-x (svref (normal x) 0))
	(a-p-y (svref (normal x) 1))
	(a-p-z (svref (normal x) 2))
	;(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (format stream "~A~%~A~%" (dxf-code 39) th))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) (svref p-p 0) (dxf-code 20) (svref p-p 1) (dxf-code 30) (svref p-p 2))
    (format stream "~A~%~A~%" (dxf-code 40) h)
    (format stream "~A~%~A~%" (dxf-code 1) t-s)
    (format stream "~A~%~A~%" (dxf-code 50) (* *radian-to-degree* rot))
    (unless (= w-f 1) (format stream "~A~%~A~%" (dxf-code 41) w-f))
    (unless (= ob 0) (format stream "~A~%~A~%" (dxf-code 51) (* *radian-to-degree* ob)))
    (format stream "~A~%~A~%" (dxf-code 7) st)
    (unless (= mir 0) (format stream "~A~%~A~%" (dxf-code 71) mir))
    (unless (= h-j 0) (format stream "~A~%~A~%" (dxf-code 72) h-j))
    (when   (or (/= h-j 0) (/= v-j 0)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 11) a-p-x (dxf-code 21) a-p-y (dxf-code 31) a-p-z))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 210) x-n (dxf-code 220) y-n (dxf-code 230) z-n))
    (format stream "~A~%~A~%" (dxf-code 100) "AcDbText")
    (unless (= v-j 0) (format stream "~A~%~A~%" (dxf-code 73) v-j))))

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
    (dxf-out-b-string 100 (class-marker x) stream)
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
  (format stream "~A~%~A~%" (dxf-code 0) *db-ellipse-class-marker*))

(defmethod dxf-out-text :after ((x db-ellipse) stream)
  (format stream "~A~%~A~%" (dxf-code 100) *db-ellipse-subclass-marker*)
  (let ((c-x (svref (center x) 0))
	(c-y (svref (center x) 1))
	(c-z (svref (center x) 2))
	(ma-x (svref (major-axis x) 0))
	(ma-y (svref (major-axis x) 1))
	(ma-z (svref (major-axis x) 2))
        (ma-e-x (+ (svref (center x) 0) (svref (major-axis x) 0)))
	(ma-e-y (+ (svref (center x) 1) (svref (major-axis x) 1)))
	(ma-e-z (+ (svref (center x) 2) (svref (major-axis x) 2)))
	(u-n-x (svref (unit-normal x) 0))
	(u-n-y (svref (unit-normal x) 1))
	(u-n-z (svref (unit-normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-param x))
	(e-p (end-param   x)))
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 10) c-x (dxf-code 20) c-y (dxf-code 30) c-z)
    (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 11) ma-e-x (dxf-code 21) ma-e-y (dxf-code 31) ma-e-z)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (format stream "~A~%~A~%~A~%~A~%~A~%~A~%" (dxf-code 210) u-n-x (dxf-code 220) u-n-y (dxf-code 230) u-n-z))
    (format stream "~A~%~A~%" (dxf-code 40) r-r)
    (format stream "~A~%~A~%" (dxf-code 41) s-p)
    (format stream "~A~%~A~%" (dxf-code 42) e-p)))

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


;;;;    ./AcCamera.h:class CAMERADLLIMPEXP AcDbCamera: public AcDbEntity
;;;;    ./AcDbGeoPositionMarker.h:class ACDB_PORT AcDbGeoPositionMarker : public AcDbEntity
;;;;    ./AcDbPointCloudEx.h:class ACDB_PORT AcDbPointCloudEx : public AcDbEntity
;;;;    ./dbcurve.h:class ADESK_NO_VTABLE AcDbCurve: public AcDbEntity
;;;;    ./dbdim.h:class ADESK_NO_VTABLE AcDbDimension: public AcDbEntity
;;;;    ./dbents.h:class AcDbText: public AcDbEntity
;;;;    ./dbents.h:class AcDbBlockReference: public AcDbEntity
;;;;    ./dbents.h:class AcDbBlockBegin: public AcDbEntity
;;;;    ./dbents.h:class AcDbBlockEnd: public AcDbEntity
;;;;    ./dbents.h:class AcDbSequenceEnd: public AcDbEntity
;;;;    ./dbents.h:class AcDbVertex: public AcDbEntity
;;;;    ./dbents.h:class AcDbPoint: public AcDbEntity
;;;;    ./dbents.h:class AcDbFace: public AcDbEntity
;;;;    ./dbents.h:class AcDbPolyFaceMesh: public AcDbEntity
;;;;    ./dbents.h:class AcDbPolygonMesh: public AcDbEntity
;;;;    ./dbents.h:class AcDbSolid: public AcDbEntity
;;;;    ./dbents.h:class AcDbTrace: public AcDbEntity
;;;;    ./dbents.h:class AcDbShape: public AcDbEntity
;;;;    ./dbents.h:class AcDbViewport: public AcDbEntity
;;;;    ./dbframe.h:class ADESK_NO_VTABLE AcDbFrame: public AcDbEntity
;;;;    ./dbhatch.h:class AcDbHatch: public AcDbEntity
;;;;    ./dbimage.h:class AcDbImage: public AcDbEntity
;;;;    ./dbmleader.h:class AcDbMLeader : public AcDbEntity
;;;;    ./dbsurf.h:class AcDbSurface: public AcDbEntity
;;;;    ./dbLight.h:class LIGHTDLLIMPEXP AcDbLight : public AcDbEntity
;;;;    ./dbMPolygon.h:class AcDbMPolygon : public AcDbEntity {
;;;;    ./dbproxy.h:class ADESK_NO_VTABLE AcDbProxyEntity : public AcDbEntity
;;;;    ./DbSection.h:class AcDbSection : public AcDbEntity
;;;;    ./dbSubD.h:class ACDB_PORT AcDbSubDMesh: public AcDbEntity
;;;;    ./dbunderlayref.h:class ADESK_NO_VTABLE AcDbUnderlayReference: public AcDbEntity
;;;;    ./dbViewBorder.h:class ACSYNERGY_PORT AcDbViewBorder : public AcDbEntity
;;;;    ./dbViewSymbol.h:class ACSYNERGY_PORT AcDbViewSymbol : public AcDbEntity
;;;;    
;;;;    ./dbbody.h:class AcDbBody: public  AcDbEntity
;;;;    ./dbfcf.h:class AcDbFcf: public  AcDbEntity
;;;;    ./dbmline.h:class AcDbMline: public  AcDbEntity
;;;;    ./dbmtext.h:class AcDbMText: public  AcDbEntity
;;;;    ./dbregion.h:class AcDbRegion: public  AcDbEntity
;;;;    ./dbsol3d.h:class AcDb3dSolid: public  AcDbEntity
