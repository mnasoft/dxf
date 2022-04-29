(in-package :dxf/classes)

((:defclass "AcadComparedReference")
  (:parents "AcadExternalReference")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DEB63F31-D8E9-41E3-B35B-12D832F5BF16\"](ComparedReference Object (ActiveX))")
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
   InsUnits InsUnitsFactor IsDynamicBlock Layer LayerPropertyOverrides
   Linetype LinetypeScale Lineweight Material Name Normal ObjectID
   ObjectName OwnerID Path PlotStyleName Rotation TrueColor Visible
   XEffectiveScaleFactor XScaleFactor YEffectiveScaleFactor
   YScaleFactor ZEffectiveScaleFactor ZScaleFactor")
  (:events
   "Modified"))
