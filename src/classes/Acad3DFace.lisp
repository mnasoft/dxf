(in-package :dxf/classes)

(defclass <acad-3dface> (<acad-entity>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-coordinate               :accessor pr-coordinate               :initarg :pr-coordinate               :initform nil :documentation "pr-coordinate")
  (pr-coordinates              :accessor pr-coordinates              :initarg :pr-coordinates              :initform nil :documentation "pr-coordinates")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-visibility-edge1         :accessor pr-visibility-edge1         :initarg :pr-visibility-edge1         :initform nil :documentation "pr-visibility-edge1")
  (pr-visibility-edge2         :accessor pr-visibility-edge2         :initarg :pr-visibility-edge2         :initform nil :documentation "pr-visibility-edge2")
  (pr-visibility-edge3         :accessor pr-visibility-edge3         :initarg :pr-visibility-edge3         :initform nil :documentation "pr-visibility-edge3")
  (pr-visibility-edge4         :accessor pr-visibility-edge4         :initarg :pr-visibility-edge4         :initform nil :documentation "pr-visibility-edge4")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DAB32FC-8C8A-4116-BD3A-CF733740DF8F\"](3DFace Object (ActiveX))"))

'((:methods    "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox GetExtensionDictionary GetInvisibleEdge GetXData Highlight IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity SetInvisibleEdge SetXData TransformBy Update")
  (:properties "Application Coordinate Coordinates Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName TrueColor VisibilityEdge1 VisibilityEdge2 VisibilityEdge3 VisibilityEdge4 Visible")
  (:events     "Modified"))


(defparameter *acad-3d-face-properties* '(pr-application pr-coordinate pr-coordinates pr-document pr-entity-transparency pr-handle pr-has-extension-dictionary pr-hyperlinks pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-material pr-object-id pr-object-name pr-owner-id pr-plot-style-name pr-true-color pr-visibility-edge1 pr-visibility-edge2 pr-visibility-edge3 pr-visibility-edge4 pr-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-3d-face-properties* *acad-entity-properties*))
