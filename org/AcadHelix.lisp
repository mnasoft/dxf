(defclass acad-helix (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-base-radius              :accessor ac-base-radius              :initarg :ac-base-radius              :initform nil :documentation "ac-base-radius")
  (ac-constrain                :accessor ac-constrain                :initarg :ac-constrain                :initform nil :documentation "ac-constrain")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-position                 :accessor ac-position                 :initarg :ac-position                 :initform nil :documentation "ac-position")
  (ac-top-radius               :accessor ac-top-radius               :initarg :ac-top-radius               :initform nil :documentation "ac-top-radius")
  (ac-total-length             :accessor ac-total-length             :initarg :ac-total-length             :initform nil :documentation "ac-total-length")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-turn-height              :accessor ac-turn-height              :initarg :ac-turn-height              :initform nil :documentation "ac-turn-height")
  (ac-turns                    :accessor ac-turns                    :initarg :ac-turns                    :initform nil :documentation "ac-turns")
  (ac-turn-slope               :accessor ac-turn-slope               :initarg :ac-turn-slope               :initform nil :documentation "ac-turn-slope")
  (ac-twist                    :accessor ac-twist                    :initarg :ac-twist                    :initform nil :documentation "ac-twist")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "A helix."))

(defparameter *acad-helix-properties* '(ac-application ac-base-radius ac-constrain ac-document ac-entity-transparency ac-handle ac-has-extension-dictionary ac-height ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-position ac-top-radius ac-total-length ac-true-color ac-turn-height ac-turns ac-turn-slope ac-twist ac-visible))

(mapcar #'make-slot (set-difference *acad-helix-properties* *acad-entity-properties*))