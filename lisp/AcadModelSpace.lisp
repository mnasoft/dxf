!(in-package :dxf)

(in-package :dxf)

(defclass <acad-model-space> (<acad-block>)
  (
   (pr-application
    :accessor pr-application :initarg :pr-application :initform nil
    :documentation
    "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-41478919-F833-4273-9EBC-B57C5FF792D4\"](Application Property (ActiveX))")
   (pr-comments
    :accessor pr-comments :initarg :pr-comments :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-528FC215-ADD5-4FFC-B928-E2CC2C267967\"](Comments Property (ActiveX))")
   (pr-count
    :accessor pr-count :initarg :pr-count :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF9D55CA-77EB-4EAC-9DD3-FEA6D077D9A1\"](Count Property (ActiveX))")
   (pr-document :accessor pr-document :initarg :pr-document :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0F0245B6-29E9-4B68-AF77-5B46D5341ADA\"](Document Property (ActiveX))")
   (pr-handle :accessor pr-handle :initarg :pr-handle :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-08DCE6ED-DE5A-41FA-9220-3D75B2B4C43D\"](Handle Property (ActiveX))")
   (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-691DA1BB-3D33-45A9-9A0F-212988DBA5F6\"](HasExtensionDictionary Property (ActiveX))")
   (pr-layout
    :accessor pr-layout
    :initarg :pr-layout
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C02D136-1FCD-4456-84AC-B1A73BD179C7\"](Layout Property (ActiveX))")
   (pr-name :accessor pr-name :initarg :pr-name :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5656E0DF-64F4-4117-BA31-64E6C2C55877\"](Name Property (ActiveX))")
   (pr-object-id
    :accessor pr-object-id
    :initarg :pr-object-id
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9E5EA63-5508-4C50-8DBF-F6750214BCCD\"](ObjectID Property (ActiveX))")
   (pr-object-name
    :accessor pr-object-name
    :initarg :pr-object-name
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-12879015-C05A-4DF8-8B9C-3C861D098D6B\"](ObjectName Property (ActiveX))")
   (pr-origin
    :accessor pr-origin
    :initarg :pr-origin
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9EB3E590-E112-4FA7-A266-3B60E5A0B1AF\"](Origin Property (ActiveX))")
   (pr-owner-id
    :accessor pr-owner-id
    :initarg :pr-owner-id
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7D4D1FB-64DB-43A4-84C4-6D5FCA3959F1\"](OwnerID Property (ActiveX))")
   (pr-units
    :accessor pr-units
    :initarg :pr-units
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-19E4BDA0-CFA2-419D-A9F3-4AA1AF709EA7\"](Units Property (ActiveX))")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C541B6F2-1279-4D1C-8DC0-788F27F644EF\"](ModelSpace Collection (ActiveX))"))

(defparameter *acad-model-space-properties*
  '(pr-application pr-comments pr-count pr-document pr-handle
    pr-has-extension-dictionary pr-layout pr-name pr-object-id
    pr-object-name pr-origin pr-owner-id pr-units))

(mapcar #'dxf/utils:make-slot (set-difference  *acad-model-space-properties* *acad-block-properties* ))


