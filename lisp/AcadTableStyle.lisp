(in-package :dxf)

(defclass <acad-table-style> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-bit-flags                :accessor ac-bit-flags                :initarg :ac-bit-flags                :initform nil :documentation "ac-bit-flags")
  (ac-description              :accessor ac-description              :initarg :ac-description              :initform nil :documentation "ac-description")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-flow-direction           :accessor ac-flow-direction           :initarg :ac-flow-direction           :initform nil :documentation "ac-flow-direction")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-header-suppressed        :accessor ac-header-suppressed        :initarg :ac-header-suppressed        :initform nil :documentation "ac-header-suppressed")
  (ac-horz-cell-margin         :accessor ac-horz-cell-margin         :initarg :ac-horz-cell-margin         :initform nil :documentation "ac-horz-cell-margin")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-num-cell-styles          :accessor ac-num-cell-styles          :initarg :ac-num-cell-styles          :initform nil :documentation "ac-num-cell-styles")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-template-id              :accessor ac-template-id              :initarg :ac-template-id              :initform nil :documentation "ac-template-id")
  (ac-title-suppressed         :accessor ac-title-suppressed         :initarg :ac-title-suppressed         :initform nil :documentation "ac-title-suppressed")
  (ac-vert-cell-margin         :accessor ac-vert-cell-margin         :initarg :ac-vert-cell-margin         :initform nil :documentation "ac-vert-cell-margin")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-409A6709-D3D9-4D7D-AC60-163444D58FBA
TableStyle Object (ActiveX)
"))

(defparameter *acad-table-style-properties* '(ac-application ac-bit-flags ac-description ac-document ac-flow-direction ac-handle ac-has-extension-dictionary ac-header-suppressed ac-horz-cell-margin ac-name ac-num-cell-styles ac-object-id ac-object-name ac-owner-id ac-template-id ac-title-suppressed ac-vert-cell-margin))

(mapcar #'dxf/utils:make-slot (set-difference *acad-table-style-properties* *acad-object-properties*))
