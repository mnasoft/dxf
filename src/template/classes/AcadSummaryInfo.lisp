(in-package :dxf/classes)

((:defclass "AcadSummaryInfo")
  (:parents "Object")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A029FB49-B0DB-43E4-8888-698E1BF49878\"](SummaryInfo Object (ActiveX))")
  (:methods
   "AddCustomInfo GetCustomByIndex GetCustomByKey NumCustomInfo
   RemoveCustomByIndex RemoveCustomByKey SetCustomByIndex
   SetCustomByKey")
  (:properties
   "Author Comments HyperlinkBase Keywords LastSavedBy RevisionNumber
   Subject Title")
  (:events
   "None"))
