(in-package :dxf/classes)

(defclass <acad-dictionary> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9FF18AA0-4E48-4F92-AC0D-FBBD4225D347\"](Dictionary Object (ActiveX))"))

(defparameter *acad-dictionary-properties* '(pr-application pr-count pr-document pr-handle pr-has-extension-dictionary pr-name pr-object-id pr-object-name pr-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-dictionary-properties* *acad-object-properties*))
