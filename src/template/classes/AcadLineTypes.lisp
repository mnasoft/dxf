(in-package :dxf/classes)

((:defclass "AcadLineTypes")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-968A3D1F-8DEF-4B8B-8067-0B756A622D97\"](Linetypes Collection (ActiveX))")
  (:methods
   "Add GetExtensionDictionary GetXData Item Load SetXData")
  (:properties
   "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
  (:events
   "Modified"))
