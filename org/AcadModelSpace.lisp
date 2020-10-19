(defclass acad-model-space (acad-block)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-comments                 :accessor ac-comments                 :initarg :ac-comments                 :initform nil :documentation "ac-comments")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-layout                   :accessor ac-layout                   :initarg :ac-layout                   :initform nil :documentation "ac-layout")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-origin                   :accessor ac-origin                   :initarg :ac-origin                   :initform nil :documentation "ac-origin")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-units                    :accessor ac-units                    :initarg :ac-units                    :initform nil :documentation "ac-units")
  )
  (:documentation "A special Block object containing all model space entities."))

(defparameter *acad-model-space-properties* '(ac-application ac-comments ac-count ac-document ac-handle ac-has-extension-dictionary ac-layout ac-name ac-object-id ac-object-name ac-origin ac-owner-id ac-units))

(mapcar #'make-slot (set-difference *acad-model-space-properties* *acad-block-properties*))