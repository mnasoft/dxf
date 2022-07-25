((:defclass "AcadApplication")
   (:parents "Object")
   (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0225808C-8C91-407B-990C-15AB966FFFA8\"](Application Object (ActiveX))")
   (:methods
    "Eval GetAcadState GetInterfaceObject ListArx LoadArx LoadDvb Quit
   RunMacro UnloadArx UnloadDvb Update ZoomAll ZoomCenter ZoomExtents
   ZoomPickWindow ZoomPrevious ZoomScaled ZoomWindow")
   (:properties
    "ActiveDocument Application Caption Documents FullName Height HWND
   LocaleID MenuBar MenuGroups Name Path Preferences StatusID VBE
   Version Visible Width WindowLeft WindowState WindowTop")
   (:events
    "AppActivate AppDeactivate ArxLoaded ArxUnloaded BeginCommand
   BeginFileDrop BeginLisp BeginModal BeginOpen BeginPlot BeginQuit
   BeginSave EndCommand EndLisp EndModal EndOpen EndPlot EndSave
   LispCancelled NewDrawing SysVarChanged WindowChanged
   WindowMovedOrResized"))
