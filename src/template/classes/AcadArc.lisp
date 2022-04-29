(in-package :dxf/classes)

'((:defclass "AcadArc")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3D31C05F-BFF7-41E3-8ACE-0F807731C913\"](Arc Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
  (:properties
   "Application ArcLength Area Center Document EndAngle EndPoint
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight Material Normal ObjectID
   ObjectName OwnerID PlotStyleName Radius StartAngle StartPoint
   Thickness TotalAngle TrueColor Visible")
  (:events
   "Modified"))
