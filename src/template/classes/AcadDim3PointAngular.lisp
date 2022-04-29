(in-package :dxf/classes)

'((:defclass "AcadDim3PointAngular")
  (:parents "AcadDimension")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1EF38BC6-8057-4F4A-95BC-0624544A248F\"](Dim3PointAngular Object (ActiveX))")
  (:methods
   "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetXData Highlight IntersectWith Mirror
   Mirror3D Move Rotate Rotate3D ScaleEntity SetXData TransformBy
   Update")
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
  (:events
   "Modified"))
