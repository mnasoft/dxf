(in-package :dxf/classes)

((:defclass "AcadHatch")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-92A2B30F-1B74-4894-850A-5505F3B5944B\"](Hatch Object (ActiveX))")
  (:methods
   "AppendInnerLoop AppendOuterLoop ArrayPolar ArrayRectangular Copy
   Delete Evaluate GetBoundingBox GetExtensionDictionary GetLoopAt
   GetXData Highlight InsertLoopAt IntersectWith Mirror Mirror3D Move
   Rotate Rotate3D ScaleEntity SetPattern SetXData TransformBy
   Update")
  (:properties
   "Application Area AssociativeHatch BackgroundColor Document
   Elevation EntityTransparency GradientAngle GradientCentered
   GradientColor1 GradientColor2 GradientName Handle
   HasExtensionDictionary HatchObjectType HatchStyle Hyperlinks
   ISOPenWidth Layer Linetype LinetypeScale Lineweight Material Normal
   NumberOfLoops ObjectID ObjectName Origin OwnerID PatternAngle
   PatternDouble PatternName PatternScale PatternSpace PatternType
   PlotStyleName TrueColor Visible")
  (:events
   "Modified"))
