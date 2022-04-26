(in-package :dxf)

(defclass <acad-selection-sets> (<object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5B8DDC53-D4CD-4121-B58D-66B48D343A24
SelectionSets Collection (ActiveX)
"))

(defparameter *acad-selection-sets-properties* '(ac-application ac-count))

(mapcar #'dxf/utils:make-slot (set-difference *acad-selection-sets-properties* *object-properties*))
