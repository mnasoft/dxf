(in-package :dxf)

(defclass <acad-3d-polyline> (<acad-entity>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-closed                   :accessor ac-closed                   :initarg :ac-closed                   :initform nil :documentation "ac-closed")
  (ac-coordinate               :accessor ac-coordinate               :initarg :ac-coordinate               :initform nil :documentation "ac-coordinate")
  (ac-coordinates              :accessor ac-coordinates              :initarg :ac-coordinates              :initform nil :documentation "ac-coordinates")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-length                   :accessor ac-length                   :initarg :ac-length                   :initform nil :documentation "ac-length")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-type                     :accessor ac-type                     :initarg :ac-type                     :initform nil :documentation "ac-type")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35D9E28C-38A8-477A-AFCE-F21952092190
"))

(defparameter *acad-3d-polyline-properties* '(ac-application ac-closed ac-coordinate ac-coordinates ac-document ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-length ac-linetype ac-linetype-scale ac-lineweight ac-material ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-true-color ac-type ac-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-3d-polyline-properties* *acad-entity-properties*))
