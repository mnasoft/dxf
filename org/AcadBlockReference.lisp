(defclass acad-block-reference (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-effective-name           :accessor ac-effective-name           :initarg :ac-effective-name           :initform nil :documentation "ac-effective-name")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-attributes           :accessor ac-has-attributes           :initarg :ac-has-attributes           :initform nil :documentation "ac-has-attributes")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-insertion-point          :accessor ac-insertion-point          :initarg :ac-insertion-point          :initform nil :documentation "ac-insertion-point")
  (ac-ins-units                :accessor ac-ins-units                :initarg :ac-ins-units                :initform nil :documentation "ac-ins-units")
  (ac-ins-units-factor         :accessor ac-ins-units-factor         :initarg :ac-ins-units-factor         :initform nil :documentation "ac-ins-units-factor")
  (ac-is-dynamic-block         :accessor ac-is-dynamic-block         :initarg :ac-is-dynamic-block         :initform nil :documentation "ac-is-dynamic-block")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-rotation                 :accessor ac-rotation                 :initarg :ac-rotation                 :initform nil :documentation "ac-rotation")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  (ac-x-effective-scale-factor :accessor ac-x-effective-scale-factor :initarg :ac-x-effective-scale-factor :initform nil :documentation "ac-x-effective-scale-factor")
  (ac-x-scale-factor           :accessor ac-x-scale-factor           :initarg :ac-x-scale-factor           :initform nil :documentation "ac-x-scale-factor")
  (ac-y-effective-scale-factor :accessor ac-y-effective-scale-factor :initarg :ac-y-effective-scale-factor :initform nil :documentation "ac-y-effective-scale-factor")
  (ac-y-scale-factor           :accessor ac-y-scale-factor           :initarg :ac-y-scale-factor           :initform nil :documentation "ac-y-scale-factor")
  (ac-z-effective-scale-factor :accessor ac-z-effective-scale-factor :initarg :ac-z-effective-scale-factor :initform nil :documentation "ac-z-effective-scale-factor")
  (ac-z-scale-factor           :accessor ac-z-scale-factor           :initarg :ac-z-scale-factor           :initform nil :documentation "ac-z-scale-factor")
  )
  (:documentation "An instance of a block definition inserted into a drawing."))

(defparameter *acad-block-reference-properties* '(ac-application ac-document ac-effective-name ac-entity-transparency ac-handle ac-has-attributes ac-has-extension-dictionary ac-hyperlinks ac-insertion-point ac-ins-units ac-ins-units-factor ac-is-dynamic-block ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-name ac-normal ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-rotation ac-true-color ac-visible ac-x-effective-scale-factor ac-x-scale-factor ac-y-effective-scale-factor ac-y-scale-factor ac-z-effective-scale-factor ac-z-scale-factor))

(mapcar #'make-slot (set-difference *acad-block-reference-properties* *acad-entity-properties*))