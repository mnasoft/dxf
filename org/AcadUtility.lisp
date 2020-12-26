(defclass acad-utility (object)
  (
  )
  (:documentation "A series of methods provided for utility purposes."))

(defparameter *acad-utility-properties* '())

(mapcar #'make-slot (set-difference *acad-utility-properties* *object-properties*))