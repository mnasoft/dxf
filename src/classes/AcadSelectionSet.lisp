(in-package :dxf/classes)

(defclass <acad-selection-set> (<object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BF264239-CF7D-4BC8-8D37-69477862DB5A\"](SelectionSet Object (ActiveX))"))

(defparameter *acad-selection-set-properties* '(pr-application pr-count pr-name))

(mapcar #'dxf/utils:make-slot (set-difference *acad-selection-set-properties* *object-properties*))
