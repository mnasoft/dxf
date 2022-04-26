(in-package :dxf)

(defclass <acad-viewport> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-arc-smoothness           :accessor ac-arc-smoothness           :initarg :ac-arc-smoothness           :initform nil :documentation "ac-arc-smoothness")
  (ac-center                   :accessor ac-center                   :initarg :ac-center                   :initform nil :documentation "ac-center")
  (ac-direction                :accessor ac-direction                :initarg :ac-direction                :initform nil :documentation "ac-direction")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-grid-on                  :accessor ac-grid-on                  :initarg :ac-grid-on                  :initform nil :documentation "ac-grid-on")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-lower-left-corner        :accessor ac-lower-left-corner        :initarg :ac-lower-left-corner        :initform nil :documentation "ac-lower-left-corner")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-ortho-on                 :accessor ac-ortho-on                 :initarg :ac-ortho-on                 :initform nil :documentation "ac-ortho-on")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-snap-base-point          :accessor ac-snap-base-point          :initarg :ac-snap-base-point          :initform nil :documentation "ac-snap-base-point")
  (ac-snap-on                  :accessor ac-snap-on                  :initarg :ac-snap-on                  :initform nil :documentation "ac-snap-on")
  (ac-snap-rotation-angle      :accessor ac-snap-rotation-angle      :initarg :ac-snap-rotation-angle      :initform nil :documentation "ac-snap-rotation-angle")
  (ac-target                   :accessor ac-target                   :initarg :ac-target                   :initform nil :documentation "ac-target")
  (ac-ucs-icon-at-origin       :accessor ac-ucs-icon-at-origin       :initarg :ac-ucs-icon-at-origin       :initform nil :documentation "ac-ucs-icon-at-origin")
  (ac-ucs-icon-on              :accessor ac-ucs-icon-on              :initarg :ac-ucs-icon-on              :initform nil :documentation "ac-ucs-icon-on")
  (ac-upper-right-corner       :accessor ac-upper-right-corner       :initarg :ac-upper-right-corner       :initform nil :documentation "ac-upper-right-corner")
  (ac-width                    :accessor ac-width                    :initarg :ac-width                    :initform nil :documentation "ac-width")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2B609059-6B70-4C66-A442-F5917363462A
Viewport Object (ActiveX)
"))

(defparameter *acad-viewport-properties* '(ac-application ac-arc-smoothness ac-center ac-direction ac-document ac-grid-on ac-handle ac-has-extension-dictionary ac-height ac-lower-left-corner ac-name ac-object-id ac-object-name ac-ortho-on ac-owner-id ac-snap-base-point ac-snap-on ac-snap-rotation-angle ac-target ac-ucs-icon-at-origin ac-ucs-icon-on ac-upper-right-corner ac-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-viewport-properties* *acad-object-properties*))
