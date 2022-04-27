(in-package :dxf)

(defclass <acad-view> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-category-name            :accessor pr-category-name            :initarg :pr-category-name            :initform nil :documentation "pr-category-name")
  (pr-center                   :accessor pr-center                   :initarg :pr-center                   :initform nil :documentation "pr-center")
  (pr-direction                :accessor pr-direction                :initarg :pr-direction                :initform nil :documentation "pr-direction")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-has-vp-association       :accessor pr-has-vp-association       :initarg :pr-has-vp-association       :initform nil :documentation "pr-has-vp-association")
  (pr-height                   :accessor pr-height                   :initarg :pr-height                   :initform nil :documentation "pr-height")
  (pr-layer-state              :accessor pr-layer-state              :initarg :pr-layer-state              :initform nil :documentation "pr-layer-state")
  (pr-layout-id                :accessor pr-layout-id                :initarg :pr-layout-id                :initform nil :documentation "pr-layout-id")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-target                   :accessor pr-target                   :initarg :pr-target                   :initform nil :documentation "pr-target")
  (pr-width                    :accessor pr-width                    :initarg :pr-width                    :initform nil :documentation "pr-width")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B9C7D36-0905-4C20-84C5-53714379B811\"](View Object (ActiveX))"))

(defparameter *acad-view-properties* '(pr-application pr-category-name pr-center pr-direction pr-document pr-handle pr-has-extension-dictionary pr-has-vp-association pr-height pr-layer-state pr-layout-id pr-name pr-object-id pr-object-name pr-owner-id pr-target pr-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-view-properties* *acad-object-properties*))
