(in-package :dxf/classes)

'((:defclass "AcadViews")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-786FCD2B-E5F8-4BFA-B69F-F871AF4503CA\"](Views Collection (ActiveX))")
  (:methods
   "Add GetExtensionDictionary GetXData Item SetXData")
  (:properties
   "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
  (:events
   "Modified"))
