(defclass acad-x-record (acad-object)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-translate-i-ds           :accessor ac-translate-i-ds           :initarg :ac-translate-i-ds           :initform nil :documentation "ac-translate-i-ds")
  )
  (:documentation "XRecord objects are used to store and manage arbitrary data."))

(defparameter *acad-x-record-properties* '(ac-application ac-document ac-handle ac-has-extension-dictionary ac-name ac-object-id ac-object-name ac-owner-id ac-translate-i-ds))

(mapcar #'make-slot (set-difference *acad-x-record-properties* *acad-object-properties*))