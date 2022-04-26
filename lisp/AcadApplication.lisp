(in-package :dxf)

(defclass <acad-application> (<object>)
  (
  (ac-active-document          :accessor ac-active-document          :initarg :ac-active-document          :initform nil :documentation "ac-active-document")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-caption                  :accessor ac-caption                  :initarg :ac-caption                  :initform nil :documentation "ac-caption")
  (ac-documents                :accessor ac-documents                :initarg :ac-documents                :initform nil :documentation "ac-documents")
  (ac-full-name                :accessor ac-full-name                :initarg :ac-full-name                :initform nil :documentation "ac-full-name")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-hwnd                     :accessor ac-hwnd                     :initarg :ac-hwnd                     :initform nil :documentation "ac-hwnd")
  (ac-locale-id                :accessor ac-locale-id                :initarg :ac-locale-id                :initform nil :documentation "ac-locale-id")
  (ac-menu-bar                 :accessor ac-menu-bar                 :initarg :ac-menu-bar                 :initform nil :documentation "ac-menu-bar")
  (ac-menu-groups              :accessor ac-menu-groups              :initarg :ac-menu-groups              :initform nil :documentation "ac-menu-groups")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-path                     :accessor ac-path                     :initarg :ac-path                     :initform nil :documentation "ac-path")
  (ac-preferences              :accessor ac-preferences              :initarg :ac-preferences              :initform nil :documentation "ac-preferences")
  (ac-status-id                :accessor ac-status-id                :initarg :ac-status-id                :initform nil :documentation "ac-status-id")
  (ac-vbe                      :accessor ac-vbe                      :initarg :ac-vbe                      :initform nil :documentation "ac-vbe")
  (ac-version                  :accessor ac-version                  :initarg :ac-version                  :initform nil :documentation "ac-version")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  (ac-width                    :accessor ac-width                    :initarg :ac-width                    :initform nil :documentation "ac-width")
  (ac-window-left              :accessor ac-window-left              :initarg :ac-window-left              :initform nil :documentation "ac-window-left")
  (ac-window-state             :accessor ac-window-state             :initarg :ac-window-state             :initform nil :documentation "ac-window-state")
  (ac-window-top               :accessor ac-window-top               :initarg :ac-window-top               :initform nil :documentation "ac-window-top")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0225808C-8C91-407B-990C-15AB966FFFA8
Application Object (ActiveX)
"))

(defparameter *acad-application-properties* '(ac-active-document ac-application ac-caption ac-documents ac-full-name ac-height ac-hwnd ac-locale-id ac-menu-bar ac-menu-groups ac-name ac-path ac-preferences ac-status-id ac-vbe ac-version ac-visible ac-width ac-window-left ac-window-state ac-window-top))

(mapcar #'dxf/utils:make-slot (set-difference *acad-application-properties* *object-properties*))
