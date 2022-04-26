(in-package :dxf)

(defclass <acad-selection-set> (<object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BF264239-CF7D-4BC8-8D37-69477862DB5A
SelectionSet Object (ActiveX)
"))

(defparameter *acad-selection-set-properties* '(ac-application ac-count ac-name))

(mapcar #'dxf/utils:make-slot (set-difference *acad-selection-set-properties* *object-properties*))
