(in-package :dxf/classes)

((:defclass "AcadEllipse")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-85D3077C-DAE6-4BB7-BB69-E8A8BD10FEA5\"](Ellipse Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
  (:properties
   "Application Area Center Document EndAngle EndParameter EndPoint
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight MajorAxis MajorRadius Material
   MinorAxis MinorRadius Normal ObjectID ObjectName OwnerID
   PlotStyleName RadiusRatio StartAngle StartParameter StartPoint
   TrueColor Visible")
  (:events
   "Modified"))
