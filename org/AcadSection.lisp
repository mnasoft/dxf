(defclass acad-section (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-bottom-height            :accessor ac-bottom-height            :initarg :ac-bottom-height            :initform nil :documentation "ac-bottom-height")
  (ac-coordinate               :accessor ac-coordinate               :initarg :ac-coordinate               :initform nil :documentation "ac-coordinate")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-elevation                :accessor ac-elevation                :initarg :ac-elevation                :initform nil :documentation "ac-elevation")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-indicator-fill-color     :accessor ac-indicator-fill-color     :initarg :ac-indicator-fill-color     :initform nil :documentation "ac-indicator-fill-color")
  (ac-indicator-transparency   :accessor ac-indicator-transparency   :initarg :ac-indicator-transparency   :initform nil :documentation "ac-indicator-transparency")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-live-section-enabled     :accessor ac-live-section-enabled     :initarg :ac-live-section-enabled     :initform nil :documentation "ac-live-section-enabled")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-num-vertices             :accessor ac-num-vertices             :initarg :ac-num-vertices             :initform nil :documentation "ac-num-vertices")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-section-plane-offset     :accessor ac-section-plane-offset     :initarg :ac-section-plane-offset     :initform nil :documentation "ac-section-plane-offset")
  (ac-settings                 :accessor ac-settings                 :initarg :ac-settings                 :initform nil :documentation "ac-settings")
  (ac-slice-depth              :accessor ac-slice-depth              :initarg :ac-slice-depth              :initform nil :documentation "ac-slice-depth")
  (ac-state                    :accessor ac-state                    :initarg :ac-state                    :initform nil :documentation "ac-state")
  (ac-state2                   :accessor ac-state2                   :initarg :ac-state2                   :initform nil :documentation "ac-state2")
  (ac-top-height               :accessor ac-top-height               :initarg :ac-top-height               :initform nil :documentation "ac-top-height")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-vertical-direction       :accessor ac-vertical-direction       :initarg :ac-vertical-direction       :initform nil :documentation "ac-vertical-direction")
  (ac-vertices                 :accessor ac-vertices                 :initarg :ac-vertices                 :initform nil :documentation "ac-vertices")
  (ac-viewing-direction        :accessor ac-viewing-direction        :initarg :ac-viewing-direction        :initform nil :documentation "ac-viewing-direction")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "A section plane entity created at the intersection of a plane and a solid."))

(defparameter *acad-section-properties* '(ac-application ac-bottom-height ac-coordinate ac-document ac-elevation ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-indicator-fill-color ac-indicator-transparency ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-live-section-enabled ac-material ac-name ac-normal ac-num-vertices ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-section-plane-offset ac-settings ac-slice-depth ac-state ac-state2 ac-top-height ac-true-color ac-vertical-direction ac-vertices ac-viewing-direction ac-visible))

(mapcar #'make-slot (set-difference *acad-section-properties* *acad-entity-properties*))