(in-package :dxf)

(defclass <acad-utility> (<object>)
  (
  )
  (:documentation "A series of methods provided for utility purposes."))

(defparameter *acad-utility-properties* '())

(mapcar #'dxf/utils:make-slot (set-difference *acad-utility-properties* *object-properties*))
