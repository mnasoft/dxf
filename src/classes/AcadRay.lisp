(in-package :dxf/classes)

'((:defclass "AcadRay" )
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-365768B5-3A4E-4340-AA17-8FCA291BA87C\"](Ray Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application BasePoint DirectionVector Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName SecondPoint TrueColor Visible")
  (:events
   "Modified"))
