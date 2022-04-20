(defclass <acad-selection-sets> (<object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  )
  (:documentation "The collection of all selection sets in the drawing."))

(defparameter *acad-selection-sets-properties* '(ac-application ac-count))

(mapcar #'dxf/utils:make-slot (set-difference *acad-selection-sets-properties* *object-properties*))
