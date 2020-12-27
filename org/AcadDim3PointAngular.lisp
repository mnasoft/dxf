(defclass acad-dim3-point-angular (acad-dimension)
  (
  (ac-angle-format             :accessor ac-angle-format             :initarg :ac-angle-format             :initform nil :documentation "ac-angle-format")
  (ac-angle-vertex             :accessor ac-angle-vertex             :initarg :ac-angle-vertex             :initform nil :documentation "ac-angle-vertex")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-arrowhead1-block         :accessor ac-arrowhead1-block         :initarg :ac-arrowhead1-block         :initform nil :documentation "ac-arrowhead1-block")
  (ac-arrowhead1-type          :accessor ac-arrowhead1-type          :initarg :ac-arrowhead1-type          :initform nil :documentation "ac-arrowhead1-type")
  (ac-arrowhead2-block         :accessor ac-arrowhead2-block         :initarg :ac-arrowhead2-block         :initform nil :documentation "ac-arrowhead2-block")
  (ac-arrowhead2-type          :accessor ac-arrowhead2-type          :initarg :ac-arrowhead2-type          :initform nil :documentation "ac-arrowhead2-type")
  (ac-arrowhead-size           :accessor ac-arrowhead-size           :initarg :ac-arrowhead-size           :initform nil :documentation "ac-arrowhead-size")
  (ac-decimal-separator        :accessor ac-decimal-separator        :initarg :ac-decimal-separator        :initform nil :documentation "ac-decimal-separator")
  (ac-dim-constr-desc          :accessor ac-dim-constr-desc          :initarg :ac-dim-constr-desc          :initform nil :documentation "ac-dim-constr-desc")
  (ac-dim-constr-expression    :accessor ac-dim-constr-expression    :initarg :ac-dim-constr-expression    :initform nil :documentation "ac-dim-constr-expression")
  (ac-dim-constr-form          :accessor ac-dim-constr-form          :initarg :ac-dim-constr-form          :initform nil :documentation "ac-dim-constr-form")
  (ac-dim-constr-name          :accessor ac-dim-constr-name          :initarg :ac-dim-constr-name          :initform nil :documentation "ac-dim-constr-name")
  (ac-dim-constr-reference     :accessor ac-dim-constr-reference     :initarg :ac-dim-constr-reference     :initform nil :documentation "ac-dim-constr-reference")
  (ac-dim-constr-value         :accessor ac-dim-constr-value         :initarg :ac-dim-constr-value         :initform nil :documentation "ac-dim-constr-value")
  (ac-dimension-line-color     :accessor ac-dimension-line-color     :initarg :ac-dimension-line-color     :initform nil :documentation "ac-dimension-line-color")
  (ac-dimension-linetype       :accessor ac-dimension-linetype       :initarg :ac-dimension-linetype       :initform nil :documentation "ac-dimension-linetype")
  (ac-dimension-line-weight    :accessor ac-dimension-line-weight    :initarg :ac-dimension-line-weight    :initform nil :documentation "ac-dimension-line-weight")
  (ac-dim-line1-suppress       :accessor ac-dim-line1-suppress       :initarg :ac-dim-line1-suppress       :initform nil :documentation "ac-dim-line1-suppress")
  (ac-dim-line2-suppress       :accessor ac-dim-line2-suppress       :initarg :ac-dim-line2-suppress       :initform nil :documentation "ac-dim-line2-suppress")
  (ac-dim-line-inside          :accessor ac-dim-line-inside          :initarg :ac-dim-line-inside          :initform nil :documentation "ac-dim-line-inside")
  (ac-dim-txt-direction        :accessor ac-dim-txt-direction        :initarg :ac-dim-txt-direction        :initform nil :documentation "ac-dim-txt-direction")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-extension-line-color     :accessor ac-extension-line-color     :initarg :ac-extension-line-color     :initform nil :documentation "ac-extension-line-color")
  (ac-extension-line-extend    :accessor ac-extension-line-extend    :initarg :ac-extension-line-extend    :initform nil :documentation "ac-extension-line-extend")
  (ac-extension-line-offset    :accessor ac-extension-line-offset    :initarg :ac-extension-line-offset    :initform nil :documentation "ac-extension-line-offset")
  (ac-extension-line-weight    :accessor ac-extension-line-weight    :initarg :ac-extension-line-weight    :initform nil :documentation "ac-extension-line-weight")
  (ac-ext-line1-end-point      :accessor ac-ext-line1-end-point      :initarg :ac-ext-line1-end-point      :initform nil :documentation "ac-ext-line1-end-point")
  (ac-ext-line1-linetype       :accessor ac-ext-line1-linetype       :initarg :ac-ext-line1-linetype       :initform nil :documentation "ac-ext-line1-linetype")
  (ac-ext-line1-suppress       :accessor ac-ext-line1-suppress       :initarg :ac-ext-line1-suppress       :initform nil :documentation "ac-ext-line1-suppress")
  (ac-ext-line2-end-point      :accessor ac-ext-line2-end-point      :initarg :ac-ext-line2-end-point      :initform nil :documentation "ac-ext-line2-end-point")
  (ac-ext-line2-linetype       :accessor ac-ext-line2-linetype       :initarg :ac-ext-line2-linetype       :initform nil :documentation "ac-ext-line2-linetype")
  (ac-ext-line2-suppress       :accessor ac-ext-line2-suppress       :initarg :ac-ext-line2-suppress       :initform nil :documentation "ac-ext-line2-suppress")
  (ac-ext-line-fixed-len       :accessor ac-ext-line-fixed-len       :initarg :ac-ext-line-fixed-len       :initform nil :documentation "ac-ext-line-fixed-len")
  (ac-ext-line-fixed-len-suppress :accessor ac-ext-line-fixed-len-suppress :initarg :ac-ext-line-fixed-len-suppress :initform nil :documentation "ac-ext-line-fixed-len-suppress")
  (ac-fit                      :accessor ac-fit                      :initarg :ac-fit                      :initform nil :documentation "ac-fit")
  (ac-force-line-inside        :accessor ac-force-line-inside        :initarg :ac-force-line-inside        :initform nil :documentation "ac-force-line-inside")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-horizontal-text-position :accessor ac-horizontal-text-position :initarg :ac-horizontal-text-position :initform nil :documentation "ac-horizontal-text-position")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-measurement              :accessor ac-measurement              :initarg :ac-measurement              :initform nil :documentation "ac-measurement")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-rotation                 :accessor ac-rotation                 :initarg :ac-rotation                 :initform nil :documentation "ac-rotation")
  (ac-scale-factor             :accessor ac-scale-factor             :initarg :ac-scale-factor             :initform nil :documentation "ac-scale-factor")
  (ac-style-name               :accessor ac-style-name               :initarg :ac-style-name               :initform nil :documentation "ac-style-name")
  (ac-suppress-leading-zeros   :accessor ac-suppress-leading-zeros   :initarg :ac-suppress-leading-zeros   :initform nil :documentation "ac-suppress-leading-zeros")
  (ac-suppress-trailing-zeros  :accessor ac-suppress-trailing-zeros  :initarg :ac-suppress-trailing-zeros  :initform nil :documentation "ac-suppress-trailing-zeros")
  (ac-text-color               :accessor ac-text-color               :initarg :ac-text-color               :initform nil :documentation "ac-text-color")
  (ac-text-fill                :accessor ac-text-fill                :initarg :ac-text-fill                :initform nil :documentation "ac-text-fill")
  (ac-text-fill-color          :accessor ac-text-fill-color          :initarg :ac-text-fill-color          :initform nil :documentation "ac-text-fill-color")
  (ac-text-gap                 :accessor ac-text-gap                 :initarg :ac-text-gap                 :initform nil :documentation "ac-text-gap")
  (ac-text-height              :accessor ac-text-height              :initarg :ac-text-height              :initform nil :documentation "ac-text-height")
  (ac-text-inside              :accessor ac-text-inside              :initarg :ac-text-inside              :initform nil :documentation "ac-text-inside")
  (ac-text-inside-align        :accessor ac-text-inside-align        :initarg :ac-text-inside-align        :initform nil :documentation "ac-text-inside-align")
  (ac-text-movement            :accessor ac-text-movement            :initarg :ac-text-movement            :initform nil :documentation "ac-text-movement")
  (ac-text-outside-align       :accessor ac-text-outside-align       :initarg :ac-text-outside-align       :initform nil :documentation "ac-text-outside-align")
  (ac-text-override            :accessor ac-text-override            :initarg :ac-text-override            :initform nil :documentation "ac-text-override")
  (ac-text-position            :accessor ac-text-position            :initarg :ac-text-position            :initform nil :documentation "ac-text-position")
  (ac-text-precision           :accessor ac-text-precision           :initarg :ac-text-precision           :initform nil :documentation "ac-text-precision")
  (ac-text-prefix              :accessor ac-text-prefix              :initarg :ac-text-prefix              :initform nil :documentation "ac-text-prefix")
  (ac-text-rotation            :accessor ac-text-rotation            :initarg :ac-text-rotation            :initform nil :documentation "ac-text-rotation")
  (ac-text-style               :accessor ac-text-style               :initarg :ac-text-style               :initform nil :documentation "ac-text-style")
  (ac-text-suffix              :accessor ac-text-suffix              :initarg :ac-text-suffix              :initform nil :documentation "ac-text-suffix")
  (ac-tolerance-display        :accessor ac-tolerance-display        :initarg :ac-tolerance-display        :initform nil :documentation "ac-tolerance-display")
  (ac-tolerance-height-scale   :accessor ac-tolerance-height-scale   :initarg :ac-tolerance-height-scale   :initform nil :documentation "ac-tolerance-height-scale")
  (ac-tolerance-justification  :accessor ac-tolerance-justification  :initarg :ac-tolerance-justification  :initform nil :documentation "ac-tolerance-justification")
  (ac-tolerance-lower-limit    :accessor ac-tolerance-lower-limit    :initarg :ac-tolerance-lower-limit    :initform nil :documentation "ac-tolerance-lower-limit")
  (ac-tolerance-precision      :accessor ac-tolerance-precision      :initarg :ac-tolerance-precision      :initform nil :documentation "ac-tolerance-precision")
  (ac-tolerance-suppress-leading-zeros :accessor ac-tolerance-suppress-leading-zeros :initarg :ac-tolerance-suppress-leading-zeros :initform nil :documentation "ac-tolerance-suppress-leading-zeros")
  (ac-tolerance-suppress-trailing-zeros :accessor ac-tolerance-suppress-trailing-zeros :initarg :ac-tolerance-suppress-trailing-zeros :initform nil :documentation "ac-tolerance-suppress-trailing-zeros")
  (ac-tolerance-upper-limit    :accessor ac-tolerance-upper-limit    :initarg :ac-tolerance-upper-limit    :initform nil :documentation "ac-tolerance-upper-limit")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-vertical-text-position   :accessor ac-vertical-text-position   :initarg :ac-vertical-text-position   :initform nil :documentation "ac-vertical-text-position")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "A dimension measuring the angular distance between three points."))

(defparameter *acad-dim3-point-angular-properties* '(ac-angle-format ac-angle-vertex ac-application ac-arrowhead1-block ac-arrowhead1-type ac-arrowhead2-block ac-arrowhead2-type ac-arrowhead-size ac-decimal-separator ac-dim-constr-desc ac-dim-constr-expression ac-dim-constr-form ac-dim-constr-name ac-dim-constr-reference ac-dim-constr-value ac-dimension-line-color ac-dimension-linetype ac-dimension-line-weight ac-dim-line1-suppress ac-dim-line2-suppress ac-dim-line-inside ac-dim-txt-direction ac-document ac-entity-transparency ac-extension-line-color ac-extension-line-extend ac-extension-line-offset ac-extension-line-weight ac-ext-line1-end-point ac-ext-line1-linetype ac-ext-line1-suppress ac-ext-line2-end-point ac-ext-line2-linetype ac-ext-line2-suppress ac-ext-line-fixed-len ac-ext-line-fixed-len-suppress ac-fit ac-force-line-inside ac-handle ac-has-extension-dictionary ac-horizontal-text-position ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-measurement ac-normal ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-rotation ac-scale-factor ac-style-name ac-suppress-leading-zeros ac-suppress-trailing-zeros ac-text-color ac-text-fill ac-text-fill-color ac-text-gap ac-text-height ac-text-inside ac-text-inside-align ac-text-movement ac-text-outside-align ac-text-override ac-text-position ac-text-precision ac-text-prefix ac-text-rotation ac-text-style ac-text-suffix ac-tolerance-display ac-tolerance-height-scale ac-tolerance-justification ac-tolerance-lower-limit ac-tolerance-precision ac-tolerance-suppress-leading-zeros ac-tolerance-suppress-trailing-zeros ac-tolerance-upper-limit ac-true-color ac-vertical-text-position ac-visible))

(mapcar #'make-slot (set-difference *acad-dim3-point-angular-properties* *acad-dimension-properties*))