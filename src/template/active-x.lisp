(in-package :dxf/template)

"
Reference Guide (ActiveX)

Listing of the properties, methods, events, and objects that define the AutoCAD ActiveX Object Library.
Object Model
AutoCAD Object Model
Properties
# A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
Obsolete
Methods
# A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
Obsolete
Events
# A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
Objects
# A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
All Drawing Objects
"
"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5D302758-ED3F-4062-A254-FB57BAB01C44"

(defparameter *properties-activex*
  '(("Action"
     "Specifies the security-related operations to be performed on a drawing.")
    ("Active"
     "Determines if the document is the active document for the session.")
    ("ActiveDimStyle"
     "Specifies the active dimension style.")
    ("ActiveDocument"
     "Specifies the active document (drawing file).")
    ("ActiveInvProject"
     "Specifies the active Inventor project being used by the Model Documentation feature. (Internal Use Only)")
    ("ActiveLayer"
     "Specifies the active layer.")
    ("ActiveLayout"
     "Specifies the active layout.")
    ("ActiveLinetype"
     "Specifies the active linetype for the drawing.")
    ("ActiveMaterial"
     "Specifies the current default material for this document.")
    ("ActiveProfile"
     "Specifies the active profile for the AutoCAD session.")
    ("ActivePViewport"
     "Specifies the active paper space viewport for the drawing.")
    ("ActiveSelectionSet"
     "Gets the active selection set for the drawing.")
    ("ActiveSpace"
     "Toggles the active space between paper space and model space.")
    ("ActiveTextStyle"
     "Specifies the active text style for the drawing.")
    ("ActiveUCS"
     "Specifies the active UCS for the drawing.")
    ("ActiveViewport"
     "Specifies the active viewport for the drawing.")
    ("ADCInsertUnitsDefaultSource"
     "Determines the units to use automatically for objects in DesignCenter for a source drawing that does not have assigned insert units.")
    ("ADCInsertUnitsDefaultTarget"
     "Determines the units to use automatically for objects in DesignCenter for a target drawing that does not have assigned insert units.")
    ("AdjustForBackground"
     "Determines whether the underlay colors are adjusted for the current background color.")
    ("AffectsGraphics"
     "Specifies that the entry in the File Dependency List affects graphics.")
    ("Algorithm"
     "Specifies the identifier of the encryption algorithm.")
    ("Alignment"
     "Specifies both the vertical and horizontal alignments for the attribute, attribute reference, or text.")
    ("AlignmentPointAcquisition"
     "Specifies how AutoAlignment points are acquired.")
    ("AlignSpace"
     "Specifies the AlignSpace of the mleaderstyle.")
    ("AllowedValues"
     "Specifies the allowed values for the property.")
    ("AllowLongSymbolNames"
     "Determines if symbol names may include extended character sets, or more than 31 characters.")
    ("AllowManualHeights"
     "Toggles the manual heights in a table.")
    ("AllowManualPositions"
     "Toggles the manual positions in a table.")
    ("AltFontFile"
     "Specifies the location of the font file to use if AutoCAD cannot locate the original font and an alternate font is not specified in the font mapping file.")
    ("Altitude"
     "Specifies the elevation of the position marker.")
    ("AltRoundDistance"
     "Specifies the rounding of alternate units.")
    ("AltSubUnitsFactor"
     "Specifies the scale factor for the alternate dimension when unit changes to sub-unit.")
    ("AltSubUnitsSuffix"
     "Specifies the text suffix for the alternate dimension when unit changes to sub-unit.")
    ("AltSuppressLeadingZeros"
     "Specifies the suppression of leading zeros in alternate dimension values.")
    ("AltSuppressTrailingZeros"
     "Specifies the suppression of trailing zeros in alternate dimension values.")
    ("AltSuppressZeroFeet"
     "Specifies the suppression of a zero foot measurement in alternate dimension values.")
    ("AltSuppressZeroInches"
     "Specifies the suppression of a zero inch measurement in alternate dimension values.")
    ("AltTabletMenuFile"
     "Specifies the path for an alternate menu to swap with the standard AutoCAD tablet menu.")
    ("AltTextPrefix"
     "Specifies a prefix for the alternate dimension measurement for all dimension types except angular.")
    ("AltTextSuffix"
     "Specifies a suffix for the alternate dimension measurement for all dimension types except angular.")
    ("AltTolerancePrecision"
     "Specifies the precision of tolerance values in alternate dimensions.")
    ("AltToleranceSuppressLeadingZeros"
     "Specifies the suppression of leading zeros in alternate dimension values.")
    ("AltToleranceSuppressTrailingZeros"
     "Specifies the suppression of trailing zeros in alternate tolerance values.")
    ("AltToleranceSuppressZeroFeet"
     "Specifies the suppression of a zero foot measurement in alternate tolerance values.")
    ("AltToleranceSuppressZeroInches"
     "Specifies the suppression of a zero inch measurement in alternate tolerance values.")
    ("AltUnits"
     "Enables dimensioning in alternate units.")
    ("AltUnitsFormat"
     "Specifies the units format for alternate units of all dimensions except angular.")
    ("AltUnitsPrecision"
     "Specifies the number of decimal places in alternate units.")
    ("AltUnitsScale"
     "Specifies the scale factor for alternate units.")
    ("Angle"
     "Gets the angle of a line.")
    ("AngleFormat"
     "Specifies the unit format for angular dimensions.")
    ("AngleVertex"
     "Specifies the angle vertex for the three-point angular dimension.")
    ("Annotation"
     "Specifies the annotation object for a leader.")
    ("Annotative"
     "Specifies the Annotative of the mleaderstyle.")
    ("Application"
     "Gets the Application object.")
    ("ArcEndParam"
     "Specifies the end parameter of the arc.")
    ("ArcLength"
     "Gets the length of the arc.")
    ("ArcPoint"
     "Specifies a point on the arc.")
    ("ArcSmoothness"
     "Specifies the smoothness of circles, arcs, and ellipses.")
    ("ArcStartParam"
     "Specifies the start parameter of the arc.")
    ("Area"
     "Specifies the enclosed area of an arc, circle, ellipse, hatch, lightweight polyline, polyline, region, or planar-closed spline.")
    ("Arrowhead1Block"
     "Specifies the block to use as the custom arrowhead for the first end of the dimension line.")
    ("Arrowhead1Type"
     "Specifies the type of arrowhead for the first end of the dimension line.")
    ("Arrowhead2Block"
     "Specifies the block to use as the custom arrowhead for the second end of the dimension line.")
    ("Arrowhead2Type"
     "Specifies the type of arrowhead for the second end of the dimension line.")
    ("ArrowheadBlock"
     "Specifies the block to use as the custom arrowhead for a radial dimension or leader line.")
    ("ArrowheadSize"
     "Specifies the size of dimension line arrowheads, leader and mleader line arrowheads, and hook lines.")
    ("ArrowheadType"
     "Specifies the type of arrowhead for the radial dimension, leader, or mleader.")
    ("ArrowSize"
     "Specifies the arrow size of the mleaderstyle.")
    ("ArrowSymbol"
     "Specifies the arrow symbol of the mleaderstyle.")
    ("AssociativeHatch"
     "Specifies whether the hatch is associative.")
    ("AttachmentPoint"
     "Specifies the attachment point for an MText object.")
    ("Author"
     "Specifies the author of the drawing.")
    ("AutoAudit"
     "Specifies whether AutoCAD should perform an audit after you render a DXFIN or DXBIN interchange command.")
    ("AutomaticPlotLog"
     "Specifies whether to automatically save a Plot or Publish log.")
    ("AutoSaveInterval"
     "Specifies an automatic save interval in minutes.")
    ("AutoSavePath"
     "Specifies the path for the file that is created if you enable automatic save using the AutoSaveInterval property.")
    ("AutoSnapAperture"
     "Toggles the display of the AutoSnap aperture.")
    ("AutoSnapApertureSize"
     "Specifies the size of the AutoSnap aperture.")
    ("AutoSnapMagnet"
     "Toggles the AutoSnap magnet.")
    ("AutoSnapMarker"
     "Toggles the AutoSnap marker.")
    ("AutoSnapMarkerColor"
     "Specifies the color of the AutoSnap marker.")
    ("AutoSnapMarkerSize"
     "Specifies the size of the AutoSnap marker.")
    ("AutoSnapToolTip"
     "Toggles the AutoSnap tooltips.")
    ("AutoTrackingVecColor"
     "Specifies the color of the auto tracking vector.")
    ("AutoTrackTooltip"
     "Toggles the display of the AutoTrack tooltips.")
    ("AxisDirection"
     "Displays the direction of the axis of revolution.")
    ("AxisPosition"
     "Specifies the start point of the axis of revolution.")
    ("BackgroundColor"
     "Specifies the background color of the hatch object.")
    ("BackgroundFill"
     "Specifies whether multiline text has a background fill.")
    ("BackgroundLinesColor"
     "Specifies the color of background lines.")
    ("BackgroundLinesHiddenLine"
     "Specifies the hidden line visibility of background lines.")
    ("BackgroundLinesLayer"
     "Specifies the layer of background lines.")
    ("BackgroundLinesLinetype"
     "Specifies the layer of background lines.")
    ("BackgroundLinesLinetypeScale"
     "Specifies the linetype scale of background lines.")
    ("BackgroundLinesLineweight"
     "Specifies the line weight of background lines.")
    ("BackgroundLinesPlotStyleName"
     "Specifies the plot style name of background lines.")
    ("BackgroundLinesVisible"
     "Specifies the visibility of background lines.")
    ("Backward"
     "Specifies the direction of text.")
    ("Bank"
     "Specifies whether or not the profile curve twists and rotates along a 3D path.")
    ("BasePoint"
     "Specifies the point through which the ray or construction line passes.")
    ("BaseRadius"
     "Specifies the base radius of the helix.")
    ("BatchPlotProgress"
     "Gets the current status of the batch plot, or terminates the batch plot.")
    ("BeepOnError"
     "Specifies if AutoCAD should sound an alarm beep when it detects an invalid entry.")
    ("BigFontFile"
     "Specifies the name of the Big Font file associated with the text or attribute.")
    ("BitFlags"
     "Specifies the bit flag values of a style.")
    ("Block"
     "Specifies the block associated with the layout or multileader style.")
    ("BlockColor"
     "Specifies the block color of the mleaderstyle.")
    ("BlockConnectionType"
     "The types of block connection a multileader can have.")
    ("BlockRotation"
     "Specifies the block rotation value of an mleader style.")
    ("Blocks"
     "Gets the Blocks collection for the drawing.")
    ("BlockScale"
     "Specifies the BlockScale of the mleader style.")
    ("BlockScaling"
     "Specifies the scaling allowed for the block.")
    ("Blue"
     "Specifies the blue component of the True Color.")
    ("BookName"
     "Specifies the book name (if any) of the color.")
    ("BottomHeight"
     "Specifies elevation of section plane bottom extents relative to the object’s elevation.")
    ("BreaksEnabled"
     "Specifies if table breaks are enabled.")
    ("BreakSize"
     "Specifies the BreakSize of the mleader style.")
    ("BreakSpacing"
     "Specifies the break spacing for a table.")
    ("Brightness"
     "Specifies the current brightness value of an image.")
    ("CanonicalMediaName"
     "Specifies the paper size by name.")
    ("Caption"
     "Gets the text that the user sees displayed for the application or a menu item.")
    ("CategoryName"
     "Specifies the category name of a view.")
    ("Center"
     "Specifies the center of an arc, circle, ellipse, view, or viewport.")
    ("CenterMarkSize"
     "Specifies the size of the center mark for radial and diameter dimensions.")
    ("CenterPlot"
     "Specifies the centering of the plot on the media.")
    ("CenterPoint"
     "Specifies the center of the arc.")
    ("CenterType"
     "Specifies the type of center mark for radial and diameter dimensions.")
    ("Centroid"
     "Gets the center of area or mass for a region or solid.")
    ("Check"
     "Specifies the check status for the popup menu item.")
    ("ChordPoint"
     "Specifies the chord point for the arc.")
    ("Circumference"
     "Specifies the circumference of a circle.")
    ("Clipped"
     "Determines if the viewport has been clipped.")
    ("ClippingEnabled"
     "Enables or disables the clipping boundary.")
    ("Closed"
     "Specifies whether the 3D polyline, lightweight polyline, lofted surface, polyline, or spline is open or closed.")
    ("Closed2"
     "Specifies whether the spline is open or closed.")
    ("Color"
     "Specifies the color of an object or layer.")
    ("ColorBookPath"
     "Sets the color book path.")
    ("ColorIndex"
     "Specifies the color index.")
    ("ColorMethod"
     "Specifies the color method.")
    ("ColorName"
     "Specifies the name (if any) of the color.")
    ("ColorScheme"
     "Specifies the color scheme to display point cloud.")
    ("Columns"
     "Specifies the number of columns in a block array or table.")
    ("ColumnSpacing"
     "Specifies the spacing of the columns in a block array.")
    ("ColumnWidth"
     "Specifies the uniform width of all columns in the table.")
    ("CommandDisplayName"
     "Specifies the displayed command name for a button on the toolbar.")
    ("Comment"
     "Specifies the comment to be included with a digital signature.")
    ("Comments"
     "Specifies the comments for the block or drawing.")
    ("ConfigFile"
     "Gets the location of the configuration file used to store hardware device driver information.")
    ("ConfigName"
     "Specifies the plotter configuration name.")
    ("Constant"
     "Specifies whether the attribute or attribute reference is constant or not.")
    ("ConstantWidth"
     "Specifies a global width for all segments in a polyline.")
    ("Constrain"
     "Controls which property is constrained when editing other property values.")
    ("ContentBlockName"
     "The name of the content block.")
    ("ContentBlockType"
     "The type of the content block.")
    ("ContentType"
     "Specifies the content type.")
    ("ContinuousPlotLog"
     "Specifies whether to save a continuous Plot log.")
    ("ContourlinesPerSurface"
     "Specifies the number of contour lines (isolines) per surface on objects.")
    ("Contrast"
     "Specifies the current contrast value of an image or underlay.")
    ("ControlPoints"
     "Specifies the control points of a spline.")
    ("Coordinate"
     "Specifies the coordinate of a single vertex in the object.")
    ("Coordinates"
     "Specifies the coordinates for each vertex in the object.")
    ("Count"
     "Gets the number of items in the object.")
    ("CreaseLevel"
     "Specifies the crease level for the subentity of the SubD mesh.")
    ("CreaseType"
     "Specifies the crease type to apply to the subentity of a SubD mesh.")
    ("CreateBackup"
     "Specifies the use of a backup file.")
    ("CurrentSectionType"
     "Specifies the current section type.")
    ("CursorSize"
     "Specifies the crosshairs size as a percentage of the screen size.")
    ("CurveTangencyLinesColor"
     "Specifies the color of curve tangency lines.")
    ("CurveTangencyLinesLayer"
     "Specifies the layer of curve tangency lines.")
    ("CurveTangencyLinesLinetype"
     "Specifies the linetype of curve tangency lines.")
    ("CurveTangencyLinesLinetypeScale"
     "Specifies the linetype scale of curve tangency lines.")
    ("CurveTangencyLinesLineweight"
     "Specifies the line weight of curve tangency lines.")
    ("CurveTangencyLinesPlotStyleName"
     "Specifies the plot style name of curve tangency lines.")
    ("CurveTangencyLinesVisible"
     "Specifies the visibility of curve tangency lines.")
    ("CustomDictionary"
     "Specifies a custom dictionary to use if you have one.")
    ("CustomIconPath"
     "Specifies the search path for custom icons.")
    ("CustomScale"
     "Specifies the custom scale factor for the viewport.")
    ("CvHullDisplay"
     "Specifies if the control vertices (CV) Hull is displayed for the NURBS surface.")
    ("Database"
     "Gets the database in which the object belongs")
    ("DecimalSeparator"
     "Specifies the character to be used as the decimal separator in decimal dimension and tolerance values.")
    ("DefaultInternetURL"
     "Specifies the default Internet address.")
    ("DefaultOutputDevice"
     "Specifies the default output device for new layouts and model space.")
    ("DefaultPlotStyleForLayer"
     "Specifies the default plot style for Layer 0 for new drawings or drawings created with earlier releases of AutoCAD that have never been saved in AutoCAD 2000 or later format.")
    ("DefaultPlotStyleForObjects"
     "Specifies the default plot style name for newly created objects.")
    ("DefaultPlotStyleTable"
     "Specifies the default plot style table to attach to new drawings.")
    ("DefaultPlotToFilePath"
     "Specifies the default path for plotting to a file.")
    ("Degree"
     "Gets the degree of the spline's polynomial representation.")
    ("Degree2"
     "Specifies the degree of the spline's polynomial representation.")
    ("Delta"
     "Gets the delta of a line.")
    ("DemandLoadARXApp"
     "Specifies whether AutoCAD demand-loads a third-party application if a drawing contains custom objects.")
    ("Description"
     "Specifies the description of an object.")
    ("DestinationBlock"
     "Specifies the destination block for section generation.")
    ("DestinationFile"
     "Specifies the destination file for section generation.")
    ("Diameter"
     "Specifies the diameter of a circle.")
    ("Dictionaries"
     "Gets the Dictionaries collection for the document.")
    ("DimConstrDesc"
     "Specifies a description for the constraint.")
    ("DimConstrExpression"
     "Specifies the expression or value of the constraint.")
    ("DimConstrForm"
     "Specifies the type of constraint.")
    ("DimConstrName"
     "Specifies a name for the constraint.")
    ("DimConstrReference"
     "Specifies the parameter is a reference constraint.")
    ("DimConstrValue"
     "Specifies the value of the constraint.")
    ("DimensionLineColor"
     "Specifies the color of the dimension line for a dimension, leader, or tolerance object.")
    ("DimensionLineExtend"
     "Specifies the distance the dimension line extends beyond the extension line when oblique strokes are drawn instead of arrowheads.")
    ("DimensionLinetype"
     "Specifies the linetype of the dimension line.")
    ("DimensionLineWeight"
     "Specifies the lineweight for the dimension lines.")
    ("DimLine1Suppress"
     "Specifies the suppression of the first dimension line.")
    ("DimLine2Suppress"
     "Specifies the suppression of the second dimension line.")
    ("DimLineInside"
     "Specifies the display of dimension lines inside the extension lines only.")
    ("DimLineSuppress"
     "Specifies the suppression of the dimension line for radial dimensions.")
    ("DimStyles"
     "Gets the DimStyles collection for the document.")
    ("DimTxtDirection"
     "Specifies the direction of the dimension text.")
    ("Direction"
     "Specifies the viewing direction for a 3D visualization of the drawing, or the direction vector of the table.")
    ("DirectionVector"
     "Specifies the direction for the ray, tolerance, or xline through a vector.")
    ("Display"
     "Gets the PreferencesDisplay object.")
    ("DisplayGrips"
     "Controls the display of selection set grips for the Stretch, Move, Rotate, Scale, and Mirror grip modes.")
    ("DisplayGripsWithinBlocks"
     "Controls the assignment of grips within blocks.")
    ("DisplayLayoutTabs"
     "Specifies whether to display the Model and layout tabs in the drawing editor.")
    ("DisplayLocked"
     "Specifies whether the viewport is locked.")
    ("DisplayOLEScale"
     "Determines whether the OLE scaling dialog is displayed when OLE objects are inserted into a drawing.")
    ("DisplayScreenMenu"
     "Specifies whether to display the screen menu on the right side of the drawing window. (Obsolete)")
    ("DisplayScrollBars"
     "Specifies whether to display scroll bars at the bottom and right sides of the drawing window.")
    ("DisplaySilhouette"
     "Controls whether silhouette curves of solid objects are displayed in Wireframe mode.")
    ("DockedVisibleLines"
     "Specifies the number of lines of text to display in the command window. (Obsolete)")
    ("DockStatus"
     "Specifies whether the toolbar is docked or floating.")
    ("Document"
     "Gets the document (drawing) in which the object belongs.")
    ("Documents"
     "Gets the Documents collection.")
    ("DogLegged"
     "The status of the dog-leg.")
    ("DoglegLength"
     "The length of the dog-leg.")
    ("Drafting"
     "Gets the PreferencesDrafting object.")
    ("DrawingDirection"
     "Specifies the direction in which the MText paragraph is to be read.")
    ("DrawLeaderOrderType"
     "Specifies the drawLeaderOrderType of the mleaderstyle.")
    ("DrawMLeaderOrderType"
     "Specifies the drawMLeaderOrderType of the mleaderstyle.")
    ("DriversPath"
     "Specifies the directory in which AutoCAD looks for ADI device drivers for the video display, pointing devices, printers, and plotters.")
    ("DWFFormat"
     "Specifies the format of the DWF file.")
    ("EdgeExtensionDistances"
     "Specifies the distance by which the edges of surface are extended to merge to an existing surface.")
    ("EffectiveName"
     "Specifies the original block name.")
    ("Elevation"
     "Specifies the current elevation of the hatch, polyline, or section.")
    ("ElevationModelSpace"
     "Specifies the elevation setting in model space.")
    ("ElevationPaperSpace"
     "Specifies the elevation setting in paper space.")
    ("Enable"
     "Enables the popup menu item. Specifies the name of the object.")
    ("EnableBlockRotation"
     "Specifies the EnableBlockRotation of the mleaderstyle.")
    ("EnableBlockScale"
     "Specifies the EnableBlockScale of the mleaderstyle.")
    ("EnableBreak"
     "Toggles table breaking.")
    ("EnableDogleg"
     "Specifies the enableDogleg of the mleaderstyle.")
    ("EnableFrameText"
     "Specifies the EnableFrameText of the mleaderstyle.")
    ("EnableLanding"
     "Specifies the enableLanding of the mleaderstyle.")
    ("EnableShadowDisplay"
     "Specifies whether the shadow display property is enabled for the object.")
    ("EnableStartupDialog"
     "Specifies whether a startup dialog box is displayed when AutoCAD is launched or a new drawing is created.")
    ("EndAngle"
     "Specifies the end angle of an arc or ellipse.")
    ("EndDraftAngle"
     "Specifies the draft angle of the surface for the last cross section.")
    ("EndDraftMagnitude"
     "Specifies the draft magnitude of the surface for the last cross section.")
    ("EndParameter"
     "Specifies the end parameter for an ellipse.")
    ("EndPoint"
     "Specifies the endpoint for the arc, line, or ellipse.")
    ("EndSmoothContinuity"
     "Specifies the tangency and curvature of the last cross section.")
    ("EndSmoothMagnitude"
     "Specifies the size of the curve of the last cross section.")
    ("EndSubMenuLevel"
     "Specifies the last item in a submenu.")
    ("EndTangent"
     "Specifies the end tangent of the spline as a directional vector.")
    ("EnterpriseMenuFile"
     "Specifies the location of the enterprise customization (CUIx) file.")
    ("EntityColor"
     "Specifies the color value of the true color.")
    ("EntityTransparency"
     "Specifies the transparency value for the entity.")
    ("Explodable"
     "Specifies whether the block can be exploded.")
    ("ExtensionLineColor"
     "Specifies the color for dimension extension lines.")
    ("ExtensionLineExtend"
     "Specifies the distance the extension line extends beyond the dimension line.")
    ("ExtensionLineOffset"
     "Specifies the distance the extension lines are offset from the origin points.")
    ("ExtensionLineWeight"
     "Specifies the lineweight for the extension lines.")
    ("ExtLine1EndPoint"
     "Specifies the endpoint of the first extension line.")
    ("ExtLine1Linetype"
     "Specifies the linetype of the first extension line.")
    ("ExtLine1Point"
     "Specifies the origin of extension line 1.")
    ("ExtLine1StartPoint"
     "Specifies the start point of the first extension line.")
    ("ExtLine1Suppress"
     "Specifies the suppression of the first extension line.")
    ("ExtLine2EndPoint"
     "Specifies the endpoint of the second extension line.")
    ("ExtLine2Linetype"
     "Specifies the linetype of the second extension line.")
    ("ExtLine2Point"
     "Specifies the origin of extension line 2.")
    ("ExtLine2StartPoint"
     "Specifies the start point of the second extension line.")
    ("ExtLine2Suppress"
     "Specifies the suppression of the second extension line.")
    ("ExtLineFixedLen"
     "Set extension line fixed length.")
    ("ExtLineFixedLenSuppress"
     "Sets suppression of extension line fixed length On or Off.")
    ("FaceCount"
     "Returns the number of faces in the SubD mesh.")
    ("Fade"
     "Specifies the current fade value of a raster or underlay image.")
    ("Feature"
     "Specifies the feature name of an entry in the File Dependency List.")
    ("FieldLength"
     "Specifies the field length of the attribute.")
    ("File"
     "Specifies the path to the underlay file.")
    ("FileDependencies"
     "Returns the file dependency manager object.")
    ("FileName"
     "Specifies the file name of an entry in the File Dependency List.")
    ("Files"
     "Gets the PreferencesFiles object.")
    ("FileSize"
     "Specifies the file size of an entry in the File Dependency List.")
    ("FingerprintGUID"
     "Specifies the Fingerprint GUID of an entry in the File Dependency List.")
    ("FirstSegmentAngleConstraint"
     "Specifies the FirstSegmentAngleConstraint of the mleaderstyle.")
    ("Fit"
     "Specifies the placement of text and arrowheads inside or outside extension lines, based on the available space between the extension lines.")
    ("FitPoints"
     "Specifies the fit points of a spline.")
    ("FitTolerance"
     "Refits the spline to the existing points with new tolerance values.")
    ("FloatingRows"
     "Specifies the number of rows for a floating toolbar.")
    ("FlowDirection"
     "Specifies whether the title and header rows are at the bottom or the top of the table.")
    ("Flyout"
     "Gets the toolbar associated with a flyout toolbar item.")
    ("FontFile"
     "Specifies the primary font file name and the path.")
    ("FontFileMap"
     "Specifies the location of the file that defines how AutoCAD should convert unfound fonts.")
    ("ForceLineInside"
     "Specifies whether a dimension line is drawn between the extension lines even when the text is placed outside the extension lines.")
    ("ForegroundLinesColor"
     "Specifies the color of foreground lines.")
    ("ForegroundLinesEdgeTransparency"
     "Specifies the edge transparency of foreground lines.")
    ("ForegroundLinesFaceTransparency"
     "Specifies the face transparency of foreground lines.")
    ("ForegroundLinesHiddenLine"
     "Specifies the hidden line visibility of foreground lines.")
    ("ForegroundLinesLayer"
     "Specifies the layer of foreground lines.")
    ("ForegroundLinesLinetype"
     "Specifies the linetype of foreground lines.")
    ("ForegroundLinesLinetypeScale"
     "Specifies the linetype scale of foreground lines.")
    ("ForegroundLinesLineweight"
     "Specifies the lineweight of foreground lines.")
    ("ForegroundLinesPlotStyleName"
     "Specifies the plot style name of foreground lines.")
    ("ForegroundLinesVisible"
     "Specifies the visibility of foreground lines.")
    ("FoundPath"
     "Specifies an alternate path of an entry in the File Dependency List.")
    ("FractionFormat"
     "Specifies the format of fractional values in dimensions and tolerances.")
    ("Freeze"
     "Specifies the freeze status of a layer.")
    ("FullCRCValidation"
     "Specifies whether a cyclic redundancy check (CRC) should be performed each time an object is read into the drawing.")
    ("FullFileName"
     "Specifies the saved full path name of an entry in the File Dependency List.")
    ("FullName"
     "Gets the name of the application or document, including the path.")
    ("FullScreenTrackingVector"
     "Toggles the display of full-screen tracking vectors.")
    ("GenerationOptions"
     "Specifies the section generation options.")
    ("GeoImageBrightness"
     "Specifies the brightness value of the embedded image.")
    ("GeoImageContrast"
     "Specifies the contrast value of the embedded image.")
    ("GeoImageFade"
     "Specifies the current fade value of the embedded image.")
    ("GeoImageHeight"
     "Specifies the height of the embedded image.")
    ("GeoImagePosition"
     "Specifies the bottom left corner of the embedded image.")
    ("GeoImageWidth"
     "Specifies the width of the embedded image.")
    ("Geolocate"
     "Specifies whether the point cloud is geographically located.")
    ("GradientAngle"
     "Specifies the gradient angle.")
    ("GradientCentered"
     "Specifies whether the gradient is centered.")
    ("GradientColor1"
     "Specifies the start color of the gradient.")
    ("GradientColor2"
     "Specifies the end color of the gradient.")
    ("GradientName"
     "Specifies the pattern name of the gradient.")
    ("GraphicsWinLayoutBackgrndColor"
     "Specifies the background color for the paper space layouts.")
    ("GraphicsWinModelBackgrndColor"
     "Specifies the background color for the model space window.")
    ("Green"
     "Specifies the green component of the True Color.")
    ("GridOn"
     "Specifies the status of the viewport grid.")
    ("GripColorSelected"
     "Specifies the color of selected grips.")
    ("GripColorUnselected"
     "Specifies the color of unselected grips.")
    ("GripSize"
     "Specifies the size of grips.")
    ("Groups"
     "Gets the Groups collection for the document.")
    ("Handle"
     "Gets the handle of an object.")
    ("HasAttributes"
     "Specifies whether the block has any attributes in it.")
    ("HasExtensionDictionary"
     "Determines whether the object has an extension dictionary associated with it.")
    ("HasLeader"
     "Specifies whether the dimension has a leader.")
    ("HasSheetView"
     "Specifies whether the viewport is linked to a corresponding sheet view.")
    ("HasSubSelection"
     "Specifies whether the table contains a subselection set.")
    ("HasVpAssociation"
     "Specifies whether the view is associated with a paper space viewport.")
    ("HatchObjectType"
     "Specifies the type of the hatch, classic or gradient.")
    ("HatchStyle"
     "Specifies the hatch style.")
    ("HeaderSuppressed"
     "Specifies whether the header of the table is suppressed.")
    ("Height"
     "Changes the height of the object.")
    ("HelpFilePath"
     "Specifies the location of the AutoCAD Help file.")
    ("HelpString"
     "Specifies the Help string for the toolbar, toolbar item, or menu item.")
    ("History"
     "Specifies whether history is saved.")
    ("HistoryLines"
     "Specifies the number of lines of text in the text window to keep in memory.")
    ("HorizontalTextPosition"
     "Specifies the horizontal justification for dimension text.")
    ("HorzCellMargin"
     "Specifies the value of the horizontal margin of cells.")
    ("HWND"
     "Gets the window handle of the window frame.")
    ("HWND32"
     "Gets the window handle of the window frame for a 64-bit system. (Obsolete)")
    ("HyperlinkBase"
     "Specifies the base address used for all relative links inserted within the drawing.")
    ("HyperlinkDisplayCursor"
     "Toggles the display of the hyperlink cursor and shortcut menu.")
    ("Hyperlinks"
     "Gets the Hyperlinks collection for an entity.")
    ("ImageFile"
     "Specifies the full path and file name of the raster image file.")
    ("ImageFrameHighlight"
     "Controls the display of raster images during selection.")
    ("ImageHeight"
     "Specifies the height of the raster image.")
    ("ImageVisibility"
     "Specifies whether image visibility is on or off.")
    ("ImageWidth"
     "Specifies the width of the raster image.")
    ("IncrementalSavePercent"
     "Specifies the percentage of wasted space allowed in a drawing file.")
    ("Index"
     "Specifies the index of the menu, toolbar item, or an entry in the File Dependency List.")
    ("IndicatorFillColor"
     "Specifies color of section plane when shading is turned on.")
    ("IndicatorTransparency"
     "Specifies transparency of section plane when shading is turned on.")
    ("InsertionPoint"
     "Insertion point for a tolerance, text, block, or shape, and the origin (upper-left corner) of an OLE object.")
    ("InsUnits"
     "Specifies the insert units saved with the block.")
    ("InsUnitsFactor"
     "Specifies the conversion factor between block units and drawing units.")
    ("IntensityColorScheme"
     "Specifies the color scheme to use for displaying intensity values.")
    ("IntersectionBoundaryColor"
     "Specifies the color of intersection boundary.")
    ("IntersectionBoundaryDivisionLines"
     "Specifies whether division lines are shown in intersection boundary.")
    ("IntersectionBoundaryLayer"
     "Specifies the layer of intersection boundary.")
    ("IntersectionBoundaryLinetype"
     "Specifies the linetype of intersection boundary.")
    ("IntersectionBoundaryLinetypeScale"
     "Specifies the linetype scale of intersection boundary.")
    ("IntersectionBoundaryLineweight"
     "Specifies the lineweight of intersection boundary.")
    ("IntersectionBoundaryPlotStyleName"
     "Specifies the plot style name of intersection boundary.")
    ("IntersectionBoundaryVisible"
     "Specifies the visibility of intersection boundary.")
    ("IntersectionFillColor"
     "Specifies the color of intersection fill.")
    ("IntersectionFillFaceTransparency"
     "Specifies the face transparency of intersection fill.")
    ("IntersectionFillHatchAngle"
     "Specifies the hatch angle for intersection fill.")
    ("IntersectionFillHatchPatternName"
     "Specifies the hatch pattern name for intersection fill.")
    ("IntersectionFillHatchPatternType"
     "Specifies the hatch pattern type for intersection fill.")
    ("IntersectionFillHatchScale"
     "Specifies the hatch scale for intersection fill.")
    ("IntersectionFillHatchSpacing"
     "Specifies the hatch spacing for intersection fill.")
    ("IntersectionFillLayer"
     "Specifies the layer of intersection fill.")
    ("IntersectionFillLinetype"
     "Specifies the linetype of intersection fill.")
    ("IntersectionFillLinetypeScale"
     "Specifies the linetype scale of intersection fill.")
    ("IntersectionFillLineweight"
     "Specifies the lineweight of intersection fill.")
    ("IntersectionFillPlotStyleName"
     "Specifies the plot style name of intersection fill.")
    ("IntersectionFillVisible"
     "Specifies the visibility of intersection fill.")
    ("Invisible"
     "Specifies whether the attribute or attribute reference is invisible.")
    ("IsCloned"
     "Determines whether the source object in a CopyObjects operation has been cloned.")
    ("IsDynamicBlock"
     "Specifies whether this is a dynamic block.")
    ("IsLayout"
     "Determines whether the given block is a layout block.")
    ("IsModified"
     "Specifies whether an entry in the File Dependency List was modified.")
    ("ISOPenWidth"
     "Specifies the ISO pen width of an ISO hatch pattern.")
    ("IsOwnerXlated"
     "Determines whether the owning object in a CopyObjects operation has been translated.")
    ("IsPartial"
     "Specifies whether the dimension is for a partial arc.")
    ("IsPeriodic"
     "Determines whether the given spline is periodic.")
    ("IsPlanar"
     "Determines whether the given spline is planar.")
    ("IsPrimary"
     "Determines whether the source object in a CopyObjects operation was part of the primary set of objects being copied, or if it was simply owned by a member in the primary set.")
    ("IsQuiescent"
     "Checks whether AutoCAD is idle and ready to accept automation calls from out-of-process applications.")
    ("IsRational"
     "Determines whether the given spline is rational.")
    ("Issuer"
     "Specifies the issuer name of the digital certificate.")
    ("IsXRef"
     "Determines whether the given block is an XRef block.")
    ("ItemName"
     "Specifies the item of the underlay file.")
    ("JogAngle"
     "Specifies the jog angle.")
    ("JogLocation"
     "Specifies the jog location.")
    ("Justification"
     "Specifies the justification of the MLine.")
    ("Key"
     "The object ID of the source object in the CopyObjects operation.")
    ("Key32"
     "The object ID of the source object in the CopyObjects operation for a 64-bit system. (Obsolete)")
    ("KeyboardAccelerator"
     "Specifies the Windows standard or AutoCAD classic keyboard.")
    ("KeyboardPriority"
     "Controls how AutoCAD responds to the input of coordinate data.")
    ("KeyLength"
     "Specifies the length of the encryption key.")
    ("Keywords"
     "Specifies the keywords you want to use to locate the drawing.")
    ("KnotParameterization"
     "Specifies the knot parameterization for a spline created by fit points.")
    ("Knots"
     "Gets the knot vector for a spline.")
    ("Label"
     "Specifies the content and formatting of menu items as they appear to the user.")
    ("LabelBlockId"
     "Returns and sets the label block ID associated with the viewport.")
    ("LabelBlockId32"
     "Returns and sets the label block ID associated with the viewport for a 64-bit system. (Obsolete)")
    ("LandingGap"
     "Specifies the text landing gap.")
    ("LargeButtons"
     "Specifies whether the toolbar button is large or small.")
    ("LastHeight"
     "Specifies the last text height used.")
    ("LastSavedBy"
     "Specifies the name of the last person who modified the file.")
    ("Latitude"
     "Specifies the latitude of the position marker.")
    ("Layer"
     "Specifies the layer for an object.")
    ("LayerOn"
     "Specifies the state of a layer.")
    ("LayerPropertyOverrides"
     "Specifies whether the viewport has layer property overrides.")
    ("Layers"
     "Gets the Layers collection for the document.")
    ("LayerState"
     "Specifies the name of the layer state of the view.")
    ("Layout"
     "Specifies the layout associated with the model space, paper space, or block object.")
    ("LayoutCreateViewport"
     "Toggles the automatic creation of a viewport for new layouts.")
    ("LayoutCrosshairColor"
     "Specifies the color of the crosshairs and text for paper space layouts.")
    ("LayoutDisplayMargins"
     "Toggles the display of margins in layouts.")
    ("LayoutDisplayPaper"
     "Toggles the display of the paper background in layouts.")
    ("LayoutDisplayPaperShadow"
     "Toggles the display of the paper background shadow in layouts.")
    ("LayoutID"
     "Specifies the layout of the view.")
    ("LayoutID32"
     "Specifies the layout of the view for a 64-bit system. (Obsolete)")
    ("Layouts"
     "Gets the Layouts collection for the document.")
    ("LayoutShowPlotSetup"
     "Toggles the display of the Plot Setup dialog when a new layout is created.")
    ("Leader1Point"
     "Specifies the origin of leader 1.")
    ("Leader2Point"
     "Specifies the origin of leader 2.")
    ("LeaderCount"
     "Gets the number of leaderLine clusters in this Mleader object.")
    ("LeaderLength"
     "Specifies the length of the leader on the diameter or radius dimension.")
    ("LeaderLineColor"
     "Specifies the color of the leader lines.")
    ("LeaderLinetype"
     "Specifies the type of the leader lines.")
    ("LeaderLineTypeId"
     "Specifies the linetype of leader lines of the mleaderstyle.")
    ("LeaderLineWeight"
     "Specifies the lineweight of the leader lines.")
    ("LeaderType"
     "Specifies the type of the leader.")
    ("Left"
     "Specifies the left edge of a toolbar.")
    ("Length"
     "Gets the length of an object.")
    ("LensLength"
     "Specifies the lens length used in perspective viewing.")
    ("Limits"
     "Specifies the drawing limits.")
    ("LinearScaleFactor"
     "Specifies a global scale factor for linear dimensioning measurements.")
    ("LineSpacingDistance"
     "Specifies the spacing of multiline text.")
    ("LineSpacingFactor"
     "Specifies the relative line spacing factor for the MText object.")
    ("LineSpacingStyle"
     "Specifies the line spacing style for the MText object.")
    ("Linetype"
     "Specifies the linetype of an object.")
    ("LinetypeGeneration"
     "Specifies the linetype generation of a 2D polyline or a lightweight polyline.")
    ("Linetypes"
     "Gets the Linetypes collection for the document.")
    ("LinetypeScale"
     "Specifies the linetype scale of an object.")
    ("Lineweight"
     "Specifies the lineweight of an individual object or the default lineweight for the drawing.")
    ("LineweightDisplay"
     "Specifies whether lineweights are displayed in model space for the drawing.")
    ("LiveSectionEnabled"
     "Turns live section on or off for this section object.")
    ("LoadAcadLspInAllDocuments"
     "Specifies whether acad.lsp is loaded at startup or with each drawing.")
    ("LocaleID"
     "Gets the locale ID of the current AutoCAD session.")
    ("Lock"
     "Locks or unlocks a layer.")
    ("LockAspectRatio"
     "Ensures that the width and height of the object stay in proportion.")
    ("Locked"
     "Specifies if the point cloud is locked.")
    ("LockPosition"
     "Specifies whether the attribute or attribute reference may be moved relative to the geometry in the block.")
    ("LogFileOn"
     "Specifies whether the contents of the text window are written to a log file.")
    ("LogFilePath"
     "Specifies the location for the log file.")
    ("Longitude"
     "Specifies the longitude of the position marker.")
    ("LowerLeftCorner"
     "Gets the lower-left corner of the current active viewport.")
    ("Macro"
     "Specifies the macro for the menu or toolbar item.")
    ("MainDictionary"
     "Specifies the current dictionary to use for spell checking.")
    ("MaintainAssociativity"
     "Specifies if a surface maintains its associativity with another surface.")
    ("MajorAxis"
     "Specifies the direction of the major axis of the ellipse.")
    ("MajorRadius"
     "Specifies the length of the major axis of the ellipse.")
    ("Mask"
     "Specifies the layer properties to be restored.")
    ("Material"
     "Specifies the name of the material.")
    ("Materials"
     "Returns the materials collection for the database.")
    ("MaxActiveViewports"
     "Specifies the maximum number of active viewports.")
    ("MaxAutoCADWindow"
     "Specifies whether the AutoCAD window should fill the entire screen area when you start.")
    ("MaxLeaderSegmentsPoints"
     "Specifies the maxLeaderSegmentsPoints of the mleaderstyle.")
    ("MClose"
     "Specifies whether the PolygonMesh is closed in the M direction.")
    ("MDensity"
     "Specifies the surface density of a PolygonMesh in the M direction.")
    ("Measurement"
     "Gets the measurement for the dimension.")
    ("MenuBar"
     "Gets the MenuBar object for the session.")
    ("MenuFile"
     "Specifies the location of the AutoCAD customization file for the session.")
    ("MenuFileName"
     "Gets the customization file name where the menu group is located.")
    ("MenuGroups"
     "Gets the MenuGroups collection for the session.")
    ("Menus"
     "Gets the PopupMenus collection.")
    ("MinimumTableHeight"
     "Specifies the minimum height of the table.")
    ("MinimumTableWidth"
     "Specifies the minimum width of the table.")
    ("MinorAxis"
     "Specifies the direction of the minor axis of an ellipse.")
    ("MinorRadius"
     "Specifies the length of the minor axis of the ellipse.")
    ("MLineScale"
     "Specifies the scale of the MLine.")
    ("Mode"
     "Specifies the mode of the attribute definition.")
    ("ModelCrosshairColor"
     "Specifies the color of the crosshairs and text for model space.")
    ("ModelSpace"
     "Gets the ModelSpace collection for the document.")
    ("ModelType"
     "Specifies whether a plot configuration applies to model space or to all layouts.")
    ("ModelView"
     "Returns and sets the model view associated with the viewport.")
    ("MomentOfInertia"
     "Gets the moment of inertia for the solid.")
    ("Monochrome"
     "Determines whether underlay is monochrome.")
    ("MRUNumber"
     "Specifies the number of most recently used files that is shown in the File menu.")
    ("MSpace"
     "Allows editing of the model from floating paper space viewports.")
    ("MTextAttribute"
     "Determines if the attribute is multiline.")
    ("MTextAttributeContent"
     "Gets the multiline attribute content.")
    ("MTextBoundaryWidth"
     "Determines the width of the text boundary for the multiline attribute.")
    ("MTextDrawingDirection"
     "Determines the drawing direction for the multiline attribute.")
    ("MVertexCount"
     "Gets the vertex count in the M direction for a PolygonMesh.")
    ("Name"
     "Specifies the name of the object.")
    ("NameNoMnemonic"
     "Specifies the name of the popup menu without the underscore mnemonic.")
    ("NClose"
     "Specifies whether the PolygonMesh is closed in the N direction.")
    ("NDensity"
     "Specifies the smooth surface density of a PolygonMesh in the N direction.")
    ("Normal"
     "Specifies the three-dimensional normal unit vector for the object.")
    ("Notes"
     "Specifies the notes for the position marker.")
    ("NumberOfControlPoints"
     "Gets the number of control points of the spline.")
    ("NumberOfCopies"
     "Specifies the number of copies to plot.")
    ("NumberOfFaces"
     "Gets the number of faces for the PolyfaceMesh.")
    ("NumberOfFitPoints"
     "Gets the number of fit points of the spline.")
    ("NumberOfLoops"
     "Gets the number of loops in the hatch boundary.")
    ("NumberOfVertices"
     "Gets the number of vertices for the PolyfaceMesh.")
    ("NumCellStyles"
     "Gets the number of cell styles a table has.")
    ("NumCrossSections"
     "Gets the number of cross-section curves used.")
    ("NumGuidePaths"
     "Gets the number of guide paths used.")
    ("NumVertices"
     "Gets the number of vertices in the section line.")
    ("NVertexCount"
     "Gets the vertex count in the N direction for a PolygonMesh.")
    ("ObjectID"
     "Gets the object ID.")
    ("ObjectID32"
     "Gets the object ID for a 64-bit system. (Obsolete)")
    ("ObjectName"
     "Gets the AutoCAD class name of the object.")
    ("ObjectSnapMode"
     "Specifies the setting of the object snap mode.")
    ("ObjectSortByPlotting"
     "Toggles sorting of drawing objects by plotting order.")
    ("ObjectSortByPSOutput"
     "Toggles sorting of drawing objects by PostScript output order.")
    ("ObjectSortByRedraws"
     "Toggles sorting of drawing objects by redraw order.")
    ("ObjectSortByRegens"
     "Toggles sorting of drawing objects by regeneration order.")
    ("ObjectSortBySelection"
     "Toggles sorting of drawing objects by object selection.")
    ("ObjectSortBySnap"
     "Toggles sorting of drawing objects by object snap.")
    ("ObliqueAngle"
     "Specifies the oblique angle of the object.")
    ("OleItemType"
     "Specifies whether the OLE object is linked to the original pasted file when opening the object for editing.")
    ("OLELaunch"
     "Determines whether to launch the parent application when plotting OLE objects.")
    ("OlePlotQuality"
     "Controls the plot quality of an OLE object based on the file type selected from the list.")
    ("OLEQuality"
     "Specifies the plot quality of OLE objects.")
    ("OleSourceApp"
     "Specifies the application for editing the OLE object.")
    ("OnMenuBar"
     "Determines if the specified popup menu is on the menu bar.")
    ("OpenSave"
     "Gets the PreferencesOpenSave object.")
    ("Origin"
     "Specifies the origin of the UCS, block, hatch, or raster image in WCS coordinates.")
    ("OrthoOn"
     "Specifies the status of the Isometric snap mode for the viewport.")
    ("Output"
     "Gets the PreferencesOutput object.")
    ("OverrideCenter"
     "Specifies the override center location.")
    ("OverwritePropChanged"
     "Indicates whether properties were changed.")
    ("OwnerID"
     "Gets the object ID of the owner (parent) object.")
    ("OwnerID32"
     "Gets the object ID of the owner (parent) object for 64-bit systems. (Obsolete)")
    ("PageSetupOverridesTemplateFile"
     "Specifies the default template for Page Setup overrides.")
    ("PaperSpace"
     "Gets the PaperSpace collection for the document.")
    ("PaperUnits"
     "Specifies the units for the display of layout or plot configuration properties.")
    ("Parent"
     "Gets the parent of the object.")
    ("Password"
     "Specifies the encryption password.")
    ("Path"
     "Gets the path of the block, document, application, or external reference.")
    ("PatternAngle"
     "Specifies the angle of the hatch pattern.")
    ("PatternDouble"
     "Specifies if the user-defined hatch is double-hatched.")
    ("PatternName"
     "Specifies the hatch pattern name.")
    ("PatternScale"
     "Specifies the hatch pattern scale.")
    ("PatternSpace"
     "Specifies the user-defined hatch pattern spacing.")
    ("PatternType"
     "Gets the pattern type used for the hatch.")
    ("Perimeter"
     "Gets the total length of the inner and outer region loops.")
    ("Periodic"
     "Specifies that a smooth and closed surface is created without a kink if it is reshaped.")
    ("PickAdd"
     "Determines if objects are added to the selection set using the Shift key.")
    ("PickAuto"
     "Controls automatic windowing at the Select Objects prompt.")
    ("PickBoxSize"
     "Specifies the size of the object selection target.")
    ("PickDrag"
     "Controls the method of drawing a selection window.")
    ("PickFirst"
     "Determines if you select objects before (noun-verb selection) or after you issue a command.")
    ("PickfirstSelectionSet"
     "Gets the pickfirst selection set.")
    ("PickGroup"
     "Determines if picking a single object in a group selects the entire group.")
    ("Plot"
     "Gets the Plot object for the document.")
    ("PlotConfigurations"
     "Gets the PlotConfigurations collection for the document.")
    ("PlotHidden"
     "Specifies if objects are to be hidden during a plot.")
    ("PlotLegacy"
     "Toggles whether legacy plot scripts are allowed to run.")
    ("PlotLogFilePath"
     "Specifies the path of the Plot log file.")
    ("PlotOrigin"
     "Specifies the origin of the UCS, block, layout, or raster image in WCS coordinates.")
    ("PlotPolicy"
     "Determines whether an object's color property is associated with its plot style name when a new drawing is created.")
    ("PlotRotation"
     "Specifies the rotation angle for the layout or plot configuration.")
    ("PlotStyleName"
     "Specifies the plot style name for an object, group of objects, or layer.")
    ("Plottable"
     "Specifies if the layer is plottable.")
    ("PlotType"
     "Specifies the type of layout or plot configuration.")
    ("PlotViewportBorders"
     "Specifies if the viewport borders are to be plotted.")
    ("PlotViewportsFirst"
     "Specifies if all geometry in paper space viewports is plotted first.")
    ("PlotWithLineweights"
     "Specifies whether objects plot with the lineweights they are assigned in the plot file, or with the lineweights in the drawing file.")
    ("PlotWithPlotStyles"
     "Specifies whether or not to plot using the plot styles that are applied to objects and defined in the plot style table.")
    ("PolarTrackingVector"
     "Toggles the display of polar tracking vectors.")
    ("Position"
     "Specifies the X, Y, Z coordinate for center of the base or center of the solid, or the origin for the DWF underlay.")
    ("PostScriptPrologFile"
     "Specifies a name for a customized prolog section in the acad.psf file.")
    ("Preferences"
     "Gets the Preferences object.")
    ("Preset"
     "Specifies if the attribute is preset.")
    ("PrimaryUnitsPrecision"
     "Specifies the number of decimal places displayed for the primary units of a dimension or tolerance.")
    ("PrincipalDirections"
     "Gets the principal directions of the solid or region.")
    ("PrincipalMoments"
     "Gets the principal moments property of the solid or region.")
    ("PrinterConfigPath"
     "Specifies the location for printer configuration files.")
    ("PrinterDescPath"
     "Specifies the location for printer description files.")
    ("PrinterPaperSizeAlert"
     "Specifies whether to alert the user when a layout is configured with a paper size that is different than the default setting for the PC3 file.")
    ("PrinterSpoolAlert"
     "Specifies whether to alert the user when the output to a device must be spooled through a system printer due to a conflict with the I/O port.")
    ("PrinterStyleSheetPath"
     "Specifies the location for printer style sheet files.")
    ("PrintFile"
     "Specifies an alternate name to use for the temporary plot file name.")
    ("PrintSpoolerPath"
     "Specifies the directory for the print spool files. AutoCAD writes the plot to this location.")
    ("PrintSpoolExecutable"
     "Specifies the application to use for print spooling.")
    ("ProductOfInertia"
     "Gets the product of inertia of the solid or region.")
    ("ProfileRotation"
     "Specifies the rotation of the sweep profile.")
    ("Profiles"
     "Gets the PreferencesProfiles object.")
    ("PromptString"
     "Specifies the prompt string for an attribute.")
    ("PropertyName"
     "Specifies the name for the property.")
    ("ProviderName"
     "Specifies the encryption provider name.")
    ("ProviderType"
     "Specifies the encryption provider type.")
    ("ProxyImage"
     "Controls the display of objects in a drawing that were created in a third-party application.")
    ("QNewTemplateFile"
     "Sets the default template file name for the QNEW command.")
    ("QuietErrorMode"
     "Toggles the quiet error mode for plot-error reporting.")
    ("Rows"
     "Specifies the number of rows in a block array or table.")
    ("RadiiOfGyration"
     "Gets the radius of gyration of the solid or region.")
    ("Radius"
     "Specifies the radius of an arc or circle.")
    ("RadiusRatio"
     "Specifies the major to minor axis ratio of an ellipse.")
    ("ReadOnly"
     "Specifies if the document or property is read-only or read-write.")
    ("Red"
     "Specifies the red component of the True Color.")
    ("ReferenceCount"
     "Specifies the reference count of an entry in the File Dependency List.")
    ("RegenerateTableSuppressed"
     "Enables or disables regeneration of the table block.")
    ("RegisteredApplications"
     "Gets the RegisteredApplications collection for the document.")
    ("RemoveHiddenLines"
     "Specifies if hidden lines are to be plotted on a paper space viewport. (Obsolete)")
    ("RenderSmoothness"
     "Specifies the smoothness of shaded, rendered, and hidden line-removed objects.")
    ("RepeatBottomLabels"
     "Determines whether the bottom set of label rows is repeated at the bottom of each broken table part.")
    ("RepeatTopLabels"
     "Determines whether the first set of label rows will be repeated at the top of each broken table part.")
    ("RevisionNumber"
     "Specifies the revision number.")
    ("RevolutionAngle"
     "Specifies the angle of revolution.")
    ("Rotation"
     "Specifies the rotation angle for the object.")
    ("RoundDistance"
     "Specifies the rounding of dimension units.")
    ("RowHeight"
     "Specifies a uniform height for all rows in the table.")
    ("RowSpacing"
     "Specifies the spacing of the rows in a block array.")
    ("SaveAsType"
     "Specifies the drawing type for saving the drawing.")
    ("Saved"
     "Specifies if the document has any unsaved changes.")
    ("SavePreviewThumbnail"
     "Specifies if BMP preview images are saved with the drawing.")
    ("Scale"
     "Specifies the scale factor from start to the end of the sweep path.")
    ("ScaleFactor"
     "Specifies the scale factor for the object.")
    ("ScaleHeight"
     "Specifies the height of the object as a percentage of its original height.")
    ("ScaleLineweights"
     "Specifies if the lineweight is scaled with the rest of the geometry when a layout is printed.")
    ("ScaleWidth"
     "Specifies the width of the object as a percentage of its original width.")
    ("SCMCommandMode"
     "Determines right-click functionality in the drawing area while in Command mode, which means that a command is currently in progress.")
    ("SCMDefaultMode"
     "Determines right-click functionality in the drawing area while in Default mode, which means that no objects are selected and no commands are in progress.")
    ("SCMEditMode"
     "Determines right-click functionality in the drawing area while in Edit mode, which means that one or more objects are selected and no commands are in progress.")
    ("SCMTimeMode"
     "Controls time-sensitive right-click behavior.")
    ("SCMTimeValue"
     "Controls time-sensitive right-click behavior by setting the duration of the long click that displays a shortcut menu.")
    ("SecondPoint"
     "Specifies the second point of the ray or xline.")
    ("SecondSegmentAngleConstraint"
     "Specifies the SecondSegmentAngleConstraint of the mleaderstyle.")
    ("SectionManager"
     "Returns the section manager object.")
    ("SegmentPerPolyline"
     "Specifies the number of line segments to be generated for each polyline curve.")
    ("Selection"
     "Gets the PreferencesSelection object.")
    ("SelectionSets"
     "Gets the SelectionSets collection for the document.")
    ("SerialNumber"
     "Specifies the serial number of the digital certificate.")
    ("Settings"
     "Retrieves the section geometry settings for the Section object.")
    ("ShadePlot"
     "Specifies the shaded viewport plotting mode of a viewport.")
    ("ShadowDisplay"
     "Specifies the shadow display property of the object.")
    ("SheetView"
     "Returns and sets the sheet view associated with the viewport.")
    ("ShortcutMenu"
     "Determines if the specified popup menu is the shortcut menu.")
    ("ShortCutMenuDisplay"
     "Controls whether right-clicking in the drawing area displays a shortcut menu or issues Enter.")
    ("Show"
     "Specifies whether the property is shown in the user interface.")
    ("ShowAssociativity"
     "Specifies if dependent surfaces are highlighted when the surface is selected.")
    ("ShowClipped"
     "Enables or disables the clipping boundary.")
    ("ShowCropped"
     "Specifies if the point cloud is shown cropped.")
    ("ShowHistory"
     "Specifies whether to show history of the solid.")
    ("ShowIntensity"
     "Specifies if the point cloud is displayed using a shaded color scheme.")
    ("ShowPlotStyles"
     "Specifies whether or not plot styles and plot style names are displayed in the drawing.")
    ("ShowProxyDialogBox"
     "Specifies if AutoCAD displays a warning message when you open a drawing that contains custom objects.")
    ("ShowRasterImage"
     "Controls the display of raster images during real-time pan and zooms.")
    ("ShowRotation"
     "Determines if a raster image is displayed at its rotation value.")
    ("ShowWarningMessages"
     "Resets all dialog boxes that have the "Don't Display This Warning Again" check box so they display again.")
    ("SingleDocumentMode"
     "Determines if AutoCAD runs in single- or multiple-document mode.")
    ("Smoothness"
     "Specifies the level of smoothness for the SubD mesh.")
    ("SnapBasePoint"
     "Specifies the snap base point for the viewport.")
    ("SnapOn"
     "Specifies the status of snap.")
    ("SnapRotationAngle"
     "Specifies the snap rotation angle of the viewport relative to the current UCS.")
    ("SolidFill"
     "Specifies if multilines, traces, solids, all hatches (including solid-fill), and wide polylines are filled in.")
    ("SolidType"
     "Indicates the type of solid.")
    ("SourceObjects"
     "Specifies the source objects for section generation.")
    ("SplineFrame"
     "Specifies the display of the control vertices (CVs) for a spline.")
    ("SplineMethod"
     "Specifies the type of the spline.")
    ("StandardScale"
     "Specifies the standard scale for the layout, viewport, or plot configuration.")
    ("StandardScale2"
     "Specifies a standard scale for the viewport.")
    ("StartAngle"
     "Specifies the start angle of an arc or an ellipse.")
    ("StartDraftAngle"
     "Specifies the draft angle of the surface for the first cross section.")
    ("StartDraftMagnitude"
     "Specifies the draft magnitude of the surface for the first cross section.")
    ("StartParameter"
     "Specifies the start parameter for an ellipse.")
    ("StartPoint"
     "Specifies the start point for the arc, line, or ellipse.")
    ("StartSmoothContinuity"
     "Specifies the tangency and curvature of the first cross section.")
    ("StartSmoothMagnitude"
     "Specifies the size of the curve of the first cross section.")
    ("StartTangent"
     "Specifies the start tangent for the spline.")
    ("State"
     "Specifies section object type.")
    ("StatusID"
     "Gets the current active status of the viewport.")
    ("StoreSQLIndex"
     "Determines if the SQL index is stored in the drawing.")
    ("StyleName"
     "Specifies the name of the style used with the object.")
    ("StyleSheet"
     "Specifies the style sheet for the layout or plot configuration.")
    ("Stylization"
     "Specifies color stylization for selected point cloud.")
    ("Subject"
     "Specifies the subject name of the digital ID (certificate) or drawing.")
    ("SubMenu"
     "Gets the popup menu associated with a sub menu.")
    ("SubUnitsFactor"
     "Specifies the sub-units scale factor for dimension when unit changes to sub-unit.")
    ("SubUnitsSuffix"
     "Specifies the sub-units suffix for dimensions when unit changes to sub-unit.")
    ("SummaryInfo"
     "Specifies the properties of a drawing.")
    ("SupportPath"
     "Specifies the directories where AutoCAD searches for support files.")
    ("SuppressLeadingZeros"
     "Specifies the suppression of leading zeros in dimension values.")
    ("SuppressTrailingZeros"
     "Specifies the suppression of trailing zeros in dimension values.")
    ("SuppressZeroFeet"
     "Specifies the suppression of a zero foot measurement in dimension values.")
    ("SuppressZeroInches"
     "Specifies the suppression of a zero inch measurement in dimension values.")
    ("SurfaceNormals"
     "Specifies for which cross-section curves the surface is normal to the cross section.")
    ("SurfaceType"
     "Indicates the type of surface.")
    ("SurfTrimAssociativity"
     "Specifies if associativity is maintained between the surface and the objects used to trim the object.")
    ("SymbolPosition"
     "Specifies placement of the arc length dimension symbol.")
    ("System"
     "Gets the PreferencesSystem object.")
    ("TableBreakFlowDirection"
     "Determines the direction that parts of the table flow.")
    ("TableBreakHeight"
     "Sets the breaking height for the initial table part and any other table parts that do not have manual heights set.")
    ("TablesReadOnly"
     "Determines whether to open database tables in read-only mode.")
    ("TableStyleOverrides"
     "Specifies the table style overrides.")
    ("TabOrder"
     "Specifies the tab order of a layout.")
    ("TagString"
     "Specifies the tag string of the object.")
    ("TaperAngle"
     "Specifies the taper angle of the extrusion.")
    ("Target"
     "Specifies the target point for the view or viewport.")
    ("TempFileExtension"
     "Specifies the extension for temporary files.")
    ("TempFilePath"
     "Specifies the directory AutoCAD uses to store temporary files.")
    ("TemplateDWGPath"
     "Specifies the path for the template files used by the start-up wizards.")
    ("TemplateId"
     "Specifies the template ID for the table style.")
    ("TemplateId32"
     "For a 64-Bit system, specifies the template ID for the table style. (Obsolete)")
    ("TempXRefPath"
     "Specifies the location of external reference files.")
    ("TextAlignmentPoint"
     "Specifies the alignment point for text and attributes.")
    ("TextAlignmentType"
     "Specifies the TextAlignmentType of the mleaderstyle.")
    ("TextAngleType"
     "Specifies the TextAngleType of the mleaderstyle.")
    ("TextAttachmentDirection"
     "Specifies if the text content uses a horizontal or vertical attachment direction.")
    ("TextAttachmentType"
     "Specify how leaders connect with the text.")
    ("TextBackgroundFill"
     "Specifies if background mask ought to be used.")
    ("TextBottomAttachmentType"
     "Specifies the attachment of the leader to the bottom of the text content.")
    ("TextColor"
     "Specifies the color of the text for dimension and tolerance objects.")
    ("TextDirection"
     "Specifies the drawing direction of the MText.")
    ("TextEditor"
     "Specifies the name of the text editor for the MTEXT command.")
    ("TextFill"
     "Sets fill color On or Off.")
    ("TextFillColor"
     "Sets text fill color.")
    ("TextFont"
     "Specifies the font for new text.")
    ("TextFontSize"
     "Specifies the font size for new text.")
    ("TextFontStyle"
     "Specifies the font style for new text.")
    ("TextFrameDisplay"
     "Toggles the display of frames around the multileader text content with a text box or for text objects instead of displaying the text itself.")
    ("TextGap"
     "Specifies the distance between the dimension text and the dimension line when you break the dimension line to accommodate dimension text.")
    ("TextGenerationFlag"
     "Specifies the attribute text generation flag.")
    ("TextHeight"
     "Specifies the height for the dimension or tolerance text.")
    ("TextInside"
     "Specifies if the dimension text is to be drawn inside the extension lines.")
    ("TextInsideAlign"
     "Specifies the position of dimension text inside the extension lines for all dimension types except ordinate.")
    ("TextJustify"
     "Specifies the attachment point of the MText.")
    ("TextLeftAttachmentType"
     "Specify how leaders on the left side connect with the text.")
    ("TextLineSpacingDistance"
     "Specifies the line spacing distance of the MText content in the multileader object.")
    ("TextLineSpacingFactor"
     "Specifies the line spacing factor of the MText content in the multileader object.")
    ("TextLineSpacingStyle"
     "Specifies the line spacing style of the MText content in the multileader object.")
    ("TextMovement"
     "Specifies how dimension text is drawn when text is moved.")
    ("TextOutsideAlign"
     "Specifies the position of dimension text outside the extension lines for all dimension types except ordinate.")
    ("TextOverride"
     "Specifies the text string for the dimension.")
    ("TextPosition"
     "Specifies the dimension text position.")
    ("TextPrecision"
     "Specifies the precision of angular dimension text.")
    ("TextPrefix"
     "Specifies the dimension value prefix.")
    ("TextRightAttachmentType"
     "Specify how leaders on the right side connect with the text.")
    ("TextRotation"
     "Specifies the rotation angle of the dimension text.")
    ("TextString"
     "Specifies the text string for the entity.")
    ("TextStyle"
     "Specifies the text style for the dimension or tolerance text.")
    ("TextStyleName"
     "Specifies the style name of the MText.")
    ("TextStyles"
     "Gets the TextStyles collection for the document.")
    ("TextSuffix"
     "Specifies the dimension value suffix.")
    ("TextTopAttachmentType"
     "Specifies the attachment of the leader to the top center of the text content.")
    ("TextureMapPath"
     "Specifies the directory in which AutoCAD searches for rendering texture maps.")
    ("TextWidth"
     "Specifies the width of the MText.")
    ("TextWinBackgrndColor"
     "Specifies the background color for the text window.")
    ("TextWinTextColor"
     "Specifies the text color for the text window.")
    ("Thickness"
     "Specifies the distance a 2D AutoCAD object is extruded above or below its elevation.")
    ("TimeServer"
     "Specifies the name of the time server to be used for a digital signature.")
    ("TimeStamp"
     "Specifies the timestamp of an entry in the File Dependency List.")
    ("Title"
     "Specifies the title you want to use to locate the drawing.")
    ("TitleSuppressed"
     "Specifies whether the title of the table is suppressed.")
    ("ToleranceDisplay"
     "Specifies if tolerances are displayed with the dimension text.")
    ("ToleranceHeightScale"
     "Specifies a scale factor for the text height of tolerance values relative to the dimension text height.")
    ("ToleranceJustification"
     "Specifies the vertical justification of tolerance values relative to the nominal dimension text.")
    ("ToleranceLowerLimit"
     "Specifies the minimum tolerance limit for dimension text.")
    ("TolerancePrecision"
     "Specifies the precision of tolerance values in primary dimensions.")
    ("ToleranceSuppressLeadingZeros"
     "Specifies the suppression of leading zeros in tolerance values.")
    ("ToleranceSuppressTrailingZeros"
     "Specifies the suppression of trailing zeros in dimension values.")
    ("ToleranceSuppressZeroFeet"
     "Specifies the suppression of a zero foot measurement in tolerance values.")
    ("ToleranceSuppressZeroInches"
     "Specifies the suppression of a zero inch measurement in tolerance values.")
    ("ToleranceUpperLimit"
     "Specifies the maximum tolerance limit for dimension text.")
    ("Toolbars"
     "Gets the Toolbars collection.")
    ("ToolPalettePath"
     "Sets the tool palette path.")
    ("Top"
     "Specifies the top edge of a toolbar.")
    ("TopHeight"
     "Specifies elevation of section plane top extents relative to the object’s elevation.")
    ("TopRadius"
     "Specifies the top radius of the helix.")
    ("TotalAngle"
     "Gets the total angle for the arc.")
    ("TotalLength"
     "Specifies the total length of the helix.")
    ("TranslateIDs"
     "Specifies the translation of any contained object IDs during deepClone or wblockClone operations.")
    ("Transparency"
     "Specifies if the transparency for a particular bitonal image is on or off.")
    ("TrueColor"
     "Specifies the True Color of an object.")
    ("TrueColorImages"
     "Determines if raster and render images are displayed at true color or palletized color.")
    ("TurnHeight"
     "Specifies the height of one full turn for the helix.")
    ("Turns"
     "Specifies the number of turns for the helix.")
    ("TurnSlope"
     "Displays the constant incline angle for the helix path.")
    ("Twist"
     "Controls the twist direction of the helix or specifies the amount of rotation along the entire length of the sweep path.")
    ("TwistAngle"
     "Specifies the twist angle for the viewport.")
    ("Type"
     "Specifies type of a Leader, MenuGroup, PopupMenuItem, ToolbarItem, Polyline, or PolygonMesh object.")
    ("UCSIconAtOrigin"
     "Specifies if the UCS icon is displayed at the origin.")
    ("UCSIconOn"
     "Specifies if the UCS icon is on.")
    ("UCSPerViewport"
     "Specifies if the UCS is saved with the viewport.")
    ("UIsolineDensity"
     "Specifies the number of U isolines that are displayed.")
    ("UnderlayLayerOverrideApplied"
     "Determines whether underlay layer overrides are applied or not.")
    ("UnderlayName"
     "Specifies the name of the underlay file.")
    ("UnderlayVisibility"
     "Specifies the visibility of the underlay file.")
    ("Unit"
     "Gets the unit of the point cloud file.")
    ("UnitFactor"
     "Gets the insertion unit factor of the point cloud file.")
    ("Units"
     "Specifies the native units of measure for the block.")
    ("UnitsFormat"
     "Specifies the unit format for all dimensions except angular.")
    ("UnitsType"
     "Specifies the current display units type for the property.")
    ("UpperRightCorner"
     "Gets the upper-right corner of the current active viewport.")
    ("UpsideDown"
     "Specifies the direction of text.")
    ("URL"
     "Specifies the URL for the Hyperlink object.")
    ("URLDescription"
     "Specifies the URL description for the Hyperlink object.")
    ("URLNamedLocation"
     "Specifies the named location for the Hyperlink object.")
    ("Used"
     "Specifies whether a layer is in use.")
    ("UseEntityColor"
     "Specifies the color source for the point cloud.")
    ("UseLastPlotSettings"
     "Applies the plotting settings of the last successful plot.")
    ("User"
     "Gets the PreferencesUser object.")
    ("UserCoordinateSystems"
     "Gets the UCSs collection for the document.")
    ("UseStandardScale"
     "Specifies if the plot is to use a standard or custom scale.")
    ("Utility"
     "Gets the Utility object for the document.")
    ("Value"
     "Specifies the current value for the property, or the object ID of the newly created cloned object.")
    ("Value32"
     "Specifies the current value for the property, or the object ID of the newly created cloned object, for a 64-bit system. (Obsolete)")
    ("VBE"
     "Gets the VBAIDE extensibility object.")
    ("Verify"
     "Specifies if the attribute is set for verification.")
    ("Version"
     "Gets the version of the AutoCAD application you are using.")
    ("VersionGUID"
     "Specifies the name of the Version GUID of an entry in the File Dependency List.")
    ("VertCellMargin"
     "Specifies the value of the vertical margin of cells.")
    ("VertexCount"
     "Returns the number of vertices in the SubD mesh.")
    ("VerticalDirection"
     "Specifies the vertical direction for the section plane.")
    ("VerticalTextPosition"
     "Specifies the vertical position of text in relation to the dimension line.")
    ("Vertices"
     "Gets the vertices in the section line.")
    ("ViewingDirection"
     "Specifies the viewing direction for the section plane.")
    ("ViewportDefault"
     "Specifies if the layer is to be frozen in new viewports.")
    ("ViewportOn"
     "Specifies the display status of the viewport.")
    ("Viewports"
     "Gets the Viewports collection for the document.")
    ("Views"
     "Gets the Views collection for the document.")
    ("ViewToPlot"
     "Specifies the name of the view to plot.")
    ("VisibilityEdge1"
     "Specifies the visibility of a 3DFace edge 1.")
    ("VisibilityEdge2"
     "Specifies the visibility of a 3DFace edge 2.")
    ("VisibilityEdge3"
     "Specifies the visibility of a 3DFace edge 3.")
    ("VisibilityEdge4"
     "Specifies the visibility of a 3DFace edge 4.")
    ("Visible"
     "Specifies the visibility of an object or the application.")
    ("VIsolineDensity"
     "Specifies the number of V isolines that are displayed.")
    ("VisualStyle"
     "Specifies the visual style for a viewport.")
    ("Volume"
     "Gets the volume of the solid.")
    ("Weights"
     "Gets the weight vector for spline.")
    ("Width"
     "Specifies the width of the object.")
    ("WindowLeft"
     "Specifies the left edge of the application window.")
    ("WindowState"
     "Specifies the state of the application or document window.")
    ("WindowTitle"
     "Gets the title of the document window.")
    ("WindowTop"
     "Specifies the top edge of the application window.")
    ("WireframeType"
     "Specifies the wireframe display type of the surface.")
    ("WorkspacePath"
     "Specifies the path for the database workspace file.")
    ("XEffectiveScaleFactor"
     "Specifies the effective XScale factor of the block.")
    ("XRefDatabase"
     "Gets the Database object that defines the contents of the block.")
    ("XrefDemandLoad"
     "Specifies demand loading of external references.")
    ("XRefEdit"
     "Determines if the current drawing can be edited in place when being referenced by another user.")
    ("XRefFadeIntensity"
     "Controls the dimming intensity for XRefs.")
    ("XRefLayerVisibility"
     "Determines the visibility of xref-dependent layers and specifies if nested xref path changes are saved.")
    ("XScaleFactor"
     "Specifies the X scale factor for the block or external reference (xref).")
    ("XVector"
     "Specifies the X direction of the given UCS.")
    ("YEffectiveScaleFactor"
     "Specifies the effective YScale factor of the block.")
    ("YScaleFactor"
     "Specifies the Y scale factor for the block or external reference (xref).")
    ("YVector"
     "Specifies the Y direction of the given UCS.")
    ("ZEffectiveScaleFactor"
     "Specifies the effective ZScale factor of the block.")
    ("ZScaleFactor"
     "Specifies the Z scale factor for the block or external reference (xref)."))
  "")

(defparameter *Methods-ActiveX*
  '(("Activate"
     "Makes the specified drawing active.")
    ("Add"
     "Creates a member object and adds it to the appropriate collection.")
    ("Add3DFace"
     "Creates a 3DFace object given four vertices.")
    ("Add3DMesh"
     "Creates a free-form 3D mesh, given the number of points in the M and N directions and the coordinates of the points in the M and N directions.")
    ("Add3DPoly"
     "Creates a 3D polyline from the given array of coordinates.")
    ("AddArc"
     "Creates an arc given the center, radius, start angle, and end angle of the arc.")
    ("AddAttribute"
     "Creates an attribute definition at the given location with the specified properties.")
    ("AddBox"
     "Creates a 3D solid box with edges parallel to the axes of the WCS.")
    ("AddCircle"
     "Creates a circle given a center point and radius.")
    ("AddCone"
     "Creates a 3D solid cone with the base on the XY plane of the WCS.")
    ("AddCustomInfo"
     "Adds a custom property field at the end of the existing list of fields.")
    ("AddCustomObject"
     "Creates a custom object.")
    ("AddCylinder"
     "Creates a 3D solid cylinder whose base is on the XY plane of the WCS.")
    ("AddDim3PointAngular"
     "Creates an angular dimension using 3 points.")
    ("AddDimAligned"
     "Creates an aligned dimension object.")
    ("AddDimAngular"
     "Creates an angular dimension for an arc, two lines, or a circle.")
    ("AddDimArc"
     "Creates an arc length dimension for an arc.")
    ("AddDimDiametric"
     "Creates a diametric dimension for a circle or arc given the two points on the diameter and the length of the leader line.")
    ("AddDimOrdinate"
     "Creates an ordinate dimension given the definition point and the leader endpoint.")
    ("AddDimRadial"
     "Creates a radial dimension for the selected object at the given location.")
    ("AddDimRadialLarge"
     "Creates a jogged radial dimension for an arc, circle, or polyline arc segment.")
    ("AddDimRotated"
     "Creates a rotated linear dimension.")
    ("AddEllipse"
     "Creates an ellipse in the XY plane of the WCS given the center point, a point on the major axis, and the radius ratio.")
    ("AddEllipticalCone"
     "Creates a 3D solid elliptical cone on the XY plane of the WCS given the Center, MajorRadius, MinorRadius, and Height.")
    ("AddEllipticalCylinder"
     "Creates a 3D solid elliptical cylinder whose base is on the XY plane of the WCS, given the Center, MajorRadius, MinorRadius, and Height.")
    ("AddExtrudedSolid"
     "Creates an extruded solid given the Profile, Height, and TaperAngle.")
    ("AddExtrudedSolidAlongPath"
     "Creates an extruded solid given the profile and an extrusion path.")
    ("AddFitPoint"
     "Adds the fit point to the spline at a given index.")
    ("AddHatch"
     "Creates a Hatch object.")
    ("AddItems"
     "Adds one or more objects to the specified selection set.")
    ("AddLeader"
     "Creates a leader line based on the provided coordinates or adds a new leader cluster to the MLeader object.")
    ("AddLeaderLine"
     "Adds a leaderLine to the leader cluster with specified index.")
    ("AddLeaderLineEx"
     "Adds a leaderLine to the leader cluster with specified index.")
    ("AddLightWeightPolyline"
     "Creates a lightweight polyline from a list of vertices.")
    ("AddLine"
     "Creates a line passing through two points.")
    ("AddMenuItem"
     "Adds a popup menu item to a popup menu.")
    ("AddMInsertBlock"
     "Inserts an array of blocks.")
    ("AddMLeader"
     "Creates an mleader line, given coordinates.")
    ("AddMLine"
     "Creates multiple lines passing through an array of points.")
    ("AddMText"
     "Creates an MText entity in a rectangle defined by the insertion point and width of the bounding box.")
    ("AddObject"
     "Adds an object to a named dictionary.")
    ("AddPoint"
     "Creates a Point object at a given location.")
    ("AddPolyfaceMesh"
     "Creates a polyface mesh from a list of vertices.")
    ("AddPolyline"
     "Creates a polyline from a list of vertices.")
    ("AddPViewport"
     "Adds a paper space viewport, given the center, height, and width.")
    ("AddRaster"
     "Creates a new raster image based on an existing image file.")
    ("AddRay"
     "Creates a ray passing through two unique points.")
    ("AddRegion"
     "Creates a region from a set of entities. The given entities must form a closed coplanar region.")
    ("AddRevolvedSolid"
     "Creates a revolved solid, given the region around an axis.")
    ("AddSection"
     "Creates a section plane.")
    ("AddSeparator"
     "Adds a separator to an existing menu or toolbar.")
    ("AddShape"
     "Creates a Shape object based on a template identified by name, at the given insertion point, scale factor, and rotation.")
    ("AddSolid"
     "Creates a 2D solid polygon.")
    ("AddSphere"
     "Creates a sphere given the center and radius.")
    ("AddSpline"
     "Creates a quadratic or cubic NURBS (nonuniform rational B-spline) curve.")
    ("AddSubMenu"
     "Adds a submenu to an existing menu.")
    ("AddTable"
     "Adds a table to a drawing.")
    ("AddText"
     "Creates a single line of text.")
    ("AddTolerance"
     "Creates a tolerance entity.")
    ("AddToolbarButton"
     "Adds a toolbar item to a toolbar at a specified position.")
    ("AddTorus"
     "Creates a torus at the given location.")
    ("AddTrace"
     "Creates a Trace object from an array of points.")
    ("AddVertex"
     "Adds a vertex to a lightweight polyline or a section.")
    ("AddWedge"
     "Creates a wedge with edges parallel to the axes given the length, width, and height.")
    ("AddXLine"
     "Creates an xline (an infinite line) passing through two specified points.")
    ("AddXRecord"
     "Creates an XRecord object in any dictionary.")
    ("AngleFromXAxis"
     "Gets the angle of a line from the X axis.")
    ("AngleToReal"
     "Converts an angle as a string to a real (double) value.")
    ("AngleToString"
     "Converts an angle from a real (double) value to a string.")
    ("AppendInnerLoop"
     "Appends an inner loop to the hatch.")
    ("AppendItems"
     "Appends one or more entities to the specified group.")
    ("AppendOuterLoop"
     "Appends an outer loop to the hatch.")
    ("AppendVertex"
     "Appends a vertex to the end of a 3DPolyline, Polyline, or PolygonMesh object.")
    ("ArrayPolar"
     "Creates a polar array of objects given a NumberOfObjects, AngleToFill, and CenterPoint.")
    ("ArrayRectangular"
     "Creates a 2D or 3D rectangular array of objects.")
    ("AttachExternalReference"
     "Attaches an external reference (xref) to the drawing.")
    ("AttachToolbarToFlyout"
     "Attaches a toolbar to a toolbar button defined as a flyout.")
    ("AuditInfo"
     "Evaluates the integrity of the drawing.")
    ("Bind"
     "Binds an external reference (xref) to a drawing.")
    ("Block"
     "Returns the block of a SortentsTable object.")
    ("Boolean"
     "Performs a Boolean operation (union, intersect, or subtract) between the object and another 3DSolid or Region object.")
    ("CheckInterference"
     "Checks for interference between two solids and, if specified, creates a solid from the interference.")
    ("Clear"
     "Clears the specified selection set of all items.")
    ("ClearSubSelection"
     "Removes a subselection set of cells from a table.")
    ("ClearTableStyleOverrides"
     "Clears table style overrides.")
    ("ClipBoundary"
     "Specifies the clipping boundary for a raster image or an underlay.")
    ("Close"
     "Closes the specified drawing, or all open drawings.")
    ("ConvertToAnonymousBlock"
     "Converts a dynamic block to a regular anonymous block.")
    ("ConvertToStaticBlock"
     "Converts a dynamic block to a regular named block.")
    ("Copy"
     "Duplicates the given object to the same location.")
    ("CopyFrom"
     "Copies the settings for a dimension style, layout, or plot configuration.")
    ("CopyObjects"
     "Duplicates multiple objects (deep cloning).")
    ("CopyProfile"
     "Copies the specified profile.")
    ("CreateCellStyle"
     "Creates a cell style with the given name.")
    ("CreateCellStyleFromStyle"
     "Creates a cell style from a given name.")
    ("CreateContent"
     "Creates new content in a cell.")
    ("CreateEntry"
     "Creates a new entry in the File Dependency List.")
    ("CreateJog"
     "Creates a jog on the section plane.")
    ("CreateTypedArray"
     "Creates a variant that contains an array of typed arguments.")
    ("Delete"
     "Deletes a specified object or a set of saved layer settings.")
    ("DeleteCellContent"
     "Deletes the cell content in the specified row and column.")
    ("DeleteCellStyle"
     "Deletes a cell style.")
    ("DeleteColumns"
     "Deletes columns from a table.")
    ("DeleteConfiguration"
     "Deletes a viewport configuration.")
    ("DeleteContent"
     "Deletes content of a cell.")
    ("DeleteFitPoint"
     "Deletes the fit point of a spline at a given index.")
    ("DeleteProfile"
     "Deletes the specified profile.")
    ("DeleteRows"
     "Deletes rows from a table.")
    ("Detach"
     "Detaches an external reference (xref) from a drawing.")
    ("Display"
     "Toggles the display control of the PViewport object on or off.")
    ("DisplayPlotPreview"
     "Displays the Plot Preview dialog box with the full view preview.")
    ("DistanceToReal"
     "Converts a distance from a string to a real (double) value.")
    ("Dock"
     "Docks the toolbar to the owning frame window.")
    ("ElevateOrder"
     "Elevates the order of the spline to the given order.")
    ("EnableMergeAll"
     "Controls cell merging.")
    ("EndUndoMark"
     "Marks the end of a block of operations.")
    ("Erase"
     "Erases all the objects in a selection set.")
    ("Eval"
     "Evaluates an expression in VBA.")
    ("Evaluate"
     "Evaluates the given hatch or leader.")
    ("Explode"
     "Explodes the compound object into subentities.")
    ("Export"
     "Exports an AutoCAD drawing or a group of saved layer settings to a file.")
    ("ExportProfile"
     "Exports the active profile so it can be shared with other users.")
    ("FieldCode"
     "Returns a text string containing field codes.")
    ("Float"
     "Floats the toolbar.")
    ("FormatValue"
     "Gets the formatted text string for the specified row and column.")
    ("GenerateLayout"
     "Generates the layout of a table.")
    ("GenerateSectionGeometry"
     "Generates 2D or 3D section geometry.")
    ("GenerateUsageData"
     "Generates data specifying whether a layer is in use.")
    ("GetAcadState"
     "Gets an AcadState object to monitor the state of AutoCAD from out-of-process applications.")
    ("GetAlignment"
     "Returns the cell alignment for a row type.")
    ("GetAlignment2"
     "Gets the cell alignment.")
    ("GetAllProfileNames"
     "Gets all available profiles for the system.")
    ("GetAngle"
     "Gets the angle specified. Considers the setting of the ANGBASE system variable.")
    ("GetAttachmentPoint"
     "Returns the attachment point for the specified row and column.")
    ("GetAttributes"
     "Gets the attributes in the block reference.")
    ("GetAutoScale"
     "Returns the value specifying whether auto scale is used in the specified row and column.")
    ("GetAutoScale2"
     "Gets the auto scale flag value for a cell.")
    ("GetBackgroundColor"
     "Returns the background color value for the specified row type.")
    ("GetBackgroundColor2"
     "Returns the background color value for the specified cell style.")
    ("GetBackgroundColorNone"
     "Returns the value specifying that there is no background color for the specified row type.")
    ("GetBitmaps"
     "Gets the large and small bitmaps used as icons for the toolbar item.")
    ("GetBlockAttributeValue"
     "Gets the attribute value in the block content with an attribute definition id.")
    ("GetBlockAttributeValue2"
     "Gets the attribute value associated to a specified block cell.")
    ("GetBlockAttributeValue232"
     "For a 64-Bit system, gets the attribute value associated to a specified block cell. (Obsolete)")
    ("GetBlockAttributeValue32"
     "For a 64-Bit system, gets the attribute value in block content with attribute definition id. (Obsolete)")
    ("GetBlockRotation"
     "Returns the block rotation angle for the specified row and column.")
    ("GetBlockScale"
     "Returns the block scale value for the specified row and column.")
    ("GetBlockTableRecordId"
     "Returns the block table record ID of the cell.")
    ("GetBlockTableRecordId2"
     "Gets the block table record object id associated to a specified cell.")
    ("GetBlockTableRecordId232"
     "For a 64-Bit system, gets the block table record object id associated to a specified cell. (Obsolete)")
    ("GetBlockTableRecordId32"
     "For a 64-Bit system, gets a cell's block table record id. (Obsolete)")
    ("GetBoundingBox"
     "Gets two points of a box enclosing the specified object.")
    ("GetBreakHeight"
     "Get the break height of the table.")
    ("GetBulge"
     "Gets the bulge value at a given index of the polyline.")
    ("GetCanonicalMediaNames"
     "Gets all available canonical media names for the specified plot device.")
    ("GetCellAlignment"
     "Returns the alignment for the cell in the specified row and column.")
    ("GetCellBackgroundColor"
     "Returns the background true color value of a cell in the specified row and column.")
    ("GetCellBackgroundColorNone"
     "Returns the value specifying that there is no background color for the specified row and column.")
    ("GetCellClass"
     "Gets the class of a cell style.")
    ("GetCellContentColor"
     "Returns the true color value for the content of the specified row and column.")
    ("GetCellContentColor2"
     "Gets the true color value for a cell.")
    ("GetCellDataType"
     "Gets the cell data and unit type for the given row and column.")
    ("GetCellExtents"
     "Returns the cell extents for the specified row and column.")
    ("GetCellFormat"
     "Gets the cell format for the given row and column.")
    ("GetCellGridColor"
     "Returns the grid color value for an edge of the specified row and column.")
    ("GetCellGridLineWeight"
     "Returns the grid lineweight value for an edge of the specified row and column.")
    ("GetCellGridVisibility"
     "Returns the grid visibility value for an edge of the specified row and column.")
    ("GetCellState"
     "Get a cell's state.")
    ("GetCellStyle"
     "Gets the cell style.")
    ("GetCellStyleOverrides"
     "Returns the cell style overrides.")
    ("GetCellStyles"
     "Gets an array of all the named cell styles associated with the table style.")
    ("GetCellTextHeight"
     "Returns the text height for the specified row and column.")
    ("GetCellTextStyle"
     "Returns the text style name for the specified row and column.")
    ("GetCellType"
     "Returns the cell type for the specified row and column.")
    ("GetCellValue"
     "Gets the cell value for the given row and column.")
    ("GetColor"
     "Returns the true color value for the specified row type.")
    ("GetColor2"
     "Returns the color value for the specified named cell style.")
    ("GetColumnName"
     "Gets a column's name.")
    ("GetColumnWidth"
     "Returns the column width for the column at the specified column index in the table.")
    ("GetConstantAttributes"
     "Gets the constant attributes in the block or external reference.")
    ("GetContentColor"
     "Returns the true color value for the specified row type.")
    ("GetContentColor2"
     "Returns the color value for the specified content located at the provided row, column, and content index.")
    ("GetContentLayout"
     "Get a cell's content layout.")
    ("GetContentType"
     "Get a cell's content type.")
    ("GetControlPoint"
     "Gets the coordinates of the control point at a given index.")
    ("GetCorner"
     "Gets a corner of a rectangle.")
    ("GetCustomByIndex"
     "Returns the custom property name (key) and value that correspond to an index value.")
    ("GetCustomByKey"
     "Returns the custom property value that corresponds to a name (key) value.")
    ("GetCustomData"
     "Gets the custom data associated to a cell.")
    ("GetCustomScale"
     "Gets the custom scale for a layout or plot configuration.")
    ("GetDataFormat"
     "Gets a cell's format.")
    ("GetDataType"
     "Returns the data type and unit type for the specified row type.")
    ("GetDataType2"
     "Gets the row data type and unit type for the specified row type and nContent.")
    ("GetDistance"
     "Gets the distance from the prompt line or a selected set of points on the screen.")
    ("GetDoglegDirection"
     "Gets the dog leg direction of the specific leader.")
    ("GetDynamicBlockProperties"
     "Gets the properties of the dynamic block.")
    ("GetEntity"
     "Gets an object interactively.")
    ("GetExtensionDictionary"
     "Gets the extension dictionary associated with an object.")
    ("GetFieldId"
     "Returns the field object ID of the specified cell.")
    ("GetFieldId2"
     "Gets the field object id associated to the specified cell.")
    ("GetFieldId232"
     "For a 64-Bit system, gets a cell's field object id. (Obsolete)")
    ("GetFieldId32"
     "For a 64-Bit system, gets the field object ID of the specified cell. (Obsolete)")
    ("GetFitPoint"
     "Gets the fit point of a spline at a given index.")
    ("GetFont"
     "Gets the definition data of the font for the TextStyle.")
    ("GetFormat"
     "Returns the format for the specified row type.")
    ("GetFormat2"
     "Gets the format of a cell style.")
    ("GetFormula"
     "Get a cell's formula.")
    ("GetFullDrawOrder"
     "Returns all of the objects in a block, sorted by draw order with the bottom object first.")
    ("GetGridColor"
     "Returns the grid color value for a grid linetype and row type.")
    ("GetGridColor2"
     "Gets the gridColor for the specified cell.")
    ("GetGridDoubleLineSpacing"
     "Gets the lineSpacing value for the specified cell.")
    ("GetGridLineStyle"
     "Get a cell's gridLineStyle.")
    ("GetGridLinetype"
     "Gets the idLinetype with the gridLinetype value for the specified cell.")
    ("GetGridLinetype32"
     "For a 64-Bit system, gets the idLinetype with the gridLinetype value for the specified cell. (Obsolete)")
    ("GetGridLineWeight"
     "Returns a grid lineweight value for a grid linetype and row type.")
    ("GetGridLineWeight2"
     "Gets the gridLineWeight value for the specified cell.")
    ("GetGridSpacing"
     "Gets the grid spacing for the viewport.")
    ("GetGridVisibility"
     "Returns a grid visibility value for the specified grid linetype and row type.")
    ("GetGridVisibility2"
     "Returns the gridVisibility value for the specified cell.")
    ("GetHasFormula"
     "Check if a cell has a formula.")
    ("GetInput"
     "Converts a user's input string into a keyword index.")
    ("GetInteger"
     "Gets an integer value from the user.")
    ("GetInterfaceObject"
     "Accepts a program ID and attempts to load it into AutoCAD as an in-process server.")
    ("GetInvisibleEdge"
     "Gets the visibility setting for an edge of a 3DFace object at a given index.")
    ("GetIsCellStyleInUse"
     "Gets the usage status of a cell style.")
    ("GetIsMergeAllEnabled"
     "Gets value of the "merge all" property.")
    ("GetKeyword"
     "Gets a keyword string from the user.")
    ("GetLeaderIndex"
     "Gets the index of leader cluster which the specified leader line is in.")
    ("GetLeaderLineIndexes"
     "Gets the indexes of leaderlines of the specific leader.")
    ("GetLeaderLineVertices"
     "Gets the vertices of leaderLine with specified index.")
    ("GetLiveSection"
     "Gets the live section plane that is currently enabled in the database.")
    ("GetLocaleMediaName"
     "Gets the localized version of the canonical media name.")
    ("GetLoopAt"
     "Gets the hatch loop at a given index.")
    ("GetMargin"
     "Get a cell's margin value.")
    ("GetMinimumColumnWidth"
     "Gets the minimum column width for the column at the specified column index in the table.")
    ("GetMinimumRowHeight"
     "Returns the minimum row height for the specified row.")
    ("GetName"
     "Gets the name (keyword) of an object in a dictionary.")
    ("GetObject"
     "Gets the object in a dictionary, given the name (keyword) of the object.")
    ("GetObjectIdString"
     "Returns an object's ID as a string.")
    ("GetOrientation"
     "Gets the angle specified. Ignores the setting of the ANGBASE system variable.")
    ("GetOverride"
     "Get a cell's overrides.")
    ("GetPaperMargins"
     "Gets the margins for the layout or plot configuration.")
    ("GetPaperSize"
     "Gets the width and height of the configured paper.")
    ("GetPlotDeviceNames"
     "Gets all available plot device names.")
    ("GetPlotStyleTableNames"
     "Gets all available plot style table names.")
    ("GetPoint"
     "Gets the point selected in AutoCAD.")
    ("GetProjectFilePath"
     "Gets the directory in which AutoCAD looks for external reference files.")
    ("GetReal"
     "Gets a real (double) value from the user.")
    ("GetRelativeDrawOrder"
     "Returns the objects specified, sorted by the draw order, with the bottom object first.")
    ("GetRemoteFile"
     "Downloads the file specified by a URL.")
    ("GetRotation"
     "Gets the rotation value for a cell or cell style.")
    ("GetRowHeight"
     "Returns the row height for the row at the specified row index in the table.")
    ("GetRowType"
     "Returns the row type for the specified row.")
    ("GetScale"
     "Gets the scale value for a cell.")
    ("GetSectionTypeSettings"
     "Gets the section type settings object.")
    ("GetSnapSpacing"
     "Gets the snap spacing for the viewport.")
    ("GetString"
     "Gets a string from the user.")
    ("GetSubEntity"
     "Gets an object or subentity interactively.")
    ("GetSubEntity32"
     "For a 64-Bit system, gets an object or subentity interactively. (Obsolete)")
    ("GetSubSelection"
     "Returns the row and column indexes of the cells in a subselection set.")
    ("GetText"
     "Returns the text value for the specified row and column.")
    ("GetTextHeight"
     "Returns the text height for the specified row type.")
    ("GetTextHeight2"
     "Gets the text height for a cell.")
    ("GetTextRotation"
     "Returns the text rotation for the specified row and column.")
    ("GetTextString"
     "Gets the text value of a cell.")
    ("GetTextStyle"
     "Gets the text style name for the specified row types.")
    ("GetTextStyle2"
     "Gets the text style name for a cell.")
    ("GetTextStyleId"
     "Gets the object id for a named cell style.")
    ("GetTextStyleId32"
     "For a 64-Bit system, gets the object id for a named cell style. (Obsolete)")
    ("GetUCSMatrix"
     "Gets the transformation matrix consisting of UCS coordinate system data.")
    ("GetUniqueCellStyleName"
     "Gets a unique cell style name with the base name that is passed as the prefix.")
    ("GetUniqueSectionName"
     "Finds a unique section plane name.")
    ("GetValue"
     "Gets the value of a cell.")
    ("GetVariable"
     "Gets the current setting of an AutoCAD system variable.")
    ("GetVertexCount"
     "Gets the number of vertices in the specified leaderline.")
    ("GetWeight"
     "Gets the weight of the control point at a given index.")
    ("GetWidth"
     "Gets the start and end width for a polyline.")
    ("GetWindowToPlot"
     "Gets the coordinates that define the portion of the layout to plot.")
    ("GetXData"
     "Gets the extended data (XData) associated with an object.")
    ("GetXRecordData"
     "Gets the extended record data (XRecordData) associated with a dictionary.")
    ("HandleToObject"
     "Gets the object that corresponds to the given handle.")
    ("Highlight"
     "Sets the highlight status for the given object, or for all objects in a given selection set.")
    ("HitTest"
     "Performs a hit test on the section plane or table cell at the specified location.")
    ("Import"
     "Imports a drawing or a group of saved layer settings from a file.")
    ("ImportProfile"
     "Imports a profile created by another user.")
    ("IndexOf"
     "Provides the index of an entry in the File Dependency List.")
    ("InitializeUserInput"
     "Initializes the GetKeyword method.")
    ("InsertBlock"
     "Inserts a drawing file or a named block that has been defined in the current drawing.")
    ("InsertColumns"
     "Inserts columns in a table.")
    ("InsertColumnsAndInherit"
     "Insert columns into a table from another table.")
    ("InsertInMenuBar"
     "Inserts the popup menu into the AutoCAD menu bar at a specified location.")
    ("InsertLoopAt"
     "Inserts a loop at a given index of a hatch.")
    ("InsertMenuInMenuBar"
     "Inserts a menu into the AutoCAD menu bar.")
    ("InsertRows"
     "Inserts rows in a table.")
    ("InsertRowsAndInherit"
     "Insert rows into a table from another table.")
    ("IntersectWith"
     "Gets the points where one object intersects another object in the drawing.")
    ("IsContentEditable"
     "Check if a cell has editable content.")
    ("IsEmpty"
     "Determines if a cell is empty based on its row and column position.")
    ("IsFormatEditable"
     "Check if a cell has editable format.")
    ("IsMergeAllEnabled"
     "Checks if cell merging is on.")
    ("IsMergedCell"
     "Returns the merge status of a cell.")
    ("IsRemoteFile"
     "Returns the URL from which a remote file was downloaded.")
    ("IsURL"
     "Validates a given URL.")
    ("Item"
     "Gets the member object at a given index in a collection, group, or selection set.")
    ("LaunchBrowserDialog"
     "Launches a dialog box in which a user can enter a URL.")
    ("ListARX"
     "Gets the currently loaded ObjectARX applications.")
    ("Load"
     "Loads a menu group from a customization (CUIx) file or the definition of a linetype from a library (LIN) file.")
    ("LoadARX"
     "Loads the specified ObjectARX application.")
    ("LoadDVB"
     "Loads the specified AutoCAD VBA project file.")
    ("LoadShapeFile"
     "Loads a shape file (SHX).")
    ("MergeCells"
     "Merges cells in a table.")
    ("Mirror"
     "Creates a mirror-image copy of a planar object around an axis.")
    ("Mirror3D"
     "Creates a mirror image of the given object about a plane.")
    ("Move"
     "Moves an object along a vector.")
    ("MoveAbove"
     "Moves objects above the target in the draw order.")
    ("MoveBelow"
     "Moves objects below the target in the draw order.")
    ("MoveContent"
     "Moves the index content of a cell.")
    ("MoveToBottom"
     "Moves objects to the bottom of the draw order.")
    ("MoveToTop"
     "Moves objects to the top of the draw order.")
    ("New"
     "Creates a new document in SDI mode.")
    ("NumCustomInfo"
     "Returns the number of custom property fields that have been set.")
    ("ObjectId32ToObjectIdString"
     "For a 64-Bit system, returns an object's ID as a string. (Obsolete)")
    ("ObjectIDToObject"
     "Gets the object that corresponds to the given object ID.")
    ("ObjectIDToObject32"
     "Gets the object that corresponds to the given object ID for a 64-bit system. (Obsolete)")
    ("Offset"
     "Creates a new object at a specified offset distance from an existing object.")
    ("Open"
     "Opens an existing drawing file (DWG) and makes it the active document.")
    ("PlotToDevice"
     "Plots a layout to a device.")
    ("PlotToFile"
     "Plots a layout to the specified file.")
    ("PolarPoint"
     "Gets the point at a specified angle and distance from a given point.")
    ("Prompt"
     "Displays a prompt on the command line.")
    ("PurgeAll"
     "Removes unused named references such as unused blocks or layers from the document.")
    ("PurgeFitData"
     "Purges the fit data of a spline.")
    ("PutRemoteFile"
     "Uploads a file to a remote FTP location specified by a URL known to AutoCAD.")
    ("Quit"
     "Closes the drawing file and exits the AutoCAD application.")
    ("RealToString"
     "Converts a real (double) value to a string.")
    ("RecomputeTableBlock"
     "Updates a table block.")
    ("RefreshPlotDeviceInfo"
     "Updates the plot, canonical media, and plot style table information to reflect the current system state.")
    ("Regen"
     "Regenerates the entire drawing and recomputes the screen coordinates and view resolution for all objects.")
    ("Reload"
     "Reloads the external reference (xref).")
    ("Remove"
     "Removes a named object from the dictionary.")
    ("RemoveAllOverrides"
     "Removes all the overrides for a cell.")
    ("RemoveCustomByIndex"
     "Deletes the custom property name (key) and value that correspond to an index value.")
    ("RemoveCustomByKey"
     "Deletes the custom property value that corresponds to a name (key) value.")
    ("RemoveEntry"
     "Removes an identified entry from the File Dependency List.")
    ("RemoveFromMenuBar"
     "Removes the popup menu from the AutoCAD menu bar.")
    ("RemoveItems"
     "Removes specified items from the group or selection set.")
    ("RemoveLeader"
     "Removes the leader cluster with specified index.")
    ("RemoveLeaderLine"
     "Removes the leaderLine with specified index.")
    ("RemoveMenuFromMenuBar"
     "Removes the popup menu, as specified from the collection, from the AutoCAD menu bar.")
    ("RemoveVertex"
     "Removes a vertex in the section line.")
    ("Rename"
     "Renames an item in a dictionary or a set of saved layer settings.")
    ("RenameCellStyle"
     "Renames a cell style.")
    ("RenameProfile"
     "Renames the specified profile.")
    ("Replace"
     "Replaces an item in the dictionary by a given item.")
    ("ReselectSubRegion"
     "Returns subentities of a selection set in a table.")
    ("ResetBlock"
     "Resets the dynamic block to the default state.")
    ("ResetCellValue"
     "Reset the cell value for the given row and column.")
    ("ResetProfile"
     "Resets the value in the specified profile to its default values.")
    ("Restore"
     "Restores a group of layer property settings.")
    ("Reverse"
     "Reverses the direction of a spline.")
    ("Rotate"
     "Rotates an object around a base point.")
    ("Rotate3D"
     "Rotates an object around a 3D axis. Point1 and Point2 define the line that becomes the axis of rotation.")
    ("RunMacro"
     "Runs a VBA macro from the Application object.")
    ("Save"
     "Saves a document or group of layer property settings; no longer supported for menu groups.")
    ("SaveAs"
     "Saves the document to a specified file; no longer supported for menu groups.")
    ("ScaleEntity"
     "Scales an object equally in the X, Y, and Z directions.")
    ("SectionSolid"
     "Creates a region that represents the intersection of a plane defined by three points and the solid.")
    ("Select"
     "Selects objects and places them into a selection set, or selects a cell in a table.")
    ("SelectAtPoint"
     "Selects an object passing through a given point and places it into a selection set.")
    ("SelectByPolygon"
     "Selects objects within a fence and adds them to the selection set.")
    ("SelectOnScreen"
     "Prompts the user to pick an object from the screen.")
    ("SelectSubRegion"
     "Selects a set of cells in a table.")
    ("SendCommand"
     "Sends a command string from a VB or VBA application to the document for processing.")
    ("SendModelessOperationEnded"
     "Indicates a modeless operation has ended.")
    ("SendModelessOperationStart"
     "Indicates a modeless operation will start.")
    ("SetAlignment"
     "Sets a cell alignment for the specified row types.")
    ("SetAlignment2"
     "Sets the cell alignment.")
    ("SetAutoScale"
     "Sets the value specifying whether auto scale is used in the specified row and column.")
    ("SetAutoScale2"
     "Sets the auto-scale flag value for a cell.")
    ("SetBackgroundColor"
     "Sets a background color value for the specified row types.")
    ("SetBackgroundColor2"
     "Sets a background color value for the specified named cell style.")
    ("SetBackgroundColorNone"
     "Sets the value specifying whether there is no background color for the specified row types.")
    ("SetBitmaps"
     "Sets the large and small bitmaps used as icons for the toolbar item.")
    ("SetBlockAttributeValue"
     "Sets the attribute value for an attribute in a block contained within a MLeader or Table object.")
    ("SetBlockAttributeValue2"
     "Sets the attribute value associated to a specified block cell.")
    ("SetBlockAttributeValue232"
     "For a 64-Bit system, sets a block cell's attribute value. (Obsolete)")
    ("SetBlockAttributeValue32"
     "For a 64-Bit system, sets the attribute value for an attribute in a block contained within a MLeader or Table object. (Obsolete)")
    ("SetBlockRotation"
     "Sets the block rotation angle for the specified row and column.")
    ("SetBlockScale"
     "Sets the block scale value for the specified row and column.")
    ("SetBlockTableRecordId"
     "Sets the block table record ID of the cell.")
    ("SetBlockTableRecordId2"
     "Sets the block table record object id associated to a specified cell.")
    ("SetBlockTableRecordId232"
     "For a 64-Bit system, sets the block table record object id associated to a specified cell. (Obsolete)")
    ("SetBlockTableRecordId32"
     "For a 64-Bit system, sets a cell's block table record id. (Obsolete)")
    ("SetBreakHeight"
     "Sets the break height for the table.")
    ("SetBulge"
     "Sets the bulge for the polyline at the given index.")
    ("SetCellAlignment"
     "Sets the cell alignment for the specified row and column.")
    ("SetCellBackgroundColor"
     "Sets the background true color value for the specified row and column.")
    ("SetCellBackgroundColorNone"
     "Sets the value specifying that there is no background color for the specified row and column.")
    ("SetCellClass"
     "Sets the class of a cell style.")
    ("SetCellContentColor"
     "Sets the true color value for the content of the specified row and column.")
    ("SetCellDataType"
     "Sets the cell data and unit type for the given row and column.")
    ("SetCellFormat"
     "Sets the cell format for the given row and column.")
    ("SetCellGridColor"
     "Sets the grid color value for an edge of the specified row and column.")
    ("SetCellGridLineWeight"
     "Sets the grid lineweight value for an edge of the specified row and column.")
    ("SetCellGridVisibility"
     "Sets the grid visibility value for an edge of the specified row and column.")
    ("SetCellState"
     "Sets the state for a cell.")
    ("SetCellStyle"
     "Sets a cell style to the cell.")
    ("SetCellTextHeight"
     "Sets the text height for the specified row and column.")
    ("SetCellTextStyle"
     "Sets the text style name for the specified row and column.")
    ("SetCellType"
     "Sets the cell type for the specified row and column.")
    ("SetCellValue"
     "Sets the cell value for the given row and column.")
    ("SetCellValueFromText"
     "Sets the cell value for the given row and column.")
    ("SetColor"
     "Sets the true color value for the specified row types.")
    ("SetColor2"
     "Sets the color value for the specified named cell style.")
    ("SetColorBookColor"
     "Specifies the color name from an existing color book.")
    ("SetColumnName"
     "Sets a name to a column.")
    ("SetColumnWidth"
     "Sets the column width for the column at the specified column index in the table.")
    ("SetContentColor"
     "Sets the true color value for the specified row types.")
    ("SetContentColor2"
     "Sets the color value for the cell content based on the row, column, and content location.")
    ("SetContentLayout"
     "Sets the content layout for a cell.")
    ("SetControlPoint"
     "Sets the control point of the spline at a given index.")
    ("SetCustomByIndex"
     "Sets the custom property name (key) and value that correspond to an index value.")
    ("SetCustomByKey"
     "Sets the custom property value that corresponds to a name (key) value.")
    ("SetCustomData"
     "Sets the custom data associated to a cell.")
    ("SetCustomScale"
     "Sets the custom scale for a layout or plot configuration.")
    ("SetDatabase"
     "Associates an AutoCAD database with the LayerStateManager object.")
    ("SetDataFormat"
     "Sets the format for the cell.")
    ("SetDataType"
     "Sets the data type and unit type for the specified row type.")
    ("SetDataType2"
     "Sets the row data type and unit type for the specified row type and nContent.")
    ("SetDoglegDirection"
     "Sets the dog leg direction of the specific leader.")
    ("SetFieldId"
     "Sets the field object ID of the specified cell.")
    ("SetFieldId2"
     "Sets the field object id associated to a specified cell.")
    ("SetFieldId232"
     "For a 64-Bit system, Sets a cell's field object id. (Obsolete)")
    ("SetFieldId32"
     "Sets the field object ID of the specified cell for a 64-bit system. (Obsolete)")
    ("SetFitPoint"
     "Sets a fit point for the spline.")
    ("SetFont"
     "Sets the definition data of the font for the TextStyle.")
    ("SetFormat"
     "Sets the format for the specified row type.")
    ("SetFormat2"
     "Sets the format of a cell style.")
    ("SetFormula"
     "Sets the formula for a cell.")
    ("SetGridColor"
     "Sets the grid color value for the specified grid linetypes and row types.")
    ("SetGridColor2"
     "Sets the gridColor for the specified cell.")
    ("SetGridDoubleLineSpacing"
     "Sets the lineSpacing value for the specified cell.")
    ("SetGridLineStyle"
     "Sets the gridLineStyle for a cell.")
    ("SetGridLinetype"
     "Sets the object with the gridLinetype value for the specified cell.")
    ("SetGridLinetype32"
     "For a 64-Bit system, sets an object from a cell with a specific gridLineType. (Obsolete)")
    ("SetGridLineWeight"
     "Sets the grid lineweight value for the specified grid linetypes and row types.")
    ("SetGridLineWeight2"
     "Sets the gridLineWeight value for the specified cell.")
    ("SetGridSpacing"
     "Sets the grid spacing for the viewport.")
    ("SetGridVisibility"
     "Sets the grid visibility value for the specified grid linetype and row types.")
    ("SetGridVisibility2"
     "Sets the gridVisibility value for the specified cell or cell style.")
    ("SetInvisibleEdge"
     "Sets the visibility state of an edge at a given index.")
    ("SetLayoutsToPlot"
     "Specifies the layout or layouts to plot.")
    ("SetLeaderLineVertices"
     "Sets the vertices of leaderLine with specified index.")
    ("SetMargin"
     "Sets the margin for a cell.")
    ("SetNames"
     "Specifies the color name and book name of the color.")
    ("SetOverride"
     "Sets the overrides for a cell.")
    ("SetPattern"
     "Sets the pattern name and pattern type for the hatch.")
    ("SetProjectFilePath"
     "Sets the directory in which AutoCAD looks for external reference files.")
    ("SetRelativeDrawOrder"
     "Sets the relative draw order specified, with the bottom objects first.")
    ("SetRGB"
     "Specifies the RGB values of the True Color.")
    ("SetRotation"
     "Sets the rotation value for a cell.")
    ("SetRowHeight"
     "Sets the height for the row at the specified row index in the table.")
    ("SetScale"
     "Sets the scale value for a cell.")
    ("SetSnapSpacing"
     "Sets the snap spacing for the viewport.")
    ("SetSubSelection"
     "Sets the row and column indices of the cells in a subselection set.")
    ("SetTemplateId"
     "Sets a template using an object ID to the table style.")
    ("SetTemplateId32"
     "For a 64-Bit system, sets a template using an object ID to the table style. (Obsolete)")
    ("SetText"
     "Sets the text value for the specified row and column.")
    ("SetTextHeight"
     "Sets the text height for the specified row types.")
    ("SetTextHeight2"
     "Sets the text height for a cell.")
    ("SetTextRotation"
     "Sets the text rotation for the specified row and column.")
    ("SetTextString"
     "Sets the text value of a cell.")
    ("SetTextStyle"
     "Sets the text style name for the specified row types.")
    ("SetTextStyle2"
     "Sets the text style name for a cell.")
    ("SetTextStyleId"
     "Sets a text style using an object ID to a named cell style.")
    ("SetTextStyleId32"
     "For a 64-Bit system, sets a text style using an object ID to a named cell style. (Obsolete)")
    ("SetToolTip"
     "Sets the tooltip for a cell.")
    ("SetValue"
     "Sets the value of a cell.")
    ("SetValueFromText"
     "Sets the value of a cell by parsing the text.")
    ("SetVariable"
     "Sets the value of an AutoCAD system variable.")
    ("SetView"
     "Sets the view in a viewport to a saved view in the Views Collection object.")
    ("SetWeight"
     "Sets the weight of the control point at a given index.")
    ("SetWidth"
     "Sets the start and end width of a polyline, given the segment index.")
    ("SetWindowToPlot"
     "Sets the coordinates that define the portion of the layout to plot.")
    ("SetXData"
     "Sets the extended data (XData) associated with an object.")
    ("SetXRecordData"
     "Sets the extended record data (XRecordData) associated with a dictionary.")
    ("SliceSolid"
     "Creates a slice of the 3DSolid object given three points that define the plane.")
    ("Split"
     "Splits a viewport into the given number of views.")
    ("StartBatchMode"
     "Starts printing in batch mode. (Obsolete)")
    ("StartUndoMark"
     "Marks the beginning of a block of operations.")
    ("SwapOrder"
     "Swaps the draw order positions of two objects.")
    ("SyncModelView"
     "Updates the viewport parameters with the parameters in the associated model view.")
    ("TransformBy"
     "Moves, scales, or rotates an object given a 4x4 transformation matrix.")
    ("TranslateCoordinates"
     "Translates a point from one coordinate system to another.")
    ("Unload"
     "Unloads the menu group or external reference.")
    ("UnloadARX"
     "Unloads the specified AutoCAD ARX application.")
    ("UnloadDVB"
     "Unloads the specified AutoCAD VBA project file.")
    ("UnmergeCells"
     "Splits merged cells in a table.")
    ("Update"
     "Updates the object to the drawing screen.")
    ("UpdateEntry"
     "Erases and then recreates an identified entry in the File Dependency List.")
    ("UpdateMTextAttribute"
     "Updates attribute from the multiline text and multiline text from an attribute.")
    ("WBlock"
     "Writes out the given selection set as a new drawing file.")
    ("ZoomAll"
     "Zooms the current viewport to display the entire drawing.")
    ("ZoomCenter"
     "Zooms the current viewport to a specified center point and magnification.")
    ("ZoomExtents"
     "Zooms the current viewport to the drawing extents.")
    ("ZoomPickWindow"
     "Zooms the current viewport to a window defined by points picked on the screen.")
    ("ZoomPrevious"
     "Zooms the current viewport to its previous extents.")
    ("ZoomScaled"
     "Zooms the current viewport to given scale factor.")
    ("ZoomWindow"
     "Zooms the current viewport to the area specified by two opposite corners of a rectangle.")))

(defparameter *Events-ActiveX*
  '(("Activate"
     "Triggered when a document window is activated.")
    ("AppActivate"
     "Triggered just before the main application window is activated.")
    ("AppDeactivate"
     "Triggered just before the main application window is activated.")
    ("ARXLoaded"
     "Triggered just before the main application window is activated.")
    ("ARXUnloaded"
     "Triggered when an ObjectARX application has been unloaded.")
    ("BeginClose"
     "Triggered immediately after AutoCAD receives a request to close a drawing.")
    ("BeginCommand"
     "Triggered immediately after a command is issued, but before it completes.")
    ("BeginDocClose"
     "Triggered immediately after AutoCAD receives a request to close a drawing.")
    ("BeginDoubleClick"
     "Triggered after the user double-clicks an object in the drawing.")
    ("BeginFileDrop"
     "Triggered when a file is dropped on the main application window.")
    ("BeginLISP"
     "Triggered immediately after AutoCAD receives a request to evaluate a LISP expression.")
    ("BeginModal"
     "Triggered just before a modal dialog is displayed.")
    ("BeginOpen"
     "Triggered immediately after AutoCAD receives a request to open an existing drawing.")
    ("BeginPlot"
     "Triggered immediately after AutoCAD receives a request to print a drawing.")
    ("BeginQuit"
     "Triggered just before an AutoCAD session ends or a document closes.")
    ("BeginRightClick"
     "Triggered after the user right-clicks on the drawing window.")
    ("BeginSave"
     "Triggered immediately after AutoCAD receives a request to save the drawing.")
    ("BeginShortcutMenuCommand"
     "Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in command mode.")
    ("BeginShortcutMenuDefault"
     "Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in default mode.")
    ("BeginShortcutMenuEdit"
     "Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in edit mode.")
    ("BeginShortcutMenuGrip"
     "Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in grip mode.")
    ("BeginShortcutMenuOSnap"
     "Triggered after the user right-clicks on the drawing window, and before the shortcut menu appears in object snap mode.")
    ("Deactivate"
     "Triggered when the drawing window is deactivated.")
    ("EndCommand"
     "Triggered immediately after a command completes.")
    ("EndLISP"
     "Triggered upon completion of evaluating a LISP expression.")
    ("EndModal"
     "Triggered just after a modal dialog is dismissed.")
    ("EndOpen"
     "Triggered immediately after AutoCAD finishes opening an existing drawing.")
    ("EndPlot"
     "Triggered after a document has been sent to the printer.")
    ("EndSave"
     "Triggered when AutoCAD has finished saving the drawing.")
    ("EndShortcutMenu"
     "Triggered after the shortcut menu appears.")
    ("LayoutSwitched"
     "Triggered after the user switches to a different layout.")
    ("LISPCancelled"
     "Triggered when the evaluation of a LISP expression is cancelled.")
    ("Modified"
     "Triggered when an object or collection in the drawing has been modified.")
    ("NewDrawing"
     "Triggered just before a new drawing is created.")
    ("ObjectAdded"
     "Triggered when an object has been added to the drawing.")
    ("ObjectErased"
     "Triggered when an object has been erased from the drawing.")
    ("ObjectModified"
     "Triggered when an object in the drawing has been modified.")
    ("SelectionChanged"
     "Triggered when the current pickfirst selection set changes.")
    ("SysVarChanged"
     "Triggered when the value of a system variable is changed.")
    ("WindowChanged"
     "Triggered when there is a change to the application or document windows.")
    ("WindowMovedOrResized"
     "Triggered just after the application or drawing window has been moved or resized.")))

(defparameter *Objects-ActiveX*
  '(("_DAcadApplicationEvents Interface"
     "The event interface for the AutoCAD application."
     "_DAcadApplicationEvents")
    ("_DAcadDocumentEvents Interface"
     "The event interface for the AutoCAD document."
     "_DAcadDocumentEvents")
    ("3DFace"
     "A 3D triangle or quadrilateral plane section."
     "Acad3DFace")
    ("3DPolyline"
     "A 3D polyline of straight line segments."
     "Acad3DPolyline")
    ("3DSolid"
     "A solid object with free-form surface support."
     "Acad3DSolid")
    ("AcadState"
     "A special object to use in monitoring the state of AutoCAD from out-of-process applications."
     "AcadState")
    ("AcCmColor"
     "AutoCAD true color object."
     "AcadAcCmColor")
    ("Application"
     "An instance of the AutoCAD application."
     "AcadApplication")
    ("Arc"
     "A circular arc."
     "AcadArc")
    ("Attribute"
     "An object appearing as a text string that describes the characteristics of an attribute reference."
     "AcadAttribute")
    ("AttributeReference"
     "An object containing text that links to a block."
     "AcadAttributeReference")
    ("Block"
     "A block definition containing a name and a set of objects."
     "AcadBlock")
    ("BlockReference"
     "An instance of a block definition inserted into a drawing."
     "AcadBlockReference")
    ("Blocks Collection"
     "The collection of all blocks in the drawing."
     "AcadBlocks")
    ("Circle"
     "A full circle."
     "AcadCircle")
    ("Database"
     "The contents of an XRef block."
     "AcadDatabase")
    ("DatabasePreferences"
     "An object that specifies the settings for the current AutoCAD drawing."
     "AcadDatabasePreferences")
    ("DgnUnderlay"
     "A source of DGN underlay content."
     "AcadDgnUnderlay")
    ("Dictionaries Collection"
     "The collection of all dictionaries in the drawing."
     "AcadDictionaries")
    ("Dictionary"
     "A container object for storing and retrieving objects."
     "AcadDictionary")
    ("Dim3PointAngular"
     "A dimension measuring the angular distance between three points."
     "AcadDim3PointAngular")
    ("DimAligned"
     "A linear dimension, measuring the distance between two points, that is displayed parallel to the points being measured."
     "AcadDimAligned")
    ("DimAngular"
     "A dimension measuring the angular distance between two lines or between the angle of a circular arc."
     "AcadDimAngular")
    ("DimArcLength"
     "A dimension measuring the length of an arc."
     "AcadDimArcLength")
    ("DimDiametric"
     "A dimension measuring the diameter of a circle or arc."
     "AcadDimDiametric")
    ("DimOrdinate"
     "A dimension measuring the absolute X or Y position of a point from the origin."
     "AcadDimOrdinate")
    ("DimRadial"
     "A dimension measuring the radius of a circle or arc."
     "AcadDimRadial")
    ("DimRadialLarge"
     "A dimension measuring a large radius, also known as a jogged radius dimension."
     "AcadDimRadialLarge")
    ("DimRotated"
     "A dimension that measures the distance between two points and is displayed at a given rotation."
     "AcadDimRotated")
    ("DimStyle"
     "A group of dimension settings that determines the appearance of a dimension."
     "AcadDimStyle")
    ("DimStyles Collection"
     "The collection of all dimension styles in the drawing."
     "AcadDimStyles")
    ("Document"
     "An AutoCAD drawing."
     "AcadDocument")
    ("Documents Collection"
     "The collection of all AutoCAD drawings that are open in the current session."
     "AcadDocuments")
    ("DwfUnderlay"
     "A source of DWF/DWFx underlay content."
     "AcadDwfUnderlay")
    ("DynamicBlockReferenceProperty"
     "An object containing the properties of a dynamic block."
     "AcadDynamicBlockReferenceProperty")
    ("Ellipse"
     "An elliptical arc or full ellipse."
     "AcadEllipse")
    ("ExternalReference"
     "An instance of an external reference inserted into a drawing."
     "AcadExternalReference")
    ("ExtrudedSurface"
     "A surface created by extruding an object or a planar face a specified distance and direction."
     "AcadExtrudedSurface")
    ("FileDependencies Collection"
     "Creates, updates, retrieves, and removes items in the File Dependency List."
     "AcadFileDependencies")
    ("FileDependency"
     "Provides information about entries in the File Dependency List of a drawing file."
     "AcadFileDependency")
    ("GeomapImage"
     "An embedded raster image which is captured from a portion of LiveMap."
     "AcadGeomapImage")
    ("GeoPositionMarker"
     "A geographical location aware marker object with a label."
     "AcadGeoPositionMarker")
    ("Group"
     "A named SelectionSet object."
     "AcadGroup")
    ("Groups Collection"
     "The collection of all groups in the drawing."
     "AcadGroups")
    ("Hatch"
     "An area fill consisting of a pattern of lines."
     "AcadHatch")
    ("Helix"
     "A helix."
     "AcadHelix")
    ("Hyperlink"
     "A URL and URL description."
     "AcadHyperlink")
    ("Hyperlinks Collection"
     "The collection of all hyperlinks for a given object."
     "AcadHyperlinks")
    ("IAcadDatabase Interface"
     "Provides an interface to the database resident objects in an AutoCAD document."
     "AcadDatabase")
    ("IAcadDimension Interface"
     "The common interface for AutoCAD dimensions."
     "AcadDimension")
    ("IAcadEntity Interface"
     "The standard interface for a basic AutoCAD entity."
     "AcadEntity")
    ("IAcadMLeaderLeader Interface"
     "AutoCAD Multileader Leader Line Interface."
     "AcadMLeaderLeader")
    ("IAcadObject Interface"
     "The standard interface for a basic AutoCAD object."
     "AcadObject")
    ("IAcadObjectEvents Interface"
     "The event interface for a basic AutoCAD object."
     "AcadObjectEvents")
    ("IDPair"
     "A special object for use with the CopyObjects method that contains the object IDs of both the source and destination objects."
     "AcadIDPair")
    ("Layer"
     "A logical grouping of data, similar to transparent acetate overlays on a drawing."
     "AcadLayer")
    ("Layers Collection"
     "The collection of all layers in the drawing."
     "AcadLayers")
    ("LayerStateManager"
     "Saves and restores layer settings."
     "AcadLayerStateManager")
    ("Layout"
     "The plot settings and visual properties of a model space or paper space block."
     "AcadLayout")
    ("Layouts Collection"
     "The collection of all layouts in the drawing."
     "AcadLayouts")
    ("Leader"
     "An object composed of an arrowhead attached to splines or straight line segments."
     "AcadLeader")
    ("LightweightPolyline"
     "A 2D line with adjustable width composed of line and arc segments."
     "AcadLWPolyline")
    ("Line"
     "A single line segment."
     "AcadLine")
    ("Linetype"
     "The line characteristics consisting of combinations of dashes, dots, and spaces."
     "AcadLinetype")
    ("Linetypes Collection"
     "The collection of all linetypes in the drawing."
     "AcadLineTypes")
    ("LoftedSurface"
     "A surface created by lofting through a set of two or more curves."
     "AcadLoftedSurface")
    ("Material"
     "The render material characteristics."
     "AcadMaterial")
    ("Materials Collection"
     "The collection of all materials in the drawing."
     "AcadMaterials")
    ("MenuBar Collection"
     "A collection of PopupMenu objects representing the current AutoCAD menu bar."
     "AcadMenuBar")
    ("MenuGroup"
     "An AutoCAD menu group."
     "AcadMenuGroup")
    ("MenuGroups Collection"
     "A collection of MenuGroup objects representing all the menu groups loaded in the current AutoCAD session."
     "AcadMenuGroups")
    ("MInsertBlock"
     "A rectangular array of block references."
     "AcadMInsertBlock")
    ("MLeader"
     "An object composed of an arrowhead attached to multiple splines or straight line segments."
     "AcadMLeader")
    ("MLeaderStyle"
     "Adds, modifies, and deletes MLeader styles."
     "AcadMLeaderStyle")
    ("MLine"
     "Multiple parallel lines."
     "AcadMLine")
    ("ModelSpace Entities Collection"
     "A special Block object containing all model space entities."
     "AcadModelSpace")
    ("MText"
     "A paragraph of alphanumeric characters that fits within a nonprinting text boundary."
     "AcadMtext")
    ("NurbSurface"
     "A surface created when NURBS creation is enabled while creating procedural or complex 3D surfaces, or by converting existing surfaces."
     "AcadNurbSurface")
    ("OLE"
     "An AutoCAD OLE object."
     "AcadOle")
    ("PaperSpace Entities Collection"
     "A special Block object containing all the entities in the active paper space layout."
     "AcadPaperSpace")
    ("PdfUnderlay"
     "A source of PDF underlay content."
     "AcadPdfUnderlay")
    ("PlaneSurface"
     "A planar surface."
     "AcadPlaneSurface")
    ("Plot"
     "The set of methods and properties used for plotting layouts."
     "AcadPlot")
    ("PlotConfiguration"
     "A named collection of plot settings."
     "AcadPlotConfiguration")
    ("PlotConfigurations Collection"
     "A collection of named plot settings."
     "AcadPlotConfigurations")
    ("Point"
     "A point marker appearing as a dot, square, circle, X, tick, or plus sign (+); or as a combination of these."
     "AcadPoint")
    ("PointCloud"
     "A source of point cloud content."
     "AcadPointCloud")
    ("PointCloudEx"
     "A point cloud extension entity."
     "AcadPointCloudEx")
    ("PolyfaceMesh"
     "A three-dimensional polyface mesh."
     "AcadPolyfaceMesh")
    ("PolygonMesh"
     "A free-form 3D mesh."
     "AcadPolygonMesh")
    ("Polyline"
     "A 2D line of adjustable width or a 3D line or mesh of non-adjustable width composed of line and arc segments."
     "AcadPolyline")
    ("PopupMenu"
     "An AutoCAD cascading menu."
     "AcadPopupMenu")
    ("PopupMenuItem"
     "A single menu item on an AutoCAD pull-down menu."
     "AcadPopupMenuItem")
    ("PopupMenus Collection"
     "A collection of PopupMenu objects representing all the popup menus loaded in the MenuGroup."
     "AcadPopupMenus")
    ("Preferences"
     "This object specifies the current AutoCAD settings."
     "AcadPreferences")
    ("PreferencesDisplay"
     "This object contains the options from the Display tab on the Options dialog box."
     "AcadPreferencesDisplay")
    ("PreferencesDrafting"
     "This object contains the options from the Drafting tab on the Options dialog box."
     "AcadPreferencesDrafting")
    ("PreferencesFiles"
     "This object contains the options from the Files tab on the Options dialog box."
     "AcadPreferencesFiles")
    ("PreferencesOpenSave"
     "This object contains options from the Open and Save tab on the Options dialog box."
     "AcadPreferencesOpenSave")
    ("PreferencesOutput"
     "This object contains the options from the Output tab on the Options dialog box."
     "AcadPreferencesOutput")
    ("PreferencesProfiles"
     "This object contains the options from the Profiles tab on the Options dialog box."
     "AcadPreferencesProfiles")
    ("PreferencesSelection"
     "This object contains the options from the Selection tab on the Options dialog box."
     "AcadPreferencesSelection")
    ("PreferencesSystem"
     "This object contains the options from the System tab on the Options dialog box."
     "AcadPreferencesSystem")
    ("PreferencesUser"
     "This object contains the options from the User tab on the Options dialog box."
     "AcadPreferencesUser")
    ("PViewport"
     "Rectangular objects created in paper space that display views."
     "AcadPViewport")
    ("RasterImage"
     "A raster image consisting of a rectangular grid (or raster) of small squares or dots known as pixels."
     "AcadRasterImage")
    ("Ray"
     "A semi-infinite line."
     "AcadRay")
    ("Region"
     "A bounded planar face consisting of lines, circles, arcs, elliptical arcs, and spline curves."
     "AcadRegion")
    ("RegisteredApplication"
     "An external application that has been added to the drawing."
     "AcadRegisteredApplication")
    ("RegisteredApplications Collection"
     "The collection of all registered applications in the drawing."
     "AcadRegisteredApplications")
    ("RevolvedSurface"
     "A surface created by revolving one or more 2D objects about an axis."
     "AcadRevolvedSurface")
    ("Section"
     "A section plane entity created at the intersection of a plane and a solid."
     "AcadSection")
    ("SectionManager"
     "This object manages the collection of section planes in the DWG database."
     "AcadSectionManager")
    ("SectionSettings"
     "A container for section geometry settings."
     "AcadSectionSettings")
    ("SectionTypeSettings"
     "The settings that apply to the various types of sections."
     "AcadSectionTypeSettings")
    ("SecurityParams"
     "Supplies information necessary for performing security operations on drawing files."
     "AcadSecurityParams")
    ("SelectionSet"
     "A group of one or more AutoCAD objects specified for processing as a single unit."
     "AcadSelectionSet")
    ("SelectionSets Collection"
     "The collection of all selection sets in the drawing."
     "AcadSelectionSets")
    ("ShadowDisplay Interface"
     "Interface for AutoCAD entities with shadows."
     "AcadShadowDisplay")
    ("Shape"
     "An object comprising lines, arcs, and circles defined in an SHX file."
     "AcadShape")
    ("Solid"
     "A solid-filled polygon."
     "AcadSolid")
    ("SortentsTable"
     "Contains and manipulates draw order information."
     "AcadSortentsTable")
    ("Spline"
     "A quadratic or cubic NURBS (nonuniform rational B-spline) curve."
     "AcadSpline")
    ("SubDMesh"
     "For internal use only."
     "AcadSubDMesh")
    ("SubDMeshEdge"
     "For internal use only."
     "AcadSubDMeshEdge")
    ("SubDMeshFace"
     "For internal use only."
     "AcadSubDMeshFace")
    ("SubDMeshVertex"
     "For internal use only."
     "AcadSubDMeshVertex")
    ("SubEntity"
     "For internal use only."
     "AcadSubEntity")
    ("SubEntSolidEdge"
     "For internal use only."
     "AcadSubEntSolidEdge")
    ("SubEntSolidFace"
     "For internal use only."
     "AcadSubEntSolidFace")
    ("SubEntSolidNode"
     "For internal use only."
     "AcadSubEntSolidNode")
    ("SubEntSolidVertex"
     "For internal use only."
     "AcadSubEntSolidVertex")
    ("SummaryInfo"
     "Accesses drawing properties such as the Title, Subject, Author, and Keywords properties."
     "AcadSummaryInfo")
    ("Surface"
     "A surface entity."
     "AcadSurface")
    ("SweptSurface"
     "A surface created by sweeping a 2D curve along a path."
     "AcadSweptSurface")
    ("Table"
     "AutoCAD table object."
     "AcadTable")
    ("TableStyle"
     "Adds, modifies, and deletes table styles."
     "AcadTableStyle")
    ("Text"
     "A single line of alphanumeric characters."
     "AcadText")
    ("TextStyle"
     "A named, saved collection of settings that determines the appearance of text characters."
     "AcadTextStyle")
    ("TextStyles Collection"
     "The collection of all text styles in the drawing."
     "AcadTextStyles")
    ("Tolerance"
     "A geometric tolerance contained in a feature control frame."
     "AcadTolerance")
    ("Toolbar"
     "An AutoCAD toolbar."
     "AcadToolbar")
    ("ToolbarItem"
     "A single button item on an AutoCAD toolbar."
     "AcadToolbarItem")
    ("Toolbars Collection"
     "A collection of Toolbar objects representing all the toolbars loaded in the current AutoCAD session."
     "AcadToolbars")
    ("Trace"
     "A 2D solid line of specified width."
     "AcadTrace")
    ("UCS"
     "A user-defined coordinate system that determines the orientation of the X, Y, and Z axes in 3D space."
     "AcadUCS")
    ("UCSs Collection"
     "The collection of all user coordinate systems (UCSs) in the drawing."
     "AcadUCSs")
    ("Utility"
     "A series of methods provided for utility purposes."
     "AcadUtility")
    ("View"
     "A graphical representation of a 2D drawing or 3D model from a specific location (viewpoint) in space."
     "AcadView")
    ("Viewport"
     "A bounded area that displays some portion of a drawing's model space."
     "AcadViewport")
    ("Viewports Collection"
     "The collection of all viewports in the drawing."
     "AcadViewports")
    ("Views Collection"
     "The collection of all views in the drawing."
     "AcadViews")
    ("Wipeout"
     "Masking object that hides the objects below it in the current draw order."
     "AcadWipeout")
    ("XLine"
     "A construction line that is infinite in both directions."
     "AcadXline")
    ("XRecord"
     "XRecord objects are used to store and manage arbitrary data."
     "AcadXRecord")))
