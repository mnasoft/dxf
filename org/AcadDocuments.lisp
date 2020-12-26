(defclass acad-documents (acad-object)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  )
  (:documentation "The collection of all AutoCAD drawings that are open in the current session."))

(defparameter *acad-documents-properties* '(ac-application ac-count))

(mapcar #'make-slot (set-difference *acad-documents-properties* *acad-object-properties*))