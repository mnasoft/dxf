(in-package :dxf/classes)

(defclass <acad-object> (<object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1C457D0A-9933-4A74-B3E9-A7F3483B3F34\"](IAcadObject Interface (ActiveX))"))


(defparameter *acad-object-methods*
  '("Delete"
    "GetExtensionDictionary"
    "GetXData"
    "SetXData"))

(defparameter *acad-object-properties*
  '("Application"
    "Document"
    "Handle"
    "HasExtensionDictionary"
    "ObjectID"
    "ObjectName"
    "OwnerID"))

(defparameter *acad-object-events*
  '("Modified"))

(dxf/utils::diff *acad-object-properties* *object-properties*)



