(in-package :dxf)

(defclass <acad-block-reference> (<acad-entity>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-effective-name           :accessor pr-effective-name           :initarg :pr-effective-name           :initform nil :documentation "pr-effective-name")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-attributes           :accessor pr-has-attributes           :initarg :pr-has-attributes           :initform nil :documentation "pr-has-attributes")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-insertion-point          :accessor pr-insertion-point          :initarg :pr-insertion-point          :initform nil :documentation "pr-insertion-point")
  (pr-ins-units                :accessor pr-ins-units                :initarg :pr-ins-units                :initform nil :documentation "pr-ins-units")
  (pr-ins-units-factor         :accessor pr-ins-units-factor         :initarg :pr-ins-units-factor         :initform nil :documentation "pr-ins-units-factor")
  (pr-is-dynamic-block         :accessor pr-is-dynamic-block         :initarg :pr-is-dynamic-block         :initform nil :documentation "pr-is-dynamic-block")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-normal                   :accessor pr-normal                   :initarg :pr-normal                   :initform nil :documentation "pr-normal")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-rotation                 :accessor pr-rotation                 :initarg :pr-rotation                 :initform nil :documentation "pr-rotation")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  (pr-x-effective-scale-factor :accessor pr-x-effective-scale-factor :initarg :pr-x-effective-scale-factor :initform nil :documentation "pr-x-effective-scale-factor")
  (pr-x-scale-factor           :accessor pr-x-scale-factor           :initarg :pr-x-scale-factor           :initform nil :documentation "pr-x-scale-factor")
  (pr-y-effective-scale-factor :accessor pr-y-effective-scale-factor :initarg :pr-y-effective-scale-factor :initform nil :documentation "pr-y-effective-scale-factor")
  (pr-y-scale-factor           :accessor pr-y-scale-factor           :initarg :pr-y-scale-factor           :initform nil :documentation "pr-y-scale-factor")
  (pr-z-effective-scale-factor :accessor pr-z-effective-scale-factor :initarg :pr-z-effective-scale-factor :initform nil :documentation "pr-z-effective-scale-factor")
  (pr-z-scale-factor           :accessor pr-z-scale-factor           :initarg :pr-z-scale-factor           :initform nil :documentation "pr-z-scale-factor")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-88EEBCA3-8AF5-4776-9D54-520B05AB9129\"](BlockReference Object (ActiveX))"))

(defparameter *acad-block-reference-properties* '(pr-application pr-document pr-effective-name pr-entity-transparency pr-handle pr-has-attributes pr-has-extension-dictionary pr-hyperlinks pr-insertion-point pr-ins-units pr-ins-units-factor pr-is-dynamic-block pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-material pr-name pr-normal pr-object-id pr-object-name pr-owner-id pr-plot-style-name pr-rotation pr-true-color pr-visible pr-x-effective-scale-factor pr-x-scale-factor pr-y-effective-scale-factor pr-y-scale-factor pr-z-effective-scale-factor pr-z-scale-factor))

(mapcar #'dxf/utils:make-slot (set-difference *acad-block-reference-properties* *acad-entity-properties*))
