(in-package :dxf)

(defclass <acad-uc-ss> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C7B1383E-9E7B-46AD-B821-0906421194E5
UCSs Collection (ActiveX)
"))

(defparameter *acad-uc-ss-properties* '(ac-application ac-count ac-document ac-handle ac-has-extension-dictionary ac-object-id ac-object-name ac-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-uc-ss-properties* *acad-object-properties*))
