(in-package :dxf/classes)

'((:defclass "AcadPolyfaceMesh" )
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-679AA72F-7A2F-468D-A2D5-E3F28425C35A\"](PolyfaceMesh Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material NumberOfFaces NumberOfVertices
   ObjectID ObjectName OwnerID PlotStyleName TrueColor Visible")
  (:events
   "Modified"))
