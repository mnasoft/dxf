(in-package :dxf/classes)

(defclass <acad-registered-applications> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-606BE79B-6E2C-4BAB-BFF7-F54B7167F96C\"](RegisteredApplications Collection (ActiveX))"))

(defparameter *acad-registered-applications-properties* '(pr-application pr-count pr-document pr-handle pr-has-extension-dictionary pr-object-id pr-object-name pr-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-registered-applications-properties* *acad-object-properties*))
