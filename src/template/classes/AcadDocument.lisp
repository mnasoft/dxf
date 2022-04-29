(in-package :dxf/classes)

((:defclass "AcadDocument")
  (:parents "AcadDatabase")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9216BFCD-D358-4FC6-B631-B52E6693D242\"](Document Object (ActiveX))")
  (:methods
   "Activate AuditInfo Close CopyObjects EndUndoMark Export
   GetVariable HandleToObject Import LoadShapeFile New
   ObjectIDToObject Open PostCommand PurgeAll Regen Save SaveAs
   SendCommand SetVariable StartUndoMark WBlock")
  (:properties
   "Active ActiveDimStyle ActiveLayer ActiveLayout ActiveLinetype
   ActiveMaterial ActivePViewport ActiveSelectionSet ActiveSpace
   ActiveTextStyle ActiveUCS ActiveViewport Application Blocks
   Database Dictionaries DimStyles ElevationModelSpace
   ElevationPaperSpace FullName Groups Height HWND Layers Layouts
   Limits Linetypes Materials ModelSpace MSpace Name ObjectSnapMode
   PaperSpace Path PickfirstSelectionSet Plot PlotConfigurations
   Preferences ReadOnly RegisteredApplications Saved SectionManager
   SelectionSets SummaryInfo TextStyles UserCoordinateSystems Utility
   Viewports Views Width WindowState WindowTitle")
  (:events
   "Activate BeginClose BeginCommand BeginDocClose BeginDoubleClick
   BeginLisp BeginPlot BeginRightClick BeginSave
   BeginShortcutMenuCommand BeginShortcutMenuDefault
   BeginShortcutMenuEdit BeginShortcutMenuGrip BeginShortcutMenuOSnap
   Deactivate EndCommand EndLisp EndPlot EndSave EndShortcutMenu
   LayoutSwitched LispCancelled ObjectAdded ObjectErased
   ObjectModified SelectionChanged WindowChanged
   WindowMovedOrResized"))
