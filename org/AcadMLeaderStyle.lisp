(defclass acad-m-leader-style (acad-object)
  (
  (ac-align-space              :accessor ac-align-space              :initarg :ac-align-space              :initform nil :documentation "ac-align-space")
  (ac-annotative               :accessor ac-annotative               :initarg :ac-annotative               :initform nil :documentation "ac-annotative")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-arrow-size               :accessor ac-arrow-size               :initarg :ac-arrow-size               :initform nil :documentation "ac-arrow-size")
  (ac-arrow-symbol             :accessor ac-arrow-symbol             :initarg :ac-arrow-symbol             :initform nil :documentation "ac-arrow-symbol")
  (ac-bit-flags                :accessor ac-bit-flags                :initarg :ac-bit-flags                :initform nil :documentation "ac-bit-flags")
  (ac-block                    :accessor ac-block                    :initarg :ac-block                    :initform nil :documentation "ac-block")
  (ac-block-color              :accessor ac-block-color              :initarg :ac-block-color              :initform nil :documentation "ac-block-color")
  (ac-block-connection-type    :accessor ac-block-connection-type    :initarg :ac-block-connection-type    :initform nil :documentation "ac-block-connection-type")
  (ac-block-rotation           :accessor ac-block-rotation           :initarg :ac-block-rotation           :initform nil :documentation "ac-block-rotation")
  (ac-block-scale              :accessor ac-block-scale              :initarg :ac-block-scale              :initform nil :documentation "ac-block-scale")
  (ac-break-size               :accessor ac-break-size               :initarg :ac-break-size               :initform nil :documentation "ac-break-size")
  (ac-content-type             :accessor ac-content-type             :initarg :ac-content-type             :initform nil :documentation "ac-content-type")
  (ac-description              :accessor ac-description              :initarg :ac-description              :initform nil :documentation "ac-description")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-dogleg-length            :accessor ac-dogleg-length            :initarg :ac-dogleg-length            :initform nil :documentation "ac-dogleg-length")
  (ac-draw-leader-order-type   :accessor ac-draw-leader-order-type   :initarg :ac-draw-leader-order-type   :initform nil :documentation "ac-draw-leader-order-type")
  (ac-draw-m-leader-order-type :accessor ac-draw-m-leader-order-type :initarg :ac-draw-m-leader-order-type :initform nil :documentation "ac-draw-m-leader-order-type")
  (ac-enable-block-rotation    :accessor ac-enable-block-rotation    :initarg :ac-enable-block-rotation    :initform nil :documentation "ac-enable-block-rotation")
  (ac-enable-block-scale       :accessor ac-enable-block-scale       :initarg :ac-enable-block-scale       :initform nil :documentation "ac-enable-block-scale")
  (ac-enable-dogleg            :accessor ac-enable-dogleg            :initarg :ac-enable-dogleg            :initform nil :documentation "ac-enable-dogleg")
  (ac-enable-frame-text        :accessor ac-enable-frame-text        :initarg :ac-enable-frame-text        :initform nil :documentation "ac-enable-frame-text")
  (ac-enable-landing           :accessor ac-enable-landing           :initarg :ac-enable-landing           :initform nil :documentation "ac-enable-landing")
  (ac-first-segment-angle-constraint :accessor ac-first-segment-angle-constraint :initarg :ac-first-segment-angle-constraint :initform nil :documentation "ac-first-segment-angle-constraint")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-landing-gap              :accessor ac-landing-gap              :initarg :ac-landing-gap              :initform nil :documentation "ac-landing-gap")
  (ac-leader-line-color        :accessor ac-leader-line-color        :initarg :ac-leader-line-color        :initform nil :documentation "ac-leader-line-color")
  (ac-leader-line-type         :accessor ac-leader-line-type         :initarg :ac-leader-line-type         :initform nil :documentation "ac-leader-line-type")
  (ac-leader-line-type-id      :accessor ac-leader-line-type-id      :initarg :ac-leader-line-type-id      :initform nil :documentation "ac-leader-line-type-id")
  (ac-leader-line-weight       :accessor ac-leader-line-weight       :initarg :ac-leader-line-weight       :initform nil :documentation "ac-leader-line-weight")
  (ac-max-leader-segments-points :accessor ac-max-leader-segments-points :initarg :ac-max-leader-segments-points :initform nil :documentation "ac-max-leader-segments-points")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-overwrite-prop-changed   :accessor ac-overwrite-prop-changed   :initarg :ac-overwrite-prop-changed   :initform nil :documentation "ac-overwrite-prop-changed")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-scale-factor             :accessor ac-scale-factor             :initarg :ac-scale-factor             :initform nil :documentation "ac-scale-factor")
  (ac-second-segment-angle-constraint :accessor ac-second-segment-angle-constraint :initarg :ac-second-segment-angle-constraint :initform nil :documentation "ac-second-segment-angle-constraint")
  (ac-text-alignment-type      :accessor ac-text-alignment-type      :initarg :ac-text-alignment-type      :initform nil :documentation "ac-text-alignment-type")
  (ac-text-angle-type          :accessor ac-text-angle-type          :initarg :ac-text-angle-type          :initform nil :documentation "ac-text-angle-type")
  (ac-text-attachment-direction :accessor ac-text-attachment-direction :initarg :ac-text-attachment-direction :initform nil :documentation "ac-text-attachment-direction")
  (ac-text-bottom-attachment-type :accessor ac-text-bottom-attachment-type :initarg :ac-text-bottom-attachment-type :initform nil :documentation "ac-text-bottom-attachment-type")
  (ac-text-color               :accessor ac-text-color               :initarg :ac-text-color               :initform nil :documentation "ac-text-color")
  (ac-text-height              :accessor ac-text-height              :initarg :ac-text-height              :initform nil :documentation "ac-text-height")
  (ac-text-left-attachment-type :accessor ac-text-left-attachment-type :initarg :ac-text-left-attachment-type :initform nil :documentation "ac-text-left-attachment-type")
  (ac-text-right-attachment-type :accessor ac-text-right-attachment-type :initarg :ac-text-right-attachment-type :initform nil :documentation "ac-text-right-attachment-type")
  (ac-text-string              :accessor ac-text-string              :initarg :ac-text-string              :initform nil :documentation "ac-text-string")
  (ac-text-style               :accessor ac-text-style               :initarg :ac-text-style               :initform nil :documentation "ac-text-style")
  (ac-text-top-attachment-type :accessor ac-text-top-attachment-type :initarg :ac-text-top-attachment-type :initform nil :documentation "ac-text-top-attachment-type")
  )
  (:documentation "Adds, modifies, and deletes MLeader styles."))

(defparameter *acad-m-leader-style-properties* '(ac-align-space ac-annotative ac-application ac-arrow-size ac-arrow-symbol ac-bit-flags ac-block ac-block-color ac-block-connection-type ac-block-rotation ac-block-scale ac-break-size ac-content-type ac-description ac-document ac-dogleg-length ac-draw-leader-order-type ac-draw-m-leader-order-type ac-enable-block-rotation ac-enable-block-scale ac-enable-dogleg ac-enable-frame-text ac-enable-landing ac-first-segment-angle-constraint ac-handle ac-has-extension-dictionary ac-landing-gap ac-leader-line-color ac-leader-line-type ac-leader-line-type-id ac-leader-line-weight ac-max-leader-segments-points ac-name ac-object-id ac-object-name ac-overwrite-prop-changed ac-owner-id ac-scale-factor ac-second-segment-angle-constraint ac-text-alignment-type ac-text-angle-type ac-text-attachment-direction ac-text-bottom-attachment-type ac-text-color ac-text-height ac-text-left-attachment-type ac-text-right-attachment-type ac-text-string ac-text-style ac-text-top-attachment-type))

(mapcar #'make-slot (set-difference *acad-m-leader-style-properties* *acad-object-properties*))