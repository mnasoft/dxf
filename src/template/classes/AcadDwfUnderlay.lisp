(in-package :dxf/classes)

'((:defclass "AcadDwfUnderlay")
  (:parents "AcadUnderlay")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1205069A-A64A-4E21-9B9A-3EAF58F2EF26\"](DwfUnderlay Object (ActiveX))")
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
