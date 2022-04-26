(in-package :dxf)

(defclass <acad-section-settings> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-current-section-type     :accessor ac-current-section-type     :initarg :ac-current-section-type     :initform nil :documentation "ac-current-section-type")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  )
  (:documentation "A container for section geometry settings."))

(defparameter *acad-section-settings-properties* '(ac-application ac-current-section-type ac-document ac-handle ac-has-extension-dictionary ac-object-id ac-object-name ac-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-section-settings-properties* *acad-object-properties*))
