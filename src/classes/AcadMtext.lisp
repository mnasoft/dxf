(in-package :dxf/classes)

'((:defclass "AcadMtext" )
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2532B20E-413D-4F59-9E88-B40E8AABB9FF\"](MText Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete FieldCode GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application AttachmentPoint BackgroundFill Document
   DrawingDirection EntityTransparency Handle HasExtensionDictionary
   Height Hyperlinks InsertionPoint Layer LineSpacingDistance
   LineSpacingFactor LineSpacingStyle Linetype LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Rotation StyleName TextString TrueColor Visible
   Width")
  (:events
   "Modified"))
