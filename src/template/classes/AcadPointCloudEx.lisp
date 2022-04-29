(in-package :dxf/classes)

'((:defclass "AcadPointCloudEx" )
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9EC2395E-F5CC-4272-B535-3D0C905B8C71\"](PointCloudEx Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application ColorScheme Document EntityTransparency Geolocate
   Handle HasExtensionDictionary Hyperlinks InsertionPoint Layer
   Linetype LinetypeScale Lineweight Locked Material Name ObjectID
   ObjectName OwnerID Path PlotStyleName Rotation Scale Segmentation
   ShowCropped Stylization TrueColor Unit UnitFactor Visible")
  (:events
   "Modified"))
