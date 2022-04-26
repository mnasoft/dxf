(in-package :dxf)

(defclass <acad-documents> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2C8C8291-16C9-4A9F-8399-58D5DE4B9589
Documents Collection (ActiveX)
"))

(defparameter *acad-documents-properties* '(ac-application ac-count))

(mapcar #'dxf/utils:make-slot (set-difference *acad-documents-properties* *acad-object-properties*))
