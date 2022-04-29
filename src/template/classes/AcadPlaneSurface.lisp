(in-package :dxf/classes)

'((:defclass "AcadPlaneSurface" )
  (:parents "AcadSurface")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8979D4B7-F581-4623-B66F-1FC24BA2CDC3\"](PlaneSurface Object (ActiveX))")
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
