(in-package :dxf/classes)

'((:defclass "AcadTable")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7B82400C-53D0-4D1A-94FA-66BB3040F0AA\"](Table Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular ClearSubSelection
   ClearTableStyleOverrides Copy CreateContent Delete
   DeleteCellContent DeleteColumns DeleteContent DeleteRows
   EnableMergeAll FormatValue GenerateLayout GetAlignment
   GetAttachmentPoint GetAutoScale GetAutoScale2 GetBackgroundColor
   GetBackgroundColorNone GetBlockAttributeValue
   GetBlockAttributeValue2 GetBlockRotation GetBlockScale
   GetBlockTableRecordId GetBlockTableRecordId2 GetBoundingBox
   GetBreakHeight GetCellAlignment GetCellBackgroundColor
   GetCellBackgroundColorNone GetCellContentColor GetCellDataType
   GetCellExtents GetCellFormat GetCellGridColor GetCellGridLineWeight
   GetCellGridVisibility GetCellState GetCellStyle
   GetCellStyleOverrides GetCellTextHeight GetCellTextStyle
   GetCellType GetCellValue GetColumnName GetColumnWidth
   GetContentColor GetContentColor2 GetContentLayout GetContentType
   GetCustomData GetDataFormat GetDataType GetDataType2
   GetExtensionDictionary GetFieldId GetFieldId2 GetFormat GetFormula
   GetGridColor GetGridColor2 GetGridDoubleLineSpacing
   GetGridLineStyle GetGridLinetype GetGridLineWeight
   GetGridLineWeight2 GetGridVisibility GetGridVisibility2
   GetHasFormula GetMargin GetMinimumColumnWidth GetMinimumRowHeight
   GetOverride GetRotation GetRowHeight GetRowType GetScale
   GetSubSelection GetText GetTextHeight GetTextHeight2
   GetTextRotation GetTextString GetTextStyle GetTextStyle2 GetValue
   GetXData Highlight HitTest InsertColumns InsertColumnsAndInherit
   InsertRows InsertRowsAndInherit IntersectWith IsContentEditable
   IsEmpty IsFormatEditable IsMergeAllEnabled IsMergedCell MergeCells
   Mirror Mirror3D Move MoveContent RecomputeTableBlock
   RemoveAllOverrides ReselectSubRegion ResetCellValue Rotate Rotate3D
   ScaleEntity Select SelectSubRegion SetAlignment SetAutoScale
   SetAutoScale2 SetBackgroundColor SetBackgroundColorNone
   SetBlockAttributeValue SetBlockAttributeValue2 SetBlockRotation
   SetBlockScale SetBlockTableRecordId SetBlockTableRecordId2
   SetBreakHeight SetCellAlignment SetCellBackgroundColor
   SetCellBackgroundColorNone SetCellContentColor SetCellDataType
   SetCellFormat SetCellGridColor SetCellGridLineWeight
   SetCellGridVisibility SetCellState SetCellStyle SetCellTextHeight
   SetCellTextStyle SetCellType SetCellValue SetCellValueFromText
   SetColumnName SetColumnWidth SetContentColor SetContentColor2
   SetContentLayout SetCustomData SetDataFormat SetDataType
   SetDataType2 SetFieldId SetFieldId2 SetFormat SetFormula
   SetGridColor SetGridColor2 SetGridDoubleLineSpacing
   SetGridLineStyle SetGridLinetype SetGridLineWeight
   SetGridLineWeight2 SetGridVisibility SetGridVisibility2 SetMargin
   SetOverride SetRotation SetRowHeight SetScale SetSubSelection
   SetText SetTextHeight SetTextHeight2 SetTextRotation SetTextString
   SetTextStyle SetTextStyle2 SetToolTip SetValue SetValueFromText
   SetXData TransformBy UnmergeCells Update")
  (:properties
   "AllowManualHeights AllowManualPositions Application BreaksEnabled
   BreakSpacing Columns ColumnWidth Direction Document EnableBreak
   EntityTransparency FlowDirection Handle HasExtensionDictionary
   HasSubSelection HeaderSuppressed Height HorzCellMargin Hyperlinks
   InsertionPoint Layer Linetype LinetypeScale Lineweight Material
   MinimumTableHeight MinimumTableWidth ObjectID ObjectName OwnerID
   PlotStyleName RegenerateTableSuppressed RepeatBottomLabels
   RepeatTopLabels RowHeight Rows StyleName TableBreakFlowDirection
   TableBreakHeight TableStyleOverrides TitleSuppressed TrueColor
   VertCellMargin Visible Width")
  (:events
   "Modified"))
