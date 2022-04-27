(in-package :dxf/classes)

(defclass <acad-plot> (<object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-batch-plot-progress      :accessor pr-batch-plot-progress      :initarg :pr-batch-plot-progress      :initform nil :documentation "pr-batch-plot-progress")
  (pr-number-of-copies         :accessor pr-number-of-copies         :initarg :pr-number-of-copies         :initform nil :documentation "pr-number-of-copies")
  (pr-quiet-error-mode         :accessor pr-quiet-error-mode         :initarg :pr-quiet-error-mode         :initform nil :documentation "pr-quiet-error-mode")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A01876A-13D5-4938-8BEE-7712FD7C12CF\"](Plot Object (ActiveX))"))

(defparameter *acad-plot-properties* '(pr-application pr-batch-plot-progress pr-number-of-copies pr-quiet-error-mode))

(mapcar #'dxf/utils:make-slot (set-difference *acad-plot-properties* *object-properties*))
