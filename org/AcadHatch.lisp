(defclass acad-hatch (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-area                     :accessor ac-area                     :initarg :ac-area                     :initform nil :documentation "ac-area")
  (ac-associative-hatch        :accessor ac-associative-hatch        :initarg :ac-associative-hatch        :initform nil :documentation "ac-associative-hatch")
  (ac-background-color         :accessor ac-background-color         :initarg :ac-background-color         :initform nil :documentation "ac-background-color")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-elevation                :accessor ac-elevation                :initarg :ac-elevation                :initform nil :documentation "ac-elevation")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-gradient-angle           :accessor ac-gradient-angle           :initarg :ac-gradient-angle           :initform nil :documentation "ac-gradient-angle")
  (ac-gradient-centered        :accessor ac-gradient-centered        :initarg :ac-gradient-centered        :initform nil :documentation "ac-gradient-centered")
  (ac-gradient-color1          :accessor ac-gradient-color1          :initarg :ac-gradient-color1          :initform nil :documentation "ac-gradient-color1")
  (ac-gradient-color2          :accessor ac-gradient-color2          :initarg :ac-gradient-color2          :initform nil :documentation "ac-gradient-color2")
  (ac-gradient-name            :accessor ac-gradient-name            :initarg :ac-gradient-name            :initform nil :documentation "ac-gradient-name")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hatch-object-type        :accessor ac-hatch-object-type        :initarg :ac-hatch-object-type        :initform nil :documentation "ac-hatch-object-type")
  (ac-hatch-style              :accessor ac-hatch-style              :initarg :ac-hatch-style              :initform nil :documentation "ac-hatch-style")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-iso-pen-width            :accessor ac-iso-pen-width            :initarg :ac-iso-pen-width            :initform nil :documentation "ac-iso-pen-width")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-number-of-loops          :accessor ac-number-of-loops          :initarg :ac-number-of-loops          :initform nil :documentation "ac-number-of-loops")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-origin                   :accessor ac-origin                   :initarg :ac-origin                   :initform nil :documentation "ac-origin")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-pattern-angle            :accessor ac-pattern-angle            :initarg :ac-pattern-angle            :initform nil :documentation "ac-pattern-angle")
  (ac-pattern-double           :accessor ac-pattern-double           :initarg :ac-pattern-double           :initform nil :documentation "ac-pattern-double")
  (ac-pattern-name             :accessor ac-pattern-name             :initarg :ac-pattern-name             :initform nil :documentation "ac-pattern-name")
  (ac-pattern-scale            :accessor ac-pattern-scale            :initarg :ac-pattern-scale            :initform nil :documentation "ac-pattern-scale")
  (ac-pattern-space            :accessor ac-pattern-space            :initarg :ac-pattern-space            :initform nil :documentation "ac-pattern-space")
  (ac-pattern-type             :accessor ac-pattern-type             :initarg :ac-pattern-type             :initform nil :documentation "ac-pattern-type")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "An area fill consisting of a pattern of lines."))

(defparameter *acad-hatch-properties* '(ac-application ac-area ac-associative-hatch ac-background-color ac-document ac-elevation ac-entity-transparency ac-gradient-angle ac-gradient-centered ac-gradient-color1 ac-gradient-color2 ac-gradient-name ac-handle ac-has-extension-dictionary ac-hatch-object-type ac-hatch-style ac-hyperlinks ac-iso-pen-width ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-normal ac-number-of-loops ac-object-id ac-object-name ac-origin ac-owner-id ac-pattern-angle ac-pattern-double ac-pattern-name ac-pattern-scale ac-pattern-space ac-pattern-type ac-plot-style-name ac-true-color ac-visible))

(mapcar #'make-slot (set-difference *acad-hatch-properties* *acad-entity-properties*))