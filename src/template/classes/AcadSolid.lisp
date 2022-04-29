(in-package :dxf/classes)

((:defclass "AcadSolid")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B207FF4-E441-4B3B-A677-BD5FE8CC479D\"](Solid Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material Normal ObjectID ObjectName
   OwnerID PlotStyleName Thickness TrueColor Visible")
  (:events
   "Modified"))
