(in-package :dxf)

(defclass <acad-ucs> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-origin                   :accessor ac-origin                   :initarg :ac-origin                   :initform nil :documentation "ac-origin")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-x-vector                 :accessor ac-x-vector                 :initarg :ac-x-vector                 :initform nil :documentation "ac-x-vector")
  (ac-y-vector                 :accessor ac-y-vector                 :initarg :ac-y-vector                 :initform nil :documentation "ac-y-vector")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-42778889-C568-4ABF-9CFA-63CC0D781794
UCS Object (ActiveX)
"))

(defparameter *acad-ucs-properties* '(ac-application ac-document ac-handle ac-has-extension-dictionary ac-name ac-object-id ac-object-name ac-origin ac-owner-id ac-x-vector ac-y-vector))

(mapcar #'dxf/utils:make-slot (set-difference *acad-ucs-properties* *acad-object-properties*))
