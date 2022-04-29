(in-package :dxf/classes)

'((:defclass "AcadPaperSpace")
  (:parents "AcadBlock")
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C5E998B5-6EB1-459A-98B1-444C74DB4516\"](PaperSpace Collection (ActiveX))")
  (:methods
   "Add3DFace Add3DMesh Add3DPoly AddArc AddAttribute AddBox AddCircle
   AddCone AddCustomObject AddCylinder AddDim3PointAngular
   AddDimAligned AddDimAngular AddDimArc AddDimDiametric
   AddDimOrdinate AddDimRadial AddDimRadialLarge AddDimRotated
   AddEllipse AddEllipticalCone AddEllipticalCylinder AddExtrudedSolid
   AddExtrudedSolidALongPath AddHatch AddLeader AddLightWeightPolyline
   AddLine AddMInsertBlock AddMLeader AddMLine AddMText AddPoint
   AddPolyfaceMesh AddPolyline AddPViewport AddRaster AddRay AddRegion
   AddRevolvedSolid AddSection AddShape AddSolid AddSphere AddSpline
   AddTable AddText AddTolerance AddTorus AddTrace AddWedge AddXLine
   AttachExternalReference GetExtensionDictionary GetXdata InsertBlock
   Item SetXdata")
  (:properties
   "Application Count Document Handle HasExtensionDictionary Layout
   Name ObjectID ObjectName OwnerID")
  (:events
   "Modified"))
