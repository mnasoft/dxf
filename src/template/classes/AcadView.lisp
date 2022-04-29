(in-package :dxf/classes)

((:defclass "AcadView")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B9C7D36-0905-4C20-84C5-53714379B811\"](View Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetXData SetXData")
  (:properties
   "Application CategoryName Center Direction Document Handle
   HasExtensionDictionary HasVpAssociation Height LayerState LayoutID
   Name ObjectID ObjectName OwnerID Target Width")
  (:events
   "Modified"))
