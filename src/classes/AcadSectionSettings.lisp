(in-package :dxf/classes)

(defclass <acad-section-settings> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-current-section-type     :accessor pr-current-section-type     :initarg :pr-current-section-type     :initform nil :documentation "pr-current-section-type")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-72C22774-0C07-4B54-8760-65ADCFC228DD\"](SectionSettings object (ActiveX))"))

(defparameter *acad-section-settings-properties* '(pr-application pr-current-section-type pr-document pr-handle pr-has-extension-dictionary pr-object-id pr-object-name pr-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-section-settings-properties* *acad-object-properties*))
