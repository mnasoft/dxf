(in-package :dxf/classes)

'((:defclass "AcadLayer")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14F28A52-81E5-4CD0-AA79-ADC09E91BB8C\"](Layer Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetXData SetXData")
  (:properties
   "Application Description Document Freeze Handle
   HasExtensionDictionary LayerOn Linetype Lineweight Lock Material
   Name ObjectID ObjectName OwnerID PlotStyleName Plottable TrueColor
   Used ViewportDefault")
  (:events
   "Modified"))
