(in-package :dxf/classes)

(defclass <acad-documents> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2C8C8291-16C9-4A9F-8399-58D5DE4B9589\"](Documents Collection (ActiveX))"))

(defparameter *acad-documents-properties* '(pr-application pr-count))

(mapcar #'dxf/utils:make-slot (set-difference *acad-documents-properties* *acad-object-properties*))
