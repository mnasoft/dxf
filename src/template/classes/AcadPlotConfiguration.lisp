(in-package :dxf/classes)

'((:defclass "AcadPlotConfiguration")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AF404266-C40A-4FB4-B4E0-1D1C83052B6D\"](PlotConfiguration Object (ActiveX))")
  (:methods
   "CopyFrom Delete GetCanonicalMediaNames GetCustomScale
   GetExtensionDictionary GetLocaleMediaName GetPaperMargins
   GetPaperSize GetPlotDeviceNames GetPlotStyleTableNames
   GetWindowToPlot GetXData RefreshPlotDeviceInfo SetCustomScale
   SetWindowToPlot SetXData")
  (:properties
   "Application CanonicalMediaName CenterPlot ConfigName Document
   Handle HasExtensionDictionary ModelType Name ObjectID ObjectName
   OwnerID PaperUnits PlotHidden PlotOrigin PlotRotation PlotType
   PlotViewportBorders PlotViewportsFirst PlotWithLineweights
   PlotWithPlotStyles ScaleLineweights ShowPlotStyles StandardScale
   StyleSheet UseStandardScale ViewToPlot")
  (:events
   "Modified"))
