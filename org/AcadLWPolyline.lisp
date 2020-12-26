(defclass acad-lw-polyline (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-area                     :accessor ac-area                     :initarg :ac-area                     :initform nil :documentation "ac-area")
  (ac-closed                   :accessor ac-closed                   :initarg :ac-closed                   :initform nil :documentation "ac-closed")
  (ac-constant-width           :accessor ac-constant-width           :initarg :ac-constant-width           :initform nil :documentation "ac-constant-width")
  (ac-coordinate               :accessor ac-coordinate               :initarg :ac-coordinate               :initform nil :documentation "ac-coordinate")
  (ac-coordinates              :accessor ac-coordinates              :initarg :ac-coordinates              :initform nil :documentation "ac-coordinates")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-elevation                :accessor ac-elevation                :initarg :ac-elevation                :initform nil :documentation "ac-elevation")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-length                   :accessor ac-length                   :initarg :ac-length                   :initform nil :documentation "ac-length")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-generation      :accessor ac-linetype-generation      :initarg :ac-linetype-generation      :initform nil :documentation "ac-linetype-generation")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-thickness                :accessor ac-thickness                :initarg :ac-thickness                :initform nil :documentation "ac-thickness")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "A 2D line with adjustable width composed of line and arc segments."))

(defparameter *acad-lw-polyline-properties* '(ac-application ac-area ac-closed ac-constant-width ac-coordinate ac-coordinates ac-document ac-elevation ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-length ac-linetype ac-linetype-generation ac-linetype-scale ac-lineweight ac-material ac-normal ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-thickness ac-true-color ac-visible))

(mapcar #'make-slot (set-difference *acad-lw-polyline-properties* *acad-entity-properties*))