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
     "Eval GetAcadState GetInterfaceObject ListArx LoadArx LoadDvb Quit
   RunMacro UnloadArx UnloadDvb Update ZoomAll ZoomCenter ZoomExtents
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

(defparameter *m-renaming*
  '(("ARX" "Arx")
    ("DVB" "Dvb")))

(format t "~{~S~%~}"
        (sort
         (set-difference 
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
          '("None")  :test #'string=)
         #'string<))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *m-h*
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
    ("GetCellBackgroundColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EE598987-E261-41D8-9E4F-D2DE8D22A635")
    ("GetCellBackgroundColorNone" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6D19CF36-F34D-4F45-8E10-7C536E765706")
    ("GetCellClass" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-896D8EDA-B95A-42F4-A6B2-9FD5C6436D9E")
    ("GetCellContentColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-67E82FEC-63C6-4883-9A83-24C5E6CF75C7")
    ("GetCellDataType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-33231CA9-CC92-4BB7-9260-58E3E15C9794")
    ("GetCellExtents" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F8975E64-00E2-4B8A-A45C-8EA76E2A147B")
    ("GetCellFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6D03F57F-E216-4BAD-A73B-C2CB85A579C7")
    ("GetCellGridColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D7B5A899-8C18-489F-8D9D-B7E434ADF487")
    ("GetCellGridLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3A4505C8-A91E-47D5-8C37-FA2B1E2A3C80")
    ("GetCellGridVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E56EA30B-D75C-4B9B-B2F0-41E6C5997C7C")
    ("GetCellState" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2DB653E7-4AB3-4BB7-9E62-FC5768C410A4")
    ("GetCellStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F938D284-3448-4B2C-B1FC-08D6F528B697")
    ("GetCellStyleOverrides" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B8B9713F-2B6A-4256-B378-C351A6081699")
    ("GetCellStyles" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D7F00C0D-66A8-49F7-A8E0-20A8AD581519")
    ("GetCellTextHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-355A7128-5E10-4547-AB88-4CD495011488")
    ("GetCellTextStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F71423EB-37A0-491A-B297-DDCF605352F2")
    ("GetCellType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-230EB944-EFE6-4EA9-B1BD-148E526FEB9E")
    ("GetCellValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AD64910D-2FFF-419E-9C96-9FF9BE48CFBC")
    ("GetColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9DCB6044-5CE7-4E93-90E9-42F0121AF5C9")
    ("GetColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-44881C28-FAE3-48F5-B045-15F9989D6EE3")
    ("GetColumnName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A0DE6936-46FD-4CE5-8F4C-E3E32F0B0DD5")
    ("GetColumnWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-75753472-516B-46B4-B8BB-C8E7FDA58F42")
    ("GetConstantAttributes" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2655DC82-1DD4-42EC-888C-5F6E32A7342B")
    ("GetContentColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4726EE3F-51EC-4334-B33D-D5BC52A31600")
    ("GetContentColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ECE7A46C-B69F-4A7C-B4F8-B6585869B9F7")
    ("GetContentLayout" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CD9AFE81-5B0D-4B42-8A45-FB05CCD673AF")
    ("GetContentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C04AB60A-502D-4E07-B498-1E0070F105CB")
    ("GetControlPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A3039B0D-A486-45B4-9FE1-8264AB9E1DF6")
    ("GetCorner" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DEBFE610-787C-478C-B311-F1DEE2B03C1E")
    ("GetCustomByIndex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-40B8C6D4-7B70-48AE-A7BF-5C2B7728AB6F")
    ("GetCustomByKey" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AE25EAE8-012B-4E16-BE71-13BC07313E07")
    ("GetCustomData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BCA24A43-3E9D-4107-B455-E253823C507C")
    ("GetCustomScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B9B18B0C-5DC1-458A-8AD9-32FE0CA58635")
    ("GetDataFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4FC088E4-CBD0-4E03-98BB-41152E5B02F2")
    ("GetDataType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5D3C02C0-26E2-478D-881C-0E129C364C46")
    ("GetDataType2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3542955C-2F9C-4EFA-B0D1-CEE519A052A1")
    ("GetDistance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8E5E263B-F827-42EA-8376-49DC97778366")
    ("GetDoglegDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-18B437E1-F900-4A99-870F-70A61C21791F")
    ("GetDynamicBlockProperties" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16C8768B-2533-45FF-9CFF-FF864AC78202")
    ("GetEntity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-69164FAA-F3C7-47A4-962C-5F4B2D5BC583")
    ("GetExtensionDictionary" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-87411ABA-ABCF-45AF-A8C5-0ED036A34D5F")
    ("GetFieldId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5AA26AA4-3288-4F2C-A537-3EC995CA5FD0")
    ("GetFieldId2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DCF426E6-029A-42AB-9BCB-620A3569222E")
    ("GetFitPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5384E917-3052-409C-89C7-B780B766941D")
    ("GetFont" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7070FBED-AD5F-47EB-BB9A-5CD25B76DCC8")
    ("GetFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-40415A47-3ED1-456D-A032-E6509479E530")
    ("GetFormat2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35B51F2F-969A-4E43-A66C-9F1FD68713F3")
    ("GetFormula" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2EA17F65-107A-4EC8-AE83-FC93F2576CD9")
    ("GetFullDrawOrder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A35E667D-BD0E-4D5A-B4FD-69B4D21DB5A7")
    ("GetGridColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-647E5C07-D599-4DE2-BB0D-118A17CE2B5E")
    ("GetGridColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A0B945BD-3E78-4310-8FED-79EB526018C8")
    ("GetGridDoubleLineSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A5F13B85-BE8E-4448-BC44-8E3D3C05B38F")
    ("GetGridLineStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C2211F61-1F53-463E-8F71-5975B14DA183")
    ("GetGridLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B9ED2575-1472-4F99-BD07-718D4981A693")
    ("GetGridLineWeight2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-907B04E5-A958-407C-946D-0D1F15DD8565")
    ("GetGridLinetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1CE50AA0-8CF2-4C05-88D8-4163DC4CD7EF")
    ("GetGridSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-36227756-F343-4C88-B5A0-9830B53D69A7")
    ("GetGridVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B86CAB76-E95E-44D1-9594-977764D6CCD8")
    ("GetGridVisibility2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EE14EB7C-B697-4F73-91CB-732E0D294DBC")
    ("GetHasFormula" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-27E01EF6-3422-49D1-9C4F-AF1370CD21C2")
    ("GetInput" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-75A18A2B-37B4-44B4-973B-B9E04CDB8203")
    ("GetInteger" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C44DEFF-8153-460D-98CB-4221972A2928")
    ("GetInterfaceObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0977714A-B209-445C-AF17-B5D173E41C38")
    ("GetInvisibleEdge" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BD89B610-90E9-4144-A075-3D08516D82D3")
    ("GetIsCellStyleInUse" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2950D1C1-40DA-4F89-8294-A77B829A50FD")
    ("GetIsMergeAllEnabled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B6C11083-12A7-451C-9BFD-E9A463969024")
    ("GetKeyword" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A47393D4-9F92-4815-B1E1-1D36FB3BEEA2")
    ("GetLeaderIndex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-64610DA7-21B1-46E6-A5F4-EECD3B172A81")
    ("GetLeaderLineIndexes" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-588DD7FC-F822-4ABC-8935-48C0C27A4CF1")
    ("GetLeaderLineVertices" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6531A230-9CD7-49A6-BCA0-E3C9655210E7")
    ("GetLiveSection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5BB64D6B-CE4C-48EC-9802-B1112C54F024")
    ("GetLocaleMediaName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-12FAD463-6156-4EF9-A206-5AA71C7E445A")
    ("GetLoopAt" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-93E21F08-C55A-4D56-9A3B-DEADB29838C0")
    ("GetMargin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-825A9601-4166-4055-8147-0F4D51DDCB48")
    ("GetMinimumColumnWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CD47C5DD-9C0F-4569-BB32-1B2D0837F8EB")
    ("GetMinimumRowHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-730D9D42-A1A7-479A-A56E-2ECABF4EFB0D")
    ("GetName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-42828CC6-35D0-4129-B967-D50F36509ED6")
    ("GetObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D62C3A92-19AB-4E1A-9E20-9AF1C13AED81")
    ("GetObjectIdString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-608ABDA5-D489-4DC8-B13E-643AA782B696")
    ("GetOrientation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BA56C0C6-745D-4790-AF12-0366B6BAF061")
    ("GetOverride" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E447FF0D-9540-45DF-9B24-95C7D66F0A52")
    ("GetPaperMargins" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2CF57709-4DBE-4CBE-A4AF-45D90C8F8B54")
    ("GetPaperSize" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7B662353-85A5-486D-8673-B164DACA3676")
    ("GetPlotDeviceNames" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-67E9FB52-7725-4EA7-9666-C26B4D260D0A")
    ("GetPlotStyleTableNames" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D36B145F-2855-4CBB-9BF6-A0BA66BE8A36")
    ("GetPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5C8BA75E-5F87-479B-B167-3961F93E617E")
    ("GetReal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-32F140FF-B7F4-409C-ADAD-4C304A841A76")
    ("GetRelativeDrawOrder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1A7646E1-CEAE-4D67-8944-6329D796E056")
    ("GetRemoteFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-912C1C27-9FEA-4CB1-BE50-054603A31547")
    ("GetRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E3BCA98F-F9F6-4C7B-BAE1-89631412DFED")
    ("GetRowHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2676F3AD-B201-4D4D-B76A-7028F0B9530D")
    ("GetRowType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B1B8AE63-5887-4386-A1F6-7C72B32B5E98")
    ("GetScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2364905F-5369-4EB1-AE19-B27081A706F0")
    ("GetSectionTypeSettings" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3355B477-5FD0-494C-BB85-F3C7443F0A4E")
    ("GetSnapSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7938C315-7A3F-47EF-9B31-B78AC6A425D9")
    ("GetString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4C5A1510-D470-4918-B2DC-FAAB9712BC33")
    ("GetSubEntity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D00A264-378F-4496-9D54-90FC70C999A1")
    ("GetSubSelection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2118C290-39B7-460E-9B0E-527E3BCF894F")
    ("GetText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-049B05A2-A096-4729-A9CF-0A4BAFB1BAB7")
    ("GetTextHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-49AC8768-B650-4D1B-94E8-2F5F72F411C2")
    ("GetTextHeight2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C60CCD4E-A151-401F-AA6D-0A42AFA5E2BE")
    ("GetTextRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0975FF30-D82B-4494-9676-F231A0D89E02")
    ("GetTextString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16DC0D7E-708E-44B4-9A59-1BDEFCA76A3D")
    ("GetTextStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-84729374-0C8E-4A00-9A2F-7D9D83EA4887")
    ("GetTextStyle2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B9E39EC-8CEA-49EB-B56D-8CD6D5A55991")
    ("GetTextStyleId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FEDB229-A100-44DC-91E1-B498AAD2BF65")
    ("GetUCSMatrix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-85495614-C788-45C7-8E26-2BC8A2C3A490")
    ("GetUniqueCellStyleName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-056E26F8-2BFA-4064-9632-7DA0B619137E")
    ("GetUniqueSectionName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1CCFF645-BD4A-4868-9EFB-0DF08E0BADBB")
    ("GetValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F8978A2D-3A99-4E66-BDA3-D8D1E22DC161")
    ("GetVariable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2D00EF00-0579-4424-85C3-BEABB329CBAD")
    ("GetVertexCount" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B0E7A682-C022-4C87-AD56-6918FB04DBB5")
    ("GetWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5673C339-D392-45FB-A11E-03463BE8D6D4")
    ("GetWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-60D35D7B-9328-4FD2-A4AB-20EDB5991F6F")
    ("GetWindowToPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C2F875C1-C95A-4B6E-849A-79B03BCA4666")
    ("GetXData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-330FCA31-A2A9-47F0-972D-6915B6B98426")
    ("GetXRecordData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD8EA14F-4913-44F3-8BEE-C455C150CE4E")
    ("GetXdata" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-330FCA31-A2A9-47F0-972D-6915B6B98426")
    ("HandleToObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E03AFFD7-B473-45F9-9FF1-CE4D09C94CF3")
    ("Highlight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A923D53-9C04-48F1-AF3A-BAD27CECCABC")
    ("HitTest" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8812BEE2-BD9F-488D-BAA1-A38060FA4D86")
    ("Import" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5B441D77-BE99-454A-AAE3-9E19731B07D5")
    ("InitializeUserInput" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B03BCD05-F925-4FD2-B131-BD7DCF3FA06C")
    ("InsertBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-17F86FDD-B7FC-4F43-9F16-B4958F73A66D")
    ("InsertColumns" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8AEDD5DB-4446-4FA3-81FA-656B6B7004AD")
    ("InsertColumnsAndInherit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9856FC46-050D-4A52-8C49-1B42CB228C21")
    ("InsertLoopAt" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E35E3387-14E8-433D-B6A6-82E034A11BEE")
    ("InsertRows" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-423356D9-CAAA-45BA-B8B9-AD475594317C")
    ("InsertRowsAndInherit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CF92D20D-CED0-4F24-B33A-046B20AB7FE5")
    ("IntersectWith" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1243A593-5DAE-4DC3-B539-59FDA990E687")
    ("IsContentEditable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8A3938A3-A7CD-44A5-9A08-A047814F11CC")
    ("IsEmpty" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0D2C5D0A-D4B1-486D-8668-6E935E4DFE26")
    ("IsFormatEditable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E7FD60B2-0466-46C4-91D5-97BADE16C3CF")
    ("IsMergeAllEnabled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-766EFEC2-4551-40BA-A16E-50DC6C6DE298")
    ("IsMergedCell" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B6B07A3B-B173-412B-9272-0D93999EEE3B")
    ("IsRemoteFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-01CBB935-A8B2-40B0-B3EA-A1B1AC4B120B")
    ("IsURL" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-64056A56-779C-49BB-9352-77602E5FBCBD")
    ("Item" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A5B6ACC4-DCD8-4FE2-AB06-D3C3C349475B")
    ("LaunchBrowserDialog" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6591F0AE-50E0-4C73-A569-B7F33470C5E8")
    ("ListArx" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-26F0E044-CAE1-43F0-87FA-7CBF03024C50")
    ("Load" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D33266B-184F-4994-8B91-DF909F24C7F2")
    ("LoadArx" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-50BB2B5A-2DA9-4B7E-A9F0-B2D1FFE6047C")
    ("LoadDvb" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4F19B20D-BF8C-4505-A13A-4B6102778E24")
    ("LoadShapeFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0F90A5A6-8A73-437A-8C82-E8C12932968D")
    ("MergeCells" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-157634F8-7FC2-4802-9728-7451DA33DFD2")
    ("Mirror" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F89941D6-676B-43C0-8D92-9AFDAFB03780")
    ("Mirror3D" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0862213C-8E61-40EA-B182-3C7CE5D7A1EE")
    ("Move" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FF65DF24-D646-4DC2-894D-095E426DC2C1")
    ("MoveAbove" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-34DFB888-D55F-4C20-A306-291B154405E4")
    ("MoveBelow" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-45CA4C5D-5408-4EC9-98B8-18FE4DD8BC2B")
    ("MoveContent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-96C54E2B-9E8E-4CA2-97B0-5AAD243C08A8")
    ("MoveToBottom" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-95465F68-7498-48F1-9945-5E76F363FAD3")
    ("MoveToTop" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0FA80CF9-427C-40F1-A400-BFD4AE81EE99")
    ("New" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C8035300-FCBC-4633-8B55-B04A139F39EA")
    ("NumCustomInfo" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CB5EF468-20FB-479C-AB51-AA53B8259624")
    ("ObjectIDToObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8F70EF0-116B-41E8-B149-B104009FCF86")
    ("ObjectIdToObject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8F70EF0-116B-41E8-B149-B104009FCF86")
    ("Offset" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-50EF273A-7552-4D6B-8523-BB956334D08A")
    ("Open" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9ED7A548-7978-4BFD-8462-E2FA747E8880")
    ("PlotToDevice" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-55FEED17-E697-4CF3-B9C3-6ACCF060672F")
    ("PlotToFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-85A6B1AF-80AA-4F56-8305-6EFD4A4D8CF8")
    ("PolarPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D42DF63B-6156-4470-9163-61E08901EDA7")
    ("PostCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D3B8666-1B40-47C0-911B-859E3C38FB1A")
    ("Prompt" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BBD8159B-14AB-4FF9-9DF8-8126C28F08E0")
    ("PurgeAll" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FD38B4D-2554-419A-9A1F-916725A300F5")
    ("PurgeFitData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CFE86811-C486-44C6-87BE-759D6CE3D837")
    ("PutRemoteFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E50E449A-94CC-446E-832D-774796F8B1DD")
    ("Quit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E9E18EC6-6FE9-4ED9-9BAF-87FA62D42ECB")
    ("RealToString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9504E90-9AFD-420E-B95F-5E2B9EE72119")
    ("RecomputeTableBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5ED2334B-96E1-4CE9-9FD9-C5B02561717E")
    ("RefreshPlotDeviceInfo" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1E8879B2-E616-4436-9356-15D0D6A3F0E9")
    ("Regen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CCF21523-F711-4FA0-9D5B-4A3D3F61D37F")
    ("Reload" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FAE45D2-6FC4-4ABE-8F0A-87591D026C91")
    ("Remove" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FFD7B0D3-ACAE-4AAF-BC8D-C33AB2A6A523")
    ("RemoveAllOverrides" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C67F0543-90CC-44A9-936C-AB4CB30CEA55")
    ("RemoveCustomByIndex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D7E02E57-9523-4EAF-B3CC-C3689FCBF708")
    ("RemoveCustomByKey" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B828232C-2849-47E5-8D55-0E1B9F830456")
    ("RemoveItems" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4D363D03-14FA-4D58-928A-A6BA399CE762")
    ("RemoveLeader" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B5BEA743-8EF4-4F17-9541-E58CE3DADE9D")
    ("RemoveLeaderLine" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-406B94E3-9B38-4F52-B5BB-DE12E1BD4FEF")
    ("RemoveVertex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-70302CED-4321-4874-951D-C604EF073F2B")
    ("Rename" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9BE05E63-C0C0-4F36-81D6-AEF2A194A209")
    ("RenameCellStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A3A60F6E-1369-45F3-AF7C-A9240841310B")
    ("Replace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-87E2F10A-A62D-4CC9-A11C-2E6BDD39D480")
    ("ReselectSubRegion" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-86EEF224-A6FD-4BD4-9548-A0B7271F5E0D")
    ("ResetBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-09C1799B-0DE5-43DB-82DF-D12F645EE1F7")
    ("ResetCellValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-56701DBD-57F3-4A7F-8025-E1A9AFFD0E55")
    ("Reverse" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BAA9C80B-2191-4CF1-8F9D-84CC07398532")
    ("Rotate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A060558E-092C-403D-8A63-276BAB901F5C")
    ("Rotate3D" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1057C914-CB4F-43C9-841F-F80207D9398E")
    ("RunMacro" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-638E14CA-798C-42BC-8F2B-5E9D6952C707")
    ("Save" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DA24D47F-FB6C-4C0B-8DDB-87D0AD4455F0")
    ("SaveAs" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED0D0B02-25FC-4ED2-9DEE-2B0C9AA9416A")
    ("ScaleEntity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F5A968AB-47BC-4D86-A04D-5985FF217596")
    ("SectionSolid" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FB1253E1-770C-4685-8EE4-81D241F405D8")
    ("Select" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4CDE43DD-E3EF-4EF8-B377-4B9ED03E4C96")
    ("SelectAtPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E5B81EA6-308F-4F9E-9318-4A4B238092F0")
    ("SelectByPolygon" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8002585-5D08-45E2-AF6C-6E894FA3D463")
    ("SelectOnScreen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C4B442A3-D6A9-48FA-8C86-03D49A3B2ED7")
    ("SelectSubRegion" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-97DD5958-645A-4236-9674-D52A2B7E7A60")
    ("SendCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E13A580D-04CA-46C1-B807-95BB461A0A57")
    ("SendModelessOperationEnded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B7C60BF7-7C90-4AFA-B908-AAC468969E39")
    ("SendModelessOperationStart" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1C9B3704-7712-4E12-B722-372700F71A59")
    ("SetAlignment" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2B85EBC7-1D82-468A-A5B7-455423B686A2")
    ("SetAlignment2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B24A60E-C217-4349-BE68-96CCE30C8CD1")
    ("SetAutoScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DFC22763-C461-4C7A-9BC0-C685BBC2521D")
    ("SetAutoScale2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-28971E41-B8DD-4325-BF81-67A36243DAAA")
    ("SetBackgroundColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A380D73-5D5D-4E3C-9839-9DBC19BAD32C")
    ("SetBackgroundColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7842FBAB-416B-458A-BFFE-F2230F3E7799")
    ("SetBackgroundColorNone" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EC710A68-CADB-497A-BABE-BC28C36B9E39")
    ("SetBlockAttributeValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2E4C0EB7-B243-4F85-BF03-36F7CCE35AD5")
    ("SetBlockAttributeValue2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-973C2CEC-91F4-4800-9064-C40B46350A0B")
    ("SetBlockRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE86AFDB-DBFA-4193-BC03-B4E0ECAA9203")
    ("SetBlockScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B2B5C5F8-3CC0-4151-9451-3EF14A043820")
    ("SetBlockTableRecordId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8A78F69E-EACF-4985-B9E1-6DA662240AF0")
    ("SetBlockTableRecordId2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0C8D4634-B341-4B9F-972B-BED80F8423ED")
    ("SetBreakHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5E4EDEE0-7D8F-47CD-A706-9865022A0E03")
    ("SetBulge" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1CE125E-AB3A-4645-B548-E43200064F9C")
    ("SetCellAlignment" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C1C4ADB2-2A8B-4817-8082-86D5BC770C05")
    ("SetCellBackgroundColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-774201E4-7039-4048-9D81-7F5DE712E729")
    ("SetCellBackgroundColorNone" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-03A78369-89B0-4CED-A40D-B6ABBB53BC39")
    ("SetCellClass" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FACB1E29-D68A-4F9C-8CB9-919C4A0457BE")
    ("SetCellContentColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8CBFFDC7-1166-4D78-BCF0-A3984D6BB397")
    ("SetCellDataType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C04C84AC-8F60-40AA-A9EF-703F335743F9")
    ("SetCellFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3E04BE12-84D3-4B37-8106-660504B47005")
    ("SetCellGridColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-71651B75-0942-4461-8D2B-755FE1333D58")
    ("SetCellGridLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-84954C42-12E8-4729-8276-2B3B77AB24B2")
    ("SetCellGridVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1ED6B6E-44E2-4CEE-8EDB-1B2D508F332D")
    ("SetCellState" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8CEDCFC-16DC-49A5-8064-65A6791357A1")
    ("SetCellStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2E9EE0DD-31AB-41BC-8ABF-B3ECB549E657")
    ("SetCellTextHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4B0FC445-DBBF-473C-86A2-BEC7DB6A4453")
    ("SetCellTextStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1450A92-374D-4E8C-8500-22344A872DAE")
    ("SetCellType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8928075F-8D48-4F8B-96F3-D359866D535D")
    ("SetCellValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7E44F906-3BD5-4EA7-A828-067DF359F052")
    ("SetCellValueFromText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4E1FAAFC-2F06-4C52-8268-451CA509AD38")
    ("SetColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-095F270A-0770-4886-AB4D-1AE8034B951F")
    ("SetColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D91707BD-B3E5-4C49-8783-14B1A5F3B1A9")
    ("SetColorBookColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4533286A-E4E8-4159-992C-10C2E69C4323")
    ("SetColumnName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F5FE13EE-A3B7-46B1-A119-401756F54230")
    ("SetColumnWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F9800295-53CB-4D8E-B786-DBA53A526DE1")
    ("SetContentColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C3151A2C-D4C7-4E69-825E-EA639CD80FF6")
    ("SetContentColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-950432DC-8ACE-4271-AAAC-0158CA43EC63")
    ("SetContentLayout" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-74844F83-B4A3-4621-8635-C20B8941894C")
    ("SetControlPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D0C7C665-6580-4AF0-977D-D6BC8F93F1E4")
    ("SetCustomByIndex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CE27EC98-F315-45D6-A870-C92562818A9C")
    ("SetCustomByKey" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CAF6F231-995C-4DD2-96F7-91F6649E6DDB")
    ("SetCustomData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5BB29807-967F-4E22-BE84-F267DE481F98")
    ("SetCustomScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CAFE8D48-E120-428A-B592-0DFE06BAF780")
    ("SetDataFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5EA7A591-5730-4266-BB92-5E11F37384B7")
    ("SetDataType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B5AFE3DE-47CF-481E-9729-F5E15341BAF5")
    ("SetDataType2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CAA10251-B8AA-43F2-85DB-80B4E143F40F")
    ("SetDoglegDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-32B570AC-541B-49F5-B3AF-5FAF041EE039")
    ("SetFieldId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DF211B7B-9655-4F83-8504-608B881CA6A7")
    ("SetFieldId2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F2235B65-73E4-477A-9330-0E68818BEB4F")
    ("SetFitPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DBB4B09C-24B0-4BB8-B96B-C59C1D06E9E4")
    ("SetFont" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DB668114-2395-43C6-858C-2F2514C4BF46")
    ("SetFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8E47DFF2-20F2-4628-8AEB-7E6126C2A7D1")
    ("SetFormat2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3A9A5F67-09A1-4244-A371-3D02EFD5590A")
    ("SetFormula" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2745BD48-A555-46DB-BE81-19D3DDCAD4F2")
    ("SetGridColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DF80B4AB-0481-4702-967F-021B4F59AD9F")
    ("SetGridColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1B6202B-C9A7-49F5-B103-110FB13ED9EB")
    ("SetGridDoubleLineSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16ED01F1-71CB-4E9F-AD65-735F3F8B0F1E")
    ("SetGridLineStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6A975E03-D5EA-4095-859E-F30D2789D452")
    ("SetGridLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8F8C7FF3-FA86-4323-99C1-7E7FE4B5204E")
    ("SetGridLineWeight2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-20F135D4-D2B3-4F48-9F18-83CFB1652E6F")
    ("SetGridLinetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B188FEA0-38C8-42F5-8819-E7F2A8A0CE41")
    ("SetGridSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D3E8938D-1329-44ED-9DA1-C9BFE3D8A943")
    ("SetGridVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-45C12586-73F3-4EDD-A15B-8850B8F50A8F")
    ("SetGridVisibility2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D98D6045-331E-4182-8863-99EC90803FA2")
    ("SetInvisibleEdge" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A14EDA04-5E4C-4E75-B2E2-0534B093DBF7")
    ("SetLayoutsToPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-514B4377-CFE5-403F-87A7-B0D3AB16CC66")
    ("SetLeaderLineVertices" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4783B9A9-0DA9-4DC5-ADDC-36BF0C58CB3F")
    ("SetMargin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-180D2C78-B661-439A-8891-73849F40D47B")
    ("SetNames" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-150F7E76-DB8B-4F60-9F22-D9E6DDA89787")
    ("SetOverride" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E06C9DDE-DBCD-4EBA-AF90-F98BEDC8CA62")
    ("SetPattern" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A69D499D-9E36-4ABB-8956-8A9F6DB24CA7")
    ("SetRGB" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1FD95F7C-0EBD-4841-9BE8-7C1EC210548D")
    ("SetRelativeDrawOrder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AD2CA392-D4B5-4F0D-AE0B-3A376B396D31")
    ("SetRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A696EE85-F867-4057-A7CF-26371673C51C")
    ("SetRowHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-40A786BA-74CA-423D-8664-9002DC8E11EB")
    ("SetScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FBE37B26-6EE8-4563-9ECE-D8ECDC68D057")
    ("SetSnapSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-848B2A85-8ADC-4F06-B7A9-D6BF2771BB80")
    ("SetSubSelection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-46A865DE-70B9-4E93-A371-B2CEB39B59A1")
    ("SetTemplateId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-493DE9D7-9487-4C77-B3C1-6B4694AB68C5")
    ("SetText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-74DEEE3D-10F5-4D0A-85D2-67899C8B20E2")
    ("SetTextHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35CC52D6-03C1-48EE-90A3-97DFBBAC33C3")
    ("SetTextHeight2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C8351305-95A6-4C79-A4E8-783E10909906")
    ("SetTextRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A743BBD-C563-45BB-82E3-05DCCAF28F95")
    ("SetTextString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C5887D04-EB95-4311-A44F-D7046C3085E9")
    ("SetTextStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F1D29F15-74F8-42B3-865C-5EEC4226DDFB")
    ("SetTextStyle2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AC968206-3BA0-473D-9978-842E327BBC24")
    ("SetTextStyleId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-97D4C2BB-F2B9-435B-9B88-BFA5A06D9C6D")
    ("SetToolTip" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37B2DA0D-9165-4FAF-B421-AF00FF6383D8")
    ("SetValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B490C108-68DD-4B82-8131-5C601382D22E")
    ("SetValueFromText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-22CE26B7-0E10-4AF8-8AF5-20360C543F0F")
    ("SetVariable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3E2009E4-2356-49D4-92DD-D16CAED65A4C")
    ("SetView" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A56246A7-65B5-4B62-9AF4-BD2FDC27FF1C")
    ("SetWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-18F9FF5A-09B9-4F64-99C5-2049084D9CC5")
    ("SetWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED45F9D1-AE03-4DF0-9F2D-2019BD42CD52")
    ("SetWindowToPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9F4784EE-3203-4C7C-A27E-720B25BB1BD9")
    ("SetXData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF0393EC-8446-4989-8C72-F3AE49D81176")
    ("SetXRecordData" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8426BA72-1852-40BC-84D4-F63F49A0DE74")
    ("SetXdata" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF0393EC-8446-4989-8C72-F3AE49D81176")
    ("SliceSolid" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-52ABF745-C98C-4315-9871-4247D048E3A5")
    ("Split" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4073402E-1833-4B36-A169-2128E17DEDAE")
    ("StartBatchMode" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F7E34A70-53AF-45CF-85D4-1328DBE506CD")
    ("StartUndoMark" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C669949-1327-4CFD-96CF-CE65EC38DAA8")
    ("SwapObjects" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-422CB04D-A597-472F-B13B-72498DB8ECA3")
    ("SyncModelView" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DED73F90-4A4A-4241-811C-691B5FE8FA1A")
    ("TransformBy" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2FAE4C13-06F2-47A2-B213-8A9A6958B799")
    ("TranslateCoordinates" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9B897CC9-2AE8-4411-BDA9-E337CBFACF8B")
    ("Unload" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2CFEFDD7-11E3-491B-8CCD-91F8893AE765")
    ("UnloadArx" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1D232F28-917F-4148-89D4-2FCB42489970")
    ("UnloadDvb" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A8AB63D9-AA04-4D51-BAA9-F78DD4C73A32")
    ("UnmergeCells" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-61535978-8788-46E1-85D8-55CB7B824CEA")
    ("Update" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-021BAA1C-9374-442E-801B-CB4CC93D533F")
    ("UpdateMTextAttribute" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-73942896-D842-4ED6-B205-39D3CA9E4076")
    ("WBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4EEC4025-ACFC-41DA-899A-8264394D7691")
    ("ZoomAll" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-30F0CB4F-A228-4FF3-B6BA-6F351E6CD0ED")
    ("ZoomCenter" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16BDEA18-4555-4EA7-A426-9A9E5683AC9B")
    ("ZoomExtents" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B204BFAA-B774-4C87-86D8-37007F390B5A")
    ("ZoomPickWindow" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-03C9B151-E828-4F2A-84C5-C935B1E8B81F")
    ("ZoomPrevious" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EFF48BA7-6990-426B-A95D-95E0F5691254")
    ("ZoomScaled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E916D642-DBCE-4186-8574-7B8D002BB7E1")
    ("ZoomWindow" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-179C3EF0-4F3F-4555-AD74-3489A21FA035")
    ))
