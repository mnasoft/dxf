(in-package :dxf/classes)

'((:defclass "AcadViewport" )
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2B609059-6B70-4C66-A442-F5917363462A\"](Viewport Object (ActiveX))")
  (:methods
   "Delete GetExtensionDictionary GetGridSpacing GetSnapSpacing
   GetXData SetGridSpacing SetSnapSpacing SetView SetXData Split")
  (:properties
   "Application ArcSmoothness Center Direction Document GridOn Handle
   HasExtensionDictionary Height LowerLeftCorner Name ObjectID
   ObjectName OrthoOn OwnerID SnapBasePoint SnapOn SnapRotationAngle
   Target UCSIconAtOrigin UCSIconOn UpperRightCorner Width")
  (:events
   "Modified"))
