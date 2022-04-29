(in-package :dxf/classes)

((:defclass "AcadRasterImage")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3613CF3F-EFC6-4E20-B875-D66B0494B94F\"](RasterImage Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
  (:properties
   "Application Brightness ClippingEnabled Contrast Document
   EntityTransparency Fade Handle HasExtensionDictionary Height
   Hyperlinks ImageFile ImageHeight ImageVisibility ImageWidth Layer
   Linetype LinetypeScale Lineweight Material Name ObjectID ObjectName
   Origin OwnerID PlotStyleName Rotation ScaleFactor ShowRotation
   Transparency TrueColor Visible Width")
  (:events
   "Modified"))
