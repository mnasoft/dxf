(in-package :dxf/classes)

'((:defclass "AcadLayout")
  (:parents "AcadPlotConfiguration")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EFC848F1-26BE-4EFA-BC0E-11F874D73842\"](Layout Object (ActiveX))")
  (:methods
   "CopyFrom Delete GetCanonicalMediaNames GetCustomScale
   GetExtensionDictionary GetLocaleMediaName GetPaperMargins
   GetPaperSize GetPlotDeviceNames GetPlotStyleTableNames
   GetWindowToPlot GetXData RefreshPlotDeviceInfo SetCustomScale
   SetWindowToPlot SetXData")
  (:properties
   "Application Block CanonicalMediaName CenterPlot ConfigName
   Document Handle HasExtensionDictionary ModelType Name ObjectID
   ObjectName OwnerID PaperUnits PlotHidden PlotOrigin PlotRotation
   PlotType PlotViewportBorders PlotViewportsFirst PlotWithLineweights
   PlotWithPlotStyles ScaleLineweights ShowPlotStyles StandardScale
   StyleSheet TabOrder UseStandardScale ViewToPlot")
  (:events
   "Modified"))
