(in-package :dxf/classes)

'((:defclass "AcadPdfUnderlay" )
  (:parents "AcadUnderlay")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-54DEC47A-5FBB-4E9F-B206-502785568E91\"](PdfUnderlay Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
  (:properties
   "AdjustForBackground Application ClippingEnabled Contrast Document
   EntityTransparency Fade File Handle HasExtensionDictionary Height
   Hyperlinks ItemName Layer Linetype LinetypeScale Lineweight
   Material Monochrome ObjectID ObjectName OwnerID PlotStyleName
   Position Rotation ScaleFactor TrueColor
   UnderlayLayerOverrideApplied UnderlayName UnderlayVisibility
   Visible Width")
  (:events
   "Modified"))
