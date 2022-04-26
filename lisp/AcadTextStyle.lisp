(in-package :dxf)

(defclass <acad-text-style> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-big-font-file            :accessor ac-big-font-file            :initarg :ac-big-font-file            :initform nil :documentation "ac-big-font-file")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-font-file                :accessor ac-font-file                :initarg :ac-font-file                :initform nil :documentation "ac-font-file")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-last-height              :accessor ac-last-height              :initarg :ac-last-height              :initform nil :documentation "ac-last-height")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-oblique-angle            :accessor ac-oblique-angle            :initarg :ac-oblique-angle            :initform nil :documentation "ac-oblique-angle")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-text-generation-flag     :accessor ac-text-generation-flag     :initarg :ac-text-generation-flag     :initform nil :documentation "ac-text-generation-flag")
  (ac-width                    :accessor ac-width                    :initarg :ac-width                    :initform nil :documentation "ac-width")
  )
  (:documentation "A named, saved collection of settings that determines the appearance of text characters."))

(defparameter *acad-text-style-properties* '(ac-application ac-big-font-file ac-document ac-font-file ac-handle ac-has-extension-dictionary ac-height ac-last-height ac-name ac-object-id ac-object-name ac-oblique-angle ac-owner-id ac-text-generation-flag ac-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-text-style-properties* *acad-object-properties*))
