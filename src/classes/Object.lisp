(defpackage :dxf/classes
  (:use #:cl)
  (:export <object>))

(in-package :dxf/classes)

(defclass <object> ()
  ()
  (:documentation "Базовый класс."))

(defparameter *active-x-class-names*
  '(("Acad3DFace" "<acad-3dface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DAB32FC-8C8A-4116-BD3A-CF733740DF8F\"](3DFace Object (ActiveX))"))
    ("Acad3DPolyline" "<acad-3dpolyline>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35D9E28C-38A8-477A-AFCE-F21952092190\"](Polyline Object (ActiveX))"))
    ("Acad3DSolid" "<acad-3dsolid>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4EC0355F-A91B-4ADA-A346-05CCCD22259B\"](3DSolid Object (ActiveX))"))
    ("AcadAcCmColor" "<acad-ac-cm-color>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D24C6BB5-5F87-42E7-907F-F27226B330E3\"](AcCmColor Object (ActiveX))"))
    ("AcadApplication" "<acad-application>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0225808C-8C91-407B-990C-15AB966FFFA8\"](Application Object (ActiveX))"))
    ("AcadArc" "<acad-arc>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3D31C05F-BFF7-41E3-8ACE-0F807731C913\"](Arc Object (ActiveX))"))
    ("AcadAttribute" "<acad-attribute>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E24E7CA0-0120-4C55-BADB-46D701B8D4CB\"](Attribute Object (ActiveX))"))
    ("AcadAttributeReference" "<acad-attribute-reference>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0630EFF2-51A2-46E4-A5A1-0377FB7E38E8\"](AttributeReference Object (ActiveX))"))
    ("AcadBlock" "<acad-block>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E6F7B03B-F5CC-4A18-9C48-BBF1D32A31FD\"](Block Object (ActiveX))"))
    ("AcadBlockReference" "<acad-block-reference>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-88EEBCA3-8AF5-4776-9D54-520B05AB9129\"](BlockReference Object (ActiveX))"))
    ("AcadBlocks" "<acad-blocks>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E77CC5AD-74B8-472C-8270-32FD162D5653\"](Blocks Collection (ActiveX))"))
    ("AcadCircle" "<acad-circle>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-18ADF171-166F-4FF0-8ED6-5F83153A5649\"](Circle Object (ActiveX))"))
    ("AcadComparedReference" "<acad-compared-reference>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DEB63F31-D8E9-41E3-B35B-12D832F5BF16\"](ComparedReference Object (ActiveX))"))
    ("AcadDatabase" "<acad-database>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31D8D654-572D-4D2B-A138-4D8793ECE135\"](Database Object (ActiveX))"))
    ("AcadDatabasePreferences" "<acad-database-preferences>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B03F622D-9D1D-4149-A170-1DF2AC62DA37\"](DatabasePreferences Object (ActiveX))"))
    ("AcadDgnUnderlay" "<acad-dgn-underlay>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-70DBB31B-E1D1-4D8C-928C-B274E0D63E66\"](DgnUnderlay Object (ActiveX))"))
    ("AcadDictionaries" "<acad-dictionaries>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5E577FF6-F939-4798-9700-3A3278EA84F4\"](Dictionaries Property (ActiveX))"))
    ("AcadDictionary" "<acad-dictionary>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FF18AA0-4E48-4F92-AC0D-FBBD4225D347\"](Dictionary Object (ActiveX))"))
    ("AcadDim3PointAngular" "<acad-dim-3point-angular>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1EF38BC6-8057-4F4A-95BC-0624544A248F\"](Dim3PointAngular Object (ActiveX))"))
    ("AcadDimAligned" "<acad-dim-aligned>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-38EB1E39-B67A-4B90-A394-5C3FA260F9F3\"](DimAligned Object (ActiveX))"))
    ("AcadDimAngular" "<acad-dim-angular>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C832CDC5-59AA-466F-B4BA-EFC133834A1E\"](DimAngular Object (ActiveX))"))
    ("AcadDimArcLength" "<acad-dim-arc-length>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BAB6D518-BE01-494A-A8AC-8645A99369CE\"](DimArcLength Object (ActiveX))"))
    ("AcadDimDiametric" "<acad-dim-diametric>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-181A4644-B053-49D6-BB3C-35158B8794C3\"](DimDiametric Object (ActiveX))"))
    ("AcadDimOrdinate" "<acad-dim-ordinate>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35CE0F15-A136-4878-AEDC-FADC193E7ED2\"](DimOrdinate Object (ActiveX))"))
    ("AcadDimRadial" "<acad-dim-radial>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-037CC1EC-8183-49B3-9F51-69AE8B282CC4\"](DimRadial Object (ActiveX))"))
    ("AcadDimRadialLarge" "<acad-dim-radial-large>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E44150ED-D643-4BC5-AD6B-E4724A109DA5\"](DimRadialLarge Object (ActiveX))"))
    ("AcadDimRotated" "<acad-dim-rotated>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-93D19CB2-9A1F-4324-BD49-D241FD009C3C\"](DimRotated Object (ActiveX))"))
    ("AcadDimStyle" "<acad-dim-style>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3227408C-75A9-434C-BD3F-B189A2BE098A\"](DimStyle Object (ActiveX))"))
    ("AcadDimStyles" "<acad-dim-styles>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-46478963-D723-44E1-92F2-3E28384E64EA\"](DimStyles Collection (ActiveX))"))
    ("AcadDocument" "<acad-document>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9216BFCD-D358-4FC6-B631-B52E6693D242\"](Document Object (ActiveX))"))
    ("AcadDocuments" "<acad-documents>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2C8C8291-16C9-4A9F-8399-58D5DE4B9589\"](Documents Collection (ActiveX))"))
    ("AcadDwfUnderlay" "<acad-dwf-underlay>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1205069A-A64A-4E21-9B9A-3EAF58F2EF26\"](DwfUnderlay Object (ActiveX))"))
    ("AcadDynamicBlockReferenceProperty" "<acad-dynamic-block-reference-property>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED753239-0C53-4741-BE13-99B21751C22F\"](DynamicBlockReferenceProperty Object (ActiveX))"))
    ("AcadEllipse" "<acad-ellipse>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-85D3077C-DAE6-4BB7-BB69-E8A8BD10FEA5\"](Ellipse Object (ActiveX))"))
    ("AcadEntity" "<acad-entity>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCA7867D-E354-4F48-9C47-DB22C53A3460\"](IAcadEntity Interface (ActiveX))"))
    ("AcadExternalReference" "<acad-external-reference>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-63129986-F84E-4674-8C90-EC1E0E627845\"](ExternalReference Object (ActiveX))"))
    ("AcadExtrudedSurface" "<acad-extruded-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-03E55664-0EBE-4EF5-A51C-B0806FA5DC3C\"](ExtrudedSurface Object (ActiveX))"))
    ("AcadGeomapImage" "<acad-geomap-image>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-97E4C257-86DC-4B0A-BE49-8EDC5864AABD\"](GeomapImage Object (ActiveX))"))
    ("AcadGeoPositionMarker" "<acad-geo-position-marker>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B60A60C8-C016-4E5D-8C91-628A2E116A4C\"](GeoPositionMarker Object (ActiveX))"))
    ("AcadGroup" "<acad-group>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1CA2C9D1-F8F7-4C11-B361-2998C4869119\"](Group Object (ActiveX))"))
    ("AcadGroups" "<acad-groups>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B6B9B72E-31BC-41E0-B06B-17B1EE33FFB0\"](Groups Collection (ActiveX))"))
    ("AcadHatch" "<acad-hatch>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-92A2B30F-1B74-4894-850A-5505F3B5944B\"](Hatch Object (ActiveX))"))
    ("AcadHelix" "<acad-helix>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A8B144D8-EFC1-4D2D-B6F8-73C541906646\"](Helix Object (ActiveX))"))
    ("AcadLayer" "<acad-layer>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14F28A52-81E5-4CD0-AA79-ADC09E91BB8C\"](Layer Object (ActiveX))"))
    ("AcadLayers" "<acad-layers>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9F62B4B-401E-4AE6-969F-3F7756819EB6\"](Layers Collection (ActiveX))"))
    ("AcadLayout" "<acad-layout>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EFC848F1-26BE-4EFA-BC0E-11F874D73842\"](Layout Object (ActiveX))"))
    ("AcadLayouts" "<acad-layouts>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0C5AF331-03C4-472B-BD30-78C8310822A2\"](Layouts Collection (ActiveX))"))
    ("AcadLeader" "<acad-leader>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1EC4A71-6FC0-4B76-AD53-4DE561D6EE46\"](Leader Object (ActiveX))"))
    ("AcadLinetype" "<acad-linetype>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16016CA5-0126-403B-844B-F6CABE117B50\"](Linetype Object (ActiveX))"))
    ("AcadLineTypes" "<acad-line-types>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-968A3D1F-8DEF-4B8B-8067-0B756A622D97\"](Linetypes Collection (ActiveX))"))
    ("AcadLoftedSurface" "<acad-lofted-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D56F5C92-731E-4FA3-9FAE-82E97E388901\"](LoftedSurface Object (ActiveX))"))
    ("AcadLWPolyline" "<acad-lwpolyline>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5A604B98-B6DE-42C3-97D9-98B8CAEBB507\"](LWPolyline Object (ActiveX))"))
    ("AcadMaterial" "<acad-material>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7E5AA1A-D3C3-4AA3-A751-97768628D96C\"](Material Object (ActiveX))"))
    ("AcadMaterials" "<acad-materials>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4BC04C70-B2B0-4325-8042-CAD81F9058F1\"](Materials Collection (ActiveX))"))
    ("AcadMInsertBlock" "<acad-minsert-block>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0F4669CB-6769-4F40-A24F-7658FBD41518\"](MInsertBlock Object (ActiveX))"))
    ("AcadMLeader" "<acad-mleader>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-95FD33C2-DF78-4014-933C-9AC124E6A35D\"](MLeader Object (ActiveX))"))
    ("AcadMLeaderStyle" "<acad-mleader-style>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14AC2D0B-EBFC-44B9-982D-9112539F8DE8\"](MLeaderStyle Object (ActiveX))"))
    ("AcadMLine" "<acad-mline>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D91098F2-83AB-41A7-B9F8-929871B438FC\"](MLine Object (ActiveX))"))
    ("AcadModelSpace" "<acad-model-space>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C541B6F2-1279-4D1C-8DC0-788F27F644EF\"](ModelSpace Collection (ActiveX))"))
    ("AcadMtext" "<acad-mtext>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2532B20E-413D-4F59-9E88-B40E8AABB9FF\"](MText Object (ActiveX))"))
    ("AcadNurbSurface" "<acad-nurb-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5F16F644-F61B-45AC-BB3D-AF8221336072\"](NurbSurface Object (ActiveX))"))
    ("AcadObject" "<acad-object>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1C457D0A-9933-4A74-B3E9-A7F3483B3F34\"](IAcadObject Interface (ActiveX))"))
    ("AcadOle" "<acad-ole>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F22B8915-FE51-4650-A738-95C81019064E\"](OLE Object (ActiveX))"))
    ("AcadPaperSpace" "<acad-paper-space>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C5E998B5-6EB1-459A-98B1-444C74DB4516\"](PaperSpace Collection (ActiveX))"))
    ("AcadPdfUnderlay" "<acad-pdf-underlay>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-54DEC47A-5FBB-4E9F-B206-502785568E91\"](PdfUnderlay Object (ActiveX))"))
    ("AcadPlaneSurface" "<acad-plane-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8979D4B7-F581-4623-B66F-1FC24BA2CDC3\"](PlaneSurface Object (ActiveX))"))
    ("AcadPlot" "<acad-plot>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A01876A-13D5-4938-8BEE-7712FD7C12CF\"](Plot Object (ActiveX))"))
    ("AcadPlotConfiguration" "<acad-plot-configuration>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AF404266-C40A-4FB4-B4E0-1D1C83052B6D\"](PlotConfiguration Object (ActiveX))"))
    ("AcadPlotConfigurations" "<acad-plot-configurations>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7337ECFB-B538-4C5D-AB7F-BD3C2F255B81\"](PlotConfigurations Collection (ActiveX))"))
    ("AcadPoint" "<acad-point>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B7F38E33-911A-4285-BCFC-EFB5F8EE260D\"](Point Object (ActiveX))"))
    ("AcadPointCloud" "<acad-point-cloud>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5142F98A-F959-4107-AF76-28813152F04C\"](PointCloud Object (ActiveX))"))
    ("AcadPointCloudEx" "<acad-point-cloud-ex>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9EC2395E-F5CC-4272-B535-3D0C905B8C71\"](PointCloudEx Object (ActiveX))"))
    ("AcadPolyfaceMesh" "<acad-polyface-mesh>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-679AA72F-7A2F-468D-A2D5-E3F28425C35A\"](PolyfaceMesh Object (ActiveX))"))
    ("AcadPolyline" "<acad-polyline>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35D9E28C-38A8-477A-AFCE-F21952092190\"](Polyline Object (ActiveX))"))
    ("AcadPViewport" "<acad-pviewport>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-63DF4686-8A79-4A39-8247-4A3565F31FAA\"](PViewport object (ActiveX))"))
    ("AcadRasterImage" "<acad-raster-image>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3613CF3F-EFC6-4E20-B875-D66B0494B94F\"](RasterImage Object (ActiveX))"))
    ("AcadRay" "<acad-ray>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-365768B5-3A4E-4340-AA17-8FCA291BA87C\"](Ray Object (ActiveX))"))
    ("AcadRegion" "<acad-region>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DFE47717-F7AF-443B-AD78-4E0BB60121C7\"](Region object (ActiveX))"))
    ("AcadRegisteredApplication" "<acad-registered-application>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-62AD8980-F707-4906-8640-B3C54E9FC3F4\"](RegisteredApplication Object (ActiveX))"))
    ("AcadRegisteredApplications" "<acad-registered-applications>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-606BE79B-6E2C-4BAB-BFF7-F54B7167F96C\"](RegisteredApplications Collection (ActiveX))"))
    ("AcadRevolvedSurface" "<acad-revolved-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD54DF69-8424-488B-BD7B-7642AD1D379F\"](RevolvedSurface Object (ActiveX))"))
    ("AcadSection" "<acad-section>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5242921B-1A1B-47DF-B9B7-2932DB5227AA\"](Section Object (ActiveX))"))
    ("AcadSectionManager" "<acad-section-manager>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A64E22B8-26B4-4D5F-89C7-C8E077F86BEC\"](SectionManager Object (ActiveX))"))
    ("AcadSectionSettings" "<acad-section-settings>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-72C22774-0C07-4B54-8760-65ADCFC228DD\"](SectionSettings object (ActiveX))"))
    ("AcadSelectionSet" "<acad-selection-set>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BF264239-CF7D-4BC8-8D37-69477862DB5A\"](SelectionSet Object (ActiveX))"))
    ("AcadSelectionSets" "<acad-selection-sets>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5B8DDC53-D4CD-4121-B58D-66B48D343A24\"](SelectionSets Collection (ActiveX))"))
    ("AcadShape" "<acad-shape>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14883954-9C4B-4B8F-AC0C-4B44940B5932\"](Shape Object (ActiveX))"))
    ("AcadSolid" "<acad-solid>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B207FF4-E441-4B3B-A677-BD5FE8CC479D\"](Solid Object (ActiveX))"))
    ("AcadSortentsTable" "<acad-sortents-table>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-258B72FF-B29A-45D2-B972-B1776D9112A7\"](SortentsTable Object (ActiveX))"))
    ("AcadSpline" "<acad-spline>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B8FC11E4-3F6B-40CE-8AEC-D4CF669086A3\"](Spline Object (ActiveX))"))
    ("AcadSummaryInfo" "<acad-summary-info>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A029FB49-B0DB-43E4-8888-698E1BF49878\"](SummaryInfo Object (ActiveX))"))
    ("AcadSurface" "<acad-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-98BC3DD3-F913-494C-8559-EAFA0DDEFE3E\"](Surface Object (ActiveX))"))
    ("AcadSweptSurface" "<acad-swept-surface>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2E70AE24-0C8F-4124-84F2-F20A94EA6AF2\"](SweptSurface Object (ActiveX))"))
    ("AcadTable" "<acad-table>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7B82400C-53D0-4D1A-94FA-66BB3040F0AA\"](Table Object (ActiveX))"))
    ("AcadTableStyle" "<acad-table-style>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-409A6709-D3D9-4D7D-AC60-163444D58FBA\"](TableStyle Object (ActiveX))"))
    ("AcadText" "<acad-text>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED298AC7-19E0-4E54-8983-48439EF70116\"](Text Object (ActiveX))"))
    ("AcadTextStyle" "<acad-text-style>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0531335D-26F3-404B-A4E1-1DE70BF0A307\"](TextStyle Object (ActiveX))"))
    ("AcadTextStyles" "<acad-text-styles>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-22FC4F30-F03C-4D9C-83DE-FEAEB7135D7F\"](TextStyles Collection (ActiveX))"))
    ("AcadTolerance" "<acad-tolerance>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-89AF1685-5ACA-44F2-B741-D4C957C887F0\"](Tolerance Object (ActiveX))"))
    ("AcadTrace" "<acad-trace>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7113C9E5-6875-4ABB-A4DC-68F6C09C4D7D\"](Trace Object (ActiveX))"))
    ("AcadUCS" "<acad-ucs>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-42778889-C568-4ABF-9CFA-63CC0D781794\"](UCS Object (ActiveX))"))
    ("AcadUCSs" "<acad-ucss>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C7B1383E-9E7B-46AD-B821-0906421194E5\"](UCSs Collection (ActiveX))"))
    ("AcadUtility" "<acad-utility>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE118C17-4567-48CF-8EFA-CABB52A27275\"](Utility Object (ActiveX))"))
    ("AcadView" "<acad-view>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B9C7D36-0905-4C20-84C5-53714379B811\"](View Object (ActiveX))"))
    ("AcadViewport" "<acad-viewport>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2B609059-6B70-4C66-A442-F5917363462A\"](Viewport Object (ActiveX))"))
    ("AcadViewports" "<acad-viewports>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5C011DBD-1D92-4DF6-B0D5-9C12CD913273\"](Viewports Collection (ActiveX))"))
    ("AcadViews" "<acad-views>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-786FCD2B-E5F8-4BFA-B69F-F871AF4503CA\"](Views Collection (ActiveX))"))
    ("AcadWipeout" "<acad-wipeout>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C978B807-6636-4DE4-AC63-7ACFF232B9EB\"](Wipeout Object (ActiveX))"))
    ("AcadXline" "<acad-xline>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A223EA11-306F-4685-AE56-72DC8D21CB46\"](XLine Object (ActiveX))"))
    ("AcadXRecord" "<acad-xrecord>"
     (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AF9C01F7-5BD9-4AF8-AB63-F58A997A5258\"](XRecord Object (ActiveX))"))
    ("Object" "<object>"
     (:documentation "Базовый класс."))))

(defparameter *object-properties* nil)

(loop :for i :in *active-x-class-names* :collect
      (list i (make-class-name i)))

(find-class '<object>)

(find-class (read-from-string "<Object>"))
