(in-package :dxf/classes)

((:defclass "AcadMaterial")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7E5AA1A-D3C3-4AA3-A751-97768628D96C\"](Material Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetXData SetXData")
  (:properties
   "Application Description Document Handle HasExtensionDictionary
   Name ObjectID ObjectName OwnerID")
  (:events
   "Modified"))
