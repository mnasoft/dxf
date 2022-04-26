(in-package :dxf)

(defclass <acad-view> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-category-name            :accessor ac-category-name            :initarg :ac-category-name            :initform nil :documentation "ac-category-name")
  (ac-center                   :accessor ac-center                   :initarg :ac-center                   :initform nil :documentation "ac-center")
  (ac-direction                :accessor ac-direction                :initarg :ac-direction                :initform nil :documentation "ac-direction")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-has-vp-association       :accessor ac-has-vp-association       :initarg :ac-has-vp-association       :initform nil :documentation "ac-has-vp-association")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-layer-state              :accessor ac-layer-state              :initarg :ac-layer-state              :initform nil :documentation "ac-layer-state")
  (ac-layout-id                :accessor ac-layout-id                :initarg :ac-layout-id                :initform nil :documentation "ac-layout-id")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-target                   :accessor ac-target                   :initarg :ac-target                   :initform nil :documentation "ac-target")
  (ac-width                    :accessor ac-width                    :initarg :ac-width                    :initform nil :documentation "ac-width")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1B9C7D36-0905-4C20-84C5-53714379B811
View Object (ActiveX)
"))

(defparameter *acad-view-properties* '(ac-application ac-category-name ac-center ac-direction ac-document ac-handle ac-has-extension-dictionary ac-has-vp-association ac-height ac-layer-state ac-layout-id ac-name ac-object-id ac-object-name ac-owner-id ac-target ac-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-view-properties* *acad-object-properties*))
