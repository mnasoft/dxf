(in-package :dxf/classes)

'((:defclass "AcadMaterials")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4BC04C70-B2B0-4325-8042-CAD81F9058F1\"](Materials Collection (ActiveX))")
  (:methods
   "Add GetExtensionDictionary GetXData Item SetXData")
  (:properties
   "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
  (:events
   "Modified"))
