(in-package :dxf)

(defclass <acad-plot> (<object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-batch-plot-progress      :accessor ac-batch-plot-progress      :initarg :ac-batch-plot-progress      :initform nil :documentation "ac-batch-plot-progress")
  (ac-number-of-copies         :accessor ac-number-of-copies         :initarg :ac-number-of-copies         :initform nil :documentation "ac-number-of-copies")
  (ac-quiet-error-mode         :accessor ac-quiet-error-mode         :initarg :ac-quiet-error-mode         :initform nil :documentation "ac-quiet-error-mode")
  )
  (:documentation "
!plot Object (ActiveX)
"))

(defparameter *acad-plot-properties* '(ac-application ac-batch-plot-progress ac-number-of-copies ac-quiet-error-mode))

(mapcar #'dxf/utils:make-slot (set-difference *acad-plot-properties* *object-properties*))
