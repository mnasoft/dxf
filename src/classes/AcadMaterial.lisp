(in-package :dxf/classes)

(defclass <acad-material> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-description              :accessor pr-description              :initarg :pr-description              :initform nil :documentation "pr-description")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A7E5AA1A-D3C3-4AA3-A751-97768628D96C\"](Material Object (ActiveX))"))

(defparameter *acad-material-properties* '(pr-application pr-description pr-document pr-handle pr-has-extension-dictionary pr-name pr-object-id pr-object-name pr-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-material-properties* *acad-object-properties*))
