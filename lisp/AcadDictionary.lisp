(in-package :dxf)

(defclass <acad-dictionary> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FF18AA0-4E48-4F92-AC0D-FBBD4225D347
Dictionary Object (ActiveX)
"))

(defparameter *acad-dictionary-properties* '(ac-application ac-count ac-document ac-handle ac-has-extension-dictionary ac-name ac-object-id ac-object-name ac-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-dictionary-properties* *acad-object-properties*))
