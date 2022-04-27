(in-package :dxf/classes)

(defclass <acad-point-cloud-ex> (<acad-entity>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-color-scheme             :accessor pr-color-scheme             :initarg :pr-color-scheme             :initform nil :documentation "pr-color-scheme")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-geolocate                :accessor pr-geolocate                :initarg :pr-geolocate                :initform nil :documentation "pr-geolocate")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-insertion-point          :accessor pr-insertion-point          :initarg :pr-insertion-point          :initform nil :documentation "pr-insertion-point")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-locked                   :accessor pr-locked                   :initarg :pr-locked                   :initform nil :documentation "pr-locked")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-path                     :accessor pr-path                     :initarg :pr-path                     :initform nil :documentation "pr-path")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-rotation                 :accessor pr-rotation                 :initarg :pr-rotation                 :initform nil :documentation "pr-rotation")
  (pr-scale                    :accessor pr-scale                    :initarg :pr-scale                    :initform nil :documentation "pr-scale")
  (pr-segmentation             :accessor pr-segmentation             :initarg :pr-segmentation             :initform nil :documentation "pr-segmentation")
  (pr-show-cropped             :accessor pr-show-cropped             :initarg :pr-show-cropped             :initform nil :documentation "pr-show-cropped")
  (pr-stylization              :accessor pr-stylization              :initarg :pr-stylization              :initform nil :documentation "pr-stylization")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-unit                     :accessor pr-unit                     :initarg :pr-unit                     :initform nil :documentation "pr-unit")
  (pr-unit-factor              :accessor pr-unit-factor              :initarg :pr-unit-factor              :initform nil :documentation "pr-unit-factor")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9EC2395E-F5CC-4272-B535-3D0C905B8C71\"](PointCloudEx Object (ActiveX))"))

(defparameter *acad-point-cloud-ex-properties* '(pr-application pr-color-scheme pr-document pr-entity-transparency pr-geolocate pr-handle pr-has-extension-dictionary pr-hyperlinks pr-insertion-point pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-locked pr-material pr-name pr-object-id pr-object-name pr-owner-id pr-path pr-plot-style-name pr-rotation pr-scale pr-segmentation pr-show-cropped pr-stylization pr-true-color pr-unit pr-unit-factor pr-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-point-cloud-ex-properties* *acad-entity-properties*))
