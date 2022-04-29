(in-package :dxf/classes)

'((:defclass "AcadBlockReference")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-88EEBCA3-8AF5-4776-9D54-520B05AB9129\"](BlockReference Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ConvertToAnonymousBlock
   ConvertToStaticBlock Copy Delete Explode GetAttributes
   GetBoundingBox GetConstantAttributes GetDynamicBlockProperties
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move ResetBlock Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
  (:properties
   "Application Document EffectiveName EntityTransparency Handle
   HasAttributes HasExtensionDictionary Hyperlinks InsertionPoint
   InsUnits InsUnitsFactor IsDynamicBlock Layer Linetype LinetypeScale
   Lineweight Material Name Normal ObjectID ObjectName OwnerID
   PlotStyleName Rotation TrueColor Visible XEffectiveScaleFactor
   XScaleFactor YEffectiveScaleFactor YScaleFactor
   ZEffectiveScaleFactor ZScaleFactor")
  (:events
   "Modified"))
