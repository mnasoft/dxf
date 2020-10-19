(defclass acad-selection-set (object)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  )
  (:documentation "A group of one or more AutoCAD objects specified for processing as a single unit."))

(defparameter *acad-selection-set-properties* '(ac-application ac-count ac-name))

(mapcar #'make-slot (set-difference *acad-selection-set-properties* *object-properties*))