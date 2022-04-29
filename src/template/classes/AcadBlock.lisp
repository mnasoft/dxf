(in-package :dxf/classes)

'((:defclass "AcadBlock" )
  (:parents "AcadObject")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E6F7B03B-F5CC-4A18-9C48-BBF1D32A31FD\"](Block Object (ActiveX))")
  (:methods
   "Add3DFace Add3DMesh Add3DPoly AddArc AddAttribute AddBox AddCircle
   AddCone AddCustomObject AddCylinder AddDim3PointAngular
   AddDimAligned AddDimAngular AddDimArc AddDimDiametric
   AddDimOrdinate AddDimRadial AddDimRadialLarge AddDimRotated
   AddEllipse AddEllipticalCone AddEllipticalCylinder AddExtrudedSolid
   AddExtrudedSolidALongPath AddHatch AddLeader AddLightWeightPolyline
   AddLine AddMInsertBlock AddMLeader AddMLine AddMText AddPoint
   AddPolyfaceMesh AddPolyline AddRaster AddRay AddRegion
   AddRevolvedSolid AddSection AddShape AddSolid AddSphere AddSpline
   AddTable AddText AddTolerance AddTorus AddTrace AddWedge AddXLine
   AttachExternalReference Bind Delete Detach GetExtensionDictionary
   GetXData InsertBlock Item Reload SetXData Unload")
  (:properties
   "Application BlockScaling Comments Count Document Explodable Handle
   HasExtensionDictionary IsDynamicBlock IsLayout IsXRef Layout
   Material Name ObjectID ObjectName Origin OwnerID Path Units
   XRefDatabase")
  (:events
   "Modified"))
