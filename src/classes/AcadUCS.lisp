(in-package :dxf)

(defclass <acad-ucs> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-origin                   :accessor pr-origin                   :initarg :pr-origin                   :initform nil :documentation "pr-origin")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-x-vector                 :accessor pr-x-vector                 :initarg :pr-x-vector                 :initform nil :documentation "pr-x-vector")
  (pr-y-vector                 :accessor pr-y-vector                 :initarg :pr-y-vector                 :initform nil :documentation "pr-y-vector")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-42778889-C568-4ABF-9CFA-63CC0D781794\"](UCS Object (ActiveX))"))

(defparameter *acad-ucs-properties* '(pr-application pr-document pr-handle pr-has-extension-dictionary pr-name pr-object-id pr-object-name pr-origin pr-owner-id pr-x-vector pr-y-vector))

(mapcar #'dxf/utils:make-slot (set-difference *acad-ucs-properties* *acad-object-properties*))
