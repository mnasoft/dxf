(in-package :dxf/classes)

'((:defclass "AcadEntity" )
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCA7867D-E354-4F48-9C47-DB22C53A3460\"](IAcadEntity Interface (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Document EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
   Lineweight Material ObjectID ObjectName OwnerID PlotStyleName
   TrueColor Visible")
  (:events
   "Modified"))
