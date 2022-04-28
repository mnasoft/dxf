(in-package :dxf/classes)

'((:defclass "AcadSweptSurface" )
  (:parents "AcadSurface")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2E70AE24-0C8F-4124-84F2-F20A94EA6AF2\"](SweptSurface Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Bank Document EdgeExtensionDistances
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Length Linetype LinetypeScale Lineweight MaintainAssociativity
   Material ObjectID ObjectName OwnerID PlotStyleName ProfileRotation
   Scale ShowAssociativity SurfaceType SurfTrimAssociativity TrueColor
   Twist UIsolineDensity Visible VIsolineDensity WireframeType")
  (:events
   "Modified"))
