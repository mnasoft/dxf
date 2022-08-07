((:defclass "AcadSpline")
   (:parents "AcadEntity")
   (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B8FC11E4-3F6B-40CE-8AEC-D4CF669086A3\"](Spline Object (ActiveX))")
   (:methods
    "AddFitPoint ArrayPolar ArrayRectangular Copy Delete DeleteFitPoint
   ElevateOrder GetBoundingBox GetControlPoint GetExtensionDictionary
   GetFitPoint GetWeight GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset PurgeFitData Reverse Rotate Rotate3D
   ScaleEntity SetControlPoint SetFitPoint SetWeight SetXData
   TransformBy Update")
   (:properties
    "Application Area Closed Closed2 ControlPoints Degree Degree2
   Document EndTangent EntityTransparency FitPoints FitTolerance
   Handle HasExtensionDictionary Hyperlinks IsPeriodic IsPlanar
   IsRational KnotParameterization Knots Layer Linetype LinetypeScale
   Lineweight Material NumberOfControlPoints NumberOfFitPoints
   ObjectID ObjectName OwnerID PlotStyleName SplineFrame SplineMethod
   StartTangent TrueColor Visible Weights")
   (:events
    "Modified"))
