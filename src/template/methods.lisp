(in-package :dxf)

(defparameter *m*
  '((:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetInvisibleEdge GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetInvisibleEdge SetXData TransformBy Update")
    (:methods
     "AppendVertex ArrayPolar ArrayRectangular Copy Delete Explode
   GetBoundingBox GetBulge GetExtensionDictionary GetWidth GetXData
   Highlight IntersectWith Mirror Mirror3D Move Offset Rotate Rotate3D
   ScaleEntity SetBulge SetWidth SetXData TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Boolean CheckInterference Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate ScaleEntity
   SectionSolid SetXData SliceSolid TransformBy Update")
    (:methods
     "Delete SetColorBookColor SetNames SetRGB")
    (:methods
     "Eval GetAcadState GetInterfaceObject ListARX LoadARX LoadDVB Quit
   RunMacro UnloadARX UnloadDVB Update ZoomAll ZoomCenter ZoomExtents
   ZoomPickWindow ZoomPrevious ZoomScaled ZoomWindow")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update UpdateMTextAttribute")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetExtensionDictionary GetXData
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update UpdateMTextAttribute")
    (:methods
     "Add3DFace Add3DMesh Add3DPoly AddArc AddAttribute AddBox AddCircle
   AddCone AddCustomObject AddCylinder AddDim3PointAngular
   AddDimAligned AddDimAngular AddDimArc AddDimDiametric
   AddDimOrdinate AddDimRadial AddDimRadialLarge AddDimRotated
   AddEllipse AddEllipticalCone AddEllipticalCylinder AddExtrudedSolid
   AddExtrudedSolidALongPath AddHatch AddLeader AddLightWeightPolyline
   AddLine AddMInsertBlock AddMLeader AddMLine AddMText AddPoint
   AddPolyfaceMesh AddPolyline AddRaster AddRay AddRegion
   AddRevolvedSolid AddSection AddShape AddSolid AddSphere AddSpline
   AddTable AddText AddTolerance AddTorus AddTrace AddWedge AddXLine
   AttachExternalReference Bind Delete Detach GetExtensionDictionary
   GetXData InsertBlock Item Reload SetXData Unload")
    (:methods
     "ArrayPolar ArrayRectangular ConvertToAnonymousBlock
   ConvertToStaticBlock Copy Delete Explode GetAttributes
   GetBoundingBox GetConstantAttributes GetDynamicBlockProperties
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move ResetBlock Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular ConvertToAnonymousBlock
   ConvertToStaticBlock Copy Delete Explode GetAttributes
   GetBoundingBox GetConstantAttributes GetDynamicBlockProperties
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move ResetBlock Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "CopyObjects HandleToObject ObjectIdToObject")
    (:methods
     "None")
    (:methods
     "ArrayPolar ArrayRectangular ClipBoundary Copy Delete GetBoundingBox
    GetExtensionDictionary GetXData Highlight IntersectWith Mirror
    Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
    Update")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "AddObject AddXRecord Delete GetExtensionDictionary GetName
   GetObject GetXData Item Remove Rename Replace SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
    GetExtensionDictionary GetXData Highlight IntersectWith Mirror
    Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
    Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "CopyFrom Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "Activate AuditInfo Close CopyObjects EndUndoMark Export
   GetVariable HandleToObject Import LoadShapeFile New
   ObjectIDToObject Open PostCommand PurgeAll Regen Save SaveAs
   SendCommand SetVariable StartUndoMark WBlock")
    (:methods
     "Add Close Item Open")
    (:methods
     "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
    (:methods
     "None")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular ConvertToAnonymousBlock
   ConvertToStaticBlock Copy Delete Explode GetAttributes
   GetBoundingBox GetConstantAttributes GetDynamicBlockProperties
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move ResetBlock Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "AppendItems Delete GetExtensionDictionary GetXData Highlight Item
   RemoveItems SetXData Update")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "AppendInnerLoop AppendOuterLoop ArrayPolar ArrayRectangular Copy
   Delete Evaluate GetBoundingBox GetExtensionDictionary GetLoopAt
   GetXData Highlight InsertLoopAt IntersectWith Mirror Mirror3D Move
   Rotate Rotate3D ScaleEntity SetPattern SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "Add GenerateUsageData GetExtensionDictionary GetXData Item
   SetXData")
    (:methods
     "CopyFrom Delete GetCanonicalMediaNames GetCustomScale
   GetExtensionDictionary GetLocaleMediaName GetPaperMargins
   GetPaperSize GetPlotDeviceNames GetPlotStyleTableNames
   GetWindowToPlot GetXData RefreshPlotDeviceInfo SetCustomScale
   SetWindowToPlot SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete Evaluate GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item Load SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "AddVertex ArrayPolar ArrayRectangular Copy Delete Explode
   GetBoundingBox GetBulge GetExtensionDictionary GetWidth GetXData
   Highlight IntersectWith Mirror Mirror3D Move Offset Rotate Rotate3D
   ScaleEntity SetBulge SetWidth SetXData TransformBy Update")
    (:methods
     "Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular ConvertToAnonymousBlock
   ConvertToStaticBlock Copy Delete Explode GetAttributes
   GetBoundingBox GetConstantAttributes GetDynamicBlockProperties
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move ResetBlock Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "AddLeader AddLeaderLine AddLeaderLineEx ArrayPolar
   ArrayRectangular Copy Delete Evaluate GetBlockAttributeValue
   GetBoundingBox GetDoglegDirection GetExtensionDictionary
   GetLeaderIndex GetLeaderLineIndexes GetLeaderLineVertices
   GetVertexCount GetXData Highlight IntersectWith Mirror Mirror3D
   Move RemoveLeader RemoveLeaderLine Rotate Rotate3D ScaleEntity
   SetBlockAttributeValue SetDoglegDirection SetLeaderLineVertices
   SetXData TransformBy Update")
    (:methods
     "Delete GetBoundingBox GetXData SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Add3DFace Add3DMesh Add3DPoly AddArc AddAttribute AddBox AddCircle
   AddCone AddCustomObject AddCylinder AddDim3PointAngular
   AddDimAligned AddDimAngular AddDimArc AddDimDiametric
   AddDimOrdinate AddDimRadial AddDimRadialLarge AddDimRotated
   AddEllipse AddEllipticalCone AddEllipticalCylinder AddExtrudedSolid
   AddExtrudedSolidALongPath AddHatch AddLeader AddLightWeightPolyline
   AddLine AddMInsertBlock AddMLeader AddMLine AddMText AddPoint
   AddPolyfaceMesh AddPolyline AddRaster AddRay AddRegion
   AddRevolvedSolid AddSection AddShape AddSolid AddSphere AddSpline
   AddTable AddText AddTolerance AddTorus AddTrace AddWedge AddXLine
   AttachExternalReference GetExtensionDictionary GetXdata InsertBlock
   Item SetXdata")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete FieldCode GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Add3DFace Add3DMesh Add3DPoly AddArc AddAttribute AddBox AddCircle
   AddCone AddCustomObject AddCylinder AddDim3PointAngular
   AddDimAligned AddDimAngular AddDimArc AddDimDiametric
   AddDimOrdinate AddDimRadial AddDimRadialLarge AddDimRotated
   AddEllipse AddEllipticalCone AddEllipticalCylinder AddExtrudedSolid
   AddExtrudedSolidALongPath AddHatch AddLeader AddLightWeightPolyline
   AddLine AddMInsertBlock AddMLeader AddMLine AddMText AddPoint
   AddPolyfaceMesh AddPolyline AddPViewport AddRaster AddRay AddRegion
   AddRevolvedSolid AddSection AddShape AddSolid AddSphere AddSpline
   AddTable AddText AddTolerance AddTorus AddTrace AddWedge AddXLine
   AttachExternalReference GetExtensionDictionary GetXdata InsertBlock
   Item SetXdata")
    (:methods
     "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "DisplayPlotPreview PlotToDevice PlotToFile SetLayoutsToPlot
   StartBatchMode")
    (:methods
     "CopyFrom Delete GetCanonicalMediaNames GetCustomScale
   GetExtensionDictionary GetLocaleMediaName GetPaperMargins
   GetPaperSize GetPlotDeviceNames GetPlotStyleTableNames
   GetWindowToPlot GetXData RefreshPlotDeviceInfo SetCustomScale
   SetWindowToPlot SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "AppendVertex ArrayPolar ArrayRectangular Copy Delete Explode
   GetBoundingBox GetBulge GetExtensionDictionary GetWidth GetXData
   Highlight IntersectWith Mirror Mirror3D Move Offset Rotate Rotate3D
   ScaleEntity SetBulge SetWidth SetXData TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete Display GetBoundingBox
   GetExtensionDictionary GetGridSpacing GetSnapSpacing GetXData
   Highlight IntersectWith Mirror Mirror3D Move Rotate Rotate3D
   ScaleEntity SetGridSpacing SetSnapSpacing SetXData SyncModelView
   TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Boolean Copy Delete Explode
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
    (:methods
     "Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "AddVertex ArrayPolar ArrayRectangular Copy CreateJog Delete
   GenerateSectionGeometry GetBoundingBox GetExtensionDictionary
   GetXData Highlight HitTest IntersectWith Mirror Mirror3D Move
   RemoveVertex Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "GetExtensionDictionary GetLiveSection GetUniqueSectionName
   GetXData Item SetXData")
    (:methods
     "Delete GetExtensionDictionary GetSectionTypeSettings GetXData
   SetXData")
    (:methods
     "AddItems Clear Delete Erase Highlight Item RemoveItems Select
   SelectAtPoint SelectByPolygon SelectOnScreen Update")
    (:methods
     "Add Item")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Block Delete GetExtensionDictionary GetFullDrawOrder
   GetRelativeDrawOrder GetXData MoveAbove MoveBelow MoveToBottom
   MoveToTop SetRelativeDrawOrder SetXData SwapObjects")
    (:methods
     "AddFitPoint ArrayPolar ArrayRectangular Copy Delete DeleteFitPoint
   ElevateOrder GetBoundingBox GetControlPoint GetExtensionDictionary
   GetFitPoint GetWeight GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset PurgeFitData Reverse Rotate Rotate3D
   ScaleEntity SetControlPoint SetFitPoint SetWeight SetXData
   TransformBy Update")
    (:methods
     "AddCustomInfo GetCustomByIndex GetCustomByKey NumCustomInfo
   RemoveCustomByIndex RemoveCustomByKey SetCustomByIndex
   SetCustomByKey")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
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
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete FieldCode GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Delete GetExtensionDictionary GetFont GetXData SetFont SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
    (:methods
     "Delete GetExtensionDictionary GetUCSMatrix GetXData SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "")
    (:methods
     "AngleFromXAxis AngleToReal AngleToString CreateTypedArray
    DistanceToReal GetAngle GetCorner GetDistance GetEntity GetInput
    GetInteger GetKeyword GetObjectIdString GetOrientation GetPoint
    GetReal GetRemoteFile GetString GetSubEntity InitializeUserInput
    IsRemoteFile IsURL LaunchBrowserDialog PolarPoint Prompt
    PutRemoteFile RealToString SendModelessOperationEnded
    SendModelessOperationStart TranslateCoordinates")
    (:methods
     "Delete GetExtensionDictionary GetXData SetXData")
    (:methods
     "Delete GetExtensionDictionary GetGridSpacing GetSnapSpacing
   GetXData SetGridSpacing SetSnapSpacing SetView SetXData Split")
    (:methods
     "Add DeleteConfiguration GetExtensionDictionary GetXData Item
   SetXData")
    (:methods
     "Add GetExtensionDictionary GetXData Item SetXData")
    (:methods
     "ArrayPolar ArrayRectangular ClipBoundary Copy Delete
   GetBoundingBox GetExtensionDictionary GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetXData TransformBy Update")
    (:methods
     "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Offset Rotate Rotate3D ScaleEntity SetXData
   TransformBy Update")
    (:methods
     "Delete GetExtensionDictionary GetXData GetXRecordData SetXData
   SetXRecordData")
    (:methods
     "")))

(format t "~{~S~%~}"
        (sort 
         (remove-duplicates 
          (apply
           #'append
           (loop :for (i j) :in *m*
                 :collect
                 (mnas-string:split
                  (coerce 
                   (list #\Space #\Return #\NewLine) 'string)
                  j)))
          :test #'string=)
         #'string<))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

'(
  ("Activate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8131A6DF-ED9F-4281-9207-C17BBDB187BF")
  ("Add" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6DB6EFDF-C393-4BD0-9E59-A57BCDA3456F")
  ("Add3DFace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E125323B-7DC2-4174-AEA9-DAAEA0E683D9")
  ("Add3DMesh" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3E5F11B9-C9A8-499E-8213-9624991453C6")
  ("Add3DPoly" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-21D7283A-552F-4DD8-BB4D-AEA1632186B9")
  ("AddArc" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-864A7E1F-D221-4C83-A4DB-F60C8E56FED6")
  ("AddAttribute" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-53417B1F-C6F1-4818-AD43-8C5F81E36BCA")
  ("AddBox" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE469E81-8531-415C-9D22-7041A42838DD")
  ("AddCircle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-837C702F-91A7-445B-8713-3099B94664BE")
  ("AddCone" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-95CCDBE3-C787-4FF5-AE5F-A94B0F2DF505")
  ("AddCustomInfo" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3A6A7572-5A76-4119-8307-FCDC7376D343")
  ("AddCustomObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F258899B-A0FF-4D92-B8D6-0CEAD1BD93B0")
  ("AddCylinder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5ED77A58-6AC2-4EF1-8E31-97F4889D3973")
  ("AddDim3PointAngular" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16DBF5D3-5D7B-4302-9363-43827C9ACFDF")
  ("AddDimAligned" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9F5CE147-3787-4DD9-8028-8E89BF02A357")
  ("AddDimAngular" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F02BBAFD-69C8-4CAC-8CCF-73949F04B43B")
  ("AddDimArc" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE0565FC-FF23-423A-A8F2-B43E4000D817")
  ("AddDimDiametric" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A713EB17-E229-48E7-BFA3-AF7DE13B09BF")
  ("AddDimOrdinate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EC499091-4A07-4B31-9B85-6A35A6009E3E")
  ("AddDimRadial" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4DAA2BF5-9658-477E-8A1B-1D27831BA2E5")
  ("AddDimRadialLarge" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-44C17784-3AA5-4D09-86D4-ED501702052D")
  ("AddDimRotated" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FE41C4DC-4717-41AC-9C07-6531CB9332E2")
  ("AddEllipse" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2A02344B-FDE0-4ECF-99BA-2595CA8F1E0D")
  ("AddEllipticalCone" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B43AD9D6-2D31-4212-B174-439038148963")
  ("AddEllipticalCylinder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1519C47-3C14-43BD-98FA-520E4142967B")
  ("AddExtrudedSolid" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B9DEA4C5-EDAA-4CC6-93B0-394D5991A0E6")
  ("AddExtrudedSolidALongPath" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2EDFD984-A178-4F1D-8F97-351E141D3DA4")
  ("AddFitPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-850ABE0B-B361-4573-A6D2-4FBA5B2FD044")
  ("AddHatch" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BAF2BEDD-489A-42D1-92B1-698DC9DAE675")
  ("AddItems" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AA0F3857-E4AD-44A7-823E-9D204E9DB6C2")
  ("AddLeader" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A8D8174C-FA79-4010-8A4D-636385BEA34B")
  ("AddLeaderLine" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A4B9704B-A70C-41D5-9C0F-BB732FDF544C")
  ("AddLeaderLineEx" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F7D86DD0-D325-4632-8E71-8219D5A0AF1E")
  ("AddLightWeightPolyline" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2003E0A1-5FB5-48A7-8CDA-2804F7C61C1C")
  ("AddLine" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-26C95029-14BB-40B9-9987-49EFC980CB9D")
  ("AddMInsertBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AAEFDED2-34A3-4466-A7AA-71CAD8DCB35C")
  ("AddMLeader" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-991E00FE-2128-4162-9C4A-80934C4897B2")
  ("AddMLine" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-04DA7279-286F-4D37-832F-18CB177608AC")
  ("AddMText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A441CDB-21D3-4AA3-A616-7FF4DA8925D2")
  ("AddObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B0163235-7D1D-4F48-A98F-598A286CB29F")
  ("AddPViewport" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-175761C6-B99A-431E-B76E-770DF0D7C39A")
  ("AddPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-265E706F-78E4-48C6-B1AB-66FD794BF230")
  ("AddPolyfaceMesh" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-038F2B2B-5FD8-43DA-A2EA-B05C13D9A3B2")
  ("AddPolyline" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED02917C-D1D6-46B8-95C6-736163C31362")
  ("AddRaster" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-28D17E41-371A-4D95-AED0-8E87ABC8CAEC")
  ("AddRay" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B34B2D9-AC2E-4DAE-9599-DB2BD495760F")
  ("AddRegion" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-74C8765E-EB4A-4773-ADD4-6C0F318FE6BE")
  ("AddRevolvedSolid" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C23158D9-F68B-44C6-B323-8196D8D5224D")
  ("AddSection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7349D699-A696-48DF-83D1-315FF944649E")
  ("AddShape" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C8184AD-1BEB-421D-9CD3-EFF3ACAB4396")
  ("AddSolid" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-89646E6C-DCD5-441B-AEF0-E4721089E607")
  ("AddSphere" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A80673FC-C26A-4CC8-9893-219154FFE59F")
  ("AddSpline" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EC965FD6-4807-4BE8-8CD6-D1213BFB8D64")
  ("AddTable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A5A767A8-98D0-40B4-89D1-1F0E5AC52EB7")
  ("AddText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D3A7DE5-4219-42D8-A2A2-20C723F01ABC")
  ("AddTolerance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9957DA00-ED1B-47EF-B133-B6BE25FB442E")
  ("AddTorus" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B805DC80-DEA9-4BE5-98E5-CB6DBA669068")
  ("AddTrace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DA77477E-E3F7-4479-8C9E-597DAEAC5580")
  ("AddVertex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F6468084-9D2B-436C-8E61-5B806883A316")
  ("AddWedge" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9C1BFD64-9BA2-41FD-BF33-A4AD90A5A031")
  ("AddXLine" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-53485293-880E-49B7-93C9-8C93E6F56625")
  ("AddXRecord" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C7326186-12DD-44B4-A45B-29311DEFC570")
  ("AngleFromXAxis" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4BC1FEFF-6A01-4272-AA8E-F4F465ABC36E")
  ("AngleToReal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EEE621A5-7248-4C24-8533-06F8B71CCF32")
  ("AngleToString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4FF6FABE-384B-4C4B-A3E5-3E7FD2069977")
  ("AppendInnerLoop" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C746F485-3882-4E89-B6CE-B4553E0DB458")
  ("AppendItems" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-01216A16-2242-4E2A-B98E-C12002594D4E")
  ("AppendOuterLoop" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4CA06494-CDFF-46FA-9E1D-A0E8220F69F4")
  ("AppendVertex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1015EC9B-0DC8-4B00-8875-F12BF8160554")
  ("ArrayPolar" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-34726D12-C973-47E4-86A1-DBD410FE1477")
  ("ArrayRectangular" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8F15232-7297-4C90-86A4-0A0887D4938B")
  ("AttachExternalReference" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-28CB9C44-08E6-47EF-A982-8F505D8C68F6")
  ("AuditInfo" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2B56C33A-0B8B-4A2A-A6C4-CDB951140171")
  ("Bind" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ABBD4055-F29F-479A-81F1-DB12188F7D74")
  ("Block" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B007B7FF-1A51-475D-9E7D-3A51C169420A")
  ("Boolean" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5D961150-1635-45ED-99CC-3C0222FDB2C3")
  ("CheckInterference" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D22E6F22-B774-48B1-8A85-01F81F1C80E4")
  ("Clear" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C9A0A555-B8B8-4CB3-86D4-EE8B7D5ED532")
  ("ClearSubSelection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-863DF0B2-FDDA-48A9-9AAA-F5D7308C0B76")
  ("ClearTableStyleOverrides" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-45E29270-0EA4-49C4-B718-D9A4A62AA9A7")
  ("ClipBoundary" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9612F57-7F1F-4CFD-B804-838B826C59FC")
  ("Close" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F0135870-7411-42CB-82E6-87509ADF3DFF")
  ("ConvertToAnonymousBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-449F4F02-F990-42D1-9A0C-91ED46E24609")
  ("ConvertToStaticBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-44279924-EDF6-41AB-B987-A6F6EDA7A883")
  ("Copy" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B036C50B-F504-486F-8179-85655206916E")
  ("CopyFrom" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1C8C71DB-C258-403B-8A41-07CE45AEC087")
  ("CopyObjects" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9E0A89C-2D81-4141-8B88-B9AC6EAABD62")
  ("CreateCellStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BF7A9530-CFDC-4AA4-8D0D-95BD64BFF1D1")
  ("CreateCellStyleFromStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F268E12D-54F4-4F47-B64E-4EE7AAA818BA")
  ("CreateContent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-25A0DF32-DDD4-4A95-AD6D-E7A0C1AF66E0")
  ("CreateJog" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D1CB7AEF-4199-4889-AB76-423A689FC072")
  ("CreateTypedArray" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A40B9E8B-47D0-4D7A-BDAF-8B28B26B3328")
  ("Delete" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-167FBA5F-C3F3-4195-A170-02E5E46EC797")
  ("DeleteCellContent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9E2F0407-FA3F-49A2-8266-78543A2FD85B")
  ("DeleteCellStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8193D4BC-2848-4E47-9F8D-D93A451AAAC1")
  ("DeleteColumns" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9402CDCF-84F6-445C-B7A0-C80D3F368361")
  ("DeleteConfiguration" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1CE02888-B4E7-44D2-9960-FF5CFB8C5B78")
  ("DeleteContent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6993A7FF-8296-4CDF-9EC2-378DEE7C8C54")
  ("DeleteFitPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C677C52-A2E6-41B0-A013-47FC992B19AE")
  ("DeleteRows" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-56B99B2E-C583-4E4B-BBC7-2FC7000B6D91")
  ("Detach" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-624A3B55-BB0A-46CC-993E-C15ECFB569C0")
  ("Display" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-11B24C9C-BEB8-425A-B833-29A1F0C5CC00")
  ("DisplayPlotPreview" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6126F7B4-B02D-4EDA-B297-BCCAF6D92ADF")
  ("DistanceToReal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DCB43B6-A696-4B9D-AD27-E553A5CA69D6")
  ("ElevateOrder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-63842B41-FA17-4300-B6A3-529221283470")
  ("EnableMergeAll" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16E02CB4-8CAA-4CA3-AF8F-D24FF5A1D831")
  ("EndUndoMark" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EAC301EA-ABF7-42DE-AC8B-CD77BC77873F")
  ("Erase" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-54A5C5A5-5156-4470-A057-12C222CE3DAE")
  ("Eval" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0D0B2C44-8F2F-4DA3-8E22-0273391ABA60")
  ("Evaluate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-04E0FB2D-919A-46A0-A715-541A4AA8CB1A")
  ("Explode" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6D96780F-3EC6-447C-B341-0FE815BE9979")
  ("Export" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-893F1711-3591-4DDC-8D27-DF91052F5E5A")
  ("FieldCode" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FE0C5004-B723-4AE8-888A-7DF11C765C89")
  ("FormatValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-26F6E964-7292-4AD1-97D2-B72B712ABDAF")
  ("GenerateLayout" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-39CE6DCE-D9CD-456D-9D71-14EB370F0D51")
  ("GenerateSectionGeometry" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9288F227-0752-4A04-8B47-DB6ECCDFE934")
  ("GenerateUsageData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-20DA963E-06EE-422E-A687-C90311796892")
  ("GetAcadState" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-820F93B4-7B83-4708-8E21-0D43D7D1C828")
  ("GetAlignment" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED26F9AB-CE3C-4832-9A94-EC73A0588698")
  ("GetAlignment2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-892800F1-3070-4EC1-B500-902932C98D22")
  ("GetAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-595BBC6E-5E87-46FA-8721-E90E54CB5CD5")
  ("GetAttachmentPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AFFD6C90-2BFA-4814-AF76-AB9807BC3442")
  ("GetAttributes" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3E8E1756-F45D-4CCE-838B-00FBC0374278")
  ("GetAutoScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-24B7F8D9-BFE3-4EF8-A506-7CF00139E169")
  ("GetAutoScale2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-24E9048E-CF74-4441-8C7F-7E9402BD1BB1")
  ("GetBackgroundColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D6A279BA-8792-4DB6-AA66-7E25E16BCC86")
  ("GetBackgroundColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CCFBEC3F-F228-4429-924F-38ABE9E89352")
  ("GetBackgroundColorNone" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B39A4D5-BA9C-45AA-8CCC-C11F42DF8A2A")
  ("GetBlockAttributeValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9422DC8E-FB16-46C7-B9E9-ECE703C814D2")
  ("GetBlockAttributeValue2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7F2C0954-E1CF-4E08-B9AD-585957BD96E4")
  ("GetBlockRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD96909E-C5C9-41BC-BAA2-1EB19F0BADFB")
  ("GetBlockScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6BECF6F6-93F5-47C1-9570-F31EF25243C9")
  ("GetBlockTableRecordId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9E3340A8-F672-4845-A55A-ABAD3372D79E")
  ("GetBlockTableRecordId2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DF3B3FCA-787B-45C3-9881-631F12DA05B6")
  ("GetBoundingBox" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A20C361C-BBF0-4EAB-8BE7-709154CEEE09")
  ("GetBreakHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AFC1C151-4A92-4393-A586-B417F1862D3E")
  ("GetBulge" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6AC9CF99-7230-4333-859A-1CBACB57B5BA")
  ("GetCanonicalMediaNames" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BDFDA2F3-63E6-47CD-8185-1793BEEDBCB1")
  ("GetCellAlignment" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C162420-98EC-4A0C-AED5-429685ABEB7E")
  ("GetCellBackgroundColor" "")
  "GetCellBackgroundColorNone"
  "GetCellClass" 
  "GetCellContentColor"
  "GetCellDataType"
  "GetCellExtents"
  "GetCellFormat"
  "GetCellGridColor"
  "GetCellGridLineWeight"
  "GetCellGridVisibility"
  "GetCellState"
  "GetCellStyle"
  "GetCellStyleOverrides"
  "GetCellStyles"
  "GetCellTextHeight"
  "GetCellTextStyle"
  "GetCellType"
  "GetCellValue"
  "GetColor"
  "GetColor2"
  "GetColumnName"
  "GetColumnWidth"
  "GetConstantAttributes"
  "GetContentColor"
  "GetContentColor2"
  "GetContentLayout"
  "GetContentType"
  "GetControlPoint"
  "GetCorner"
  "GetCustomByIndex"
  "GetCustomByKey"
  "GetCustomData"
  "GetCustomScale"
  "GetDataFormat"
  "GetDataType"
  "GetDataType2"
  "GetDistance"
  "GetDoglegDirection"
  "GetDynamicBlockProperties"
  "GetEntity"
  "GetExtensionDictionary"
  "GetFieldId"
  "GetFieldId2"
  "GetFitPoint"
  "GetFont"
  "GetFormat"
  "GetFormat2"
  "GetFormula"
  "GetFullDrawOrder"
  "GetGridColor"
  "GetGridColor2"
  "GetGridDoubleLineSpacing"
  "GetGridLineStyle"
  "GetGridLineWeight"
  "GetGridLineWeight2"
  "GetGridLinetype"
  "GetGridSpacing"
  "GetGridVisibility"
  "GetGridVisibility2"
  "GetHasFormula"
  "GetInput"
  "GetInteger"
  "GetInterfaceObject"
  "GetInvisibleEdge"
  "GetIsCellStyleInUse"
  "GetIsMergeAllEnabled"
  "GetKeyword"
  "GetLeaderIndex"
  "GetLeaderLineIndexes"
  "GetLeaderLineVertices"
  "GetLiveSection"
  "GetLocaleMediaName"
  "GetLoopAt"
  "GetMargin"
  "GetMinimumColumnWidth"
  "GetMinimumRowHeight"
  "GetName"
  "GetObject"
  "GetObjectIdString"
  "GetOrientation"
  "GetOverride"
  "GetPaperMargins"
  "GetPaperSize"
  "GetPlotDeviceNames"
  "GetPlotStyleTableNames"
  "GetPoint"
  "GetReal"
  "GetRelativeDrawOrder"
  "GetRemoteFile"
  "GetRotation"
  "GetRowHeight"
  "GetRowType"
  "GetScale"
  "GetSectionTypeSettings"
  "GetSnapSpacing"
  "GetString"
  "GetSubEntity"
  "GetSubSelection"
  "GetText"
  "GetTextHeight"
  "GetTextHeight2"
  "GetTextRotation"
  "GetTextString"
  "GetTextStyle"
  "GetTextStyle2"
  "GetTextStyleId"
  "GetUCSMatrix"
  "GetUniqueCellStyleName"
  "GetUniqueSectionName"
  "GetValue"
  "GetVariable"
  "GetVertexCount"
  "GetWeight"
  "GetWidth"
  "GetWindowToPlot"
  "GetXData"
  "GetXRecordData"
  "GetXdata"
  "HandleToObject"
  "Highlight"
  "HitTest"
  "Import"
  "InitializeUserInput"
  "InsertBlock"
  "InsertColumns"
  "InsertColumnsAndInherit"
  "InsertLoopAt"
  "InsertRows"
  "InsertRowsAndInherit"
  "IntersectWith"
  "IsContentEditable"
  "IsEmpty"
  "IsFormatEditable"
  "IsMergeAllEnabled"
  "IsMergedCell"
  "IsRemoteFile"
  "IsURL"
  "Item"
  "LaunchBrowserDialog"
  "ListARX"
  "Load"
  "LoadARX"
  "LoadDVB"
  "LoadShapeFile"
  "MergeCells"
  "Mirror"
  "Mirror3D"
  "Move"
  "MoveAbove"
  "MoveBelow"
  "MoveContent"
  "MoveToBottom"
  "MoveToTop"
  "New"
  "None"
  "NumCustomInfo"
  "ObjectIDToObject"
  "ObjectIdToObject"
  "Offset"
  "Open"
  "PlotToDevice"
  "PlotToFile"
  "PolarPoint"
  "PostCommand"
  "Prompt"
  "PurgeAll"
  "PurgeFitData"
  "PutRemoteFile"
  "Quit"
  "RealToString"
  "RecomputeTableBlock"
  "RefreshPlotDeviceInfo"
  "Regen"
  "Reload"
  "Remove"
  "RemoveAllOverrides"
  "RemoveCustomByIndex"
  "RemoveCustomByKey"
  "RemoveItems"
  "RemoveLeader"
  "RemoveLeaderLine"
  "RemoveVertex"
  "Rename"
  "RenameCellStyle"
  "Replace"
  "ReselectSubRegion"
  "ResetBlock"
  "ResetCellValue"
  "Reverse"
  "Rotate"
  "Rotate3D"
  "RunMacro"
  "Save"
  "SaveAs"
  "ScaleEntity"
  "SectionSolid"
  "Select"
  "SelectAtPoint"
  "SelectByPolygon"
  "SelectOnScreen"
  "SelectSubRegion"
  "SendCommand"
  "SendModelessOperationEnded"
  "SendModelessOperationStart"
  "SetAlignment"
  "SetAlignment2"
  "SetAutoScale"
  "SetAutoScale2"
  "SetBackgroundColor"
  "SetBackgroundColor2"
  "SetBackgroundColorNone"
  "SetBlockAttributeValue"
  "SetBlockAttributeValue2"
  "SetBlockRotation"
  "SetBlockScale"
  "SetBlockTableRecordId"
  "SetBlockTableRecordId2"
  "SetBreakHeight"
  "SetBulge"
  "SetCellAlignment"
  "SetCellBackgroundColor"
  "SetCellBackgroundColorNone"
  "SetCellClass"
  "SetCellContentColor"
  "SetCellDataType"
  "SetCellFormat"
  "SetCellGridColor"
  "SetCellGridLineWeight"
  "SetCellGridVisibility"
  "SetCellState"
  "SetCellStyle"
  "SetCellTextHeight"
  "SetCellTextStyle"
  "SetCellType"
  "SetCellValue"
  "SetCellValueFromText"
  "SetColor"
  "SetColor2"
  "SetColorBookColor"
  "SetColumnName"
  "SetColumnWidth"
  "SetContentColor"
  "SetContentColor2"
  "SetContentLayout"
  "SetControlPoint"
  "SetCustomByIndex"
  "SetCustomByKey"
  "SetCustomData"
  "SetCustomScale"
  "SetDataFormat"
  "SetDataType"
  "SetDataType2"
  "SetDoglegDirection"
  "SetFieldId"
  "SetFieldId2"
  "SetFitPoint"
  "SetFont"
  "SetFormat"
  "SetFormat2"
  "SetFormula"
  "SetGridColor"
  "SetGridColor2"
  "SetGridDoubleLineSpacing"
  "SetGridLineStyle"
  "SetGridLineWeight"
  "SetGridLineWeight2"
  "SetGridLinetype"
  "SetGridSpacing"
  "SetGridVisibility"
  "SetGridVisibility2"
  "SetInvisibleEdge"
  "SetLayoutsToPlot"
  "SetLeaderLineVertices"
  "SetMargin"
  "SetNames"
  "SetOverride"
  "SetPattern"
  "SetRGB"
  "SetRelativeDrawOrder"
  "SetRotation"
  "SetRowHeight"
  "SetScale"
  "SetSnapSpacing"
  "SetSubSelection"
  "SetTemplateId"
  "SetText"
  "SetTextHeight"
  "SetTextHeight2"
  "SetTextRotation"
  "SetTextString"
  "SetTextStyle"
  "SetTextStyle2"
  "SetTextStyleId"
  "SetToolTip"
  "SetValue"
  "SetValueFromText"
  "SetVariable"
  "SetView"
  "SetWeight"
  "SetWidth"
  "SetWindowToPlot"
  "SetXData"
  "SetXRecordData"
  "SetXdata"
  "SliceSolid"
  "Split"
  "StartBatchMode"
  "StartUndoMark"
  "SwapObjects"
  "SyncModelView"
  "TransformBy"
  "TranslateCoordinates"
  "Unload"
  "UnloadARX"
  "UnloadDVB"
  "UnmergeCells"
  "Update"
  "UpdateMTextAttribute"
  "WBlock"
  "ZoomAll"
  "ZoomCenter"
  "ZoomExtents"
  "ZoomPickWindow"
  "ZoomPrevious"
  "ZoomScaled"
  "ZoomWindow"
  )
