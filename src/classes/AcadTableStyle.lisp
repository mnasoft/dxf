(in-package :dxf/classes)

(defclass <acad-table-style> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-bit-flags                :accessor pr-bit-flags                :initarg :pr-bit-flags                :initform nil :documentation "pr-bit-flags")
  (pr-description              :accessor pr-description              :initarg :pr-description              :initform nil :documentation "pr-description")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-flow-direction           :accessor pr-flow-direction           :initarg :pr-flow-direction           :initform nil :documentation "pr-flow-direction")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-header-suppressed        :accessor pr-header-suppressed        :initarg :pr-header-suppressed        :initform nil :documentation "pr-header-suppressed")
  (pr-horz-cell-margin         :accessor pr-horz-cell-margin         :initarg :pr-horz-cell-margin         :initform nil :documentation "pr-horz-cell-margin")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-num-cell-styles          :accessor pr-num-cell-styles          :initarg :pr-num-cell-styles          :initform nil :documentation "pr-num-cell-styles")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-template-id              :accessor pr-template-id              :initarg :pr-template-id              :initform nil :documentation "pr-template-id")
  (pr-title-suppressed         :accessor pr-title-suppressed         :initarg :pr-title-suppressed         :initform nil :documentation "pr-title-suppressed")
  (pr-vert-cell-margin         :accessor pr-vert-cell-margin         :initarg :pr-vert-cell-margin         :initform nil :documentation "pr-vert-cell-margin")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-409A6709-D3D9-4D7D-AC60-163444D58FBA\"](TableStyle Object (ActiveX))"))

(defparameter *acad-table-style-properties* '(pr-application pr-bit-flags pr-description pr-document pr-flow-direction pr-handle pr-has-extension-dictionary pr-header-suppressed pr-horz-cell-margin pr-name pr-num-cell-styles pr-object-id pr-object-name pr-owner-id pr-template-id pr-title-suppressed pr-vert-cell-margin))

(mapcar #'dxf/utils:make-slot (set-difference *acad-table-style-properties* *acad-object-properties*))
