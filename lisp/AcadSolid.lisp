(in-package :dxf)

(defclass <acad-solid> (<acad-entity>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-coordinate               :accessor ac-coordinate               :initarg :ac-coordinate               :initform nil :documentation "ac-coordinate")
  (ac-coordinates              :accessor ac-coordinates              :initarg :ac-coordinates              :initform nil :documentation "ac-coordinates")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-thickness                :accessor ac-thickness                :initarg :ac-thickness                :initform nil :documentation "ac-thickness")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B207FF4-E441-4B3B-A677-BD5FE8CC479D
Solid Object (ActiveX)
"))

(defparameter *acad-solid-properties* '(ac-application ac-coordinate ac-coordinates ac-document ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-normal ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-thickness ac-true-color ac-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-solid-properties* *acad-entity-properties*))
