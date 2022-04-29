(in-package :dxf/classes)

'((:defclass "AcadMLeader")
  (:parents "AcadEntity")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-95FD33C2-DF78-4014-933C-9AC124E6A35D\"](MLeader Object (ActiveX))")
  (:methods
   "AddLeader AddLeaderLine AddLeaderLineEx ArrayPolar
   ArrayRectangular Copy Delete Evaluate GetBlockAttributeValue
   GetBoundingBox GetDoglegDirection GetExtensionDictionary
   GetLeaderIndex GetLeaderLineIndexes GetLeaderLineVertices
   GetVertexCount GetXData Highlight IntersectWith Mirror Mirror3D
   Move RemoveLeader RemoveLeaderLine Rotate Rotate3D ScaleEntity
   SetBlockAttributeValue SetDoglegDirection SetLeaderLineVertices
   SetXData TransformBy Update")
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
  (:events
   "Modified"))
