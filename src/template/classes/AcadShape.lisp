(in-package :dxf/classes)

'((:defclass "AcadShape" )
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14883954-9C4B-4B8F-AC0C-4B44940B5932\"](Shape Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application Document EntityTransparency Handle
   HasExtensionDictionary Height Hyperlinks InsertionPoint Layer
   Linetype LinetypeScale Lineweight Material Name Normal ObjectID
   ObjectName ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor
   Thickness TrueColor Visible")
  (:events
   "Modified"))
