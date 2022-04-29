(in-package :dxf/classes)

((:defclass "AcadLoftedSurface")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D56F5C92-731E-4FA3-9FAE-82E97E388901\"](LoftedSurface Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Closed Document EdgeExtensionDistances EndDraftAngle
   EndDraftMagnitude EndSmoothContinuity EndSmoothMagnitude
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight MaintainAssociativity Material
   NumCrossSections NumGuidePaths ObjectID ObjectName OwnerID Periodic
   PlotStyleName ShowAssociativity StartDraftAngle StartDraftMagnitude
   StartSmoothContinuity StartSmoothMagnitude SurfaceNormals
   SurfaceType SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
  (:events
   "Modified"))
