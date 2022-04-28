(in-package :dxf/classes)

'((:defclass "AcadDgnUnderlay" )
  (:parents "AcadUnderlay")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-70DBB31B-E1D1-4D8C-928C-B274E0D63E66\"](DgnUnderlay Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ClipBoundary Copy Delete GetBoundingBox
    GetExtensionDictionary GetXData Highlight IntersectWith Mirror
    Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
    Update")
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
