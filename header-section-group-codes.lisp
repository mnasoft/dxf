;;;; header-section-group-codes.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *$ACADMAINTVER* '("$ACADMAINTVER" 70 ) "Maintenance version number (should be ignored)")

(defparameter *$ACADVER* '("$ACADVER" 1 ) "The AutoCAD drawing database version number: 
AC1006 = R10;
AC1009 = R11 and R12;                                                                                              
AC1012 = R13; AC1014 = R14;
AC1015 = AutoCAD 2000;
AC1018 = AutoCAD 2004;
AC1021 = AutoCAD 2007;
AC1024 = AutoCAD 2010")

(defparameter *$ANGBASE* '("$ANGBASE" 50 ) "Angle 0 direction")

(defparameter *$ANGDIR* '("$ANGDIR" 70 ) "1 = Clockwise angles; 0 = Counterclockwise angles")

(defparameter *$ATTMODE* '("$ATTMODE"70 ) "Attribute visibility: 0 = None; 1 = Normal; 2 = All")

(defparameter *$AUNITS* '("$AUNITS" 70 ) "Units format for angles")

(defparameter *$AUPREC* '("$AUPREC" 70 ) "Units precision for angles")

(defparameter *$CECOLOR* '("$CECOLOR" 62 ) "Current entity color number: 0 = BYBLOCK; 256 = BYLAYER")

(defparameter *$CELTSCALE* '("$CELTSCALE" 40 ) "Current entity linetype scale")

(defparameter *$CELTYPE* '("$CELTYPE" 6 ) "Entity linetype name, or BYBLOCK or BYLAYER")

(defparameter *$CELWEIGHT* '("$CELWEIGHT" 370 ) "Lineweight of new objects")

(defparameter *$CEPSNID* '("$CEPSNID" 390 ) "Plotstyle handle of new objects; if CEPSNTYPE is 3, then this value indicates the handle")

(defparameter *$CEPSNTYPE* '("$CEPSNTYPE" 380 ) "Plot style type of new objects:  0 = Plot style by layer; 1 = Plot style by block; 2 = Plot style by dictionary default; 3 = Plot style by object ID/handle")


(defparameter *$CHAMFERA* '("$CHAMFERA" 40 ) "First chamfer distance")

(defparameter *$CHAMFERB* '("$CHAMFERB" 40 )  "Second chamfer distance")

(defparameter *$CHAMFERC* '("$CHAMFERC" 40 ) "Chamfer length")

(defparameter *$CHAMFERD* '("$CHAMFERD" 40 ) "Chamfer angle")

(defparameter *$CLAYER* '("$CLAYER" 8 ) "Current layer name")

(defparameter *$CMLJUST* '("$CMLJUST" 70 ) "Current multiline justification: 0 = Top; 1 = Middle; 2 = Bottom")

(defparameter *$CMLSCALE* '("$CMLSCALE" 40 ) "Current multiline scale")

(defparameter *$CMLSTYLE* '("$CMLSTYLE" 2 ) "Current multiline style name")

(defparameter *$CSHADOW* '("$CSHADOW" 280 ) "Shadow mode for a 3D object: 
  0 = Casts and receives shadows 
  1 = Casts shadows 
  2 = Receives shadows 
  3 = Ignores shadows")


(defparameter *$DIMADEC* '("$DIMADEC" 70 )
  "Number of precision places displayed in angular dimensions")

(defparameter *$DIMALT* '("$DIMALT" 70 )
  "Alternate unit dimensioning performed if nonzero")

(defparameter *$DIMALTD* '("$DIMALTD" 70 )
  "Alternate unit decimal places")

(defparameter *$DIMALTF* '("$DIMALTF" 40 )
  "Alternate unit scale factor")

(defparameter *$DIMALTRND* '("$DIMALTRND" 40 )
  "Determines rounding of alternate units")

(defparameter *$DIMALTTD* '("$DIMALTTD" 70 )
  "Number of decimal places for tolerance values of an alternate units dimension")

(defparameter *$DIMALTTZ* '("$DIMALTTZ" 70 )
  "Controls suppression of zeros for alternate tolerance values:
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches                                                                  
3 = Includes zero inches and suppresses zero feet")


(defparameter *$DIMALTU* '("$DIMALTU" 70 )
  "Units format for alternate units of all dimension style family members except angular: 
1 = Scientific; 2 = Decimal; 3 = Engineering;
4 = Architectural (stacked); 5 = Fractional (stacked);
6 = Architectural; 7 = Fractional")


(defparameter *$DIMALTZ* '("$DIMALTZ" 70 )
  "Controls suppression of zeros for alternate unit dimension values: 
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches
3 = Includes zero inches and suppresses zero feet")


(defparameter *$DIMAPOST* '("$DIMAPOST"1 )
  " Alternate dimensioning suffix")

(defparameter *$DIMASO* '("$DIMASO"70 )
  "1 = Create associative dimensioning
0 = Draw individual entities")


(defparameter *$DIMASSOC* '("$DIMASSOC" 280 )
  "Controls the associativity of dimension objects
0 = Creates exploded dimensions; there is no association between elements of the dimension, and the lines, arcs, arrowheads, and text of a dimension are drawn as separate objects;
1 = Creates non-associative dimension objects; the elements of the dimension are formed into a single object, and if the definition point on the object moves,then the dimension value is updated;
2 = Creates associative dimension objects; the elements of the dimension are formed into a single object and one or more definition points of the dimension are coupled with association points on geometric objects")


(defparameter *$DIMASZ* '("$DIMASZ" 40 )
  "Dimensioning arrow size")

(defparameter *$DIMATFIT* '("$DIMATFIT" 70 )
  "Controls dimension text and arrow placement when space is not sufficient to place both within the extension lines:
0 = Places both text and arrows outside extension lines
1 = Moves arrows first, then text
2 = Moves text first, then arrows
3 = Moves either text or arrows, whichever fits best
AutoCAD adds a leader to moved dimension text when DIMTMOVE is set to 1")


(defparameter *$DIMAUNIT* '("$DIMAUNIT" 70 )
  "Angle format for angular dimensions: 
0 = Decimal degrees; 1 = Degrees/minutes/seconds;
2 = Gradians; 
3 = Radians; 
4 = Surveyor's units")


(defparameter *$DIMAZIN* '("$DIMAZIN" 70 )
  "Controls suppression of zeros for angular dimensions: 
0 = Displays all leading and trailing zeros
1 = Suppresses leading zeros in decimal dimensions
2 = Suppresses trailing zeros in decimal dimensions
3 = Suppresses leading and trailing zeros")


(defparameter *$DIMBLK* '("$DIMBLK" 1 )
  "Arrow block name")

(defparameter *$DIMBLK1* '("$DIMBLK1" 1 )
  "First arrow block name")

(defparameter *$DIMBLK2* '("$DIMBLK2" 1 )
  "Second arrow block name")

(defparameter *$DIMCEN* '("$DIMCEN" 40 )
  "Size of center mark/lines")

(defparameter *$DIMCLRD* '("$DIMCLRD" 70 )
  "Dimension line color: range is 0 = BYBLOCK; 256 = BYLAYER")


(defparameter *$DIMCLRE* '("$DIMCLRE" 70 )
  "Dimension extension line color: range is 0 = BYBLOCK; 256 = BYLAYER")


(defparameter *$DIMCLRT* '("$DIMCLRT" 70 )
  "Dimension text color: range is 0 = BYBLOCK; 256 = BYLAYER")


(defparameter *$DIMDEC* '("$DIMDEC" 70 )
  "Number of decimal places for the tolerance values of a primary units dimension")

(defparameter *$DIMDLE* '("$DIMDLE" 40 )
  "Dimension line extension")

(defparameter *$DIMDLI* '("$DIMDLI" 40 )
  "Dimension line increment")

(defparameter *$DIMDSEP* '("$DIMDSEP" 70 )
  "Single-character decimal separator used when creating dimensions whose unit format is decimal")

(defparameter *$DIMEXE* '("$DIMEXE" 40 )
  "Extension line extension")

(defparameter *$DIMEXO* '("$DIMEXO" 40 )
  "Extension line offset")

(defparameter *$DIMFAC* '("$DIMFAC" 40 )
  "Scale factor used to calculate the height of text for dimension fractions and tolerances. 
AutoCAD multiplies DIMTXT by DIMTFAC to set the fractional or tolerance text height")


(defparameter *$DIMGAP* '("$DIMGAP" 40 )
  "Dimension line gap")

(defparameter *$DIMJUST* '("$DIMJUST" 70 )
  "Horizontal dimension text position: 
0 = Above dimension line and center-justified between extension lines
1 = Above dimension line and next to first extension line
2 = Above dimension line and next to second extension line
3 = Above and center-justified to first extension line
4 = Above and center-justified to second extension line")


(defparameter *$DIMLDRBLK* '("$DIMLDRBLK" 1 )
  "Arrow block name for leaders")

(defparameter *$DIMLFAC* '("$DIMLFAC" 40 )
  "Linear measurements scale factor")

(defparameter *$DIMLIM* '("$DIMLIM" 70 )
  "Dimension limits generated if nonzero")

(defparameter *$DIMLUNIT* '("$DIMLUNIT" 70 )
  "Sets units for all dimension types except Angular: 
1 = Scientific; 2 = Decimal; 3 = Engineering;
4 = Architectural; 5 = Fractional; 6 = Windows desktop")

(defparameter *$DIMLWD* '("$DIMLWD" 70 )
  "Dimension line lineweight: 
-3 = Standard
-2 = ByLayer
-1 = ByBlock
0-211 = an integer representing 100th of mm")


(defparameter *$DIMLWE* '("$DIMLWE" 70 )
  "Extension line lineweight: 
-3 = Standard
-2 = ByLayer
-1 = ByBlock
0-211 = an integer representing 100th of mm")


(defparameter *$DIMPOST* '("$DIMPOST" 1 ) "General dimensioning suffix")

(defparameter *$DIMRND* '("$DIMRND" 40 ) "Rounding value for dimension distances")

(defparameter *$DIMSAH* '("$DIMSAH" 70 ) "Use separate arrow blocks if nonzero")

(defparameter *$DIMSCALE* '("$DIMSCALE" 40 ) "Overall dimensioning scale factor")

(defparameter *$DIMSD1* '("$DIMSD1" 70 ) "Suppression of first extension line: 0 = Not suppressed; 1 = Suppressed")


(defparameter *$DIMSD2* '("$DIMSD2" 70 ) "Suppression of second extension line: 0 = Not suppressed; 1 = Suppressed")




(defparameter *$DIMSE1* '("$DIMSE1" 70 )
    " First extension line suppressed if nonzero")

(defparameter *$DIMSE2* '("$DIMSE2" 70 )
  " Second extension line suppressed if nonzero")

(defparameter *$DIMSHO* '("$DIMSHO" 70 )
  " 1 = Recompute dimensions while dragging 0 = Drag original image")


(defparameter *$DIMSOXD* '("$DIMSOXD" 70 )
  " Suppress outside-extensions dimension lines if nonzero")

(defparameter *$DIMSTYLE* '("$DIMSTYLE" 2 )
  " Dimension style name")

(defparameter *$DIMTAD* '("$DIMTAD" 70 )
  " Text above dimension line if nonzero")

(defparameter *$DIMTDEC* '("$DIMTDEC" 70 )
  " Number of decimal places to display the tolerance values")

(defparameter *$DIMTFAC* '("$DIMTFAC" 40 )
  " Dimension tolerance display scale factor")

(defparameter *$DIMTIH* '("$DIMTIH" 70 )
  " Text inside horizontal if nonzero")

(defparameter *$DIMTIX* '("$DIMTIX" 70 )
  " Force text inside extensions if nonzero")

(defparameter *$DIMTM* '("$DIMTM" 40 )
  " Minus tolerance")

(defparameter *$DIMTMOVE* '("$DIMTMOVE" 70 )
  " Dimension text movement rules: 
0 = Moves the dimension line with dimension text
1 = Adds a leader when dimension text is moved
2 = Allows text to be moved freely without a leader")


(defparameter *$DIMTOFL* '("$DIMTOFL" 70 )
  " If text is outside extensions, force line extensions between extensions if nonzero")

(defparameter *$DIMTOH* '("$DIMTOH" 70 )
  " Text outside horizontal if nonzero")

(defparameter *$DIMTOL* '("$DIMTOL" 70 )
  " Dimension tolerances generated if nonzero")

(defparameter *$DIMTOLJ* '("$DIMTOLJ" 70 )
  " Vertical justification for tolerance values: 
0 = Top; 1 = Middle; 2 = Bottom")


(defparameter *$DIMTP* '("$DIMTP" 40 )
  " Plus tolerance")

(defparameter *$DIMTSZ* '("$DIMTSZ" 40 )
  " Dimensioning tick size: 0 = No ticks")


(defparameter *$DIMTVP* '("$DIMTVP" 40 )
  " Text vertical position")

(defparameter *$DIMTXSTY* '("$DIMTXSTY" 7 )
  " Dimension text style")

(defparameter *$DIMTXT* '("$DIMTXT" 40 )
  " Dimensioning text height")

(defparameter *$DIMTZIN* '("$DIMTZIN" 70 )
  " Controls suppression of zeros for tolerance values: 
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches
3 = Includes zero inches and suppresses zero feet")

(defparameter *$DIMUPT* '("$DIMUPT" 70 )
  " Cursor functionality for user-positioned text: 
0 = Controls only the dimension line location
1 = Controls the text position as well as the dimension line location")


(defparameter *$DIMZIN* '("$DIMZIN" 70 )
  " Controls suppression of zeros for primary unit values: 
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches
3 = Includes zero inches and suppresses zero feet")


(defparameter *$DISPSILH* '("$DISPSILH" 70 )
  " Controls the display of silhouette curves of body objects in Wireframe mode: 
0 = Off; 1 = On")


(defparameter *$DRAGVS* '("$DRAGVS" 349 )
  " Hard-pointer ID to visual style while creating 3D solid primitives. 
The defualt value is NULL")


(defparameter *$DWGCODEPAGE* '("$DWGCODEPAGE" 3 )
  " Drawing code page; set to the system code page when a new drawing is created, but not otherwise maintained by AutoCAD")


(defparameter *$ELEVATION* '("$ELEVATION" 40 )
  " Current elevation set by ELEV command")

(defparameter *$ENDCAPS* '("$ENDCAPS" 280 )
  " Lineweight endcaps setting for new objects: 0 = none; 1 = round; 2 = angle; 3 = square")


(defparameter *$EXTMAX* '("$EXTMAX" '(10 20 30) )
  " X, Y, and Z drawing extents upper-right corner (in WCS)")

(defparameter *$EXTMIN* '("$EXTMIN" '(10 20 30) )
  " X, Y, and Z drawing extents lower-left corner (in WCS)")

(defparameter *$EXTNAMES* '("$EXTNAMES" 290 )
  " Controls symbol table naming: 
0 = Release 14 compatibility. Limits names to 31 characters in length.
Names can include the letters A to Z, the numerals 0 to 9, and the special
characters dollar sign ($), underscore (_), and hyphen (-).
1 = AutoCAD 2000. Names can be up to 255 characters in length, and can include
the letters A to Z, the numerals 0 to 9, spaces, and any special characters not
used for other purposes by Microsoft Windows and AutoCAD")


(defparameter *$FILLETRAD* '("$FILLETRAD" 40 )
  " Fillet radius")

(defparameter *$FILLMODE* '("$FILLMODE" 70 )
  " Fill mode on if nonzero")

(defparameter *$FINGERPRINTGUID* '("$FINGERPRINTGUID" 2 )
  " Set at creation time, uniquely identifies a particular drawing")

(defparameter *$HALOGAP* '("$HALOGAP" 280 )
  " Specifies a gap to be displayed where an object is hidden by another object; 
the value is specified as a percent of one unit and is independent of the
zoom level. A haloed line is shortened at the point where it is hidden when
HIDE or the Hidden option of SHADEMODE is used")


(defparameter *$HANDSEED* '("$HANDSEED" 5 )
  " Next available handle")

(defparameter *$HIDETEXT* '("$HIDETEXT" 290 )
  " Specifies HIDETEXT system variable: 
0 = HIDE ignores text objects when producing the hidden view
1 = HIDE does not ignore text objects")


(defparameter *$HYPERLINKBASE* '("$HYPERLINKBASE" 1 )
  " Path for all relative hyperlinks in the drawing. If null, the drawing path is used")

(defparameter *$INDEXCTL* '("$INDEXCTL" 280 )
  " Controls whether layer and spatial indexes are created and saved in drawing files: 
0 = No indexes are created
1 = Layer index is created
2 = Spatial index is created
3 = Layer and spatial indexes are created")


(defparameter *$INSBASE* '("$INSBASE" '(10 20 30) )
  " Insertion base set by BASE command (in WCS)")

(defparameter *$INSUNITS* '("$INSUNITS" 70 )
  "Default drawing units for AutoCAD DesignCenter blocks: 
0 = Unitless; 1 = Inches; 2 = Feet; 3 = Miles; 4 = Millimeters;
5 = Centimeters; 6 = Meters; 7 = Kilometers; 8 = Microinches;
9 = Mils; 10 = Yards; 11 = Angstroms; 12 = Nanometers;
13 = Microns; 14 = Decimeters; 15 = Decameters;
16 = Hectometers; 17 = Gigameters; 18 = Astronomical units;
19 = Light years; 20 = Parsecs")


(defparameter *$INTERFERECOLOR* '("$INTERFERECOLOR" 62 )
  "Represents the ACI color index of the \"interference objects\" created during the interfere command.Default value is 1")


(defparameter *$INTERFEREOBJVS* '("$INTERFEREOBJVS" 345 )
  " Hard-pointer ID to the visual style for interference objects. Default visual style is Conceptual.")


(defparameter *$INTERFEREVPVS* '("$INTERFEREVPVS" 346 )
  " Hard-pointer ID to the visual style for the viewport during interference checking. Default visual style is 3d Wireframe.")


(defparameter *$INTERSECTIONCOLOR* '("$INTERSECTIONCOLOR" 70 )
  " Specifies the entity color of intersection polylines: 
Values 1-255 designate an AutoCAD color index (ACI)
0 = Color BYBLOCK
256 = Color BYLAYER
257 = Color BYENTITY")


(defparameter *$INTERSECTIONDISPLAY* '("$INTERSECTIONDISPLAY" 290 )
  " Specifies the display of intersection polylines: 
0 = Turns off the display of intersection polylines
1 = Turns on the display of intersection polylines")


(defparameter *$JOINSTYLE* '("$JOINSTYLE" 280 )
  " Lineweight joint setting for new objects: 0=none; 1= round; 2 = angle; 3 = flat")


(defparameter *$LIMCHECK* '("$LIMCHECK" 70 )
  " Nonzero if limits checking is on")

(defparameter *$LIMMAX* '("$LIMMAX"  '(10 20) )
  " XY drawing limits upper-right corner (in WCS)")

(defparameter *$LIMMIN* '("$LIMMIN"  '(10 20) )
  " XY drawing limits lower-left corner (in WCS)")

(defparameter *$LTSCALE* '("$LTSCALE" 40 )
  " Global linetype scale")

(defparameter *$LUNITS* '("$LUNITS" 70 )
  " Units format for coordinates and distances")

(defparameter *$LUPREC* '("$LUPREC" 70 )
  " Units precision for coordinates and distances")

(defparameter *$LWDISPLAY* '("$LWDISPLAY" 290 )
  " Controls the display of lineweights on the Model or Layout tab: 
0 = Lineweight is not displayed
1 = Lineweight is displayed")


(defparameter *$MAXACTVP* '("$MAXACTVP" 70 )
  " Sets maximum number of viewports to be regenerated")

(defparameter *$MEASUREMENT* '("$MEASUREMENT" 70 )
  " Sets drawing units: 0 = English; 1 = Metric")

(defparameter *$MENU* '("$MENU" 1 )
  " Name of menu file")

(defparameter *$MIRRTEXT* '("$MIRRTEXT" 70 )
  " Mirror text if nonzero")

(defparameter *$OBSCOLOR* '("$OBSCOLOR" 70 )
  " Specifies the color of obscured lines. An obscured line is a hidden line made visible by changing its color and linetype and is visible only when the HIDE or SHADEMODE command is used. The OBSCUREDCOLOR setting is visible only if the OBSCUREDLTYPE is turned ON by setting it to a value other than 0.
0 and 256 = Entity color 1-255 = An AutoCAD color index (ACI)")


(defparameter *$OBSLTYPE* '("$OBSLTYPE" 280 )
  " Specifies the linetype of obscured lines. Obscured linetypes are independent of zoom level, unlike regular AutoCAD linetypes. Value 0 turns off display of obscured lines and is the default.
Linetype values are defined as follows: 0 = Off 1 = Solid
2 = Dashed
3 = Dotted
4 = Short Dash
5 = Medium Dash
6 = Long Dash
7 = Double Short Dash
8 = Double Medium Dash
9 = Double Long Dash
10 = Medium Long Dash
11 = Sparse Dot")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *$ORTHOMODE* '("$ORTHOMODE" 70 )
  " Ortho mode on if nonzero")

(defparameter *$PDMODE* '("$PDMODE" 70 )
  " Point display mode")

(defparameter *$PDSIZE* '("$PDSIZE" 40 )
  " Point display size")

(defparameter *$PELEVATION* '("$PELEVATION" 40 )
  " Current paper space elevation")

(defparameter *$PEXTMAX* '("$PEXTMAX" '(10 20 30) )
  " Maximum X, Y, and Z extents for paper space")

(defparameter *$PEXTMIN* '("$PEXTMIN" '(10 20 30) )
  " Minimum X, Y, and Z extents for paper space")

(defparameter *$PINSBASE* '("$PINSBASE" '(10 20 30) )
  " Paper space insertion base point")

(defparameter *$PLIMCHECK* '("$PLIMCHECK" 70 )
  " Limits checking in paper space when nonzero")

(defparameter *$PLIMMAX* '("$PLIMMAX"  '(10 20) )
  " Maximum X and Y limits in paper space")

(defparameter *$PLIMMIN* '("$PLIMMIN"  '(10 20) )
  " Minimum X and Y limits in paper space")

(defparameter *$PLINEGEN* '("$PLINEGEN" 70 )
  " Governs the generation of linetype patterns around the vertices of a 2D polyline: 
1 = Linetype is generated in a continuous pattern around vertices of the polyline
0 = Each segment of the polyline starts and ends with a dash")


(defparameter *$PLINEWID* '("$PLINEWID" 40 )
  " Default polyline width")

(defparameter *$PROJECTNAME* '("$PROJECTNAME" 1 )
  " Assigns a project name to the current drawing. Used when an external reference or image is not found on its original path. The project name points to a section in
the registry that can contain one or more search paths for each project name defined.
Project names and their search directories are created from the Files tab of the Options dialog box")


(defparameter *$PROXYGRAPHICS* '("$PROXYGRAPHICS" 70 )
  " Controls the saving of proxy object images")

(defparameter *$PSLTSCALE* '("$PSLTSCALE" 70 )
  " Controls paper space linetype scaling: 
1 = No special linetype scaling
0 = Viewport scaling governs linetype scaling")


(defparameter *$PSTYLEMODE* '("$PSTYLEMODE" 290 )
  " Indicates whether the current drawing is in a Color-Dependent or Named Plot Style mode: 
0 = Uses named plot style tables in the current drawing
1 = Uses color-dependent plot style tables in the current drawing")


(defparameter *$PSVPSCALE* '("$PSVPSCALE" 40 )
  " View scale factor for new viewports: 
0 = Scaled to fit
>0 = Scale factor (a positive real value)")


(defparameter *$PUCSBASE* '("$PUCSBASE" 2 )
  " Name of the UCS that defines the origin and orientation of orthographic UCS settings (paper space only)")

(defparameter *$PUCSNAME* '("$PUCSNAME" 2 )
  " Current paper space UCS name")

(defparameter *$PUCSORG* '("$PUCSORG" '(10 20 30) )
  " Current paper space UCS origin")

(defparameter *$PUCSORGBACK* '("$PUCSORGBACK" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to BACK when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGBOTTOM* '("$PUCSORGBOTTOM" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to BOTTOM when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGFRONT* '("$PUCSORGFRONT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to FRONT when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGLEFT* '("$PUCSORGLEFT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to LEFT when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGRIGHT* '("$PUCSORGRIGHT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to RIGHT when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGTOP* '("$PUCSORGTOP" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to TOP when PUCSBASE is set to WORLD")

(defparameter *$PUCSORTHOREF* '("$PUCSORTHOREF" 2 )
  " If paper space UCS is orthographic (PUCSORTHOVIEW not equal to 0), this is the name of the UCS that the orthographic UCS is relative to. If blank, UCS is relative to WORLD")


(defparameter *$PUCSORTHOVIEW* '("$PUCSORTHOVIEW" 70 )
  " Orthographic view type of paper space UCS: 0 = UCS is not orthographic;
1 = Top; 2 = Bottom;
3 = Front; 4 = Back;
5 = Left; 6 = Right")


(defparameter *$PUCSXDIR* '("$PUCSXDIR" '(10 20 30) )
  " Current paper space UCS X axis")

(defparameter *$PUCSYDIR* '("$PUCSYDIR" '(10 20 30) )
  " Current paper space UCS Y axis")

(defparameter *$QTEXTMODE* '("$QTEXTMODE" 70 )
  " Quick Text mode on if nonzero")

(defparameter *$REGENMODE* '("$REGENMODE" 70 )
  " REGENAUTO mode on if nonzero")

(defparameter *$SHADEDGE* '("$SHADEDGE" 70 )
  " 0 = Faces shaded, edges not highlighted 
1 = Faces shaded, edges highlighted in black
2 = Faces not filled, edges in entity color
3 = Faces in entity color, edges in black")


(defparameter *$SHADEDIF* '("$SHADEDIF" 70 )
  " Percent ambient/diffuse light; range 1-100; default 70")

(defparameter *$SHADOWPLANELOCATION* '("$SHADOWPLANELOCATION" 40 )
  " Location of the ground shadow plane. This is a Z axis ordinate.")

(defparameter *$SKETCHINC* '("$SKETCHINC" 40 )
  " Sketch record increment")

(defparameter *$SKPOLY* '("$SKPOLY" 70 )
  " 0 = Sketch lines; 1 = Sketch polylines")

(defparameter *$SORTENTS* '("$SORTENTS" 280 )
  " Controls the object sorting methods; accessible from the Options dialog box User Preferences tab. 
SORTENTS uses the following bitcodes: 0 = Disables SORTENTS
1 = Sorts for object selection
2 = Sorts for object snap
4 = Sorts for redraws
8 = Sorts for MSLIDE command slide creation
16 = Sorts for REGEN commands
32 = Sorts for plotting
64 = Sorts for PostScript output")


(defparameter *$SPLINESEGS* '("$SPLINESEGS" 70 )
  " Number of line segments per spline patch")

(defparameter *$SPLINETYPE* '("$SPLINETYPE" 70 )
  " Spline curve type for PEDIT Spline")

(defparameter *$SURFTAB1* '("$SURFTAB1" 70 )
  " Number of mesh tabulations in first direction")

(defparameter *$SURFTAB2* '("$SURFTAB2" 70 )
  " Number of mesh tabulations in second direction")

(defparameter *$SURFTYPE* '("$SURFTYPE" 70 )
  " Surface type for PEDIT Smooth")

(defparameter *$SURFU* '("$SURFU" 70 )
  " Surface density (for PEDIT Smooth) in M direction")

(defparameter *$SURFV* '("$SURFV" 70 )
  " Surface density (for PEDIT Smooth) in N direction")

(defparameter *$TDCREATE* '("$TDCREATE" 40 )
  " Local date/time of drawing creation (see Special Handling of Date/Time Variables)")

(defparameter *$TDINDWG* '("$TDINDWG" 40 )
  " Cumulative editing time for this drawing (see Special Handling of Date/Time Variables)")

(defparameter *$TDUCREATE* '("$TDUCREATE" 40 )
  " Universal date/time the drawing was created (see Special Handling of Date/Time Variables)")

(defparameter *$TDUPDATE* '("$TDUPDATE" 40 )
  " Local date/time of last drawing update (see Special Handling of Date/Time Variables)")

(defparameter *$TDUSRTIMER* '("$TDUSRTIMER" 40 )
  " User-elapsed timer")

(defparameter *$TDUUPDATE* '("$TDUUPDATE" 40 )
  " Universal date/time of the last update/save (see Special Handling of Date/Time Variables)")

(defparameter *$TEXTSIZE* '("$TEXTSIZE" 40 )
  " Default text height")

(defparameter *$TEXTSTYLE* '("$TEXTSTYLE" 7 )
  " Current text style name")

(defparameter *$THICKNESS* '("$THICKNESS" 40 )
  " Current thickness set by ELEV command")

(defparameter *$TILEMODE* '("$TILEMODE" 70 )
  " 1 for previous release compatibility mode; 0 otherwise")

(defparameter *$TRACEWID* '("$TRACEWID" 40 )
  " Default trace width")

(defparameter *$TREEDEPTH* '("$TREEDEPTH" 70 )
  " Specifies the maximum depth of the spatial index")

(defparameter *$UCSBASE* '("$UCSBASE" 2 )
  " Name of the UCS that defines the origin and orientation of orthographic UCS settings")

(defparameter *$UCSNAME* '("$UCSNAME" 2 )
  " Name of current UCS")

(defparameter *$UCSORG* '("$UCSORG" '(10 20 30) )
  " Origin of current UCS (in WCS)")

(defparameter *$UCSORGBACK* '("$UCSORGBACK" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to BACK when UCSBASE is set to WORLD")

(defparameter *$UCSORGBOTTOM* '("$UCSORGBOTTOM" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to BOTTOM when UCSBASE is set to WORLD")

(defparameter *$UCSORGFRONT* '("$UCSORGFRONT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to FRONT when UCSBASE is set to WORLD")

(defparameter *$UCSORGLEFT* '("$UCSORGLEFT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to LEFT when UCSBASE is set to WORLD")

(defparameter *$UCSORGRIGHT* '("$UCSORGRIGHT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to RIGHT when UCSBASE is set to WORLD")

(defparameter *$UCSORGTOP* '("$UCSORGTOP" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to TOP when UCSBASE is set to WORLD")

(defparameter *$UCSORTHOREF* '("$UCSORTHOREF" 2 )
  " If model space UCS is orthographic (UCSORTHOVIEW not equal to 0), this is the name of the UCS that the orthographic UCS is relative to. If blank, UCS is relative to WORLD")


(defparameter *$UCSORTHOVIEW* '("$UCSORTHOVIEW" 70 )
  " Orthographic view type of model space UCS: 
0 = UCS is not orthographic;
1 = Top; 2 = Bottom;
3 = Front; 4 = Back;
5 = Left; 6 = Right")


(defparameter *$UCSXDIR* '("$UCSXDIR" '(10 20 30) )
  " Direction of the current UCS X axis (in WCS)")

(defparameter *$UCSYDIR* '("$UCSYDIR" '(10 20 30) )
  " Direction of the current UCS Y axis (in WCS)")

(defparameter *$UNITMODE* '("$UNITMODE" 70 )
  " Low bit set = Display fractions, feet-and-inches, and surveyor's angles in input format")

(defparameter *$USERI1* '("$USERI1" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI2* '("$USERI2" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI3* '("$USERI3" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI4* '("$USERI4" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI5* '("$USERI5" 70) "Five integer variables intended for use by third-party developers")

(defparameter *$USERR1* '("$USERR1" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR2* '("$USERR2" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR3* '("$USERR3" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR4* '("$USERR4" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR5* '("$USERR5" 40) "Five real variables intended for use by third-party developers")

(defparameter *$USRTIMER* '("$USRTIMER" 70 ) "0 = Timer off; 1 = Timer on")

(defparameter *$VERSIONGUID* '("$VERSIONGUID" 2 ) "Uniquely identifies a particular version of a drawing. Updated when the drawing is modified")

(defparameter *$VISRETAIN* '("$VISRETAIN" 70 ) "0 = Don't retain xref-dependent visibility settings; 1 = Retain xref-dependent visibility settings")

(defparameter *$WORLDVIEW* '("$WORLDVIEW" 70 ) "1 = Set UCS to WCS during DVIEW/VPOINT; 0 = Don't change UCS")


(defparameter *$XCLIPFRAME* '("$XCLIPFRAME" 290 ) "Controls the visibility of xref clipping boundaries: 
0 = Clipping boundary is not visible
1 = Clipping boundary is visible")


(defparameter *$XEDIT* '("$XEDIT" 290 ) "Controls whether the current drawing can be edited in-place when being referenced by another drawing. 1 = Can use in-place reference editing")


