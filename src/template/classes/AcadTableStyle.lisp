(in-package :dxf/classes)

'((:defclass "AcadTableStyle")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-409A6709-D3D9-4D7D-AC60-163444D58FBA\"](TableStyle Object (ActiveX))")
  (:methods
   "CreateCellStyle CreateCellStyleFromStyle Delete DeleteCellStyle
   EnableMergeAll GetAlignment GetAlignment2 GetBackgroundColor
   GetBackgroundColor2 GetBackgroundColorNone GetCellClass
   GetCellStyles GetColor GetColor2 GetDataType GetDataType2
   GetExtensionDictionary GetFormat GetFormat2 GetGridColor
   GetGridColor2 GetGridLineWeight GetGridLineWeight2
   GetGridVisibility GetGridVisibility2 GetIsCellStyleInUse
   GetIsMergeAllEnabled GetRotation GetTextHeight GetTextHeight2
   GetTextStyle GetTextStyleId GetUniqueCellStyleName GetXData
   RenameCellStyle SetAlignment SetAlignment2 SetBackgroundColor
   SetBackgroundColor2 SetBackgroundColorNone SetCellClass SetColor
   SetColor2 SetDataType SetDataType2 SetFormat SetFormat2
   SetGridColor SetGridColor2 SetGridLineWeight SetGridLineWeight2
   SetGridVisibility SetGridVisibility2 SetRotation SetTemplateId
   SetTextHeight SetTextHeight2 SetTextStyle SetTextStyleId SetXData")
  (:properties
   "Application BitFlags Description Document FlowDirection Handle
   HasExtensionDictionary HeaderSuppressed HorzCellMargin Name
   NumCellStyles ObjectID ObjectName OwnerID TemplateId
   TitleSuppressed VertCellMargin")
  (:events
   "Modified"))
