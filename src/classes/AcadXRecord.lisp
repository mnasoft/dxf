(in-package :dxf/classes)

(defclass <acad-xrecord> (<acad-object>)
  (
   (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
   (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
   (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
   (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
   (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
   (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
   (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
   (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
   (pr-translate-i-ds           :accessor pr-translate-i-ds           :initarg :pr-translate-i-ds           :initform nil :documentation "pr-translate-i-ds")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-AF9C01F7-5BD9-4AF8-AB63-F58A997A5258\"](XRecord Object (ActiveX))"))

(closer-mop:class-slots (find-class '<acad-x-record>))

(defparameter *acad-x-record-properties* '(pr-application pr-document pr-handle pr-has-extension-dictionary pr-name pr-object-id pr-object-name pr-owner-id pr-translate-i-ds))

(mapcar #'dxf/utils:make-slot (set-difference *acad-x-record-properties* *acad-object-properties*))
