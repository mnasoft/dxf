(in-package :dxf/classes)

(defclass <acad-text-style> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-big-font-file            :accessor pr-big-font-file            :initarg :pr-big-font-file            :initform nil :documentation "pr-big-font-file")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-font-file                :accessor pr-font-file                :initarg :pr-font-file                :initform nil :documentation "pr-font-file")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-height                   :accessor pr-height                   :initarg :pr-height                   :initform nil :documentation "pr-height")
  (pr-last-height              :accessor pr-last-height              :initarg :pr-last-height              :initform nil :documentation "pr-last-height")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-oblique-angle            :accessor pr-oblique-angle            :initarg :pr-oblique-angle            :initform nil :documentation "pr-oblique-angle")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-text-generation-flag     :accessor pr-text-generation-flag     :initarg :pr-text-generation-flag     :initform nil :documentation "pr-text-generation-flag")
  (pr-width                    :accessor pr-width                    :initarg :pr-width                    :initform nil :documentation "pr-width")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0531335D-26F3-404B-A4E1-1DE70BF0A307\"](TextStyle Object (ActiveX))"))

(defparameter *acad-text-style-properties* '(pr-application pr-big-font-file pr-document pr-font-file pr-handle pr-has-extension-dictionary pr-height pr-last-height pr-name pr-object-id pr-object-name pr-oblique-angle pr-owner-id pr-text-generation-flag pr-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-text-style-properties* *acad-object-properties*))
