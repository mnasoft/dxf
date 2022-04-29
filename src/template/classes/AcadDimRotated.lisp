(in-package :dxf/classes)

'((:defclass "AcadDimRotated" )
  (:parents "AcadDimension")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-93D19CB2-9A1F-4324-BD49-D241FD009C3C\"](DimRotated Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
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
  (:events
   "Modified"))
