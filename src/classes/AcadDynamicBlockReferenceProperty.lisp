(in-package :dxf)

(defclass <acad-dynamic-block-reference-property> (<object>)
  (
  (pr-allowed-values           :accessor pr-allowed-values           :initarg :pr-allowed-values           :initform nil :documentation "pr-allowed-values")
  (pr-description              :accessor pr-description              :initarg :pr-description              :initform nil :documentation "pr-description")
  (pr-property-name            :accessor pr-property-name            :initarg :pr-property-name            :initform nil :documentation "pr-property-name")
  (pr-read-only                :accessor pr-read-only                :initarg :pr-read-only                :initform nil :documentation "pr-read-only")
  (pr-show                     :accessor pr-show                     :initarg :pr-show                     :initform nil :documentation "pr-show")
  (pr-units-type               :accessor pr-units-type               :initarg :pr-units-type               :initform nil :documentation "pr-units-type")
  (pr-value                    :accessor pr-value                    :initarg :pr-value                    :initform nil :documentation "pr-value")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED753239-0C53-4741-BE13-99B21751C22F\"](DynamicBlockReferenceProperty Object (ActiveX))"))

(defparameter *acad-dynamic-block-reference-property-properties* '(pr-allowed-values pr-description pr-property-name pr-read-only pr-show pr-units-type pr-value))

(mapcar #'dxf/utils:make-slot (set-difference *acad-dynamic-block-reference-property-properties* *object-properties*))
