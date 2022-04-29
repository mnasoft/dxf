(in-package :dxf/classes)

((:defclass "AcadPlot")
  (:parents "Object")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A01876A-13D5-4938-8BEE-7712FD7C12CF\"](Plot Object (ActiveX))")
  (:methods
   "DisplayPlotPreview PlotToDevice PlotToFile SetLayoutsToPlot
   StartBatchMode")
  (:properties
   "Application BatchPlotProgress NumberOfCopies QuietErrorMode")
  (:events
   "None"))
