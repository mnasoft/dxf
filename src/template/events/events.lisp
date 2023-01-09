("ArxLoaded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-726449E4-E027-4260-BD6F-1C0D4E27D065"
             "
ARXLoaded Event (ActiveX)
Triggered when an ObjectARX application has been loaded.
Supported platforms: Windows only
Signature
VBA:
object.ARXLoaded(FullPathName)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
FullPathName
    Type: String
    The full path and file name of the ObjectARX application that has been loaded.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example initializes the public variable (ACADApp), which will be used
    ' to intercept AcadApplication Events.
    '
    ' The VBA WithEvents statement makes it possible to intercept a generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we get it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_ARXLoaded(ByVal AppName As String)
    ' This example intercepts an Application ARXLoaded event.
    ' This event is triggered when AutoCAD loads an ObjectARX application.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Load an ARX application into AutoCAD.
    ' Use the \"AppName\" variable to notify the user which ARX application was loaded
      MsgBox \"AutoCAD just loaded the ARX application: \" & AppName
End Sub
Visual LISP:
Not available
")
("ArxUnloaded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B30E5068-B18A-4179-B253-23FD4CC01894"
               "
ARXUnloaded Event (ActiveX)
Triggered when an ObjectARX application has been unloaded.
Supported platforms: Windows only
Signature
VBA:
object.ARXUnloaded(FullPathName)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
FullPathName
    Type: String
    The full path and file name of the ObjectARX application that has been unloaded.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_ARXUnloaded(ByVal AppName As String)
    ' This example intercepts an Application ARXUnloaded event.
    '
    ' This event is triggered when the AutoCAD unloads an ARX application
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Unload an ARX application that is already loaded into AutoCAD
    ' Use the \"AppName\" variable to notify the user which ARX application was unloaded
      MsgBox \"AutoCAD just unloaded the ARX application: \" & AppName
End Sub
Visual LISP:
Not available
")
("Activate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-65F892D6-C81F-4CD3-A6F3-A77E65B62309"
            "
Activate Event (ActiveX)
Triggered when a document window is activated.
Supported platforms: Windows only
Signature
VBA:
object.Activate()
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_Activate()
    ' This example intercepts a drawing Activate event.
    '
    ' This event is triggered when a drawing window becomes active.
    '
    ' To trigger this example event: Either open a new drawing or switch from
    ' one drawing window to another
    MsgBox \"You have just activated a drawing!\"
End Sub
Visual LISP:
Not available
")
("AppActivate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FA52F3C0-FE4E-4F35-A6AE-C2BAA1912031"
               "
AppActivate Event (ActiveX)
Triggered just before the main application window is activated.
Supported platforms: Windows only
Signature
VBA:
object.AppActivate()
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example initializes the public variable (ACADApp), which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept a generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will need to run this procedure.
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we get it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_AppActivate()
    ' This example intercepts an Application AppActivate event.
    '
    ' This event is triggered when the AutoCAD application receives focus
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Switch focus from AutoCAD to another Windows application
    '     and then back again.
      MsgBox \"AutoCAD was just activated!\"
End Sub
Visual LISP:
Not available
")
("AppDeactivate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EC60EA71-090D-4D96-B951-9465D877F97F"
                 "
AppDeactivate Event (ActiveX)
Triggered just before the main application window is deactivated.
Supported platforms: Windows only
Signature
VBA:
object.AppDeactivate()
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example initializes the public variable (ACADApp), which will be used
    ' to intercept AcadApplication Events.
    '
    ' The VBA WithEvents statement makes it possible to intercept a generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we get it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_AppDeactivate()
    ' This example intercepts an Application AppDeactivate event.
    '
    ' This event is triggered when the AutoCAD application loses focus
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Switch focus from AutoCAD to another Windows application.
      MsgBox \"AutoCAD just lost focus!\"
End Sub
Visual LISP:
Not available
")
("BeginClose" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B1114C2-35FD-4689-B031-62D489FF8A7E"
              "
BeginClose Event (ActiveX)
Triggered immediately after AutoCAD receives a request to close a drawing.
Supported platforms: Windows only
Signature
VBA:
object.BeginClose()
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
Remarks
You should use the BeginDocClose event rather than the BeginClose event because the BeginDocClose event enables you to keep a drawing from being closed.
No events occur while a modal dialog is displayed.
Examples
VBA:
Private Sub AcadDocument_BeginClose()
    ' This example intercepts a drawing BeginClose event.
    '
    ' This event is triggered when a drawing receives a request to close.
    '
    ' To trigger this example event: Close an open drawing
    MsgBox \"A drawing has just been closed!\"
End Sub
Visual LISP:
Not available
")
("BeginCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2A816E4A-E74C-46B7-9DBA-7E09ACE31D9E"
                "
BeginCommand Event (ActiveX)
Triggered immediately after a command is issued, but before it completes.
Supported platforms: Windows only
Signature
VBA:
object.BeginCommand(CommandName)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
CommandName
    Type: String
    The name of the command being issued.
Remarks
The BeginCommand event is triggered as soon as AutoCAD receives a request to issue a command. This request can come either interactively by a user through the AutoCAD user interface or programmatically. The BeginCommand event is followed by the EndCommand event after AutoCAD completes processing the command. If the user cancels out of the command, the EndCommand event will not be triggered.
The BeginCommand event will be fired for any basic AutoCAD command, or any command registered on the AutoCAD command stack via an ObjectARX application, or the Visual LISP vlax-add-cmd function.
This event will not be fired for Visual LISP functions defined as external subroutines via the Visual LISP vl-acad-defun function. These functions are not exposed to the command stack, even though you execute them from the AutoCAD command line. Instead, these functions will trigger the BeginLISP and EndLISP events. If you need LISP commands to be recognized when they execute you will need to use the Visual LISP vlax-add-cmd function to register the command correctly to the AutoCAD command stack.
If you undefine an AutoCAD command and then redefine it via the Visual LISP vl-acad-defun function, the BeginCommand event may not be triggered until an actual AutoCAD command is called (command \"._LINE\" ...) for instance.
AutoCAD commands are stored in groups in the command stack. One instance of the command stack is created per AutoCAD session. This stack consists of the native AutoCAD commands, as well as any custom commands you add to it.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginCommand(ByVal CommandName As String)
    ' This example intercepts a drawing BeginCommand event.
    '
    ' This event is triggered when a drawing receives
    ' any command compatible with this event.
    '
    ' To trigger this example event: Issue any command to an open drawing from
    ' either the command line, VBA, the AutoCAD menus, the AutoCAD toolbars, or LISP.
    ' Use the \"CommandName\" variable to determine which command was started
    MsgBox \"A drawing has just been issued a \" & CommandName & \" command.\"
End Sub
Visual LISP:
Not available
")
("BeginDocClose" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EE0D8F0D-1132-4BCE-A68F-7125B97E737F"
                 "
BeginDocClose Event (ActiveX)
Triggered immediately after AutoCAD receives a request to close a drawing.
Supported platforms: Windows only
Signature
VBA:
object.BeginDocClose(Cancel)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
Cancel
    Type: Boolean
    Determines whether to prevent the drawing from being closed.
        True: The drawing is prevented from closing.
        False: The drawing is not prevented from closing.
Remarks
You can use this event to keep a drawing from being closed. This event should be used instead of the BeginClose event.
No events occur while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginDocClose(Cancel As Boolean)
    ' This example prevents a drawing from closing.
    Cancel = True
    MsgBox \"Please do not close this drawing.\"
End Sub
Visual LISP:
Not available
")
("BeginDoubleClick" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0BBE54CD-0C3C-49E3-8F43-02C8D3219ED4"
                    "
BeginDoubleClick Event (ActiveX)
Triggered after the user double-clicks an object in the drawing.
Supported platforms: Windows only
Signature
VBA:
object.BeginDoubleClick(PickPoint)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
PickPoint
    Type: Variant (three-element array of doubles); input to the handler
    The 3D WCS coordinate that was double-clicked.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginDoubleClick(ByVal PickPoint As Variant)
    ' This example intercepts a drawing BeginDoubleClick event.
    '
    ' This event is triggered when a drawing receives
    ' a double mouse click in its working area.
    '
    ' To trigger this example event: Position the mouse over the working area of
    ' a drawing window and double-click the left mouse button
    ' Use the \"PickPoint\" variable to determine where on the drawing the user clicked
    MsgBox \"A drawing has just been double-clicked at:\" & vbCrLf & _
            PickPoint(0) & vbCrLf & _
            PickPoint(1) & vbCrLf & _
            PickPoint(2)
End Sub
Visual LISP:
Not available
")
("BeginFileDrop" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D14A002C-60EF-493A-A8FA-696B12F05D3D"
                 "
BeginFileDrop Event (ActiveX)
Triggered when a file is dropped on the main application window.
Supported platforms: Windows only
Signature
VBA:
object.BeginFileDrop(FileName, Cancel)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
FileName
    Type: String; input to the handler
    The name of the file that has been dropped on the main application window.
Cancel
    Type: Boolean; output from the handler
        True: Aborts the loading of the drawing.
        False: Allows the loading of the drawing to continue.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_BeginFileDrop(ByVal FileName As String, Cancel As Boolean)
    ' This example intercepts an Application BeginFileDrop event.
    '
    ' This event is triggered when a drawing file is dragged into AutoCAD.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Drag an AutoCAD drawing file into the AutoCAD application from either
    '     the Windows Desktop or File Explorer
    ' Use the \"Cancel\" variable to stop the loading of the dragged file, and the \"FileName\"
    ' variable to notifiy the user which file is about to be dragged in.
    If MsgBox(\"AutoCAD is about to load \" & FileName & vbCrLf & _
              \"Do you want to continue loading this file?\", vbYesNoCancel + vbQuestion) <> vbYes Then
        Cancel = True
    End If
End Sub
Visual LISP:
Not available
")
("BeginLisp" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CF0D87BB-1E41-4F82-B007-409F794EC8EB"
             "
BeginLISP Event (ActiveX)
Triggered immediately after AutoCAD receives a request to evaluate an AutoLISP expression.
Supported platforms: Windows only
Signature
VBA:
object.BeginLISP(FirstLine)
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and the document.
FirstLine
    Type: String; input-only
    The name of the AutoLISP expression about to be executed by the AutoLISP interpreter. FirstLine will not have any case conversion of the alpha characters.
    If the AutoLISP function being executed is defined (with defun) as a C:xxx function and is being executed as an AutoCAD command (such as just using the xxx part of the function name and no parentheses), then FirstLine will be the complete function name including the C: prefix and will be enclosed inside a pair of parentheses—just the way it would appear when executed as a true AutoLISP function call. Otherwise, FirstLine will be the actual AutoLISP expression that has been typed in at the AutoCAD command line or is part of a menu macro.
    For example:
        If there is a user-defined AutoLISP function loaded called C:TEST, and it is executed by typing \"TEST\" at the command line, then FirstLine will be (C:TEST).
        If there is a user defined AutoLISP function loaded called calc and it is executed as (cAlc), then FirstLine will be (cAlc).
        If a menu macro contains (getvar \"cmdecho\"), then FirstLine will be (getvar \"cmdecho\").
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginLisp(ByVal FirstLine As String)
    ' This example intercepts a drawing BeginLisp event.
    '
    ' This event is triggered when a drawing receives
    ' a request to evaluate a LISP expression.
    '
    ' To trigger this example event: Start the evaluation of a LISP expression
    ' Use the \"FirstLine\" variable to help the user determine which LISP expression is running
    MsgBox \"A LISP expression has just started to be evaluated.  The first line of the expression is: \" & FirstLine
End Sub
Visual LISP:
Not available
")
("BeginModal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1A32712E-B2AB-4159-95F3-8C95BC22AB7F"
              "
BeginModal Event (ActiveX)
Triggered just before a modal dialog is displayed.
Supported platforms: Windows only
Signature
VBA:
object.BeginModal()
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Remarks
No events will be fired while a modal dialog is being displayed.
You should never issue a message box from within an event handler for the BeginModal event.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_BeginModal()
    ' This example intercepts an Application BeginModal event.  We use a Beep instead of
    ' a message box to notify the user when the event is triggered, since a message box
    ' is a modal entity and would cause continuous BeginModal/EndModal events to be triggered.
    '
    ' This event is triggered when AutoCAD displays a modal dialog.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Use AutoCAD to begin a modal dialog operation.
    '     For example, use AutoCAD to display a modal file dialog by using File/New
    Beep  ' A modal dialog is about to be displayed!
End Sub
Visual LISP:
Not available
")
("BeginOpen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BD420830-798B-4023-BD33-E1442D71D800"
             "
BeginOpen Event (ActiveX)
Triggered immediately after AutoCAD receives a request to open an existing drawing.
Supported platforms: Windows only
Signature
VBA:
object.BeginOpen(Filename)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Filename
    Type: String
    The name of the file being opened.
Remarks
The BeginOpen event is triggered as soon as AutoCAD receives a request to open an existing file. This request can come either interactively by a user through the File Open dialog box or programmatically.
The BeginOpen event does not trigger when opening a DXF format file.
When opening an existing file, the BeginOpen event will be followed by the EndOpen event when AutoCAD completes the opening of the drawing. For example, when a user selects Application menu Open, then chooses the file to open from the dialog box and selects the Open button, the BeginOpen event is triggered (as soon as the Open button is processed). Once the drawing is visible in the AutoCAD window and is ready for work, the EndOpen event is triggered.
When creating a new file, the NewDrawing event is triggered.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_BeginOpen(FileName As String)
    ' This example intercepts an Application BeginOpen event.
    '
    ' This event is triggered when a drawing is opened by AutoCAD.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Use AutoCAD to open an existing drawing
    ' Use the \"FileName\" variable to determine which drawing file is being opened
    MsgBox \"A drawing is about to be loaded from: \" & FileName
End Sub
Visual LISP:
Not available
")
("BeginPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-286CEEB9-3F3B-40AC-B148-E02335B74270"
             "
BeginPlot Event (ActiveX)
Triggered immediately after AutoCAD receives a request to print a drawing.
Supported platforms: Windows only
Signature
VBA:
object.BeginPlot(DrawingName)
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
DrawingName
    Type: String; input to the handler
    The name of the drawing that is being sent to the printer.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginPlot(ByVal DrawingName As String)
    ' This example intercepts a drawing BeginPlot event.
    '
    ' This event is triggered when a drawing receives a plot request.
    '
    ' To trigger this example event: Plot an open drawing
    ' Use the \"DrawingName\" variable to determine which drawing is about to plot
    MsgBox \"A drawing has just received a request to plot for: \" & DrawingName
End Sub
Visual LISP:
Not available
")
("BeginQuit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5315845E-EC1F-4D03-AAAB-D9E08EB0873D"
             "
BeginQuit Event (ActiveX)
Triggered just before an AutoCAD session ends or a document closes.
Supported platforms: Windows only
Signature
VBA:
object.BeginQuit(Cancel)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Cancel
    Type: Boolean; output from the handler
        True: Aborts the shutdown of AutoCAD.
        False: Allows the shutdown of AutoCAD to continue.
Remarks
The BeginQuit event marks the end of the AutoCAD session.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_BeginQuit(Cancel As Boolean)
    ' This example intercepts an Application BeginQuit event.
    '
    ' This event is triggered when AutoCAD receives a request to shut down.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Close the AutoCAD application
    ' Use the \"Cancel\" variable to stop the shut down of the application
    If MsgBox(\"AutoCAD is about to shut down.  Do you want to continue with the shutdown?\", _
              vbYesNoCancel + vbQuestion) <> vbYes Then
        Cancel = True
    End If
End Sub
Visual LISP:
Not available
")
("BeginRightClick" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6AF4DAD7-96EF-4CFB-9FC5-43F0F017F5CA"
                   "
BeginRightClick Event (ActiveX)
Triggered after the user right-clicks on the drawing window.
Supported platforms: Windows only
Signature
VBA:
object.BeginRightClick(PickPoint)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
PickPoint
    Type: Variant (three-element array of doubles); input to the handler
    The 3D WCS coordinate that was right-clicked.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginRightClick(ByVal PickPoint As Variant)
    ' This example intercepts a drawing BeginRightClick event.
    '
    ' This event is triggered when a drawing receives
    ' a right mouse click in its working area.
    '
    ' To trigger this example event: Position the cursor over the working area of
    ' a drawing window and click the right mouse button.
    ' Use the \"PickPoint\" variable to determine where on the drawing the user clicked
    MsgBox \"A drawing has just been right-clicked at:\" & vbCrLf & _
            PickPoint(0) & vbCrLf & _
            PickPoint(1) & vbCrLf & _
            PickPoint(2)
End Sub
Visual LISP:
Not available
")
("BeginSave" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E34B6863-298A-40A3-AA8F-327F5C5DACF0"
             "
BeginSave Event (ActiveX)
Triggered immediately after AutoCAD receives a request to save the drawing.
Supported platforms: Windows only
Signature
VBA:
object.BeginSave(Filename)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Filename
    Type: String
    The name of the file being saved.
Remarks
The BeginSave event is triggered as soon as AutoCAD receives a request to save along with the name of the file to save. This request can come either interactively by a user through the interface or programmatically.
The BeginSave event is followed by the EndSave event after AutoCAD completes the saving of the drawing.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginSave(ByVal FileName As String)
    ' This example intercepts a drawing BeginSave event.
    '
    ' This event is triggered when a drawing receives a request to be saved.
    '
    ' To trigger this example event: Save an open drawing
    ' Use the \"FileName\" variable to determine where the drawing file is being saved
    MsgBox \"A drawing is about to be saved to: \" & FileName
End Sub
Visual LISP:
Not available
")
("BeginShortcutMenuCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B125BE98-E80D-41EE-A281-E2E8DFC4968E"
                            "
BeginShortcutMenuCommand Event (ActiveX)
Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in command mode.
Supported platforms: Windows only
Signature
VBA:
object.BeginShortcutMenuCommand(ShortcutMenu, Command)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ShortcutMenu
    Type: PopupMenu object; input/output from the handler
    The shortcut menu about to be displayed.
Command
    Type: String; input to the handler only
    The name of the command in process.
Remarks
This event allows you to make changes to the shortcut menu before it is displayed. To make changes to the shortcut menu, edit the PopupMenu object that is passed in to your handler from the event. This same PopupMenu object is passed out of the handler as the current shortcut menu. Use the EndShortcutMenu event to perform any cleanup work on the shortcut menu.
There is a command in progress when this event is triggered.
This event is triggered after all shortcut menu elements, including any ObjectARX command additions, have occurred.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginShortcutMenuCommand(ShortcutMenu As AutoCAD.IAcadPopupMenu, ByVal Command As String)
    ' This example intercepts a shortcut menu start while you are in the command mode.
    '
    MsgBox \"You have just initiated a shortcut menu in command mode!\"
End Sub
Visual LISP:
Not available
")
("BeginShortcutMenuDefault" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5DF17EEA-9276-4E14-8FF3-96F738F7ED8D"
                            "
BeginShortcutMenuDefault Event (ActiveX)
Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in default mode.
Supported platforms: Windows only
Signature
VBA:
object.BeginShortcutMenuDefault(ShortcutMenu)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ShortcutMenu
    Type: PopupMenu object; input/output from the handler
    The shortcut menu about to be displayed.
Remarks
This event allows you to make changes to the shortcut menu before it is displayed. To make changes to the shortcut menu, edit the PopupMenu object that is passed in to your handler from the event. This same PopupMenu object is passed out as the current shortcut menu. Use the EndShortcutMenu event to perform any cleanup work on the shortcut menu.
There is no selection set active and no command in process when this event is triggered.
This event is triggered after all shortcut menu elements, including any ObjectARX command additions, have occurred.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginShortcutMenuDefault(ShortcutMenu As AutoCAD.IAcadPopupMenu)
    ' This example intercepts a shortcut menu start while you are in the default mode.
    '
    MsgBox \"You have just initiated a shortcut menu in default mode!\"
End Sub
Visual LISP:
Not available
")
("BeginShortcutMenuEdit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D993E595-B28A-4486-956C-3B1B7583F6DB"
                         "
BeginShortcutMenuEdit Event (ActiveX)
Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in edit mode.
Supported platforms: Windows only
Signature
VBA:
object.BeginShortcutMenuEdit(ShortcutMenu, SelectionSet)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ShortcutMenu
    Type: PopupMenu object; input/output from the handler
    The shortcut menu about to be displayed.
SelectionSet
    Type: SelectionSet object; input/output from the handler
    The pickfirst selection set.
Remarks
This event allows you to make changes to the shortcut menu before it is displayed. To make changes to the shortcut menu, edit the PopupMenu object that is passed in to your handler from the event. This same PopupMenu object is passed out of the handler as the current shortcut menu. Use the EndShortcutMenu event to perform any cleanup work on the shortcut menu.
There is a selection set active but no command in progress when this event is triggered.
This event is triggered after all shortcut menu elements, including any ObjectARX command additions, have occurred.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginShortcutMenuEdit(ShortcutMenu As AutoCAD.IAcadPopupMenu, SelectionSet As AutoCAD.IAcadSelectionSet)
    ' This example intercepts a shortcut menu start while you are in the edit mode.
    '
    MsgBox \"You have just initiated a shortcut menu in edit mode!\"
End Sub
Visual LISP:
Not available
")
("BeginShortcutMenuGrip" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6E178381-061D-48FB-95C9-3D077AB1A1EF"
                         "
BeginShortcutMenuGrip Event (ActiveX)
Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in grip mode.
Supported platforms: Windows only
Signature
VBA:
object.BeginShortcutMenuGrip(ShortcutMenu)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ShortcutMenu
    Type: PopupMenu object; input/output from the handler
    The shortcut menu about to be displayed.
Remarks
This event allows you to make changes to the shortcut menu before it is displayed. To make changes to the shortcut menu, edit the PopupMenu object that is passed in to your handler from the event. This same PopupMenu object is passed out as the current shortcut menu. Use the EndShortcutMenu event to perform any cleanup work on the shortcut menu.
There is a hot grip active when this event is triggered.
This event is triggered after all shortcut menu elements, including any ObjectARX command additions, have occurred.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginShortcutMenuGrip(ShortcutMenu As AutoCAD.IAcadPopupMenu)
    ' This example intercepts a shortcut menu start while you are in the grip mode.
    '
    MsgBox \"You have just initiated a shortcut menu in grip mode!\"
End Sub
Visual LISP:
Not available
")
("BeginShortcutMenuOSnap" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A244B425-3107-4F3B-97C6-229FCA1286EA"
                          "
BeginShortcutMenuOSnap Event (ActiveX)
Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in object snap mode.
Supported platforms: Windows only
Signature
VBA:
object.BeginShortcutMenuGrip(ShortcutMenu)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ShortcutMenu
    Type: PopupMenu object; input/output from the handler
    The shortcut menu about to be displayed.
Remarks
This event allows you to make changes to the shortcut menu before it is displayed. To make changes to the shortcut menu, edit the PopupMenu object that is passed in to your handler from the event. This same PopupMenu object is passed out as the current shortcut menu. Use the EndShortcutMenu event to perform any cleanup work on the shortcut menu.
This event is triggered after all shortcut menu elements, including any ObjectARX command additions, have occurred.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_BeginShortcutMenuOSnap(ShortcutMenu As AutoCAD.IAcadPopupMenu)
    ' This example intercepts a shortcut menu start while you are in the osnap mode.
    '
    MsgBox \"You have just initiated a shortcut menu in osnap mode!\"
End Sub
Visual LISP:
Not available
")
("Deactivate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-22750180-C69B-42BB-9895-F865797D753C"
              "
Deactivate Event (ActiveX)
Triggered when the drawing window is deactivated.
Supported platforms: Windows only
Signature
VBA:
object.Deactivate()
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_Deactivate()
    ' This example intercepts a drawing DeActivate event.
    '
    ' This event is triggered when a drawing window loses focus.
    '
    ' To trigger this example event: Open two drawings and switch from
    ' one drawing window to another
    MsgBox \"You have just deactivated a drawing!\"
End Sub
Visual LISP:
Not available
")
("EndCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-54741B8A-2A8F-46CC-B62C-1DAA182E7174"
              "
EndCommand Event (ActiveX)
Triggered immediately after a command completes.
Supported platforms: Windows only
Signature
VBA:
object.EndCommand(CommandName)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
CommandName
    Type: String
    The name of the command that was issued.
Remarks
The EndCommand event follows the BeginCommand event after AutoCAD completes processing the command. If the user cancels out of the command, the EndCommand event will not be triggered.
The BeginCommand event will be fired for any basic AutoCAD command, or any command registered on the AutoCAD command stack via an ObjectARX application, or the Visual LISP vlax-add-cmd function. It will not be fired for any normally defun'd C: AutoLISP function because it is not exposed to the command stack, even though you execute it from the AutoCAD command Line. If you need AutoLISP commands to be recognized when they execute, you will need to use the Visual LISP vlax-add-cmd function to register the command correctly to the AutoCAD command stack.
If you undefine an AutoCAD command and then redefine it via the AutoLISP defun function, the BeginCommand event may not be triggered until an actual AutoCAD command is called; for example, (command \"._LINE\" ...).
AutoCAD commands are stored in groups in the command stack. One instance of the command stack is created per AutoCAD session. This stack consists of the native AutoCAD commands, as well as any custom commands you add to it.
No events will be fired while a modal dialog is being displayed
Examples
VBA:
Private Sub AcadDocument_EndCommand(ByVal CommandName As String)
    ' This example intercepts a drawing EndCommand event.
    '
    ' This event is triggered when a drawing receives
    ' any command compatible with this event.
    '
    ' To trigger this example event: Issue any command to an open drawing from
    ' either the command line, VBA, the ACAD menus, the ACAD toolbars, or LISP.
    ' When the command is finished, this event will be triggered.
    ' Use the \"CommandName\" variable to determine which command just finished
    MsgBox \"A drawing has just finished a \" & CommandName & \" command.\"
End Sub
Visual LISP:
Not available
")
("EndLisp" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A6EA78E5-C0FC-4E71-9223-24E30C32E217"
           "
EndLISP Event (ActiveX)
Triggered upon completion of evaluating an AutoLISP expression.
Supported platforms: Windows only
Signature
VBA:
object.EndLISP()
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
Remarks
This event will occur after either a normal termination of the AutoLISP evaluation, or after a cancellation of the AutoLISP evaluation.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_EndLisp()
    ' This example intercepts a drawing BeginLisp event.
    '
    ' This event is triggered when a drawing finishes
    ' a the evaluation of a LISP expression.
    '
    ' To trigger this example event: Start the evaluation of a LISP expression and
    ' wait for it to finish being evaluated
    MsgBox \"A LISP expression has just finished being evaluated!\"
End Sub
Visual LISP:
Not available
")
("EndModal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B834BF42-B242-40EC-9093-2D830C62F71F"
            "
EndModal Event (ActiveX)
Triggered just after a modal dialog is dismissed.
Supported platforms: Windows only
Signature
VBA:
object.EndModal()
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_EndModal()
    ' This example intercepts an Application EndModal event.  We use a Beep instead of
    ' a message box to notify the user when the event is triggered, since a message box
    ' is a modal entity and would cause continuous BeginModal/EndModal events to be triggered.
    '
    ' This event is triggered when AutoCAD finishes displaying a modal dialog.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Use AutoCAD to begin a modal dialog operation and then dismiss the dialog.
    '     For example, use AutoCAD to display a modal file dialog by using File/New and then
    '     close the dialog by selecting Cancel
    Beep  ' The modal dialog was just closed!
End Sub
Visual LISP:
Not available
")
("EndOpen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1AEC7F00-981A-4517-A830-37CA653D336A"
           "
EndOpen Event (ActiveX)
Triggered immediately after AutoCAD finishes opening an existing drawing.
Supported platforms: Windows only
Signature
VBA:
object.EndOpen(Filename)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Filename
    Type: String
    The name of the file being opened.
Remarks
The EndOpen event follows the BeginOpen event after AutoCAD completes the opening of an existing drawing.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_EndOpen(ByVal FileName As String)
    ' This example intercepts an Application EndOpen event.
    '
    ' This event is triggered when AutoCAD finishes opening a drawing.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Use AutoCAD to open an existing drawing and wait until the
    '     operation finishes
    ' Use the \"FileName\" variable to determine which drawing file is being opened
    MsgBox \"A drawing was just loaded from: \" & FileName
End Sub
Visual LISP:
Not available
")
("EndPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BC920EE5-A616-449B-A8E4-9CAF0E588306"
           "
EndPlot Event (ActiveX)
Triggered after a document has been sent to the printer.
Supported platforms: Windows only
Signature
VBA:
object.EndPlot(DrawingName)
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application or a document.
DrawingName
    Type: String; input to the handler
    The name of the drawing that has been printed.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_EndPlot(ByVal DrawingName As String)
    ' This example intercepts a drawing EndPlot event.
    '
    ' This event is triggered when a drawing finishes a plot request.
    '
    ' To trigger this example event: Plot an open drawing and wait for the plot to finish
    ' Use the \"DrawingName\" variable to determine which drawing just finished plotting
    MsgBox \"A drawing has just finished a plot request!\"
End Sub
Visual LISP:
Not available
")
("EndSave" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D72C232D-82D9-4C63-9808-9E8CFE514B36"
           "
EndSave Event (ActiveX)
Triggered when AutoCAD has finished saving the drawing.
Supported platforms: Windows only
Signature
VBA:
object.EndSave(Filename)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Filename
    Type: String
    The name of the file that was saved.
Remarks
The EndSave event follows the BeginSave event after AutoCAD completes the saving of the drawing.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_EndSave(ByVal FileName As String)
    ' This example intercepts a drawing EndSave event.
    '
    ' This event is triggered when a drawing finishes a save request.
    '
    ' To trigger this example event: Save an open drawing and wait for the save to complete
    ' Use the \"FileName\" variable to determine where the drawing file was saved
    MsgBox \"A drawing has just been saved to: \" & FileName
End Sub
Visual LISP:
Not available
")
("EndShortcutMenu" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8F40A4D3-75DF-4DC6-BC63-8E927A049641"
                   "
EndShortcutMenu Event (ActiveX)
Triggered after the shortcut menu appears.
Supported platforms: Windows only
Signature
VBA:
object.EndShortcutMenu(ShortcutMenu)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ShortcutMenu
    Type: PopupMenu object; input/output from the handler
    The shortcut menu that has been displayed.
Remarks
Use this event to perform any cleanup work on the shortcut menu.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_EndShortcutMenu(ShortcutMenu As AutoCAD.IAcadPopupMenu)
    ' This example intercepts a drawing EndShortcutMenu event.
    '
    ' This event is triggered when the user closes a drawing shortcut menu.
    '
    ' To trigger this example event: Right click the mouse in the working area of a drawing,
    ' wait for the shortcut menu to be displayed and then dismiss the shortcut menu
    MsgBox \"A shortcut menu was just closed!\"
End Sub
Visual LISP:
Not available
")
("LispCancelled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-419542A9-A9EA-4786-AF23-A3C49667E822"
                 "
LISPCancelled Event (ActiveX)
Triggered when the evaluation of a AutoLISP expression is cancelled.
Supported platforms: Windows only
Signature
VBA:
object.LISPCancelled()
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_LispCancelled()
    ' This example intercepts a drawing LispCancelled event.
    '
    ' This event is triggered when the evaluation of a LISP expression is cancelled.
    '
    ' To trigger this example event: Run a LISP expression and
    ' cancel the LISP evaluation before it finishes
    MsgBox \"A LISP evaluation was just cancelled.\"
End Sub
Visual LISP:
Not available
")
("LayoutSwitched" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-32909BB0-81E6-4E41-816D-8B0C1EAB608F"
                  "
LayoutSwitched Event (ActiveX)
Triggered after the user switches to a different layout.
Supported platforms: Windows only
Signature
VBA:
object.LayoutSwitched(LayoutName)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
LayoutName
    Type: String; input to the handler
    The name of the layout the user has switched to.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_LayoutSwitched(ByVal LayoutName As String)
    ' This example intercepts a drawing LayoutSwitched event.
    '
    ' This event is triggered when the user switches to a different
    ' drawing layout view.
    '
    ' To trigger this example event: Open a drawing and change its layout view
    '
    ' For example: Switch the drawing from Model view to Layout1 view
    ' Use the \"LayoutName\" variable to determine the which layout view we changed to
    MsgBox \"The drawing layout was just changed to: \" & LayoutName
End Sub
Visual LISP:
Not available
")
("LispCancelled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-419542A9-A9EA-4786-AF23-A3C49667E822"
                 "
LISPCancelled Event (ActiveX)
Triggered when the evaluation of a AutoLISP expression is cancelled.
Supported platforms: Windows only
Signature
VBA:
object.LISPCancelled()
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_LispCancelled()
    ' This example intercepts a drawing LispCancelled event.
    '
    ' This event is triggered when the evaluation of a LISP expression is cancelled.
    '
    ' To trigger this example event: Run a LISP expression and
    ' cancel the LISP evaluation before it finishes
    MsgBox \"A LISP evaluation was just cancelled.\"
End Sub
Visual LISP:
Not available
")
("Modified" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5EF65D7D-F5B4-48FE-A9F6-CD5F7CF3C54B"
            "
Modified Event (ActiveX)
Triggered when an object or collection in the drawing has been modified.
Supported platforms: Windows only
Signature
VBA:
object.Modified(Entity)
object
    Type: All drawing objects, Block, Blocks, Dictionaries, Dictionary, DimStyle, DimStyles, Group, Groups, Layer, Layers, Layout, Layouts, Linetype, Linetypes, Material, Materials, MLeaderStyle, ModelSpace, PaperSpace, PlotConfiguration, PlotConfigurations, RegisteredApplication, RegisteredApplications, SectionManager, SectionSettings, SectionTypeSettings, SortentsTable, TableStyle, TextStyle, TextStyles, UCS, UCSs, View, Viewport, Viewports, Views, XRecord
    An object expression that evaluates to a valid container object.
Entity
    Type: A Drawing Object
    The object in the drawing that is modified can be any one of the drawing objects.
Remarks
This event will be triggered whenever the object is modified. Modification includes whenever the value of a property is set, even if the new value is equal to the current value.
When coding in VBA, you must provide an event handler for all objects enabled for the Modified event. If you do not provide a handler, VBA may terminate unexpectedly.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents PLine As AcadLWPolyline    ' Use with Modified Event Example
Sub Example_Modified()
     ' This example creates a lightweight polyline in model space and
     ' references the PolyLine using the public variable (PLine) which
     ' is set up to intercept Modified events.
     '
     ' This example then modifies the new object, triggering the code
     ' in the Modified event.
    
    Dim points(0 To 9) As Double
    
    ' Define the 2D polyline points
    points(0) = 1: points(1) = 1
    points(2) = 1: points(3) = 2
    points(4) = 2: points(5) = 2
    points(6) = 3: points(7) = 2
    points(8) = 4: points(9) = 4
        
    ' Create a lightweight Polyline object in model space
    '
    ' * Note: We are returning the new PolyLine object into a Module
    ' level variable.  This allows us to intercept events associated
    ' with that particular object.
    Set PLine = ThisDrawing.ModelSpace.AddLightWeightPolyline(points)
    
    ThisDrawing.Application.ZoomAll
    
    ' Modify object to trigger event.
    '
    ' * Note: The event code for the PolyLine modification will be triggered
    ' before we move forward and refresh the view, so the line will not
    ' appear blue when the event message box is displayed.
    Dim color As AcadAcCmColor
    Set color = AcadApplication.GetInterfaceObject(\"AutoCAD.AcCmColor.\" + Left(AcadApplication.Version, 2))
    Call color.SetRGB(80, 100, 244)
    PLine.TrueColor = color
    ThisDrawing.Regen acAllViewports
    
End Sub
Private Sub PLine_Modified(ByVal pObject As AutoCAD.IAcadObject)
    ' This example intercepts an object's Modified event.
    '
    ' This event is triggered when an object supporting this event is modified.
    '
    ' To trigger this code: Modify an object connected to this event
    ' * Note: By connected, we mean the object set up to intercept events using
    ' the VBA WithEvents statement
    ' Use the \"pObject\" variable to determine which object was modified
    MsgBox \"You just modified an object with an ID of: \" & pObject.ObjectID
    
End Sub
Visual LISP:
Not available
")
("NewDrawing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2204099A-0E75-4FA9-93B9-2FC997916682"
              "
NewDrawing Event (ActiveX)
Triggered just before a new drawing is created.
Supported platforms: Windows only
Signature
VBA:
object.NewDrawing()
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_NewDrawing()
    ' This example intercepts an Application NewDrawing event.
    '
    ' This event is triggered when a new drawing request is sent to AutoCAD.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Use AutoCAD to create a new drawing using File/New
    MsgBox \"A request to start a new drawing was just intercepted!\"
End Sub
Visual LISP:
Not available
")
("ObjectAdded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-689D8C57-6EB5-446B-8E2D-4C55C35908E9"
               "
ObjectAdded Event (ActiveX)
Triggered when an object has been added to the drawing.
Supported platforms: Windows only
Signature
VBA:
object.ObjectAdded(Entity)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
Entity
    Type: A Drawing Object; input to the handler
    The object that was added to the drawing. It can be any one of the drawing objects.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_ObjectAdded(ByVal Object As Object)
    ' This example intercepts a drawing ObjectAdded event.
    '
    ' This event is triggered when an object is added to a drawing.
    '
    ' To trigger this example event: Add an object to an open drawing
    ' Use the \"Object\" variable to determine the type of object added
    MsgBox \"A \" & TypeName(Object) & \" was just added to the drawing!\"
End Sub
Visual LISP:
Not available
")
("ObjectErased" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7A8EB01B-B793-46CC-A369-FD9B4DD98022"
                "
ObjectErased Event (ActiveX)
Triggered when an object has been erased from the drawing.
Supported platforms: Windows only
Signature
VBA:
object.ObjectErased(ObjectID)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
ObjectID
    Type: LONG_PTR; input to the handler
    The object ID of the object that was erased.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_ObjectErased(ByVal ObjectID As Long_PTR)
    ' This example intercepts a drawing ObjectErased event.
    '
    ' This event is triggered when an object is removed from a drawing.
    '
    ' To trigger this example event: Delete (Cut) an existing object from an open drawing
    ' Use the \"Object\" variable to determine the type of object removed
    MsgBox \"The ID of the object deleted is: \" & ObjectID
End Sub
Visual LISP:
Not available
")
("ObjectModified" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-554BCA2C-19B5-4445-95E4-5624FE7F290A"
                  "
ObjectModified Event (ActiveX)
Triggered when an object in the drawing has been modified.
Supported platforms: Windows only
Signature
VBA:
object.ObjectModified(Entity)
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
Entity
    Type: Document; input to the handler
    The object in the drawing that is modified. It can be any one of the drawing objects.
Remarks
This event takes place after the modification operation is complete.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_ObjectModified(ByVal Object As Object)
    ' This example intercepts a drawing ObjectModified event.
    '
    ' This event is triggered when an object in a drawing is modified.
    '
    ' To trigger this example event: Modify an object in any open drawing
    ' Use the \"Object\" variable to determine the type of object modified
    MsgBox \"A \" & TypeName(Object) & \" was just modified!\"
End Sub
Visual LISP:
Not available
")
("SelectionChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2C0AED20-1D9A-41F9-B62A-467C6E16E6C7"
                    "
SelectionChanged Event (ActiveX)
Triggered when the current pickfirst selection set changes.
Supported platforms: Windows only
Signature
VBA:
object.SelectionChanged()
object
    Type: Document
    An object expression that evaluates to a valid container object. In this case, the only valid container is a document.
Remarks
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_SelectionChanged()
    ' This example intercepts a drawing SelectionChanged event.
    '
    ' This event is triggered when the current selection set in a drawing is modified.
    '
    ' To trigger this example event: Select or deselect objects in any open drawing
    MsgBox \"The selection set in a drawing was just changed!\"
End Sub
Visual LISP:
Not available
")
("SysVarChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-275C46E6-15AA-4086-84F9-D4836E96C049"
                 "
SysVarChanged Event (ActiveX)
Triggered when the value of a system variable is changed.
Supported platforms: Windows only
Signature
VBA:
object.SysVarChanged(SysVarName, NewVal)
object
    Type: Application
    An object expression that evaluates to a valid container object. In this case, the only valid container is the application.
SysVarName
    Type: String; input to the handler
    The name of the system variable whose value has changed.
NewVal
    Type: Variant; input to the handler
    The new value of the system variable.
Remarks
This event indicates an attempt was made to change a system variable. It does not indicate the actual value was changed. In some cases, it is possible to set a system variable without causing its value to change. For example, if FILLMODE was 0 and someone tried to set it to 0, then you would get an event for that system variable even though the call had no actual effect on the value of FILLMODE.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Public WithEvents ACADApp As AcadApplication    ' Use with Application Event Examples
Sub Example_AcadApplication_Events()
    ' This example intializes the public variable (ACADApp) which will be used
    ' to intercept AcadApplication Events
    '
    ' The VBA WithEvents statement makes it possible to intercept an generic object
    ' with the events associated with that object.
    '
    ' Before you will be able to trigger any of the AcadApplication events,
    ' you will first need to run this procedure.
    
    ' We could get the application from the ThisDocument object, but that would
    ' require having a drawing open, so we grab it from the system.
    Set ACADApp = GetObject(, \"AutoCAD.Application.24.1\")
End Sub
Private Sub ACADApp_SysVarChanged(ByVal SysvarName As String, ByVal newVal As Variant)
    ' This example intercepts an Application SysVarChanged event.
    '
    ' This event is triggered when the value of a system variable is changed.
    '
    ' To trigger this example event:
    '     1) Make sure to run the example that initializes
    '     the public variable (named ACADApp) linked to this event.
    '
    '     2) Change the value of a system variable in AutoCAD.
    '     For example: Type GRIDMODE on the command line and toggle the grid display on/off
    ' Use the \"SysvarName\" and \"newVal\" variables to determine which
    ' system variable has changed and its new value.
    MsgBox \"The system variable \" & SysvarName & \" was just changed to: \" & newVal
End Sub
Visual LISP:
Not available
")
("WindowChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EADD41ED-CEB1-4D2D-A7F2-710863289795"
                 "
WindowChanged Event (ActiveX)
Triggered when there is a change to the application or document windows.
Supported platforms: Windows only
Signature
VBA:
object.WindowChanged(WindowState)
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
WindowState
    Type: Integer; input to the handler.
        acMin - The window is minimized.
        acMax - The window is maximized.
        acNorm - The window is normal (neither minimized nor maximized).
Remarks
This event is helpful when implementing toolbars or modeless dialog boxes that track with the application or document window. The VB or ObjectARX application can use the HWNDFrame parameter to get the coordinates of the window, convert those coordinates to either screen or parent coordinates, and use this information to position other windows.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_WindowChanged(ByVal WindowState As Long)
    ' This example intercepts a drawing WindowChanged event.
    '
    ' This event is triggered when the window state of the
    ' current drawing window is changed.
    '
    ' To trigger this example event: Change the window state of the drawing window
    '
    ' For example: Minimize or maximize the drawing window
    Dim CurrentState As String
    ' Use the \"WindowState\" variable to determine the new drawing window state
    Select Case WindowState
        Case acMin: CurrentState = \"Minimized\"
        Case acMax: CurrentState = \"Maximized\"
        Case acNorm: CurrentState = \"Normal Size\"
    End Select
    MsgBox \"The drawing window is now: \" & CurrentState
End Sub
Visual LISP:
Not available
")
("WindowMovedOrResized" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-24A4303B-C20E-49DB-A552-DC345FAF6B65"
                        "
WindowMovedOrResized Event (ActiveX)
Triggered just after the application or drawing window has been moved or resized.
Supported platforms: Windows only
Signature
VBA:
object.WindowMovedOrResized(HWNDFrame, bMoved)
object
    Type: Application, Document
    An object expression that evaluates to a valid container object. In this case, the only valid containers are the application and a document.
HWNDFrame
    Type: Long_PTR; input to the handler
    The application or document window frame.
bMoved
    Type: Boolean; input to the handler
        True: The window was moved.
        False: The window was resized
Remarks
This event is helpful when implementing toolbars or modeless dialog boxes that track with the application or document window. The VB or ObjectARX application can use the HWNDFrame parameter to get the coordinates of the window, convert those coordinates to either screen or parent coordinates, and use this information to position other windows.
No events will be fired while a modal dialog is being displayed.
Examples
VBA:
Private Sub AcadDocument_WindowMovedOrResized(ByVal HWNDFrame As LONG_PTR, ByVal bMoved As Boolean)
    ' This example intercepts a drawing WindowMovedOrResized event.
    '
    ' This event is triggered when the drawing window is moved or resized
    '
    ' To trigger this example event: Move or resize the drawing window
    Dim CurrentState As String
    ' Use the \"bmoved\" variable to determine if we moved or sized the drawing window
    CurrentState = IIf(bMoved, \"Moving\", \"Sizing\")
    MsgBox \"The drawing window appearance was changed by: \" & CurrentState
End Sub
Visual LISP:
Not available
")
;;(defparameter *e-renameing* '("LISP" "Lisp"))
