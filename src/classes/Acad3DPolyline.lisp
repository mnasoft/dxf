(in-package :dxf/classes)

(defclass <acad-3dpolyline> (<acad-entity>)
  ((pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
   (pr-closed                   :accessor pr-closed                   :initarg :pr-closed                   :initform nil :documentation "pr-closed")
   (pr-coordinate               :accessor pr-coordinate               :initarg :pr-coordinate               :initform nil :documentation "pr-coordinate")
   (pr-coordinates              :accessor pr-coordinates              :initarg :pr-coordinates              :initform nil :documentation "pr-coordinates")
   (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
   (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
   (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
   (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
   (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
   (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
   (pr-length                   :accessor pr-length                   :initarg :pr-length                   :initform nil :documentation "pr-length")
   (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
   (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
   (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
   (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
   (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
   (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
   (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
   (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
   (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
   (pr-type                     :accessor pr-type                     :initarg :pr-type                     :initform nil :documentation "pr-type")
   (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35D9E28C-38A8-477A-AFCE-F21952092190\"](Polyline Object (ActiveX))"))

(defparameter *acad-3dpolyline-properties*
  '(pr-application pr-closed pr-coordinate pr-coordinates pr-document
    pr-entity-transparency pr-handle pr-has-extension-dictionary
    pr-hyperlinks pr-layer pr-length pr-linetype pr-linetype-scale
    pr-lineweight pr-material pr-object-id pr-object-name pr-owner-id
    pr-plot-style-name pr-true-color pr-type pr-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-3d-polyline-properties* *acad-entity-properties*))
