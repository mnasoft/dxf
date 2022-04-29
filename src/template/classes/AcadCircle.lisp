(in-package :dxf/classes)

'((:defclass "AcadCircle")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-18ADF171-166F-4FF0-8ED6-5F83153A5649\"](Circle Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
  (:properties
   "Application Area Center Circumference Diameter Document
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight Material Normal ObjectID
   ObjectName OwnerID PlotStyleName Radius Thickness TrueColor
   Visible")
  (:events
   "Modified"))
