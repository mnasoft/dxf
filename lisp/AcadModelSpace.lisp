(in-package :dxf)

(in-package :dxf)

(defclass <acad-model-space> (<acad-block>)
  (
   (ac-application
    :accessor ac-application :initarg :ac-application :initform nil
    :documentation
    "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-41478919-F833-4273-9EBC-B57C5FF792D4\"](Application Property (ActiveX))")
   (ac-comments
    :accessor ac-comments :initarg :ac-comments :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-528FC215-ADD5-4FFC-B928-E2CC2C267967\"](Comments Property (ActiveX))")
   (ac-count
    :accessor ac-count :initarg :ac-count :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF9D55CA-77EB-4EAC-9DD3-FEA6D077D9A1\"](Count Property (ActiveX))")
   (ac-document :accessor ac-document :initarg :ac-document :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0F0245B6-29E9-4B68-AF77-5B46D5341ADA\"](Document Property (ActiveX))")
   (ac-handle :accessor ac-handle :initarg :ac-handle :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-08DCE6ED-DE5A-41FA-9220-3D75B2B4C43D\"](Handle Property (ActiveX))")
   (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-691DA1BB-3D33-45A9-9A0F-212988DBA5F6\"](HasExtensionDictionary Property (ActiveX))")
   (ac-layout
    :accessor ac-layout
    :initarg :ac-layout
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8C02D136-1FCD-4456-84AC-B1A73BD179C7\"](Layout Property (ActiveX))")
   (ac-name :accessor ac-name :initarg :ac-name :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5656E0DF-64F4-4117-BA31-64E6C2C55877\"](Name Property (ActiveX))")
   (ac-object-id
    :accessor ac-object-id
    :initarg :ac-object-id
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D9E5EA63-5508-4C50-8DBF-F6750214BCCD\"](ObjectID Property (ActiveX))")
   (ac-object-name
    :accessor ac-object-name
    :initarg :ac-object-name
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-12879015-C05A-4DF8-8B9C-3C861D098D6B\"](ObjectName Property (ActiveX))")
   (ac-origin
    :accessor ac-origin
    :initarg :ac-origin
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9EB3E590-E112-4FA7-A266-3B60E5A0B1AF\"](Origin Property (ActiveX))")
   (ac-owner-id
    :accessor ac-owner-id
    :initarg :ac-owner-id
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7D4D1FB-64DB-43A4-84C4-6D5FCA3959F1\"](OwnerID Property (ActiveX))")
   (ac-units
    :accessor ac-units
    :initarg :ac-units
    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-19E4BDA0-CFA2-419D-A9F3-4AA1AF709EA7\"](Units Property (ActiveX))")
  )
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C541B6F2-1279-4D1C-8DC0-788F27F644EF\"](ModelSpace Collection (ActiveX))"))

(defparameter *acad-model-space-properties*
  '(ac-application ac-comments ac-count ac-document ac-handle
    ac-has-extension-dictionary ac-layout ac-name ac-object-id
    ac-object-name ac-origin ac-owner-id ac-units))

(mapcar #'dxf/utils:make-slot (set-difference  *acad-model-space-properties* *acad-block-properties* ))


