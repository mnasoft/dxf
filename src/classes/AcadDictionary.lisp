(in-package :dxf/classes)

'((:defclass "AcadDictionary" )
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FF18AA0-4E48-4F92-AC0D-FBBD4225D347\"](Dictionary Object (ActiveX))")
  (:methods
   "AddObject AddXRecord Delete GetExtensionDictionary GetName
   GetObject GetXData Item Remove Rename Replace SetXData")
  (:properties
   "Application Count Document Handle HasExtensionDictionary Name
   ObjectID ObjectName OwnerID")
  (:events
   "Modified"))
