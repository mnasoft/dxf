(in-package :dxf)

(defclass <acad-sortents-table> (<acad-object>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-258B72FF-B29A-45D2-B972-B1776D9112A7
SortentsTable Object (ActiveX)
"))

(defparameter *acad-sortents-table-properties* '(ac-application ac-document ac-handle ac-has-extension-dictionary ac-object-id ac-object-name ac-owner-id))

(mapcar #'dxf/utils:make-slot (set-difference *acad-sortents-table-properties* *acad-object-properties*))
