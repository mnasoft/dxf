(in-package :dxf/classes)

'((:defclass
   "Acad3DFace") 
  (:parents
   "AcadEntity")
  (:documentation
   "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DAB32FC-8C8A-4116-BD3A-CF733740DF8F\"](3DFace Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetInvisibleEdge GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetInvisibleEdge SetXData TransformBy Update")
  (:properties
   "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName TrueColor VisibilityEdge1 VisibilityEdge2
   VisibilityEdge3 VisibilityEdge4 Visible")
  (:events
   "Modified"))
