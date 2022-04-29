(in-package :dxf/classes)

((:defclass "AcadRevolvedSurface")
  (:parents "AcadSurface")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD54DF69-8424-488B-BD7B-7642AD1D379F\"](RevolvedSurface Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application AxisDirection AxisPosition Document
   EdgeExtensionDistances EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
   Lineweight MaintainAssociativity Material ObjectID ObjectName
   OwnerID PlotStyleName RevolutionAngle ShowAssociativity SurfaceType
   SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
  (:events
   "Modified"))
