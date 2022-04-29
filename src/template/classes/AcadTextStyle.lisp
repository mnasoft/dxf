(in-package :dxf/classes)

'((:defclass "AcadTextStyle")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0531335D-26F3-404B-A4E1-1DE70BF0A307\"](TextStyle Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetFont GetXData SetFont SetXData")
  (:properties
   "Application BigFontFile Document FontFile Handle
   HasExtensionDictionary Height LastHeight Name ObjectID ObjectName
   ObliqueAngle OwnerID TextGenerationFlag Width")
  (:events
   "Modified"))
