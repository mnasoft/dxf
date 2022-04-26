(in-package :dxf)

(defclass <acad-block> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-block-scaling            :accessor ac-block-scaling            :initarg :ac-block-scaling            :initform nil :documentation "ac-block-scaling")
  (ac-comments                 :accessor ac-comments                 :initarg :ac-comments                 :initform nil :documentation "ac-comments")
  (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-explodable               :accessor ac-explodable               :initarg :ac-explodable               :initform nil :documentation "ac-explodable")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-is-dynamic-block         :accessor ac-is-dynamic-block         :initarg :ac-is-dynamic-block         :initform nil :documentation "ac-is-dynamic-block")
  (ac-is-layout                :accessor ac-is-layout                :initarg :ac-is-layout                :initform nil :documentation "ac-is-layout")
  (ac-is-x-ref                 :accessor ac-is-x-ref                 :initarg :ac-is-x-ref                 :initform nil :documentation "ac-is-x-ref")
  (ac-layout                   :accessor ac-layout                   :initarg :ac-layout                   :initform nil :documentation "ac-layout")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-origin                   :accessor ac-origin                   :initarg :ac-origin                   :initform nil :documentation "ac-origin")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-path                     :accessor ac-path                     :initarg :ac-path                     :initform nil :documentation "ac-path")
  (ac-units                    :accessor ac-units                    :initarg :ac-units                    :initform nil :documentation "ac-units")
  (ac-x-ref-database           :accessor ac-x-ref-database           :initarg :ac-x-ref-database           :initform nil :documentation "ac-x-ref-database")
  )
  (:documentation "A block definition containing a name and a set of objects."))

(defparameter *acad-block-properties*
  '(ac-application ac-block-scaling ac-comments ac-count ac-document
    ac-explodable ac-handle ac-has-extension-dictionary
    ac-is-dynamic-block ac-is-layout ac-is-x-ref ac-layout ac-material
    ac-name ac-object-id ac-object-name ac-origin ac-owner-id ac-path
    ac-units ac-x-ref-database))

(mapcar #'dxf/utils:make-slot (set-difference *acad-block-properties* *acad-object-properties*))
