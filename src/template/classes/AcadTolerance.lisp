(in-package :dxf/classes)

((:defclass "AcadTolerance")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-89AF1685-5ACA-44F2-B741-D4C957C887F0\"](Tolerance Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application DimensionLineColor DirectionVector Document
   EntityTransparency Handle HasExtensionDictionary Hyperlinks
   InsertionPoint Layer Linetype LinetypeScale Lineweight Material
   Normal ObjectID ObjectName OwnerID PlotStyleName ScaleFactor
   StyleName TextColor TextHeight TextString TextStyle TrueColor
   Visible")
  (:events
   "Modified"))
