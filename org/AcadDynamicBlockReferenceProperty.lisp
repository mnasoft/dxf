(defclass acad-dynamic-block-reference-property (object)
  (
  (ac-allowed-values           :accessor ac-allowed-values           :initarg :ac-allowed-values           :initform nil :documentation "ac-allowed-values")
  (ac-description              :accessor ac-description              :initarg :ac-description              :initform nil :documentation "ac-description")
  (ac-property-name            :accessor ac-property-name            :initarg :ac-property-name            :initform nil :documentation "ac-property-name")
  (ac-read-only                :accessor ac-read-only                :initarg :ac-read-only                :initform nil :documentation "ac-read-only")
  (ac-show                     :accessor ac-show                     :initarg :ac-show                     :initform nil :documentation "ac-show")
  (ac-units-type               :accessor ac-units-type               :initarg :ac-units-type               :initform nil :documentation "ac-units-type")
  (ac-value                    :accessor ac-value                    :initarg :ac-value                    :initform nil :documentation "ac-value")
  )
  (:documentation "An object containing the properties of a dynamic block."))

(defparameter *acad-dynamic-block-reference-property-properties* '(ac-allowed-values ac-description ac-property-name ac-read-only ac-show ac-units-type ac-value))

(mapcar #'make-slot (set-difference *acad-dynamic-block-reference-property-properties* *object-properties*))