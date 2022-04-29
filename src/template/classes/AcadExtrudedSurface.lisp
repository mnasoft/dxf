(in-package :dxf/classes)

((:defclass "AcadExtrudedSurface")
  (:parents "AcadSurface")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-03E55664-0EBE-4EF5-A51C-B0806FA5DC3C\"](ExtrudedSurface Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Direction Document EdgeExtensionDistances
   EntityTransparency Handle HasExtensionDictionary Height Hyperlinks
   Layer Linetype LinetypeScale Lineweight MaintainAssociativity
   Material ObjectID ObjectName OwnerID PlotStyleName
   ShowAssociativity SurfaceType SurfTrimAssociativity TaperAngle
   TrueColor UIsolineDensity Visible VIsolineDensity WireframeType")
  (:events
   "Modified"))
