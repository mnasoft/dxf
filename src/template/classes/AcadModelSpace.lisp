!(in-package :dxf/classes)
(in-package :dxf/classes)

'((:defclass "AcadModelSpace")
  (:parents "AcadBlock")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C541B6F2-1279-4D1C-8DC0-788F27F644EF\"](ModelSpace Collection (ActiveX))")
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
   AttachExternalReference GetExtensionDictionary GetXdata InsertBlock
   Item SetXdata")
  (:properties
   "Application Comments Count Document Handle HasExtensionDictionary
   Layout Name ObjectID ObjectName Origin OwnerID Units")
  (:events
   "Modified"))
