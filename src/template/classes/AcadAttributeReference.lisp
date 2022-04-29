(in-package :dxf/classes)

'((:defclass "AcadAttributeReference")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0630EFF2-51A2-46E4-A5A1-0377FB7E38E8\"](AttributeReference Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetExtensionDictionary GetXData
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update UpdateMTextAttribute")
  (:properties
   "Alignment Application Backward Constant Document
   EntityTransparency FieldLength Handle HasExtensionDictionary Height
   Hyperlinks InsertionPoint Invisible Layer Linetype LinetypeScale
   Lineweight LockPosition Material MTextAttribute
   MTextAttributeContent MTextBoundaryWidth MTextDrawingDirection
   Normal ObjectID ObjectName ObliqueAngle OwnerID PlotStyleName
   Rotation ScaleFactor StyleName TagString TextAlignmentPoint
   TextGenerationFlag TextString Thickness TrueColor UpsideDown
   Visible")
  (:events
   "Modified"))
