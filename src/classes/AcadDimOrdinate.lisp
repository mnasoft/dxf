(in-package :dxf/classes)

'((:defclass "AcadDimOrdinate" )
  (:parents "AcadDimension")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-35CE0F15-A136-4878-AEDC-FADC193E7ED2\"](DimOrdinate Object (ActiveX))")
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
  (:events
   "Modified"))
