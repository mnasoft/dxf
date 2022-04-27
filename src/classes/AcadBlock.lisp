(in-package :dxf)

(defclass <acad-block> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-block-scaling            :accessor pr-block-scaling            :initarg :pr-block-scaling            :initform nil :documentation "pr-block-scaling")
  (pr-comments                 :accessor pr-comments                 :initarg :pr-comments                 :initform nil :documentation "pr-comments")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-explodable               :accessor pr-explodable               :initarg :pr-explodable               :initform nil :documentation "pr-explodable")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-is-dynamic-block         :accessor pr-is-dynamic-block         :initarg :pr-is-dynamic-block         :initform nil :documentation "pr-is-dynamic-block")
  (pr-is-layout                :accessor pr-is-layout                :initarg :pr-is-layout                :initform nil :documentation "pr-is-layout")
  (pr-is-x-ref                 :accessor pr-is-x-ref                 :initarg :pr-is-x-ref                 :initform nil :documentation "pr-is-x-ref")
  (pr-layout                   :accessor pr-layout                   :initarg :pr-layout                   :initform nil :documentation "pr-layout")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-origin                   :accessor pr-origin                   :initarg :pr-origin                   :initform nil :documentation "pr-origin")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-path                     :accessor pr-path                     :initarg :pr-path                     :initform nil :documentation "pr-path")
  (pr-units                    :accessor pr-units                    :initarg :pr-units                    :initform nil :documentation "pr-units")
  (pr-x-ref-database           :accessor pr-x-ref-database           :initarg :pr-x-ref-database           :initform nil :documentation "pr-x-ref-database")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E6F7B03B-F5CC-4A18-9C48-BBF1D32A31FD\"](Block Object (ActiveX))"))

(defparameter *acad-block-properties*
  '(pr-application pr-block-scaling pr-comments pr-count pr-document
    pr-explodable pr-handle pr-has-extension-dictionary
    pr-is-dynamic-block pr-is-layout pr-is-x-ref pr-layout pr-material
    pr-name pr-object-id pr-object-name pr-origin pr-owner-id pr-path
    pr-units pr-x-ref-database))

(mapcar #'dxf/utils:make-slot (set-difference *acad-block-properties* *acad-object-properties*))
