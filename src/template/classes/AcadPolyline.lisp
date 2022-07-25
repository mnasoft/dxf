((:defclass "AcadPolyline")
   (:parents "AcadEntity")
   (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35D9E28C-38A8-477A-AFCE-F21952092190\"](Polyline Object (ActiveX))")
   (:methods
    "AppendVertex ArrayPolar ArrayRectangular Copy Delete Explode
   GetBoundingBox GetBulge GetExtensionDictionary GetWidth GetXData
   Highlight IntersectWith Mirror Mirror3D Move Offset Rotate Rotate3D
   ScaleEntity SetBulge SetWidth SetXData TransformBy Update")
   (:properties
    "Application Area Closed ConstantWidth Coordinate Coordinates
   Document Elevation EntityTransparency Handle HasExtensionDictionary
   Hyperlinks Layer Length Linetype LinetypeGeneration LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Thickness TrueColor Type Visible")
   (:events
    "Modified"))
