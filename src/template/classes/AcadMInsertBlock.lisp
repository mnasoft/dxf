(in-package :dxf/classes)

((:defclass "AcadMInsertBlock")
  (:parents "AcadBlockReference")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0F4669CB-6769-4F40-A24F-7658FBD41518\"](MInsertBlock Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ConvertToAnonymousBlock
   ConvertToStaticBlock Copy Delete Explode GetAttributes
   GetBoundingBox GetConstantAttributes GetDynamicBlockProperties
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move ResetBlock Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
  (:properties
   "Application Columns ColumnSpacing Document EffectiveName
   EntityTransparency Handle HasAttributes HasExtensionDictionary
   Hyperlinks InsertionPoint InsUnits InsUnitsFactor IsDynamicBlock
   Layer Linetype LinetypeScale Lineweight Material Name Normal
   ObjectID ObjectName OwnerID PlotStyleName Rotation Rows RowSpacing
   TrueColor Visible XEffectiveScaleFactor XScaleFactor
   YEffectiveScaleFactor YScaleFactor ZEffectiveScaleFactor
   ZScaleFactor")
  (:events
   "Modified"))
