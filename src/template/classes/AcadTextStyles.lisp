(in-package :dxf/classes)

((:defclass "AcadTextStyles")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-22FC4F30-F03C-4D9C-83DE-FEAEB7135D7F\"](TextStyles Collection (ActiveX))")
  (:methods
   "Add GetExtensionDictionary GetXData Item SetXData")
  (:properties
   "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
  (:events
   "Modified"))
