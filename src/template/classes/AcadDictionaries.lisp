(in-package :dxf/classes)

'((:defclass "AcadDictionaries")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C04BFB8A-8FDF-4D9E-8C0F-E1D2226FEC8A\"](Dictionaries Collection (ActiveX))")
  (:methods
   "Add GetExtensionDictionary GetXData Item SetXData")
  (:properties
   "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
  (:events
   "Modified"))
