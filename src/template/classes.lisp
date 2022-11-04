
(in-package :dxf/template)

(dxf/utils:make-class-name "AcadObjectID")
(dxf/utils:make-method-name "AcadObjectID")
(dxf/utils:make-proprety-name "AcadObjectID")
(dxf/utils:make-event-name "AcadObjectID")


(mnas-graph/view:view-graph *active-x-object-graph*)

(defparameter *objects-activex*
  '(("AcadState"
     "A special object to use in monitoring the state of AutoCAD from out-of-process applications.")
    ("AcCmColor"
     "AutoCAD true color object.")
    ("Application"
     "An instance of the AutoCAD application.")
    ("Arc"
     "A circular arc.")
    ("Attribute"
     "An object appearing as a text string that describes the characteristics of an attribute reference.")
    ("AttributeReference"
     "An object containing text that links to a block.")
    ("Block"
     "A block definition containing a name and a set of objects.")
    ("BlockReference"
     "An instance of a block definition inserted into a drawing.")
    ("Blocks Collection"
     "The collection of all blocks in the drawing.")
    ("Circle"
     "A full circle.")
    ("Database"
     "The contents of an XRef block.")
    ("DatabasePreferences"
     "An object that specifies the settings for the current AutoCAD drawing.")
    ("DgnUnderlay"
     "A source of DGN underlay content.")
    ("Dictionaries Collection"
     "The collection of all dictionaries in the drawing.")
    ("Dictionary"
     "A container object for storing and retrieving objects.")
    ("Dim3PointAngular"
     "A dimension measuring the angular distance between three points.")
    ("DimAligned"
     "A linear dimension, measuring the distance between two points, that is displayed parallel to the points being measured.")
    ("DimAngular"
     "A dimension measuring the angular distance between two lines or between the angle of a circular arc.")
    ("DimArcLength"
     "A dimension measuring the length of an arc.")
    ("DimDiametric"
     "A dimension measuring the diameter of a circle or arc.")
    ("DimOrdinate"
     "A dimension measuring the absolute X or Y position of a point from the origin.")
    ("DimRadial"
     "A dimension measuring the radius of a circle or arc.")
    ("DimRadialLarge"
     "A dimension measuring a large radius, also known as a jogged radius dimension.")
    ("DimRotated"
     "A dimension that measures the distance between two points and is displayed at a given rotation.")
    ("DimStyle"
     "A group of dimension settings that determines the appearance of a dimension.")
    ("DimStyles Collection"
     "The collection of all dimension styles in the drawing.")
    ("Document"
     "An AutoCAD drawing.")
    ("Documents Collection"
     "The collection of all AutoCAD drawings that are open in the current session.")
    ("DwfUnderlay"
     "A source of DWF/DWFx underlay content.")
    ("DynamicBlockReferenceProperty"
     "An object containing the properties of a dynamic block.")
    ("Ellipse"
     "An elliptical arc or full ellipse.")
    ("ExternalReference"
     "An instance of an external reference inserted into a drawing.")
    ("ExtrudedSurface"
     "A surface created by extruding an object or a planar face a specified distance and direction.")
    ("FileDependencies Collection"
     "Creates, updates, retrieves, and removes items in the File Dependency List.")
    ("FileDependency"
     "Provides information about entries in the File Dependency List of a drawing file.")
    ("GeomapImage"
     "An embedded raster image which is captured from a portion of LiveMap.")
    ("GeoPositionMarker"
     "A geographical location aware marker object with a label.")
    ("Group"
     "A named SelectionSet object.")
    ("Groups Collection"
     "The collection of all groups in the drawing.")
    ("Hatch"
     "An area fill consisting of a pattern of lines.")
    ("Helix"
     "A helix.")
    ("Hyperlink"
     "A URL and URL description.")
    ("Hyperlinks Collection"
     "The collection of all hyperlinks for a given object.")
    ("IAcadDatabase Interface"
     "Provides an interface to the database resident objects in an AutoCAD document.")
    ("IAcadDimension Interface"
     "The common interface for AutoCAD dimensions.")
    ("IAcadEntity Interface"
     "The standard interface for a basic AutoCAD entity.")
    ("IAcadMLeaderLeader Interface"
     "AutoCAD Multileader Leader Line Interface.")
    ("IAcadObject Interface"
     "The standard interface for a basic AutoCAD object.")
    ("IAcadObjectEvents Interface"
     "The event interface for a basic AutoCAD object.")
    ("IDPair"
     "A special object for use with the CopyObjects method that contains the object IDs of both the source and destination objects.")
    ("Layer"
     "A logical grouping of data, similar to transparent acetate overlays on a drawing.")
    ("Layers Collection"
     "The collection of all layers in the drawing.")
    ("LayerStateManager"
     "Saves and restores layer settings.")
    ("Layout"
     "The plot settings and visual properties of a model space or paper space block.")
    ("Layouts Collection"
     "The collection of all layouts in the drawing.")
    ("Leader"
     "An object composed of an arrowhead attached to splines or straight line segments.")
    ("LightweightPolyline"
     "A 2D line with adjustable width composed of line and arc segments.")
    ("Line"
     "A single line segment.")
    ("Linetype"
     "The line characteristics consisting of combinations of dashes, dots, and spaces.")
    ("Linetypes Collection"
     "The collection of all linetypes in the drawing.")
    ("LoftedSurface"
     "A surface created by lofting through a set of two or more curves.")
    ("Material"
     "The render material characteristics.")
    ("Materials Collection"
     "The collection of all materials in the drawing.")
    ("MenuBar Collection"
     "A collection of PopupMenu objects representing the current AutoCAD menu bar.")
    ("MenuGroup"
     "An AutoCAD menu group.")
    ("MenuGroups Collection"
     "A collection of MenuGroup objects representing all the menu groups loaded in the current AutoCAD session.")
    ("MInsertBlock"
     "A rectangular array of block references.")
    ("MLeader"
     "An object composed of an arrowhead attached to multiple splines or straight line segments.")
    ("MLeaderStyle"
     "Adds, modifies, and deletes MLeader styles.")
    ("MLine"
     "Multiple parallel lines.")
    ("ModelSpace Entities Collection"
     "A special Block object containing all model space entities.")
    ("MText"
     "A paragraph of alphanumeric characters that fits within a nonprinting text boundary.")
    ("NurbSurface"
     "A surface created when NURBS creation is enabled while creating procedural or complex 3D surfaces, or by converting existing surfaces.")
    ("OLE"
     "An AutoCAD OLE object.")
    ("PaperSpace Entities Collection"
     "A special Block object containing all the entities in the active paper space layout.")
    ("PdfUnderlay"
     "A source of PDF underlay content.")
    ("PlaneSurface"
     "A planar surface.")
    ("Plot"
     "The set of methods and properties used for plotting layouts.")
    ("PlotConfiguration"
     "A named collection of plot settings.")
    ("PlotConfigurations Collection"
     "A collection of named plot settings.")
    ("Point"
     "A point marker appearing as a dot, square, circle, X, tick, or plus sign (+); or as a combination of these.")
    ("PointCloud"
     "A source of point cloud content.")
    ("PointCloudEx"
     "A point cloud extension entity.")
    ("PolyfaceMesh"
     "A three-dimensional polyface mesh.")
    ("PolygonMesh"
     "A free-form 3D mesh.")
    ("Polyline"
     "A 2D line of adjustable width or a 3D line or mesh of non-adjustable width composed of line and arc segments.")
    ("PopupMenu"
     "An AutoCAD cascading menu.")
    ("PopupMenuItem"
     "A single menu item on an AutoCAD pull-down menu.")
    ("PopupMenus Collection"
     "A collection of PopupMenu objects representing all the popup menus loaded in the MenuGroup.")
    ("Preferences"
     "This object specifies the current AutoCAD settings.")
    ("PreferencesDisplay"
     "This object contains the options from the Display tab on the Options dialog box.")
    ("PreferencesDrafting"
     "This object contains the options from the Drafting tab on the Options dialog box.")
    ("PreferencesFiles"
     "This object contains the options from the Files tab on the Options dialog box.")
    ("PreferencesOpenSave"
     "This object contains options from the Open and Save tab on the Options dialog box.")
    ("PreferencesOutput"
     "This object contains the options from the Output tab on the Options dialog box.")
    ("PreferencesProfiles"
     "This object contains the options from the Profiles tab on the Options dialog box.")
    ("PreferencesSelection"
     "This object contains the options from the Selection tab on the Options dialog box.")
    ("PreferencesSystem"
     "This object contains the options from the System tab on the Options dialog box.")
    ("PreferencesUser"
     "This object contains the options from the User tab on the Options dialog box.")
    ("PViewport"
     "Rectangular objects created in paper space that display views.")
    ("RasterImage"
     "A raster image consisting of a rectangular grid (or raster) of small squares or dots known as pixels.")
    ("Ray"
     "A semi-infinite line.")
    ("Region"
     "A bounded planar face consisting of lines, circles, arcs, elliptical arcs, and spline curves.")
    ("RegisteredApplication"
     "An external application that has been added to the drawing.")
    ("RegisteredApplications Collection"
     "The collection of all registered applications in the drawing.")
    ("RevolvedSurface"
     "A surface created by revolving one or more 2D objects about an axis.")
    ("Section"
     "A section plane entity created at the intersection of a plane and a solid.")
    ("SectionManager"
     "This object manages the collection of section planes in the DWG database.")
    ("SectionSettings"
     "A container for section geometry settings.")
    ("SectionTypeSettings"
     "The settings that apply to the various types of sections.")
    ("SecurityParams"
     "Supplies information necessary for performing security operations on drawing files.")
    ("SelectionSet"
     "A group of one or more AutoCAD objects specified for processing as a single unit.")
    ("SelectionSets Collection"
     "The collection of all selection sets in the drawing.")
    ("ShadowDisplay Interface"
     "Interface for AutoCAD entities with shadows.")
    ("Shape"
     "An object comprising lines, arcs, and circles defined in an SHX file.")
    ("Solid"
     "A solid-filled polygon.")
    ("SortentsTable"
     "Contains and manipulates draw order information.")
    ("Spline"
     "A quadratic or cubic NURBS (nonuniform rational B-spline) curve.")
    ("SubDMesh"
     "For internal use only.")
    ("SubDMeshEdge"
     "For internal use only.")
    ("SubDMeshFace"
     "For internal use only.")
    ("SubDMeshVertex"
     "For internal use only.")
    ("SubEntity"
     "For internal use only.")
    ("SubEntSolidEdge"
     "For internal use only.")
    ("SubEntSolidFace"
     "For internal use only.")
    ("SubEntSolidNode"
     "For internal use only.")
    ("SubEntSolidVertex"
     "For internal use only.")
    ("SummaryInfo"
     "Accesses drawing properties such as the Title, Subject, Author, and Keywords properties.")
    ("Surface"
     "A surface entity.")
    ("SweptSurface"
     "A surface created by sweeping a 2D curve along a path.")
    ("Table"
     "AutoCAD table object.")
    ("TableStyle"
     "Adds, modifies, and deletes table styles.")
    ("Text"
     "A single line of alphanumeric characters.")
    ("TextStyle"
     "A named, saved collection of settings that determines the appearance of text characters.")
    ("TextStyles Collection"
     "The collection of all text styles in the drawing.")
    ("Tolerance"
     "A geometric tolerance contained in a feature control frame.")
    ("Toolbar"
     "An AutoCAD toolbar.")
    ("ToolbarItem"
     "A single button item on an AutoCAD toolbar.")
    ("Toolbars Collection"
     "A collection of Toolbar objects representing all the toolbars loaded in the current AutoCAD session.")
    ("Trace"
     "A 2D solid line of specified width.")
    ("UCS"
     "A user-defined coordinate system that determines the orientation of the X, Y, and Z axes in 3D space.")
    ("UCSs Collection"
     "The collection of all user coordinate systems (UCSs) in the drawing.")
    ("Utility"
     "A series of methods provided for utility purposes.")
    ("View"
     "A graphical representation of a 2D drawing or 3D model from a specific location (viewpoint) in space.")
    ("Viewport"
     "A bounded area that displays some portion of a drawing's model space.")
    ("Viewports Collection"
     "The collection of all viewports in the drawing.")
    ("Views Collection"
     "The collection of all views in the drawing.")
    ("Wipeout"
     "Masking object that hides the objects below it in the current draw order.")
    ("XLine"
     "A construction line that is infinite in both directions.")
    ("XRecord"
     "XRecord objects are used to store and manage arbitrary data.")))


