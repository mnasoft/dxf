(in-package :dxf/classes)

(defclass <acad-selection-sets> (<object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5B8DDC53-D4CD-4121-B58D-66B48D343A24\"](SelectionSets Collection (ActiveX))"))

(defparameter *acad-selection-sets-properties* '(pr-application pr-count))

(mapcar #'dxf/utils:make-slot (set-difference *acad-selection-sets-properties* *object-properties*))
