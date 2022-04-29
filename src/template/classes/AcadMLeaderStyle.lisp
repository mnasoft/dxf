(in-package :dxf/classes)

'((:defclass "AcadMLeaderStyle")
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-14AC2D0B-EBFC-44B9-982D-9112539F8DE8\"](MLeaderStyle Object (ActiveX))")
  (:methods
   "Delete GetBoundingBox GetXData SetXData")
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
  (:events
   "Modified"))
