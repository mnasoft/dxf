(in-package :dxf/classes)

'((:defclass "AcadSection")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5242921B-1A1B-47DF-B9B7-2932DB5227AA\"](Section Object (ActiveX))")
  (:methods
   "AddVertex ArrayPolar ArrayRectangular Copy CreateJog Delete
   GenerateSectionGeometry GetBoundingBox GetExtensionDictionary
   GetXData Highlight HitTest IntersectWith Mirror Mirror3D Move
   RemoveVertex Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
  (:properties
   "Application BottomHeight Coordinate Document Elevation
   EntityTransparency Handle HasExtensionDictionary Hyperlinks
   IndicatorFillColor IndicatorTransparency Layer Linetype
   LinetypeScale Lineweight LiveSectionEnabled Material Name Normal
   NumVertices ObjectID ObjectName OwnerID PlotStyleName
   SectionPlaneOffset Settings SliceDepth State State2 TopHeight
   TrueColor VerticalDirection Vertices ViewingDirection Visible")
  (:events
   "Modified"))
