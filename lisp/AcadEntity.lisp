(in-package :dxf)

(defclass <acad-entity> (<acad-object>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCA7867D-E354-4F48-9C47-DB22C53A3460\"](IAcadEntity Interface (ActiveX))"))

(defparameter *acad-entity-properties* '(pr-application pr-document pr-entity-transparency pr-handle pr-has-extension-dictionary pr-hyperlinks pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-material pr-object-id pr-object-name pr-owner-id pr-plot-style-name pr-true-color pr-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-entity-properties* *acad-object-properties*))
