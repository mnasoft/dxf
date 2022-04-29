(in-package :dxf/classes)

((:defclass "AcadUCS")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-42778889-C568-4ABF-9CFA-63CC0D781794\"](UCS Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetUCSMatrix GetXData SetXData")
  (:properties
   "Application Document Handle HasExtensionDictionary Name ObjectID
   ObjectName Origin OwnerID XVector YVector")
  (:events
   "Modified"))
