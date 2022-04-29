(in-package :dxf/classes)

((:defclass "AcadGeomapImage")
  (:parents "AcadRasterImage")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-97E4C257-86DC-4B0A-BE49-8EDC5864AABD\"](GeomapImage Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
  (:properties
   "Application Brightness ClippingEnabled Contrast Document
   EntityTransparency Fade GeoImageBrightness GeoImageContrast
   GeoImageFade GeoImageHeight GeoImagePosition GeoImageWidth Handle
   HasExtensionDictionary Height Hyperlinks ImageFile ImageHeight
   ImageVisibility ImageWidth Layer Linetype LinetypeScale Lineweight
   Material Name ObjectID ObjectName Origin OwnerID PlotStyleName
   Rotation ScaleFactor ShowRotation Transparency TrueColor Visible
   Width")
  (:events
   "None"))
