(in-package :dxf/classes)

((:defclass "AcadSurface")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-98BC3DD3-F913-494C-8559-EAFA0DDEFE3E\"](Surface Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Document EdgeExtensionDistances EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight MaintainAssociativity Material ObjectID
   ObjectName OwnerID PlotStyleName ShowAssociativity SurfaceType
   SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
  (:events
   "Modified"))
