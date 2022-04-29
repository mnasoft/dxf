(in-package :dxf)

(defparameter *p*
  '((:properties
     "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName TrueColor VisibilityEdge1 VisibilityEdge2
   VisibilityEdge3 VisibilityEdge4 Visible")
    (:properties
     "Application Area Closed ConstantWidth Coordinate Coordinates
   Document Elevation EntityTransparency Handle HasExtensionDictionary
   Hyperlinks Layer Length Linetype LinetypeGeneration LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Thickness TrueColor Type Visible")
    (:properties
     "Application Centroid Document EntityTransparency Handle
   HasExtensionDictionary History Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material MomentOfInertia ObjectID
   ObjectName OwnerID PlotStyleName Position PrincipalDirections
   PrincipalMoments ProductOfInertia RadiiOfGyration ShowHistory
   SolidType TrueColor Visible Volume")
    (:properties
     "Blue BookName ColorIndex ColorMethod ColorName EntityColor Green
   Red")
    (:properties
     "ActiveDocument Application Caption Documents FullName Height HWND
   LocaleID MenuBar MenuGroups Name Path Preferences StatusID VBE
   Version Visible Width WindowLeft WindowState WindowTop")
    (:properties
     "Application ArcLength Area Center Document EndAngle EndPoint
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight Material Normal ObjectID
   ObjectName OwnerID PlotStyleName Radius StartAngle StartPoint
   Thickness TotalAngle TrueColor Visible")
    (:properties
     "Alignment Application Backward Constant Document
   EntityTransparency FieldLength Handle HasExtensionDictionary Height
   Hyperlinks InsertionPoint Invisible Layer Linetype LinetypeScale
   Lineweight LockPosition Material Mode MTextAttribute
   MTextAttributeContent MTextBoundaryWidth MTextDrawingDirection
   Normal ObjectID ObjectName ObliqueAngle OwnerID PlotStyleName
   Preset PromptString Rotation ScaleFactor StyleName TagString
   TextAlignmentPoint TextGenerationFlag TextString Thickness
   TrueColor UpsideDown Verify Visible")
    (:properties
     "Alignment Application Backward Constant Document
   EntityTransparency FieldLength Handle HasExtensionDictionary Height
   Hyperlinks InsertionPoint Invisible Layer Linetype LinetypeScale
   Lineweight LockPosition Material MTextAttribute
   MTextAttributeContent MTextBoundaryWidth MTextDrawingDirection
   Normal ObjectID ObjectName ObliqueAngle OwnerID PlotStyleName
   Rotation ScaleFactor StyleName TagString TextAlignmentPoint
   TextGenerationFlag TextString Thickness TrueColor UpsideDown
   Visible")
    (:properties
     "Application BlockScaling Comments Count Document Explodable Handle
   HasExtensionDictionary IsDynamicBlock IsLayout IsXRef Layout
   Material Name ObjectID ObjectName Origin OwnerID Path Units
   XRefDatabase")
    (:properties
     "Application Document EffectiveName EntityTransparency Handle
   HasAttributes HasExtensionDictionary Hyperlinks InsertionPoint
   InsUnits InsUnitsFactor IsDynamicBlock Layer Linetype LinetypeScale
   Lineweight Material Name Normal ObjectID ObjectName OwnerID
   PlotStyleName Rotation TrueColor Visible XEffectiveScaleFactor
   XScaleFactor YEffectiveScaleFactor YScaleFactor
   ZEffectiveScaleFactor ZScaleFactor")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Area Center Circumference Diameter Document
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight Material Normal ObjectID
   ObjectName OwnerID PlotStyleName Radius Thickness TrueColor
   Visible")
    (:properties
     "Application Document EffectiveName EntityTransparency Handle
   HasAttributes HasExtensionDictionary Hyperlinks InsertionPoint
   InsUnits InsUnitsFactor IsDynamicBlock Layer LayerPropertyOverrides
   Linetype LinetypeScale Lineweight Material Name Normal ObjectID
   ObjectName OwnerID Path PlotStyleName Rotation TrueColor Visible
   XEffectiveScaleFactor XScaleFactor YEffectiveScaleFactor
   YScaleFactor ZEffectiveScaleFactor ZScaleFactor")
    (:properties
     "Blocks Dictionaries DimStyles ElevationModelSpace
   ElevationPaperSpace Groups Layers Layouts Limits Linetypes Material
   ModelSpace PaperSpace PlotConfigurations Preferences
   RegisteredApplications SectionManager SummaryInfo TextStyles
   UserCoordinateSystems Viewports Views")
    (:properties
     "AllowLongSymbolNames Application ContourlinesPerSurface
    DisplaySilhouette Lineweight LineweightDisplay MaxActiveViewports
    ObjectSortByPlotting ObjectSortByPSOutput ObjectSortByRedraws
    ObjectSortByRegens ObjectSortBySelection ObjectSortBySnap
    OLELaunch RenderSmoothness SegmentPerPolyline SolidFill
    TextFrameDisplay XRefEdit XRefLayerVisibility")
    (:properties
     "AdjustForBackground Application ClippingEnabled Contrast Document
    EntityTransparency Fade File Handle HasExtensionDictionary Height
    Hyperlinks ItemName Layer Linetype LinetypeScale Lineweight
    Material Monochrome ObjectID ObjectName OwnerID PlotStyleName
    Position Rotation ScaleFactor TrueColor
    UnderlayLayerOverrideApplied UnderlayName UnderlayVisibility
    Visible Width")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Count Document Handle HasExtensionDictionary Name
   ObjectID ObjectName OwnerID")
    (:properties
     "AngleFormat AngleVertex Application Arrowhead1Block Arrowhead1Type
   Arrowhead2Block Arrowhead2Type ArrowheadSize DecimalSeparator
   DimConstrDesc DimConstrExpression DimConstrForm DimConstrName
   DimConstrReference DimConstrValue DimensionLineColor
   DimensionLinetype DimensionLineWeight DimLine1Suppress
   DimLine2Suppress DimLineInside DimTxtDirection Document
   EntityTransparency ExtensionLineColor ExtensionLineExtend
   ExtensionLineOffset ExtensionLineWeight ExtLine1EndPoint
   ExtLine1Linetype ExtLine1Suppress ExtLine2EndPoint ExtLine2Linetype
   ExtLine2Suppress ExtLineFixedLen ExtLineFixedLenSuppress Fit
   ForceLineInside Handle HasExtensionDictionary
   HorizontalTextPosition Hyperlinks Layer Linetype LinetypeScale
   Lineweight Material Measurement Normal ObjectID ObjectName OwnerID
   PlotStyleName Rotation ScaleFactor StyleName SuppressLeadingZeros
   SuppressTrailingZeros TextColor TextFill TextFillColor TextGap
   TextHeight TextInside TextInsideAlign TextMovement TextOutsideAlign
   TextOverride TextPosition TextPrecision TextPrefix TextRotation
   TextStyle TextSuffix ToleranceDisplay ToleranceHeightScale
   ToleranceJustification ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceUpperLimit TrueColor VerticalTextPosition Visible")
    (:properties
     "AltRoundDistance AltSubUnitsFactor AltSubUnitsSuffix
   AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   Arrowhead1Block Arrowhead1Type Arrowhead2Block Arrowhead2Type
   ArrowheadSize DecimalSeparator DimConstrDesc DimConstrExpression
   DimConstrForm DimConstrName DimConstrReference DimConstrValue
   DimensionLineColor DimensionLineExtend DimensionLinetype
   DimensionLineWeight DimLine1Suppress DimLine2Suppress DimLineInside
   DimTxtDirection Document EntityTransparency ExtensionLineColor
   ExtensionLineExtend ExtensionLineOffset ExtensionLineWeight
   ExtLine1Linetype ExtLine1Point ExtLine1Suppress ExtLine2Linetype
   ExtLine2Point ExtLine2Suppress ExtLineFixedLen
   ExtLineFixedLenSupress Fit ForceLineInside FractionFormat Handle
   HasExtensionDictionary HorizontalTextPosition Hyperlinks Layer
   LinearScaleFactor Linetype LinetypeScale Lineweight Material
   Measurement Normal ObjectID ObjectName OwnerID PlotStyleName
   PrimaryUnitsPrecision Rotation RoundDistance ScaleFactor StyleName
   SubUnitsFactor SubUnitsSuffix SuppressLeadingZeros
   SuppressTrailingZeros SuppressZeroFeet SuppressZeroInches TextColor
   TextFill TextFillColor TextGap TextHeight TextInside
   TextInsideAlign TextMovement TextOutsideAlign TextOverride
   TextPosition TextPrefix TextRotation TextStyle TextSuffix
   ToleranceDisplay ToleranceHeightScale ToleranceJustification
   ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "AngleFormat Application Arrowhead1Block Arrowhead1Type
   Arrowhead2Block Arrowhead2Type ArrowheadSize DecimalSeparator
   DimConstrDesc DimConstrExpression DimConstrForm DimConstrName
   DimConstrReference DimConstrValue DimensionLineColor
   DimensionLinetype DimensionLineWeight DimLine1Suppress
   DimLine2Suppress DimLineInside DimTxtDirection Document
   EntityTransparency ExtensionLineColor ExtensionLineExtend
   ExtensionLineOffset ExtensionLineWeight ExtLine1EndPoint
   ExtLine1Linetype ExtLine1StartPoint ExtLine1Suppress
   ExtLine2EndPoint ExtLine2Linetype ExtLine2StartPoint
   ExtLine2Suppress ExtLineFixedLen ExtLineFixedLenSuppress Fit
   ForceLineInside Handle HasExtensionDictionary
   HorizontalTextPosition Hyperlinks Layer Linetype LinetypeScale
   Lineweight Material Measurement Normal ObjectID ObjectName OwnerID
   PlotStyleName Rotation ScaleFactor StyleName SuppressLeadingZeros
   SuppressTrailingZeros TextColor TextFill TextFillColor TextGap
   TextHeight TextInside TextInsideAlign TextMovement TextOutsideAlign
   TextOverride TextPosition TextPrecision TextPrefix TextRotation
   TextStyle TextSuffix ToleranceDisplay ToleranceHeightScale
   ToleranceJustification ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceUpperLimit TrueColor VerticalTextPosition Visible")
    (:properties
     "AltRoundDistance AltSubUnitsFactor AltSubUnitsSuffix
   AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   ArcEndParam ArcPoint ArcStartParam Arrowhead1Block Arrowhead1Type
   Arrowhead2Block Arrowhead2Type ArrowheadSize CenterPoint
   DecimalSeparator DimensionLineColor DimensionLineExtend
   DimensionLinetype DimensionLineWeight DimLine1Suppress
   DimLine2Suppress DimLineInside DimTxtDirection Document
   EntityTransparency ExtensionLineColor ExtensionLineExtend
   ExtensionLineOffset ExtensionLineWeight ExtLine1Linetype
   ExtLine1Point ExtLine1Suppress ExtLine2Linetype ExtLine2Point
   ExtLine2Suppress ExtLineFixedLen ExtLineFixedLenSuppress Fit
   ForceLineInside FractionFormat Handle HasExtensionDictionary
   HasLeader HorizontalTextPosition Hyperlinks IsPartial Layer
   Leader1Point Leader2Point LinearScaleFactor Linetype LinetypeScale
   Lineweight Material Measurement Normal ObjectID ObjectName OwnerID
   PlotStyleName PrimaryUnitsPrecision Rotation RoundDistance
   ScaleFactor StyleName SubUnitsFactor SubUnitsSuffix
   SuppressLeadingZeros SuppressTrailingZeros SuppressZeroFeet
   SuppressZeroInches SymbolPosition TextColor TextFill TextFillColor
   TextGap TextHeight TextInside TextInsideAlign TextMovement
   TextOutsideAlign TextOverride TextPosition TextPrefix TextRotation
   TextStyle TextSuffix ToleranceDisplay ToleranceHeightScale
   ToleranceJustification ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "AltRoundDistance AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   Arrowhead1Block Arrowhead1Type Arrowhead2Block Arrowhead2Type
   ArrowheadSize CenterMarkSize CenterType DecimalSeparator
   DimConstrDesc DimConstrExpression DimConstrForm DimConstrName
   DimConstrReference DimConstrValue DimensionLineColor
   DimensionLinetype DimensionLineWeight DimLine1Suppress
   DimLine2Suppress DimTxtDirection Document EntityTransparency Fit
   ForceLineInside FractionFormat Handle HasExtensionDictionary
   Hyperlinks Layer LeaderLength LinearScaleFactor Linetype
   LinetypeScale Lineweight Material Measurement Normal ObjectID
   ObjectName OwnerID PlotStyleName PrimaryUnitsPrecision Rotation
   RoundDistance ScaleFactor StyleName SuppressLeadingZeros
   SuppressTrailingZeros SuppressZeroFeet SuppressZeroInches TextColor
   TextFill TextFillColor TextGap TextHeight TextInside
   TextInsideAlign TextMovement TextOutsideAlign TextOverride
   TextPosition TextPrefix TextRotation TextStyle TextSuffix
   ToleranceDisplay ToleranceHeightScale ToleranceJustification
   ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "Application DecimalSeparator DimTxtDirection Document
    EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
    Linetype LinetypeScale Lineweight Material Normal ObjectID
    ObjectName OwnerID PlotStyleName Rotation ScaleFactor StyleName
    SuppressLeadingZeros SuppressTrailingZeros TextColor TextFill
    TextFillColor TextGap TextHeight TextMovement TextOverride
    TextPosition TextPrefix TextRotation TextStyle TextSuffix
    ToleranceDisplay ToleranceHeightScale ToleranceJustification
    ToleranceLowerLimit TolerancePrecision
    ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
    ToleranceUpperLimit TrueColor VerticalTextPosition Visible")
    (:properties
     "AltRoundDistance AltSubUnitsFactor AltSubUnitsSuffix
   AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   ArrowheadSize DecimalSeparator DimTxtDirection Document
   EntityTransparency ExtensionLineColor ExtensionLineOffset
   ExtensionLineWeight ExtLineFixedLen ExtLineFixedLenSuppress
   FractionFormat Handle HasExtensionDictionary Hyperlinks Layer
   LinearScaleFactor Linetype LinetypeScale Lineweight Material
   Measurement Normal ObjectID ObjectName OwnerID PlotStyleName
   PrimaryUnitsPrecision Rotation RoundDistance ScaleFactor StyleName
   SubUnitsFactor SubUnitsSuffix SuppressLeadingZeros
   SuppressTrailingZeros SuppressZeroFeet SuppressZeroInches TextColor
   TextFill TextFillColor TextGap TextHeight TextMovement TextOverride
   TextPosition TextPrefix TextRotation TextStyle TextSuffix
   ToleranceDisplay ToleranceHeightScale ToleranceJustification
   ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "AltRoundDistance AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   ArrowheadBlock ArrowheadSize ArrowheadType CenterMarkSize
   CenterType DecimalSeparator DimConstrDesc DimConstrExpression
   DimConstrForm DimConstrName DimConstrReference DimConstrValue
   DimensionLineColor DimensionLinetype DimensionLineWeight
   DimLineSuppress DimTxtDirection Document EntityTransparency Fit
   ForceLineInside FractionFormat Handle HasExtensionDictionary
   Hyperlinks Layer LeaderLength LinearScaleFactor Linetype
   LinetypeScale Lineweight Material Measurement Normal ObjectID
   ObjectName OwnerID PlotStyleName PrimaryUnitsPrecision Rotation
   RoundDistance ScaleFactor StyleName SuppressLeadingZeros
   SuppressTrailingZeros SuppressZeroFeet SuppressZeroInches TextColor
   TextFill TextFillColor TextGap TextHeight TextInside
   TextInsideAlign TextMovement TextOutsideAlign TextOverride
   TextPosition TextPrefix TextRotation TextStyle TextSuffix
   ToleranceDisplay ToleranceHeightScale ToleranceJustification
   ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "AltRoundDistance AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   ArrowheadBlock ArrowheadSize ArrowheadType Center CenterMarkSize
   CenterType ChordPoint DecimalSeparator DimensionLineColor
   DimensionLinetype DimensionLineWeight DimLineSuppress
   DimTxtDirection Document EntityTransparency Fit ForceLineInside
   FractionFormat Handle HasExtensionDictionary Hyperlinks JogAngle
   JogLocation Layer LinearScaleFactor Linetype LinetypeScale
   Lineweight Material Measurement Normal ObjectID ObjectName
   OverrideCenter OwnerID PlotStyleName PrimaryUnitsPrecision Rotation
   RoundDistance ScaleFactor StyleName SuppressLeadingZeros
   SuppressTrailingZeros SuppressZeroFeet SuppressZeroInches TextColor
   TextFill TextFillColor TextGap TextHeight TextInside
   TextInsideAlign TextMovement TextOutsideAlign TextOverride
   TextPosition TextPrefix TextRotation TextStyle TextSuffix
   ToleranceDisplay ToleranceHeightScale ToleranceJustification
   ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "AltRoundDistance AltSubUnitsFactor AltSubUnitsSuffix
   AltSuppressLeadingZeros AltSuppressTrailingZeros
   AltSuppressZeroFeet AltSuppressZeroInches AltTextPrefix
   AltTextSuffix AltTolerancePrecision
   AltToleranceSuppressLeadingZeros AltToleranceSuppressTrailingZeros
   AltToleranceSuppressZeroFeet AltToleranceSuppressZeroInches
   AltUnits AltUnitsFormat AltUnitsPrecision AltUnitsScale Application
   Arrowhead1Block Arrowhead1Type Arrowhead2Block Arrowhead2Type
   ArrowheadSize DecimalSeparator DimConstrDesc DimConstrExpression
   DimConstrForm DimConstrName DimConstrReference DimConstrValue
   DimensionLineColor DimensionLineExtend DimensionLinetype
   DimensionLineWeight DimLine1Suppress DimLine2Suppress DimLineInside
   DimTxtDirection Document EntityTransparency ExtensionLineColor
   ExtensionLineExtend ExtensionLineOffset ExtensionLineWeight
   ExtLine1Linetype ExtLine1Suppress ExtLine2Linetype ExtLine2Suppress
   ExtLineFixedLen ExtLineFixedLenSuppress Fit ForceLineInside
   FractionFormat Handle HasExtensionDictionary HorizontalTextPosition
   Hyperlinks Layer LinearScaleFactor Linetype LinetypeScale
   Lineweight Material Measurement Normal ObjectID ObjectName OwnerID
   PlotStyleName PrimaryUnitsPrecision Rotation RoundDistance
   ScaleFactor StyleName SubUnitsFactor SubUnitsSuffix
   SuppressLeadingZeros SuppressTrailingZeros SuppressZeroFeet
   SuppressZeroInches TextColor TextFill TextFillColor TextGap
   TextHeight TextInside TextInsideAlign TextMovement TextOutsideAlign
   TextOverride TextPosition TextPrefix TextRotation TextStyle
   TextSuffix ToleranceDisplay ToleranceHeightScale
   ToleranceJustification ToleranceLowerLimit TolerancePrecision
   ToleranceSuppressLeadingZeros ToleranceSuppressTrailingZeros
   ToleranceSuppressZeroFeet ToleranceSuppressZeroInches
   ToleranceUpperLimit TrueColor UnitsFormat VerticalTextPosition
   Visible")
    (:properties
     "Application Document Handle HasExtensionDictionary Name ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
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
    (:properties
     "Application Count")
    (:properties
     "AdjustForBackground Application ClippingEnabled Contrast Document
   EntityTransparency Fade File Handle HasExtensionDictionary Height
   Hyperlinks ItemName Layer Linetype LinetypeScale Lineweight
   Material Monochrome ObjectID ObjectName OwnerID PlotStyleName
   Position Rotation ScaleFactor TrueColor
   UnderlayLayerOverrideApplied UnderlayName UnderlayVisibility
   Visible Width")
    (:properties
     "AllowedValues Description PropertyName ReadOnly Show UnitsType
   Value")
    (:properties
     "Application Area Center Document EndAngle EndParameter EndPoint
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight MajorAxis MajorRadius Material
   MinorAxis MinorRadius Normal ObjectID ObjectName OwnerID
   PlotStyleName RadiusRatio StartAngle StartParameter StartPoint
   TrueColor Visible")
    (:properties
     "Application Document EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
   Lineweight Material ObjectID ObjectName OwnerID PlotStyleName
   TrueColor Visible")
    (:properties
     "Application Document EffectiveName EntityTransparency Handle
   HasAttributes HasExtensionDictionary Hyperlinks InsertionPoint
   InsUnits InsUnitsFactor IsDynamicBlock Layer LayerPropertyOverrides
   Linetype LinetypeScale Lineweight Material Name Normal ObjectID
   ObjectName OwnerID Path PlotStyleName Rotation TrueColor Visible
   XEffectiveScaleFactor XScaleFactor YEffectiveScaleFactor
   YScaleFactor ZEffectiveScaleFactor ZScaleFactor")
    (:properties
     "Application Direction Document EdgeExtensionDistances
   EntityTransparency Handle HasExtensionDictionary Height Hyperlinks
   Layer Linetype LinetypeScale Lineweight MaintainAssociativity
   Material ObjectID ObjectName OwnerID PlotStyleName
   ShowAssociativity SurfaceType SurfTrimAssociativity TaperAngle
   TrueColor UIsolineDensity Visible VIsolineDensity WireframeType")
    (:properties
     "Application Brightness ClippingEnabled Contrast Document
   EntityTransparency Fade GeoImageBrightness GeoImageContrast
   GeoImageFade GeoImageHeight GeoImagePosition GeoImageWidth Handle
   HasExtensionDictionary Height Hyperlinks ImageFile ImageHeight
   ImageVisibility ImageWidth Layer Linetype LinetypeScale Lineweight
   Material Name ObjectID ObjectName Origin OwnerID PlotStyleName
   Rotation ScaleFactor ShowRotation Transparency TrueColor Visible
   Width")
    (:properties
     "Altitude Application BackgroundFill Document DrawingDirection
   EntityTransparency Handle HasExtensionDictionary Height LandingGap
   Latitude Layer LineSpacingDistance LineSpacingFactor
   LineSpacingStyle Linetype LinetypeScale Lineweight Longitude
   Material Notes ObjectID ObjectName OwnerID PlotStyleName Position
   Radius Rotation TextFrameDisplay TextJustify TextString
   TextStyleName TextWidth TrueColor Visible")
    (:properties
     "Application Count Document Handle HasExtensionDictionary Layer
   Linetype LinetypeScale Lineweight Material Name ObjectID ObjectName
   OwnerID PlotStyleName TrueColor Visible")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Area AssociativeHatch BackgroundColor Document
   Elevation EntityTransparency GradientAngle GradientCentered
   GradientColor1 GradientColor2 GradientName Handle
   HasExtensionDictionary HatchObjectType HatchStyle Hyperlinks
   ISOPenWidth Layer Linetype LinetypeScale Lineweight Material Normal
   NumberOfLoops ObjectID ObjectName Origin OwnerID PatternAngle
   PatternDouble PatternName PatternScale PatternSpace PatternType
   PlotStyleName TrueColor Visible")
    (:properties
     "Application BaseRadius Constrain Document EntityTransparency
   Handle HasExtensionDictionary Height Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName Position TopRadius TotalLength TrueColor TurnHeight
   Turns TurnSlope Twist Visible")
    (:properties
     "Application Description Document Freeze Handle
   HasExtensionDictionary LayerOn Linetype Lineweight Lock Material
   Name ObjectID ObjectName OwnerID PlotStyleName Plottable TrueColor
   Used ViewportDefault")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Block CanonicalMediaName CenterPlot ConfigName
   Document Handle HasExtensionDictionary ModelType Name ObjectID
   ObjectName OwnerID PaperUnits PlotHidden PlotOrigin PlotRotation
   PlotType PlotViewportBorders PlotViewportsFirst PlotWithLineweights
   PlotWithPlotStyles ScaleLineweights ShowPlotStyles StandardScale
   StyleSheet TabOrder UseStandardScale ViewToPlot")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Annotation Application ArrowheadBlock ArrowheadSize ArrowheadType
   Coordinate Coordinates DimensionLineColor DimensionLineWeight
   Document EntityTransparency Handle HasExtensionDictionary
   Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal
   ObjectID ObjectName OwnerID PlotStyleName ScaleFactor StyleName
   TextGap TrueColor Type VerticalTextPosition Visible")
    (:properties
     "Application Description Document Handle HasExtensionDictionary
   Name ObjectID ObjectName OwnerID")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Closed Document EdgeExtensionDistances EndDraftAngle
   EndDraftMagnitude EndSmoothContinuity EndSmoothMagnitude
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Linetype LinetypeScale Lineweight MaintainAssociativity Material
   NumCrossSections NumGuidePaths ObjectID ObjectName OwnerID Periodic
   PlotStyleName ShowAssociativity StartDraftAngle StartDraftMagnitude
   StartSmoothContinuity StartSmoothMagnitude SurfaceNormals
   SurfaceType SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
    (:properties
     "Application Area Closed ConstantWidth Coordinate Coordinates
   Document Elevation EntityTransparency Handle HasExtensionDictionary
   Hyperlinks Layer Length Linetype LinetypeGeneration LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Thickness TrueColor Visible")
    (:properties
     "Application Description Document Handle HasExtensionDictionary
   Name ObjectID ObjectName OwnerID")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Columns ColumnSpacing Document EffectiveName
   EntityTransparency Handle HasAttributes HasExtensionDictionary
   Hyperlinks InsertionPoint InsUnits InsUnitsFactor IsDynamicBlock
   Layer Linetype LinetypeScale Lineweight Material Name Normal
   ObjectID ObjectName OwnerID PlotStyleName Rotation Rows RowSpacing
   TrueColor Visible XEffectiveScaleFactor XScaleFactor
   YEffectiveScaleFactor YScaleFactor ZEffectiveScaleFactor
   ZScaleFactor")
    (:properties
     "Application ArrowheadBlock ArrowheadSize ArrowheadType
   BlockConnectionType BlockScale ContentBlockName ContentBlockType
   ContentType Document DogLegged DoglegLength EntityTransparency
   Handle HasExtensionDictionary Hyperlinks LandingGap Layer
   LeaderCount LeaderLineColor LeaderLineType LeaderLineWeight
   LeaderType Linetype LinetypeScale Lineweight Material Normal
   ObjectID ObjectName OwnerID PlotStyleName ScaleFactor StyleName
   TextAttachmentDirection TextBackgroundFill TextBottomAttachmentType
   TextDirection TextFrameDisplay TextHeight TextJustify
   TextLeftAttachmentType TextLineSpacingDistance
   TextLineSpacingFactor TextLineSpacingStyle TextRightAttachmentType
   TextRotation TextString TextStyleName TextTopAttachmentType
   TextWidth TrueColor Type Visible")
    (:properties
     "AlignSpace Annotative Application ArrowSize ArrowSymbol BitFlags
   Block BlockColor BlockConnectionType BlockRotation BlockScale
   BreakSize ContentType Description Document DoglegLength
   DrawLeaderOrderType DrawMLeaderOrderType EnableBlockRotation
   EnableBlockScale EnableDogleg EnableFrameText EnableLanding
   FirstSegmentAngleConstraint Handle HasExtensionDictionary
   LandingGap LeaderLineColor LeaderLineType LeaderLineTypeId
   LeaderLineWeight MaxLeaderSegmentsPoints Name ObjectID ObjectName
   OverwritePropChanged OwnerID ScaleFactor
   SecondSegmentAngleConstraint TextAlignmentType TextAngleType
   TextAttachmentDirection TextBottomAttachmentType TextColor
   TextHeight TextLeftAttachmentType TextRightAttachmentType
   TextString TextStyle TextTopAttachmentType")
    (:properties
     "Application Coordinates Document EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Justification Layer Linetype
   LinetypeScale Lineweight Material MLineScale ObjectID ObjectName
   OwnerID PlotStyleName StyleName TrueColor Visible")
    (:properties
     "Application Comments Count Document Handle HasExtensionDictionary
   Layout Name ObjectID ObjectName Origin OwnerID Units")
    (:properties
     "Application AttachmentPoint BackgroundFill Document
   DrawingDirection EntityTransparency Handle HasExtensionDictionary
   Height Hyperlinks InsertionPoint Layer LineSpacingDistance
   LineSpacingFactor LineSpacingStyle Linetype LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Rotation StyleName TextString TrueColor Visible
   Width")
    (:properties
     "Application CvHullDisplay Document EdgeExtensionDistances
   EntityTransparency Handle HasExtensionDictionary Height Hyperlinks
   Layer Linetype LinetypeScale Lineweight MaintainAssociativity
   Material ObjectID ObjectName OwnerID PlotStyleName
   ShowAssociativity SurfaceType SurfTrimAssociativity TrueColor
   UIsolineDensity Visible VIsolineDensity WireframeType")
    (:properties
     "Application Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Document EntityTransparency Handle
   HasExtensionDictionary Height Hyperlinks InsertionPoint Layer
   Linetype LinetypeScale Lineweight LockAspectRatio Material ObjectID
   ObjectName OleItemType OlePlotQuality OleSourceApp OwnerID
   PlotStyleName Rotation ScaleHeight ScaleWidth TrueColor Visible
   Width")
    (:properties
     "Application Count Document Handle HasExtensionDictionary Layout
   Name ObjectID ObjectName OwnerID")
    (:properties
     "AdjustForBackground Application ClippingEnabled Contrast Document
   EntityTransparency Fade File Handle HasExtensionDictionary Height
   Hyperlinks ItemName Layer Linetype LinetypeScale Lineweight
   Material Monochrome ObjectID ObjectName OwnerID PlotStyleName
   Position Rotation ScaleFactor TrueColor
   UnderlayLayerOverrideApplied UnderlayName UnderlayVisibility
   Visible Width")
    (:properties
     "Application Document EdgeExtensionDistances EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight MaintainAssociativity Material ObjectID
   ObjectName OwnerID PlotStyleName ShowAssociativity SurfaceType
   SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
    (:properties
     "Application BatchPlotProgress NumberOfCopies QuietErrorMode")
    (:properties
     "Application CanonicalMediaName CenterPlot ConfigName Document
   Handle HasExtensionDictionary ModelType Name ObjectID ObjectName
   OwnerID PaperUnits PlotHidden PlotOrigin PlotRotation PlotType
   PlotViewportBorders PlotViewportsFirst PlotWithLineweights
   PlotWithPlotStyles ScaleLineweights ShowPlotStyles StandardScale
   StyleSheet UseStandardScale ViewToPlot")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Coordinates Document EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Thickness TrueColor Visible")
    (:properties
     "Application Document EntityTransparency Handle
   HasExtensionDictionary Height Hyperlinks InsertionPoint
   IntensityColorScheme Layer Length Linetype LinetypeScale Lineweight
   Locked Material Name ObjectID ObjectName OwnerID Path PlotStyleName
   Rotation Scale ShowClipped ShowIntensity Stylization TrueColor Unit
   UnitFactor UseEntityColor Visible Width")
    (:properties
     "Application ColorScheme Document EntityTransparency Geolocate
   Handle HasExtensionDictionary Hyperlinks InsertionPoint Layer
   Linetype LinetypeScale Lineweight Locked Material Name ObjectID
   ObjectName OwnerID Path PlotStyleName Rotation Scale Segmentation
   ShowCropped Stylization TrueColor Unit UnitFactor Visible")
    (:properties
     "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material NumberOfFaces NumberOfVertices
   ObjectID ObjectName OwnerID PlotStyleName TrueColor Visible")
    (:properties
     "Application Area Closed ConstantWidth Coordinate Coordinates
   Document Elevation EntityTransparency Handle HasExtensionDictionary
   Hyperlinks Layer Length Linetype LinetypeGeneration LinetypeScale
   Lineweight Material Normal ObjectID ObjectName OwnerID
   PlotStyleName Thickness TrueColor Type Visible")
    (:properties
     "Application ArcSmoothness Center Clipped CustomScale Direction
   DisplayLocked Document EntityTransparency GridOn Handle
   HasExtensionDictionary HasSheetView Height Hyperlinks LabelBlockId
   Layer LayerPropertyOverrides LensLength Linetype LinetypeScale
   Lineweight Material ModelView ObjectID ObjectName OwnerID
   PlotStyleName ShadePlot SheetView SnapBasePoint SnapOn
   SnapRotationAngle StandardScale StandardScale2 Target TrueColor
   TwistAngle UCSIconAtOrigin UCSIconOn UCSPerViewport ViewportOn
   Visible VisualStyle Width")
    (:properties
     "Application Brightness ClippingEnabled Contrast Document
   EntityTransparency Fade Handle HasExtensionDictionary Height
   Hyperlinks ImageFile ImageHeight ImageVisibility ImageWidth Layer
   Linetype LinetypeScale Lineweight Material Name ObjectID ObjectName
   Origin OwnerID PlotStyleName Rotation ScaleFactor ShowRotation
   Transparency TrueColor Visible Width")
    (:properties
     "Application BasePoint DirectionVector Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName SecondPoint TrueColor Visible")
    (:properties
     "Application Area Centroid Document EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
   Lineweight Material MomentOfInertia Normal ObjectID ObjectName
   OwnerID Perimeter PlotStyleName PrincipalDirections
   PrincipalMoments ProductOfInertia RadiiOfGyration TrueColor
   Visible")
    (:properties
     "Application Document Handle HasExtensionDictionary Name ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application AxisDirection AxisPosition Document
   EdgeExtensionDistances EntityTransparency Handle
   HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
   Lineweight MaintainAssociativity Material ObjectID ObjectName
   OwnerID PlotStyleName RevolutionAngle ShowAssociativity SurfaceType
   SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
    (:properties
     "Application BottomHeight Coordinate Document Elevation
   EntityTransparency Handle HasExtensionDictionary Hyperlinks
   IndicatorFillColor IndicatorTransparency Layer Linetype
   LinetypeScale Lineweight LiveSectionEnabled Material Name Normal
   NumVertices ObjectID ObjectName OwnerID PlotStyleName
   SectionPlaneOffset Settings SliceDepth State State2 TopHeight
   TrueColor VerticalDirection Vertices ViewingDirection Visible")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application CurrentSectionType Document Handle
   HasExtensionDictionary ObjectID ObjectName OwnerID")
    (:properties
     "Application Count Name")
    (:properties
     "Application Count")
    (:properties
     "Application Document EntityTransparency Handle
   HasExtensionDictionary Height Hyperlinks InsertionPoint Layer
   Linetype LinetypeScale Lineweight Material Name Normal ObjectID
   ObjectName ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor
   Thickness TrueColor Visible")
    (:properties
     "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material Normal ObjectID ObjectName
   OwnerID PlotStyleName Thickness TrueColor Visible")
    (:properties
     "Application Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Area Closed Closed2 ControlPoints Degree Degree2
   Document EndTangent EntityTransparency FitPoints FitTolerance
   Handle HasExtensionDictionary Hyperlinks IsPeriodic IsPlanar
   IsRational KnotParameterization Knots Layer Linetype LinetypeScale
   Lineweight Material NumberOfControlPoints NumberOfFitPoints
   ObjectID ObjectName OwnerID PlotStyleName SplineFrame SplineMethod
   StartTangent TrueColor Visible Weights")
    (:properties
     "Author Comments HyperlinkBase Keywords LastSavedBy RevisionNumber
   Subject Title")
    (:properties
     "Application Document EdgeExtensionDistances EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight MaintainAssociativity Material ObjectID
   ObjectName OwnerID PlotStyleName ShowAssociativity SurfaceType
   SurfTrimAssociativity TrueColor UIsolineDensity Visible
   VIsolineDensity WireframeType")
    (:properties
     "Application Bank Document EdgeExtensionDistances
   EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
   Length Linetype LinetypeScale Lineweight MaintainAssociativity
   Material ObjectID ObjectName OwnerID PlotStyleName ProfileRotation
   Scale ShowAssociativity SurfaceType SurfTrimAssociativity TrueColor
   Twist UIsolineDensity Visible VIsolineDensity WireframeType")
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
    (:properties
     "Application BitFlags Description Document FlowDirection Handle
   HasExtensionDictionary HeaderSuppressed HorzCellMargin Name
   NumCellStyles ObjectID ObjectName OwnerID TemplateId
   TitleSuppressed VertCellMargin")
    (:properties
     "Alignment Application Backward Document EntityTransparency Handle
   HasExtensionDictionary Height Hyperlinks InsertionPoint Layer
   Linetype LinetypeScale Lineweight Material Normal ObjectID
   ObjectName ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor
   StyleName TextAlignmentPoint TextGenerationFlag TextString
   Thickness TrueColor UpsideDown Visible")
    (:properties
     "Application BigFontFile Document FontFile Handle
   HasExtensionDictionary Height LastHeight Name ObjectID ObjectName
   ObliqueAngle OwnerID TextGenerationFlag Width")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application DimensionLineColor DirectionVector Document
   EntityTransparency Handle HasExtensionDictionary Hyperlinks
   InsertionPoint Layer Linetype LinetypeScale Lineweight Material
   Normal ObjectID ObjectName OwnerID PlotStyleName ScaleFactor
   StyleName TextColor TextHeight TextString TextStyle TrueColor
   Visible")
    (:properties
     "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material Normal ObjectID ObjectName
   OwnerID PlotStyleName Thickness TrueColor Visible")
    (:properties
     "Application Document Handle HasExtensionDictionary Name ObjectID
   ObjectName Origin OwnerID XVector YVector")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "")
    (:properties "None")
    (:properties
     "Application CategoryName Center Direction Document Handle
   HasExtensionDictionary HasVpAssociation Height LayerState LayoutID
   Name ObjectID ObjectName OwnerID Target Width")
    (:properties
     "Application ArcSmoothness Center Direction Document GridOn Handle
   HasExtensionDictionary Height LowerLeftCorner Name ObjectID
   ObjectName OrthoOn OwnerID SnapBasePoint SnapOn SnapRotationAngle
   Target UCSIconAtOrigin UCSIconOn UpperRightCorner Width")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Count Document Handle HasExtensionDictionary ObjectID
   ObjectName OwnerID")
    (:properties
     "Application Brightness ClippingEnabled Contrast Document
   EntityTransparency Fade Handle HasExtensionDictionary Height
   Hyperlinks ImageFile ImageHeight ImageVisibility ImageWidth Layer
   Linetype LinetypeScale Lineweight Material Name ObjectID ObjectName
   Origin OwnerID PlotStyleName Rotation ScaleFactor ShowRotation
   Transparency TrueColor Visible Width")
    (:properties
     "Application BasePoint DirectionVector Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName SecondPoint TrueColor Visible")
    (:properties
     "Application Document Handle HasExtensionDictionary Name ObjectID
   ObjectName OwnerID TranslateIDs")
    (:properties
     "")))

(format t "~{~S~%~}"
        (sort
         (set-difference 
          (remove-duplicates 
           (apply
            #'append
            (loop :for (i j) :in *p*
                  :collect
                  (mnas-string:split
                   (coerce 
                    (list #\Space #\Return #\NewLine) 'string)
                   j)))
           :test #'string=)
          '("None")  :test #'string=)
         #'string<))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(length
'(
  ("Active" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C56733CC-704D-4F9D-9C78-7EA9DFC40799")
  ("ActiveDimStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-06023FAF-A279-443F-88D5-04735E557D95")
  ("ActiveDocument" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-161FD7E5-B739-4E09-8430-BA04A6298703")
  ("ActiveLayer" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1ECB5739-A11D-4B19-9F2B-994A680D94BF")
  ("ActiveLayout" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-362525D2-1F6D-40BB-97FD-B83D668D7851")
  ("ActiveLinetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E93FD0AE-F63F-4655-B5A6-AAB30288D663")
  ("ActiveMaterial" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5478BDCD-0B51-46AE-A51A-0DB42D1925FD")
  ("ActivePViewport" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4ABA8345-CB2B-4F56-A4FF-4B221DB51B27")
  ("ActiveSelectionSet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3F917B84-B086-4995-9577-E2C73051BF2C")
  ("ActiveSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7CDD9455-21E1-42BB-ADA4-D39ABF2FB4A3")
  ("ActiveTextStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1D9D9A7D-7429-402D-90B8-387903FD5D08")
  ("ActiveUCS" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F806BFBE-6291-44B9-AE48-CD960B7CB8D1")
  ("ActiveViewport" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8EA574F1-AEB1-4940-BB9F-02AFE5B6C630")
  ("AdjustForBackground" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-04A4923A-7362-4651-9A37-2BD043ACCB15")
  ("AlignSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F7817816-B54B-4E8C-A93D-86A8FE456F43")
  ("Alignment" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-27030E1C-6480-4A64-BE0A-E72C1FFF2023")
  ("AllowLongSymbolNames" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-798A8844-D55D-46D3-8528-19993F1B86B2")
  ("AllowManualHeights" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FB244E08-FA9D-4508-BFEC-1BA6B3CD0F05")
  ("AllowManualPositions" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FF706F7-84B1-4391-B885-434316F41720")
  ("AllowedValues" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EB41B402-5E46-4D9B-9853-AF172AEF1A65")
  ("AltRoundDistance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0D190983-C449-4B17-90D8-6CD3DC623780")
  ("AltSubUnitsFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7A2C927-C2C5-42D6-AE87-BFC035EB94DD")
  ("AltSubUnitsSuffix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0818F2BD-DF70-457C-8606-48D0ECC23ED4")
  ("AltSuppressLeadingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DBF1D57D-BBA5-4455-AF02-14805ECE8E66")
  ("AltSuppressTrailingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2723B235-FE67-4BE5-A223-237FFD061704")
  ("AltSuppressZeroFeet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14862177-5D19-45BF-A3AE-7B19B051F4A9")
  ("AltSuppressZeroInches" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-636A0E74-E4AD-4696-8EE2-4A1C5B5A0E12")
  ("AltTextPrefix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FE8AF87-AC1C-4F38-A02F-93295234E0AF")
  ("AltTextSuffix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A0049F8D-207B-4631-A2A9-8BAAB3750D02")
  ("AltTolerancePrecision" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2C9CF879-F426-4608-A887-3D54C980D5B3")
  ("AltToleranceSuppressLeadingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9A4073D9-7F42-4C41-B4F3-FEFC5F5F1497")
  ("AltToleranceSuppressTrailingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-56577FF1-FD1B-40C3-A21F-A99BC931A956")
  ("AltToleranceSuppressZeroFeet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9A6A3AAE-EACC-46D0-9984-687660442CA6")
  ("AltToleranceSuppressZeroInches" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED8D6D59-0A55-4330-9AE7-CA221CF6784A")
  ("AltUnits" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D4FAE739-4C2F-4491-905C-2A702F0933E3")
  ("AltUnitsFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4F655505-CA53-4868-9612-87FC8E2A43E6")
  ("AltUnitsPrecision" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FE5B4AF5-4D25-410A-83AB-914B81ED9133")
  ("AltUnitsScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2D0F9913-E6E1-46DE-B30D-414C6C11E8C4")
  ("Altitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6E8127B7-7A45-4DD9-8DA6-427DDC5498B0")
  ("AngleFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8DBD1F10-2BA5-4AAA-8105-3D0E71557CEF")
  ("AngleVertex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EBB45237-23AF-4A35-B97F-89B3FE43ECF4")
  ("Annotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7144167A-1C3D-41F8-9B49-8A107F06AFD3")
  ("Annotative" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-02B58681-4887-418A-8E39-01EB1CF9C2D5")
  ("Application" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-41478919-F833-4273-9EBC-B57C5FF792D4")
  ("ArcEndParam" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5310BAA3-35B2-40D5-8CC1-266788576A2F")
  ("ArcLength" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-444A8412-5B88-4EB1-8B8D-FDC0D84626C6")
  ("ArcPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4AB7D3DF-062A-433F-874A-342B4912719F")
  ("ArcSmoothness" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C628A113-F50C-43C0-B205-4C5FC49EBFEF")
  ("ArcStartParam" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6BE4CDC3-AA75-4842-986A-F33BC513CE93")
  ("Area" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2D31D8C1-9BEC-48CF-8B73-E2AD38A08D74")
  ("ArrowSize" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-74147445-89D8-47DD-9ADC-DA1D136A1F12")
  ("ArrowSymbol" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D70DEB9A-71B3-4576-932B-331ECB1FC6CC")
  ("Arrowhead1Block" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4723AF0C-6C05-4062-A4E7-5ECEC3B87128")
  ("Arrowhead1Type" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-951D8691-B849-4C68-A95A-F2048B67CC17")
  ("Arrowhead2Block" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4742FC6A-19B6-48C6-A30C-398046CBE89B")
  ("Arrowhead2Type" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-62EE0F7D-4748-4706-A5E5-2635268C18BB")
  ("ArrowheadBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C11EF6F6-43F8-4A57-97B2-B8EF5BD7192B")
  ("ArrowheadSize" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6101462A-9A07-4D6D-81E5-9284FA05D413")
  ("ArrowheadType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1D2668D-435F-4B5E-94EA-EB91AB7BD52A")
  ("AssociativeHatch" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-02D66CBD-C490-4AE1-B18E-531AE970AF3E")
  ("AttachmentPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FD7EDA56-7FA0-4616-A746-9B97AE0C6456")
  ("Author" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E3FA500F-D9EB-41A9-B49C-F0BAD0FD5A23")
  ("AxisDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8B3F9239-9C7B-4983-B600-336270BFF6CB")
  ("AxisPosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0DDC4DD6-EC92-4B77-A16D-ACC33AC715CD")
  ("BackgroundColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B15015C7-D6C1-41E8-B58C-ECC2511A1E2C")
  ("BackgroundFill" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AE6714F4-3095-4797-AC69-48EC9D99C5F4")
  ("Backward" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A594237B-925A-4F5A-BF0E-3447DCA55456")
  ("Bank" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BF74EEA7-20E5-4B51-BE10-D4C26D6C1098")
  ("BasePoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4A31CEF8-992D-40BC-998C-33A3EE66E859")
  ("BaseRadius" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-926627BF-D114-4468-983B-8C82D0F58ABF")
  ("BatchPlotProgress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A4E73393-7EC3-4D70-8FBE-62F2DD08B2F6")
  ("BigFontFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6351C267-2821-4156-ACDB-603B22310872")
  ("BitFlags" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-67A4E4C6-17A5-405C-8544-DE5D17B72AF7")
  ("Block" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-29A6C18B-6D8F-43FF-A587-4E72FA7C3884")
  ("BlockColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E42F4533-DEB9-45A6-8170-CAB8CC26E0FC")
  ("BlockConnectionType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6E719B8F-3283-46A8-B474-F73CEC854D08")
  ("BlockRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5319A7B4-C266-48CA-8A5D-BD90FF225662")
  ("BlockScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9373481F-83B1-4A52-95D5-D8FE5665E2A6")
  ("BlockScaling" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F8A1C955-9669-4132-BBF3-6F7BE4710471")
  ("Blocks" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4E432456-907D-467E-A060-3F5AFCCBCCDD")
  ("Blue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7BF5BBF0-3795-496B-9ECC-4391FF5D29C5")
  ("BookName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6CF39563-E33A-4097-BCE6-04DD8CA198E4")
  ("BottomHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-46B3C877-51D2-4402-91C0-F5407A9145B7")
  ("BreakSize" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BF8CE2B2-366B-420C-8DBC-61638045705A")
  ("BreakSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AE05B22D-FD4E-4447-9674-19D38E5349C1")
  ("BreaksEnabled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-36E9A430-F097-4EF3-9779-271331E1D931")
  ("Brightness" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A273EB24-D107-4933-ADC3-76ACACCC3C81")
  ("CanonicalMediaName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-51318BED-855E-4176-8FA1-7C63A4DB4CBB")
  ("Caption" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C1877617-CCF5-4352-B0D0-38B0F015D20D")
  ("CategoryName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F00EF8C2-17E9-472F-9053-291479124537")
  ("Center" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5EFC87E1-5A1E-4B2C-8552-67A6F367617A")
  ("CenterMarkSize" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37F49603-FCA8-4913-B0AF-D90DFF5290DE")
  ("CenterPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6EF7CA15-1F94-4279-A6B2-CA072A71F388")
  ("CenterPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1A434213-C41C-44E5-96CD-124D4AE22AF5")
  ("CenterType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F83E4570-3987-4658-BF9C-85A473E0755E")
  ("Centroid" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4B2E3A74-A84C-4060-976C-90FE7977D635")
  ("ChordPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-71DFE652-72D5-4AF8-8986-BB82EABB9A3B")
  ("Circumference" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B9019FFA-F0FB-46BA-957E-D1F104354D86")
  ("Clipped" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-52D82C2D-B76B-4A9A-B563-D6022763DB2D")
  ("ClippingEnabled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DF876CD6-C606-45D3-BF4E-2D6ECE01950B")
  ("Closed" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-139FAA7F-D679-4C04-B0AB-0299730C1A34")
  ("Closed2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1E58834-ADDA-42D0-85AF-9ED2E6303CB9")
  ("ColorIndex" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0C23C1B5-DA04-4A27-9EDD-26D5615C71D5")
  ("ColorMethod" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C555F5A1-A3AE-42F6-B45D-930B42AD5F9A")
  ("ColorName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-896DBFE1-388E-4CAF-92A0-ECB7AC95AAA3")
  ("ColorScheme" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6D58DBAE-6C75-4D2B-9CA8-610C18B01676")
  ("ColumnSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1B0C3DC-ECF3-41CC-81E8-E8179C08E6C8")
  ("ColumnWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EA043036-6A20-49D0-A7BC-E3E3D2C64812")
  ("Columns" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-75B2C8F3-BA20-4A32-A7A3-5D7340708F04")
  ("Comments" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-528FC215-ADD5-4FFC-B928-E2CC2C267967")
  ("ConfigName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-65434AAB-F1EC-44ED-9568-8F68757F4485")
  ("Constant" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-899D51E7-5CB6-4109-9840-3CD4D823033F")
  ("ConstantWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5632AA9B-0225-4D6A-84F1-3677E220779B")
  ("Constrain" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-94A6A390-FBCE-4DEB-908F-2F557B245F64")
  ("ContentBlockName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-53B787B0-9D47-419B-BA02-93704B51B59C")
  ("ContentBlockType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CACCA248-66ED-40F9-AD42-D4E2D64600C7")
  ("ContentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A003F944-BC86-43FD-BFD0-3204C8F29DC7")
  ("ContourlinesPerSurface" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C8C347D-1FC8-4618-A4C2-86636856B2AA")
  ("Contrast" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DDDBF69A-D7CF-41B6-BEB4-261FF31763EC")
  ("ControlPoints" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F3265A1E-C1FA-47E9-B87C-4C3DDB064772")
  ("Coordinate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-906EA0F9-D64D-472E-97A3-FD04B07E8890")
  ("Coordinates" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-11CAC0D6-DFCF-4653-8403-CF5AFD689773")
  ("Count" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF9D55CA-77EB-4EAC-9DD3-FEA6D077D9A1")
  ("CurrentSectionType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5F653FD4-4DDF-4DBF-AFB7-3D76CC32705F")
  ("CustomScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B2267102-5970-49A4-AA7E-A9D0362D2CF6")
  ("CvHullDisplay" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-50F871F1-B6D9-45D2-9623-16738FE69762")
  ("Database" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6FC179C1-EBE2-4F13-91B3-760B6D2AB7A5")
  ("DecimalSeparator" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5F74354B-DEF5-486D-BD2B-7767F23009AC")
  ("Degree" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6794BD00-A121-47DF-87E9-C8659E58D29D")
  ("Degree2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-46FCC8A7-1250-404F-82EB-6E344F0F40E0")
  ("Description" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8426981B-58B7-465E-94C5-AEFDCA0D1CC7")
  ("Diameter" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-506F4B7E-78B3-4C94-954E-F986DB0EF26F")
  ("Dictionaries" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5E577FF6-F939-4798-9700-3A3278EA84F4")
  ("DimConstrDesc" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5AE70927-73F6-4C1D-9936-038CFAB358A4")
  ("DimConstrExpression" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AFB4E484-221F-4B00-AA61-17412554ADEB")
  ("DimConstrForm" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3BA78692-AC13-4649-8C21-2BE7C4ECED62")
  ("DimConstrName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6A08ECE1-1F4D-4AD4-8127-39F0B78C45ED")
  ("DimConstrReference" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D06A8297-0390-42AF-ACAD-1F2CA996EB80")
  ("DimConstrValue" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D1BE3F09-1491-46DE-A426-C1BB38368068")
  ("DimLine1Suppress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EC6704BE-D000-45C4-AAAE-CDA79D06A076")
  ("DimLine2Suppress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-186F2D21-99F0-4431-9AD7-48E6C41E8FAF")
  ("DimLineInside" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8381A44F-4BE4-49FD-B4D3-FCAF50D759E0")
  ("DimLineSuppress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-389DC9CF-52B6-4882-9D02-85E7FE6FA43E")
  ("DimStyles" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9CEE2A14-EF1C-484C-A930-3B8040981FAA")
  ("DimTxtDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DC17E960-4FA7-4793-A75B-6D09510A518A")
  ("DimensionLineColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AEE75290-EE61-4235-8E1C-655D2AABCDF1")
  ("DimensionLineExtend" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-328247F8-7B1E-4DAD-9B25-F2F5ADB8B818")
  ("DimensionLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B47D9FC6-D1F7-4292-B986-EC8E378B247D")
  ("DimensionLinetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9B674B1C-F3A0-46B2-B53F-D149076E08D2")
  ("Direction" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F7DEFBDB-796C-4D7A-802C-872EE09A941C")
  ("DirectionVector" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-90ADA39F-3AD4-404C-88E4-2BD57F9B4CB4")
  ("DisplayLocked" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-08A9604A-6637-42FE-BF24-1B8D591A97CC")
  ("DisplaySilhouette" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B83C7164-05D6-4799-8888-2AF89E214D5B")
  ("Document" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0F0245B6-29E9-4B68-AF77-5B46D5341ADA")
  ("Documents" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2AD2E393-4725-4957-8D1A-90202A25DA03")
  ("DogLegged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D178C870-993B-4A19-8906-9A0CAFF3373E")
  ("DoglegLength" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-23E79ABC-73DF-4377-8BBC-5CEFC1B16B18")
  ("DrawLeaderOrderType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C256D322-FE3F-45FF-A4F1-4CF9C2E7AEEF")
  ("DrawMLeaderOrderType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-75190D46-F4A0-4D92-950E-846A37934F24")
  ("DrawingDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0185B012-9C5B-45BC-8559-83618790A2FE")
  ("EdgeExtensionDistances" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-551E3867-8123-4406-9747-E9829033CF10")
  ("EffectiveName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A87607A4-D7F9-40B3-94B5-B9D88011DEB5")
  ("Elevation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6A6D826B-9826-436F-877B-B3BC095F6AB3")
  ("ElevationModelSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0CD217EF-B8A0-4338-965C-FDD4DF51F505")
  ("ElevationPaperSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-58391345-3F39-43E4-90F5-A0F3ADF51F6E")
  ("EnableBlockRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-43CDB42D-5372-40A3-806D-DFEB5F7E22CD")
  ("EnableBlockScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A8B031A1-22A8-4EDC-BAD3-E87A19C053B3")
  ("EnableBreak" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E07F26E8-9B4A-4CC6-8542-04F069FE9554")
  ("EnableDogleg" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD55662D-A0EB-4526-802F-F8CE7950EA13")
  ("EnableFrameText" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-34076F40-C315-4AA6-B14C-89DDC82B47A3")
  ("EnableLanding" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DAACAF20-1BFF-4FE6-9066-4B15C390FE33")
  ("EndAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5F2762C5-A24D-4A35-92F3-AC31311BE503")
  ("EndDraftAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-84B11D1A-9294-470E-9857-838A8D0B8401")
  ("EndDraftMagnitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9DB72185-6CB3-4071-81C2-C9D56C7488F5")
  ("EndParameter" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2FAAB29B-1BA4-447B-9D52-0FFDE585511C")
  ("EndPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-76ADF16D-0D2F-47C5-8EBA-DFC449334045")
  ("EndSmoothContinuity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1338397E-742A-499E-8A21-9C92B2286049")
  ("EndSmoothMagnitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD7CC060-95A2-432D-BD53-026A177B5485")
  ("EndTangent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CAB1F069-A8AB-441D-8D15-98E562DE0677")
  ("EntityColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3AAFA129-2543-49B3-B649-A62EB4975FEC")
  ("EntityTransparency" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2D91A428-3C88-42D3-AB77-9B578EEF7F2F")
  ("Explodable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FF5DD779-77B1-4CC6-9573-A3BA3ABCEBFA")
  ("ExtLine1EndPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1271F0E6-8032-48BD-A0CF-9E0B2E902F28")
  ("ExtLine1Linetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-249DB279-AD2A-4A4C-AEB0-85CB5B8FB111")
  ("ExtLine1Point" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A141951B-45D4-4085-8AB8-D79434194577")
  ("ExtLine1StartPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B665189-04A4-47D8-BCE7-8E70E3CE6A14")
  ("ExtLine1Suppress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4611E161-14B1-44A3-88C2-6563E9E557D2")
  ("ExtLine2EndPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8B2F838F-56E5-430C-98DE-6AF1B7B929FD")
  ("ExtLine2Linetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0DC1F9E2-3CDE-4303-8D18-10E18818F6AF")
  ("ExtLine2Point" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A63F1BA4-E105-42C7-951D-043672E61891")
  ("ExtLine2StartPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-929C0F0E-1F05-4FDC-BADB-37B24EE5A221")
  ("ExtLine2Suppress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C9AD1C32-CBFB-4B56-8674-EB3DA1C014DB")
  ("ExtLineFixedLen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7BA97EAE-5A53-42CF-B405-28272D2BA5BF")
  ("ExtLineFixedLenSuppress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-33060046-AACD-474D-9FC6-419A8EAC22BE")
  ("ExtLineFixedLenSupress" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-422CB04D-A597-472F-B13B-72498DB8ECA3")
  ("ExtensionLineColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C93DB94D-B3D0-46A3-8B81-F3B92D4CB345")
  ("ExtensionLineExtend" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-15B9259B-0F39-4FB9-9DB0-8B61116102AC")
  ("ExtensionLineOffset" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C179EEAD-D390-474D-9D1C-7181C0797512")
  ("ExtensionLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCC4B614-561B-434A-BAFB-5BA68C39FFAB")
  ("Fade" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C7B05F48-5D90-42E9-805E-326F4767E7B9")
  ("FieldLength" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D2944C82-C67C-4C8D-B5DF-0496CA6318BE")
  ("File" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-223D48A9-D1A5-4D53-BDA7-37CC37F16FA2")
  ("FirstSegmentAngleConstraint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D017142F-E957-44EA-9E7F-CA4D76E64EC5")
  ("Fit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8AD82E1B-6C98-46A2-A7FC-4CF38BB36AB8")
  ("FitPoints" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EA703EA6-E4E2-47AD-B91D-C341EFA35F79")
  ("FitTolerance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7A98F43E-DD80-4F24-BDBC-3447827FB0B0")
  ("FlowDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-76BAA2AF-8250-4D01-853D-0EC792EDFBD1")
  ("FontFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD2E1EB8-3BDE-46B6-ADC4-636234CCB3E7")
  ("ForceLineInside" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-285E26AB-0228-4522-9564-84B899172FAF")
  ("FractionFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-70B3796C-1CAA-417D-B4A7-34533379A290")
  ("Freeze" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B5D15DA-4C0A-470E-ABD9-E004B74C83AA")
  ("FullName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1738D847-ACED-491B-9B5C-CDC781A89BEB")
  ("GeoImageBrightness" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1C798E2C-C26B-49F6-9022-0F4B54601DD4")
  ("GeoImageContrast" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-80234F8E-3207-4A86-AC16-AD968578216E")
  ("GeoImageFade" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35DDA5D7-68F0-42C0-9DE0-1EC83DBE4D03")
  ("GeoImageHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16AFEC32-D8D6-4FBA-ACF6-EF2110BB45AC")
  ("GeoImagePosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F56AC56A-7D19-4864-BAD0-8E3BEC96A877")
  ("GeoImageWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-90D4EE36-6D71-4087-8C8D-BA347747BB68")
  ("Geolocate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-12F57213-B4A6-44B2-8E07-4B34E54D2A33")
  ("GradientAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3BCAAD20-A2CD-4E59-A3FD-A6144A49E848")
  ("GradientCentered" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-883A9FC6-FC9E-4F56-9C5E-7641BEFE98F6")
  ("GradientColor1" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9E901910-0C2D-4B5F-9B9E-F137AEA471EE")
  ("GradientColor2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-60D0625B-25AC-4086-A065-D5D6A875F3BB")
  ("GradientName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C1F522D5-7644-4569-9CF9-029E768F4530")
  ("Green" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2874356A-C91F-42C4-8091-F45B95D7E776")
  ("GridOn" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-85F3005E-87BF-4A22-B6BC-7FFF8F2E27E8")
  ("Groups" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-61422D1A-B391-4528-968A-04A7B7A590F2")
  ("HWND" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-79FF9339-5361-4E73-A8F9-0F72C5E03DC1")
  ("Handle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-08DCE6ED-DE5A-41FA-9220-3D75B2B4C43D")
  ("HasAttributes" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-98EA1BF9-6259-45F0-87EF-CB97C012D0ED")
  ("HasExtensionDictionary" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-691DA1BB-3D33-45A9-9A0F-212988DBA5F6")
  ("HasLeader" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6809548A-E4CF-45B0-899D-450C06F0C0E3")
  ("HasSheetView" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C3E561D6-7623-4740-BBAA-E96E30039596")
  ("HasSubSelection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B178F988-EE33-434C-BD65-78136A53AF0C")
  ("HasVpAssociation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-93422C59-FF28-4798-9CE9-78C75FD0C780")
  ("HatchObjectType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BBDF246E-8F3E-45D8-9906-2A6970322235")
  ("HatchStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F05981A7-DB57-4F64-96D5-73B812BA259B")
  ("HeaderSuppressed" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-834B9A4F-D308-4CE6-9F58-C67F00C177E7")
  ("Height" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EB797768-80BE-4A07-95A3-34F3CD61D5A3")
  ("History" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9879D666-5C87-4CA6-A5D6-A4C07C7A3428")
  ("HorizontalTextPosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BE78386A-DB47-4DA6-B089-724033465C2D")
  ("HorzCellMargin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-931D7084-14D0-493F-9796-9CF45147A373")
  ("HyperlinkBase" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9911D570-27F9-4F3D-837F-4064447065FF")
  ("Hyperlinks" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-585A0DF2-7932-4B18-A3B3-698B5AE595F5")
  ("ISOPenWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-54B0DE75-E382-4DAC-9845-08A0124BD740")
  ("ImageFile" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-10F5B2F6-5D84-4B60-8ED5-D0B3A2644275")
  ("ImageHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-567443C9-C76D-4FA0-9842-942B6F3A23B6")
  ("ImageVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AB60D8EC-C038-44FC-AFC4-69F22475947A")
  ("ImageWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3D3ADA6C-DD69-4119-AC2D-1506328C5DF4")
  ("IndicatorFillColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A2F9C320-8325-43B3-9740-6D91C0F8EDA4")
  ("IndicatorTransparency" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-882CDFEE-0F92-4D1A-A177-453DC59FB16C")
  ("InsUnits" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6C8AFC78-7347-4536-BC5B-BD655F1AB948")
  ("InsUnitsFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-738C8263-EEE2-4DA0-B41D-362CAA62C3DD")
  ("InsertionPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B6F917C1-9916-419A-9047-625453CEA306")
  ("IntensityColorScheme" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BB89E9B6-3F46-4942-8695-2B2598B358ED")
  ("Invisible" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B5C539EB-F345-4517-9463-8E77A59F635B")
  ("IsDynamicBlock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7EF9313C-D017-4698-A421-46DF696C1B4E")
  ("IsLayout" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6CA8725D-4872-41AF-8B0B-48F05380E28C")
  ("IsPartial" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C0281A71-9691-413C-8714-A785D8076BEF")
  ("IsPeriodic" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EA2B38A2-452E-4E74-84C5-F11E2F98DA69")
  ("IsPlanar" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-56E2E2C2-04B7-427A-B371-29E55D3E33EF")
  ("IsRational" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EB72402D-5B2D-4974-9434-65EC2F8E3A80")
  ("IsXRef" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2DB912E6-401E-4859-8D71-CAF474483D91")
  ("ItemName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A329A0CE-8A1F-4329-8439-84498E091B28")
  ("JogAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C6AD7996-13DA-44C5-A5F0-D1DF3655B795")
  ("JogLocation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-43F99AA5-5023-4156-BA29-E5A1B90FD12C")
  ("Justification" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7D9F7368-0B08-41FD-B7B3-8B800574FAC1")
  ("Keywords" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BFF112D6-5E97-4912-A052-8F3F5026F0C1")
  ("KnotParameterization" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AA9D0E80-5814-4AAF-91B5-751133EEF625")
  ("Knots" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B228DB94-7A0C-48F4-B6D4-9F3AF06D233A")
  ("LabelBlockId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-89FC2B94-702E-4CB0-BDBA-7E2F4DD37E4A")
  ("LandingGap" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5848A6DC-0C57-427F-B8CF-A63BFE92B51F")
  ("LastHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5FB3776F-CD98-48AE-B94A-B4835DFE69EA")
  ("LastSavedBy" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-09FDBF11-27C6-4077-8F43-CF1713AB708A")
  ("Latitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-520D9095-24DA-42D8-8CBF-8091A734E7EE")
  ("Layer" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BBA57E84-2225-4363-ADDC-FB3A90A32643")
  ("LayerOn" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-832E23F5-C622-4FF6-AAB0-D2E9120DA1AB")
  ("LayerPropertyOverrides" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9C8B04B9-B1E5-4F66-A49F-344E40A7D808")
  ("LayerState" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8CE360A3-D98E-4974-B7E3-BBDAA938EC39")
  ("Layers" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D01C8A57-12BE-4EE3-9952-EEBD99818585")
  ("Layout" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C02D136-1FCD-4456-84AC-B1A73BD179C7")
  ("LayoutID" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AA4F0EBB-1A09-4C5E-A971-A54BDAA64512")
  ("Layouts" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4D435BCF-BD83-46D6-9940-8CA519F29272")
  ("Leader1Point" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-993EA61B-01EC-491A-A6B5-B05E38F85CD7")
  ("Leader2Point" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3332BFBE-6426-42DD-B46F-79EFECE05907")
  ("LeaderCount" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-71008474-8C2E-4E9C-9B40-5BD1B452D587")
  ("LeaderLength" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A0F745BF-7F78-44B9-B90C-D39B831BAE64")
  ("LeaderLineColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6FFAED08-A300-4952-8928-64E0A1F8D95B")
  ("LeaderLineType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B98CCE6B-055B-4839-8A60-B5C9BA5DE110")
  ("LeaderLineTypeId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-72ED034A-6CE4-4815-B23B-F222B3CF9DBA")
  ("LeaderLineWeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E634FC41-6495-4D72-BA06-80B8584E8B8D")
  ("LeaderType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0CB6A8E7-861A-424E-8F08-D48BDE7E31C2")
  ("Length" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6D7C13B5-1DAB-4591-80E5-8C05923331F3")
  ("LensLength" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D81A20CE-6E51-4E3E-8AD0-ADCF773FEE6E")
  ("Limits" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-30E059A2-A0C0-4F1A-B021-0478AF950D6E")
  ("LineSpacingDistance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-13A19CD9-C287-48AA-B6DC-8ED79EF53B20")
  ("LineSpacingFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-429D5E20-4522-4699-BEC8-0D27CA17EDDF")
  ("LineSpacingStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F2313E05-2429-4B28-8D6B-8D474F1DA746")
  ("LinearScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-17D4F009-070C-472A-9B71-9A94FA57788C")
  ("Linetype" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2EEC97F1-0956-47DA-9FF4-1058EAA173A8")
  ("LinetypeGeneration" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-40F4B7B9-CB82-4D62-AD82-1BCFDBBC9F81")
  ("LinetypeScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-203A67F6-12BF-4F10-B8E8-C8B9A12CDCBD")
  ("Linetypes" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BADF9960-D671-46DC-B887-334D72A4B295")
  ("Lineweight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE1AC635-BCEA-428F-A47D-80E35EFE55D3")
  ("LineweightDisplay" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9530FD9D-2BF9-476F-8A7A-C85842E56B10")
  ("LiveSectionEnabled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3CE8C36B-B1D8-4FB4-BC3A-63926CC5EE68")
  ("LocaleID" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7A8C2188-FB2F-4D88-B6C3-1311967B65D8")
  ("Lock" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-49CA344E-0F8C-4AB2-8336-9E696F8BD5D7")
  ("LockAspectRatio" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3F83D35C-89A7-4CE1-A433-3F281BDF7996")
  ("LockPosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-306CD657-9EE2-42B3-A169-A6F90B786B83")
  ("Locked" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D131D7F6-084A-48B6-909A-52DB42A21BCA")
  ("Longitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B437473C-B233-499F-A40B-A33FF5010063")
  ("LowerLeftCorner" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C0FCFADF-7D43-47CA-8B6F-68321C58A053")
  ("MLineScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6CFD9F11-2CE2-4011-BF88-E264AAE9D2A1")
  ("MSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FC5EE356-D978-47B8-A8B2-CDDFA4CA3415")
  ("MTextAttribute" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-200B59A4-AB76-4A1D-9E20-C075571B39E3")
  ("MTextAttributeContent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D15CA00-A962-4664-9BE5-81C43384478C")
  ("MTextBoundaryWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2B799069-AAC8-4D8F-B30A-805814DE47D4")
  ("MTextDrawingDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-88481CB1-3150-46FC-8692-5E97759506D6")
  ("MaintainAssociativity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1E74D925-75C2-433C-A0B5-032149CB6542")
  ("MajorAxis" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F97BBFD1-ED1A-450D-845C-D46EE58E2C0F")
  ("MajorRadius" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0CB2B20E-7523-4823-B91B-86846CDC37F3")
  ("Material" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-291D29B4-D327-424B-B9F5-DB46E99D0F27")
  ("Materials" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CC0B448B-532C-48F8-A93C-9FE435C5BCFD")
  ("MaxActiveViewports" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-76B88EE1-CDFB-44E3-AEAE-DA19ADFD0139")
  ("MaxLeaderSegmentsPoints" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CE3817AE-45E3-4EAE-B532-9AE6C1059F40")
  ("Measurement" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7FB34BA-81A6-4D75-9AA6-C3A56C93C9FD")
  ("MenuBar" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E607F7BE-AE4E-47D0-BA96-A9CB1EA2B9CA")
  ("MenuGroups" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4DD90235-FEB0-4ED0-AC20-67F5C71B41D9")
  ("MinimumTableHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D1B8AE6F-6447-4C4C-B660-A1E590DC4505")
  ("MinimumTableWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C372DEB1-71FB-4DB2-A4C4-D0B080B7A4BE")
  ("MinorAxis" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F2E76EDC-458A-4536-964C-8B8873835396")
  ("MinorRadius" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-455F5930-2E8C-492A-89F2-4BD2483FD317")
  ("Mode" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-63FFF960-83A5-4B7C-8D47-B396E96FE309")
  ("ModelSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5A488EA7-C843-4994-8D66-03B7745EC80D")
  ("ModelType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7D01DF6D-1D7D-4505-8EDC-861C38551593")
  ("ModelView" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-626ECDFE-31D3-40B5-84D6-C789C0BA2900")
  ("MomentOfInertia" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16A4E0AD-2D46-42FA-B7A6-00D7027154EE")
  ("Monochrome" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8FFF3B6B-9B73-4971-A395-384FB2A9C385")
  ("Name" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5656E0DF-64F4-4117-BA31-64E6C2C55877")
  ("Normal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EA1EE244-2D63-4491-8133-1ADAF9531BB6")
  ("Notes" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4D6A1086-CC45-462C-ABB6-E979D01A95BD")
  ("NumCellStyles" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0773F383-3914-40CD-8BD9-B737CFA90BB0")
  ("NumCrossSections" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B17F2C28-7DA8-47DD-9D10-E911758FC8B8")
  ("NumGuidePaths" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CBC0B517-EFD3-4AAC-996D-98DF1A66F98C")
  ("NumVertices" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AB8EB3CA-1A6F-4A05-86D9-2172761B7D41")
  ("NumberOfControlPoints" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-594F8EBD-EE03-4DD8-A091-6EE21614C8DA")
  ("NumberOfCopies" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3E910816-76DC-44B4-839E-4B56D79D1D88")
  ("NumberOfFaces" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-46848BD7-B361-4EC2-BEF9-47F7A6035EE0")
  ("NumberOfFitPoints" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35245B4A-FB48-42C2-AE36-ADC229449662")
  ("NumberOfLoops" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E31A9E53-0435-4002-8247-814B966919E6")
  ("NumberOfVertices" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C21ED544-A002-438B-8030-8B4D425A198E")
  ("OLELaunch" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F22D7EF8-E48F-4619-A0B3-B09BDE5DE7ED")
  ("ObjectID" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9E5EA63-5508-4C50-8DBF-F6750214BCCD")
  ("ObjectName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-12879015-C05A-4DF8-8B9C-3C861D098D6B")
  ("ObjectSnapMode" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E7E097DE-098F-48C9-A4C2-69AEBD56F30A")
  ("ObjectSortByPSOutput" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C7DD416-D295-4CD2-ADB9-0E7662E60955")
  ("ObjectSortByPlotting" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F0C68844-103D-4916-A55A-A9D8CCBBC213")
  ("ObjectSortByRedraws" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-67658E90-C04A-4F92-97C2-50B3799EF1B1")
  ("ObjectSortByRegens" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DEC7C1A6-AA4A-4477-B030-0DF4B3EE0BA1")
  ("ObjectSortBySelection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-32EF368D-7604-4114-8B39-77DD3A245148")
  ("ObjectSortBySnap" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-84665987-23F2-42E1-AE91-5961E46CE3E4")
  ("ObliqueAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5EBE2471-54BF-45F3-BFF9-0A4926DA780C")
  ("OleItemType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-270BCCD6-AC88-4628-A736-A5560452F208")
  ("OlePlotQuality" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0FD15AD4-612A-4C22-8E09-D0AD77FF03B7")
  ("OleSourceApp" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-478C115C-0976-4092-8F7F-7933EA3C14BB")
  ("Origin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9EB3E590-E112-4FA7-A266-3B60E5A0B1AF")
  ("OrthoOn" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-40D004C5-B856-487C-9B2D-B538ED871F6F")
  ("OverrideCenter" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C32080D5-9F24-49E8-828B-6C1F9CC7B7D4")
  ("OverwritePropChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9326FC6A-BFE6-4432-9781-92770D0D0DD3")
  ("OwnerID" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7D4D1FB-64DB-43A4-84C4-6D5FCA3959F1")
  ("PaperSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-740E6C3D-4EA9-4202-96D0-F8ACF0C92DC8")
  ("PaperUnits" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E4325F20-6258-4F62-93D2-2E1C37C820C9")
  ("Path" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-252F6CDA-B400-4EF5-A3F6-FD0E54A4CA40")
  ("PatternAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7CDE967-0755-41A0-B557-3E6918E57315")
  ("PatternDouble" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-645969D5-9475-4413-8AD1-8F410DBD333B")
  ("PatternName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5B25E3C9-0BAD-455B-9A81-85731BEFDF45")
  ("PatternScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B18585CA-9CB1-400C-BD9E-EC227F3EB3C4")
  ("PatternSpace" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-18C8D938-C657-4856-87F8-DBE14205E7B4")
  ("PatternType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5D71CDF9-E9EB-402B-AED5-7BC1A9B4A03D")
  ("Perimeter" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9B1F3413-02C1-4531-8AF0-0B0EF776647E")
  ("Periodic" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-72209D73-58EA-4FAC-B6FE-B0B036422A9F")
  ("PickfirstSelectionSet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D48A1C37-4223-4AAA-B1DC-A746604C49B3")
  ("Plot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C66D011-6130-4463-935F-26D92D6C83F3")
  ("PlotConfigurations" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CCF26567-0714-40F4-9895-856A1722C891")
  ("PlotHidden" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-04E76F4D-D58B-406B-AB8E-7A62AFC7EF0C")
  ("PlotOrigin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CBA0BF04-AA4B-4605-98F9-7B50531E2CDE")
  ("PlotRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E612859D-AEC5-414F-B1D5-24C0CF6A4F48")
  ("PlotStyleName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1AF12D45-BF89-4426-AC06-C9C703E6C72B")
  ("PlotType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C7BADF4-C201-4554-9E23-76DC5A60D787")
  ("PlotViewportBorders" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FBFBB73C-D6AB-4DEC-BC6F-2DFC55E9AF72")
  ("PlotViewportsFirst" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-53FD4018-8BEA-4E83-A271-5ECFB5331AC8")
  ("PlotWithLineweights" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-44A4E6C4-02B1-4BDB-ADAA-E94AB354DB91")
  ("PlotWithPlotStyles" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-400D57D6-C025-44AA-A8F8-938783A5E33D")
  ("Plottable" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-61FD920B-1486-490B-A268-70A3DC7EA3EE")
  ("Position" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7BAEF097-C177-4F4A-B9A6-0A2202C4381B")
  ("Preferences" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CEA64734-E3BE-441F-A586-2F954AA8403E")
  ("Preset" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A0753063-764A-4FA8-8211-E525A4C94FC9")
  ("PrimaryUnitsPrecision" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2BA3198C-BC5A-47DC-BBE6-B5A6D94B6425")
  ("PrincipalDirections" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C1B05DAB-86A8-457A-8E46-555FAE277540")
  ("PrincipalMoments" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1E8E7025-1E04-4806-B967-136295222877")
  ("ProductOfInertia" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FE8F6365-9E04-44C4-80B4-3DE62707F71F")
  ("ProfileRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4FA17852-13F7-45A0-BB7B-3855640253E1")
  ("PromptString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5320ADDC-E5FF-483F-AC10-FFBBB9002128")
  ("PropertyName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1D55A245-28F4-48E5-BB2B-78E88C62541C")
  ("QuietErrorMode" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CC97F02A-D833-4F2A-A4E7-14BF68CF5B77")
  ("RadiiOfGyration" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1CA0EA7A-FD58-484F-ADB3-D5D58DF17938")
  ("Radius" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-28F16E3B-56A0-44AA-9449-1DB66BBF08DA")
  ("RadiusRatio" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-816A420F-C2A0-4458-AAFD-D3D73D04B28D")
  ("ReadOnly" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F907311B-2BFC-4498-BD1D-560D537F7FE8")
  ("Red" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4E401941-2C63-4D67-996F-7D5B625788EA")
  ("RegenerateTableSuppressed" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D2E984AC-BB0E-4F07-AB49-7962B40F3869")
  ("RegisteredApplications" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31073EC8-7827-4617-A3D2-7ED1760EFC59")
  ("RenderSmoothness" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E37F9070-DBFF-40B1-AD4E-3C2C665E526D")
  ("RepeatBottomLabels" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BCBE8D30-F8AD-44FA-A208-13E9F289D435")
  ("RepeatTopLabels" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-73BD792F-2E89-475C-B9F7-15B45C037986")
  ("RevisionNumber" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AB8F9912-637A-43D0-A89C-68F0AB59EB72")
  ("RevolutionAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C0E44A30-22F1-457C-AE76-7B17C03C96AF")
  ("Rotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ADD5CBF4-4C4A-4DE2-A686-4F4DD0CB8734")
  ("RoundDistance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E8298474-A584-425C-82BF-03F8A7F84B6B")
  ("RowHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-22463190-A009-408B-8E78-A002C60E2C56")
  ("RowSpacing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8F6A399-860F-4204-9809-C007B8C7605C")
  ("Rows" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F93CE898-0504-4C44-BCC2-86EBAA742E24")
  ("Saved" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5CC922B2-DFB3-45B6-88BB-CB59ED62934E")
  ("Scale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D2795DA7-91F2-46A4-9869-70B80BD3AD88")
  ("ScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1192309B-E37B-438D-B6C3-6443D858FC2A")
  ("ScaleHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-23A24784-6C19-4130-B92F-F560C12516DC")
  ("ScaleLineweights" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D0954BC9-C56C-4782-8AA6-6605AAF99418")
  ("ScaleWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AFE54257-47ED-4448-B23C-6F770C45F887")
  ("SecondPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1A3DDF2A-1D8F-4E3B-8ACB-66036C277265")
  ("SecondSegmentAngleConstraint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-86037CC4-4E12-42DE-A972-44FDC70A20F4")
  ("SectionManager" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-877A384A-4B16-4651-9DDA-939F70476DED")
  ("SectionPlaneOffset" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E2FFC822-699D-4DC5-9416-C5C46ABC32E3")
  ("SegmentPerPolyline" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B6211F95-B4AA-4E5B-9D84-2B9A6CDD3EE7")
  ("Segmentation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FF267722-D75B-49FC-8111-6232215FAB01")
  ("SelectionSets" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-671644CD-D776-4743-88D4-C0F759EC5D89")
  ("Settings" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-454EC342-BF99-4015-AEA4-84D41CF31EEC")
  ("ShadePlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-911E01F5-B5A6-4331-B860-FAB1E7E124C2")
  ("SheetView" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9526B2BC-53E6-4BA7-A48E-398E38B449B7")
  ("Show" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-42C29920-C453-42EF-8F1F-D557DA5AEA81")
  ("ShowAssociativity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2197BC32-E43F-4937-9933-A6DD22DB5184")
  ("ShowClipped" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9C823DB3-684C-4871-A8E0-E7C3E810F482")
  ("ShowCropped" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-383B906A-F600-43A2-8DA5-374F3D85C731")
  ("ShowHistory" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-023CACF6-E1E4-482E-A11B-5A3F04C22F62")
  ("ShowIntensity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A82310BC-6897-4152-9BAA-C911F001CAF5")
  ("ShowPlotStyles" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31B8B6DE-C9F1-4BB2-916C-EF7B9AE723B5")
  ("ShowRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F068E9E8-DAF6-426A-A288-89C6EF0D65BA")
  ("SliceDepth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-956F69DE-8EB6-42C9-AA44-9EF81C2E862C")
  ("SnapBasePoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-94EF4ADD-56B9-4C09-ABC4-45DBE18ACA6B")
  ("SnapOn" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ADDC90FE-71F9-40DC-8345-0AA0B589845B")
  ("SnapRotationAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-082AC07A-DF56-4E92-B9FD-473A53A5659E")
  ("SolidFill" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E9030C60-5EA3-4E72-AF40-47C2364442E6")
  ("SolidType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C5DFFC5C-33EC-406C-BC14-B17F0EE4DCF0")
  ("SplineFrame" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6BC79A53-1559-436E-9830-34B786305DCA")
  ("SplineMethod" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0A581675-FCDB-4501-8570-5190A69EC1A7")
  ("StandardScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E8D9D4F5-24C1-4C89-924E-DF57C7F0CF5F")
  ("StandardScale2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E13E2CC3-A80B-48B8-B952-16E58DEDA96F")
  ("StartAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7D7F6071-105F-45C4-ABA5-F1EE8618A139")
  ("StartDraftAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BC66F75A-4323-45A0-9666-B2BEB8340579")
  ("StartDraftMagnitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4627CC32-D8F6-440F-AD5C-2F2531B6A8CB")
  ("StartParameter" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E7C085E0-22CA-4E96-83A5-F8672277340E")
  ("StartPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7EE4F705-D287-4165-AEB7-AA56C36F1789")
  ("StartSmoothContinuity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9F2583F0-516D-49D8-87DD-DB4E06A1D311")
  ("StartSmoothMagnitude" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9C007593-F090-4F36-B5E7-ACA302541262")
  ("StartTangent" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-828484FF-AFF2-45D3-AD90-B29AC242F1B9")
  ("State" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-58DFA39B-5EA5-4963-A339-FB6F5B87D279")
  ("State2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C4BDDC1-8F67-49BF-8DAC-3E3BAF3C4030")
  ("StatusID" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-09EA11FE-DE59-4153-BCF3-137ECCFB7C8B")
  ("StyleName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F70A2F76-B986-4742-9863-4A9693C8DA0A")
  ("StyleSheet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5C46D875-11BB-47C1-95EC-095D6EBCBE8F")
  ("Stylization" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8DCAF979-896D-4DB8-8649-42C4A3506E1C")
  ("SubUnitsFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8254963B-E5CB-4931-8C95-AD283E8AD7A9")
  ("SubUnitsSuffix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B7CEA648-733A-4758-8937-B266DA89A040")
  ("Subject" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-00744E45-CB72-4DCE-85BE-B38C798D7908")
  ("SummaryInfo" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B1AB773D-8EA7-4DA6-95BB-38DAF1F34DEC")
  ("SuppressLeadingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3EC6040A-50EF-4080-999A-FA85595C0A72")
  ("SuppressTrailingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-61E14F43-98EA-4F76-AAC3-BB0EACBCEC78")
  ("SuppressZeroFeet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C98361E3-08E2-467C-8ECF-C455FAC454A8")
  ("SuppressZeroInches" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-56A443E9-2A46-4775-B0BB-F43FD143C33E")
  ("SurfTrimAssociativity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D49BBA98-D9DC-4263-AE67-B938A5088F2B")
  ("SurfaceNormals" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8318D259-D322-40F0-A9D2-F378A764E979")
  ("SurfaceType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-70802F5D-DFBA-4061-B336-BD3716F97BC2")
  ("SymbolPosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16B76881-7C0C-44F5-ABAB-BE7D0522C166")
  ("TabOrder" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F1825AD5-8E40-4566-B062-7B20DD1A98A7")
  ("TableBreakFlowDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-02573DA8-EEA4-419E-A6DA-1F97873F4E3B")
  ("TableBreakHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3A9B60BE-C4E9-4F6F-BD8D-DADE071008B6")
  ("TableStyleOverrides" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0632BC19-5BBD-4B7B-A9EB-7B93D273D443")
  ("TagString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1F539FFB-F623-459A-926D-DD8D78147856")
  ("TaperAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-05414541-4946-44C8-93E3-EE36AF4F4D28")
  ("Target" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F85C09CF-FA62-4579-9274-BB6B40AF6728")
  ("TemplateId" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1063242A-F40B-4B07-8C7D-82DD57615B0F")
  ("TextAlignmentPoint" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-13212A9D-A3B9-4957-B1B7-E1A77E092582")
  ("TextAlignmentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-469593B2-AA9D-4069-A301-1E25108BBD29")
  ("TextAngleType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1F067E52-9811-43E9-BE82-1D3104C4B30C")
  ("TextAttachmentDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D8CB606-2288-4B2D-9669-E1330F71CF56")
  ("TextBackgroundFill" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6BBAC0FF-9A52-4D8F-9944-61D108E18DF6")
  ("TextBottomAttachmentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-955DB76A-5A54-4ABF-B2AD-8FC5732EDC40")
  ("TextColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-36320A64-4513-4249-9FF0-ECF19C0B6EC1")
  ("TextDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1206235-CDA8-4BCB-B542-F531286858E7")
  ("TextFill" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7FF42A72-A5EE-4841-9B03-41B3967FD1F4")
  ("TextFillColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8A68AE6B-B5A3-436D-A787-CDF60D5D99DE")
  ("TextFrameDisplay" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-64ECDCFA-2CF2-4787-8722-595F6B2E1677")
  ("TextGap" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C9C31690-D036-42A8-871B-7577CBB3427D")
  ("TextGenerationFlag" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5CF97D09-694B-4560-BA20-7981D7B3E5FF")
  ("TextHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-24195201-FDD5-4C34-A3D4-2DDC21163B90")
  ("TextInside" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-83FABE16-536B-4ED3-B24C-CBF60B3052F8")
  ("TextInsideAlign" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-65DB8C65-CB53-4D2A-98B6-66F299A40297")
  ("TextJustify" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FB4F61A2-86F9-4174-8B4B-29E8DF255CE7")
  ("TextLeftAttachmentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3A9A5A13-3637-4196-B7C0-AE638488FB63")
  ("TextLineSpacingDistance" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2774C8A1-ED35-464E-AFCE-876ADABB76C1")
  ("TextLineSpacingFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D3999237-4C41-4A89-B97D-F8E841FBD32F")
  ("TextLineSpacingStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-107D304C-38D4-4F79-8518-C7C57B5F40E7")
  ("TextMovement" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BD0CF26B-A928-4C51-AE8A-04C6CBC4012D")
  ("TextOutsideAlign" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0EEDA221-35E6-41D2-9881-F99E6CB3D012")
  ("TextOverride" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B2576004-E3DA-4E90-9E5B-0DB166AAD008")
  ("TextPosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E39FFEDE-FF81-4071-81E9-02D9C376D918")
  ("TextPrecision" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AC37A73B-CB8A-4869-BC05-EF4D30BF3E2E")
  ("TextPrefix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DFDB7CE3-159C-498D-822C-E1F64878F534")
  ("TextRightAttachmentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1AF580BE-D7CA-497B-B6D4-F44BAE56AB35")
  ("TextRotation" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EB9C76B1-4CCD-4080-BB04-30A496DA4E09")
  ("TextString" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E54B1951-5BF5-4524-97E6-DFB4E4A20109")
  ("TextStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31E4C32F-89DA-4452-A7A6-2A6A10F15B38")
  ("TextStyleName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3BDB85B9-BA03-4666-8E57-CF5BB9C80F04")
  ("TextStyles" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37275969-EA77-4358-A559-FB804EA5179F")
  ("TextSuffix" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A8889FE5-EF98-4C8C-82E9-D0AE4C6DFACE")
  ("TextTopAttachmentType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-27F0D9CA-B042-489D-96FC-B9277C20C178")
  ("TextWidth" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-710C7711-AE15-4758-AB5A-E31D506FFAA8")
  ("Thickness" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0DFEAA18-C0FE-4B60-B103-39D52E939D63")
  ("Title" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F8081228-4163-4EF0-BFF5-73B81DF0E6BF")
  ("TitleSuppressed" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6B7BC1CC-6331-4385-9FCA-258A7C97316F")
  ("ToleranceDisplay" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2A8E8FA8-EFA7-4F9E-95A3-2145CD92038A")
  ("ToleranceHeightScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FEA03827-FC73-4033-AB08-BD1E79E46F90")
  ("ToleranceJustification" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CCB5AF2E-8F53-4F6E-92DA-3C2B6430D76E")
  ("ToleranceLowerLimit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6FCC3D9C-290D-4D4D-9230-9D30CE656F74")
  ("TolerancePrecision" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A87F2C4A-997B-4314-9C0C-6AE10AC08EAC")
  ("ToleranceSuppressLeadingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B30EC7F1-211E-4E6D-B577-3055F4E35E0E")
  ("ToleranceSuppressTrailingZeros" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1D82AE6-C9C3-4C1D-9013-03F2F803F2A4")
  ("ToleranceSuppressZeroFeet" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-45DBA1FA-E96F-4A85-AD80-68318BCBED05")
  ("ToleranceSuppressZeroInches" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-96A5AD6B-B726-46DF-B276-1B7F765D9A17")
  ("ToleranceUpperLimit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-99AA0BC0-5612-4434-88ED-DD55D6937450")
  ("TopHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-130517DA-F073-4816-B60D-0EFF59AE270E")
  ("TopRadius" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-23C12F46-55FC-43F2-BE86-EB6A74C2EF36")
  ("TotalAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F9FB52AA-0F9A-409D-B334-A1687FF8CA26")
  ("TotalLength" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EE94A912-2BE8-49A1-80F2-AB520FF52D76")
  ("TranslateIDs" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-59BD5654-63AB-4780-9E0F-DEEED5068E94")
  ("Transparency" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9854CD06-75D8-4024-BB67-BA80ED00ABE5")
  ("TrueColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E5F6DDEB-1856-4D42-B31D-DFB757D74466")
  ("TurnHeight" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F248411C-BCE8-4AE0-934A-C83D78456870")
  ("TurnSlope" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BFB79B8A-8AA1-449D-974D-A068F39DB8C5")
  ("Turns" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-89A7D36A-D531-4300-9BA0-8406099419BB")
  ("Twist" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-429E767E-C2BF-4A73-AEAF-F0792BA5F0D4")
  ("TwistAngle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37481065-7A7F-46D7-84E5-B1BB072CFF36")
  ("Type" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-60D723A4-F1AD-4FF5-B448-268108A2BEDA")
  ("UCSIconAtOrigin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-40DB819D-38DE-4C78-9D94-035F66BD6FAA")
  ("UCSIconOn" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9D286342-ECA2-4A87-8CF4-BFF1A765C8D9")
  ("UCSPerViewport" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4A1716CB-F994-4254-A25B-B938B243BC9A")
  ("UIsolineDensity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5E9037B6-2166-4CEE-A201-114BC4B1EE48")
  ("UnderlayLayerOverrideApplied" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-55B962F2-FB10-485A-BD67-838F351D39F8")
  ("UnderlayName" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-03430E86-F5ED-49EA-BC30-F8489D3CDAD1")
  ("UnderlayVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE856DB8-B0A7-4B59-A311-36446BE3BF20")
  ("Unit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B964A616-4B0A-4341-8A41-017AB429FF70")
  ("UnitFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A3C7BE76-143D-427A-B0F1-AC83476AF967")
  ("Units" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-19E4BDA0-CFA2-419D-A9F3-4AA1AF709EA7")
  ("UnitsFormat" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-427FBCE3-A903-44C4-988A-10A30860079E")
  ("UnitsType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37E1E675-571B-4D03-96B6-EA5CB0F737FD")
  ("UpperRightCorner" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCD44D2E-0668-45E7-985B-16B9F8E43F88")
  ("UpsideDown" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-48E13661-CC33-45CF-BDA2-7EE538EC72DF")
  ("UseEntityColor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-16529720-E2F6-4365-BCE1-14F48ED21E50")
  ("UseStandardScale" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BCDB772B-D2E5-456E-A180-2398BC434883")
  ("Used" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C71CFC92-7F83-44BF-9FF7-B42F1AE0EBA1")
  ("UserCoordinateSystems" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1121D09A-27D8-4289-8D8C-03A3339D95BA")
  ("Utility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1B12A7D-2BCA-4743-AE01-F9106ED4D982")
  ("VBE" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37FA3505-7663-4DF5-9BAC-AD17EE62172E")
  ("VIsolineDensity" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DEB993A6-CF3C-4C99-AB9E-B0B527C22C47")
  ("Value" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2FFB80CC-12DB-4B31-BDD0-18A565B15A02")
  ("Verify" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9F4D88AF-2B7A-4D5E-BAFF-A87E30C064DF")
  ("Version" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF73B1E4-DC20-416B-8462-DD2F60ACF1AD")
  ("VertCellMargin" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C39E8AF-0B6B-4F01-B777-AEA628FAACB1")
  ("VerticalDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EB4475A1-AEDF-4F82-ABBE-52F7B6F54F1C")
  ("VerticalTextPosition" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4BAA4370-EDB7-4E65-B0C3-2EC38F648A2E")
  ("Vertices" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6C6A7723-47F0-4019-B373-44B510339006")
  ("ViewToPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E66C049C-5907-404A-BB25-2CAF3B464DAB")
  ("ViewingDirection" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9071E62-7818-473D-B00E-260D86AD6E5C")
  ("ViewportDefault" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E09F81FB-D659-438D-B209-EF57DE9B26B8")
  ("ViewportOn" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B3BE2B59-CDAF-4718-BD67-A39AE2F37186")
  ("Viewports" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DA1A71A-DEA1-4136-B057-A6EE915EF001")
  ("Views" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD4ED21D-EF6A-4FAD-99C5-3A08BEF12101")
  ("VisibilityEdge1" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1878AB7A-A06A-48B2-9952-A46EC12F8189")
  ("VisibilityEdge2" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-961076DD-BA1B-4C32-B7C0-702B5D758986")
  ("VisibilityEdge3" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3CAEB3FF-FBEA-4D7F-85F0-7397C2CBA457")
  ("VisibilityEdge4" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8D0F0136-D1D9-45E0-85E0-2FB07F90F83D")
  ("Visible" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8161BA70-820D-47EA-8D14-1E8B8AEF3315")
  ("VisualStyle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DF56CD1D-0371-4527-8172-A2725E73EB51")
  ("Volume" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6BA4339E-5F59-4061-90F9-35B487E9BEC3")
  ("Weights" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E0706FEE-2B0F-4A9D-B2B7-7872CE79A6AB")
  ("Width" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-023FE356-8A2C-4E3F-ADFB-85BCFCCCA6EA")
  ("WindowLeft" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-72ECCC21-7AD2-4F08-B43F-EFFEB473699E")
  ("WindowState" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C89AA1E8-A976-4C3D-B901-75B852E9BE71")
  ("WindowTitle" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D3ABE51D-929E-4907-A822-EDC3D8986E7D")
  ("WindowTop" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-26DF2511-0F12-4573-9F47-BC876106CBB2")
  ("WireframeType" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0EA12FAA-89F2-4863-AA25-4374B8CCEE84")
  ("XEffectiveScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-27A413B0-D586-4E28-A882-FF3D3E8BB43A")
  ("XRefDatabase" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E7D0AC97-5ECD-40E2-929F-EC1300F6502A")
  ("XRefEdit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-68B29BDE-3704-4317-B179-4D11AE5CEAE3")
  ("XRefLayerVisibility" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F0671C01-FF50-4E8D-9AF6-BA9F74C97FF4")
  ("XScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4606037F-9B61-4320-98A4-AB0D4D511665")
  ("XVector" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3FB215F3-EE89-43F4-BACF-1F8C2675B190")
  ("YEffectiveScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6867ED2B-2635-4E62-B39D-4FFC57C6B265")
  ("YScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CA689A80-DC02-4BBE-A67B-97B377159F9D")
  ("YVector" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B68D37F9-1136-4A37-9919-EE4BD9AFA936")
  ("ZEffectiveScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E7A14E18-0AD7-41E9-A4D8-DA4264D2F499")
  ("ZScaleFactor" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9A22CC37-F59D-4CF6-99AD-9FA28058AB87")
  )
)
