(in-package :dxf/classes)

(defclass <acad-group> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-count                    :accessor pr-count                    :initarg :pr-count                    :initform nil :documentation "pr-count")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1CA2C9D1-F8F7-4C11-B361-2998C4869119\"](Group Object (ActiveX))"))

(defparameter *acad-group-properties* '(pr-application pr-count pr-document pr-handle pr-has-extension-dictionary pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-material pr-name pr-object-id pr-object-name pr-owner-id pr-plot-style-name pr-true-color pr-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-group-properties* *acad-object-properties*))
