(in-package :dxf/classes)

((:defclass "AcadLinetype")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16016CA5-0126-403B-844B-F6CABE117B50\"](Linetype Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetXData SetXData")
  (:properties
   "Application Description Document Handle HasExtensionDictionary
   Name ObjectID ObjectName OwnerID")
  (:events
   "Modified"))
