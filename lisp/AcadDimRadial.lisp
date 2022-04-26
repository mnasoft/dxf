(in-package :dxf)

(defclass <acad-dim-radial> (<acad-dimension>)
  (
  (ac-alt-round-distance       :accessor ac-alt-round-distance       :initarg :ac-alt-round-distance       :initform nil :documentation "ac-alt-round-distance")
  (ac-alt-suppress-leading-zeros :accessor ac-alt-suppress-leading-zeros :initarg :ac-alt-suppress-leading-zeros :initform nil :documentation "ac-alt-suppress-leading-zeros")
  (ac-alt-suppress-trailing-zeros :accessor ac-alt-suppress-trailing-zeros :initarg :ac-alt-suppress-trailing-zeros :initform nil :documentation "ac-alt-suppress-trailing-zeros")
  (ac-alt-suppress-zero-feet   :accessor ac-alt-suppress-zero-feet   :initarg :ac-alt-suppress-zero-feet   :initform nil :documentation "ac-alt-suppress-zero-feet")
  (ac-alt-suppress-zero-inches :accessor ac-alt-suppress-zero-inches :initarg :ac-alt-suppress-zero-inches :initform nil :documentation "ac-alt-suppress-zero-inches")
  (ac-alt-text-prefix          :accessor ac-alt-text-prefix          :initarg :ac-alt-text-prefix          :initform nil :documentation "ac-alt-text-prefix")
  (ac-alt-text-suffix          :accessor ac-alt-text-suffix          :initarg :ac-alt-text-suffix          :initform nil :documentation "ac-alt-text-suffix")
  (ac-alt-tolerance-precision  :accessor ac-alt-tolerance-precision  :initarg :ac-alt-tolerance-precision  :initform nil :documentation "ac-alt-tolerance-precision")
  (ac-alt-tolerance-suppress-leading-zeros :accessor ac-alt-tolerance-suppress-leading-zeros :initarg :ac-alt-tolerance-suppress-leading-zeros :initform nil :documentation "ac-alt-tolerance-suppress-leading-zeros")
  (ac-alt-tolerance-suppress-trailing-zeros :accessor ac-alt-tolerance-suppress-trailing-zeros :initarg :ac-alt-tolerance-suppress-trailing-zeros :initform nil :documentation "ac-alt-tolerance-suppress-trailing-zeros")
  (ac-alt-tolerance-suppress-zero-feet :accessor ac-alt-tolerance-suppress-zero-feet :initarg :ac-alt-tolerance-suppress-zero-feet :initform nil :documentation "ac-alt-tolerance-suppress-zero-feet")
  (ac-alt-tolerance-suppress-zero-inches :accessor ac-alt-tolerance-suppress-zero-inches :initarg :ac-alt-tolerance-suppress-zero-inches :initform nil :documentation "ac-alt-tolerance-suppress-zero-inches")
  (ac-alt-units                :accessor ac-alt-units                :initarg :ac-alt-units                :initform nil :documentation "ac-alt-units")
  (ac-alt-units-format         :accessor ac-alt-units-format         :initarg :ac-alt-units-format         :initform nil :documentation "ac-alt-units-format")
  (ac-alt-units-precision      :accessor ac-alt-units-precision      :initarg :ac-alt-units-precision      :initform nil :documentation "ac-alt-units-precision")
  (ac-alt-units-scale          :accessor ac-alt-units-scale          :initarg :ac-alt-units-scale          :initform nil :documentation "ac-alt-units-scale")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-arrowhead-block          :accessor ac-arrowhead-block          :initarg :ac-arrowhead-block          :initform nil :documentation "ac-arrowhead-block")
  (ac-arrowhead-size           :accessor ac-arrowhead-size           :initarg :ac-arrowhead-size           :initform nil :documentation "ac-arrowhead-size")
  (ac-arrowhead-type           :accessor ac-arrowhead-type           :initarg :ac-arrowhead-type           :initform nil :documentation "ac-arrowhead-type")
  (ac-center-mark-size         :accessor ac-center-mark-size         :initarg :ac-center-mark-size         :initform nil :documentation "ac-center-mark-size")
  (ac-center-type              :accessor ac-center-type              :initarg :ac-center-type              :initform nil :documentation "ac-center-type")
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
  (ac-dim-line-suppress        :accessor ac-dim-line-suppress        :initarg :ac-dim-line-suppress        :initform nil :documentation "ac-dim-line-suppress")
  (ac-dim-txt-direction        :accessor ac-dim-txt-direction        :initarg :ac-dim-txt-direction        :initform nil :documentation "ac-dim-txt-direction")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-fit                      :accessor ac-fit                      :initarg :ac-fit                      :initform nil :documentation "ac-fit")
  (ac-force-line-inside        :accessor ac-force-line-inside        :initarg :ac-force-line-inside        :initform nil :documentation "ac-force-line-inside")
  (ac-fraction-format          :accessor ac-fraction-format          :initarg :ac-fraction-format          :initform nil :documentation "ac-fraction-format")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-leader-length            :accessor ac-leader-length            :initarg :ac-leader-length            :initform nil :documentation "ac-leader-length")
  (ac-linear-scale-factor      :accessor ac-linear-scale-factor      :initarg :ac-linear-scale-factor      :initform nil :documentation "ac-linear-scale-factor")
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
  (ac-primary-units-precision  :accessor ac-primary-units-precision  :initarg :ac-primary-units-precision  :initform nil :documentation "ac-primary-units-precision")
  (ac-rotation                 :accessor ac-rotation                 :initarg :ac-rotation                 :initform nil :documentation "ac-rotation")
  (ac-round-distance           :accessor ac-round-distance           :initarg :ac-round-distance           :initform nil :documentation "ac-round-distance")
  (ac-scale-factor             :accessor ac-scale-factor             :initarg :ac-scale-factor             :initform nil :documentation "ac-scale-factor")
  (ac-style-name               :accessor ac-style-name               :initarg :ac-style-name               :initform nil :documentation "ac-style-name")
  (ac-suppress-leading-zeros   :accessor ac-suppress-leading-zeros   :initarg :ac-suppress-leading-zeros   :initform nil :documentation "ac-suppress-leading-zeros")
  (ac-suppress-trailing-zeros  :accessor ac-suppress-trailing-zeros  :initarg :ac-suppress-trailing-zeros  :initform nil :documentation "ac-suppress-trailing-zeros")
  (ac-suppress-zero-feet       :accessor ac-suppress-zero-feet       :initarg :ac-suppress-zero-feet       :initform nil :documentation "ac-suppress-zero-feet")
  (ac-suppress-zero-inches     :accessor ac-suppress-zero-inches     :initarg :ac-suppress-zero-inches     :initform nil :documentation "ac-suppress-zero-inches")
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
  (ac-tolerance-suppress-zero-feet :accessor ac-tolerance-suppress-zero-feet :initarg :ac-tolerance-suppress-zero-feet :initform nil :documentation "ac-tolerance-suppress-zero-feet")
  (ac-tolerance-suppress-zero-inches :accessor ac-tolerance-suppress-zero-inches :initarg :ac-tolerance-suppress-zero-inches :initform nil :documentation "ac-tolerance-suppress-zero-inches")
  (ac-tolerance-upper-limit    :accessor ac-tolerance-upper-limit    :initarg :ac-tolerance-upper-limit    :initform nil :documentation "ac-tolerance-upper-limit")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-units-format             :accessor ac-units-format             :initarg :ac-units-format             :initform nil :documentation "ac-units-format")
  (ac-vertical-text-position   :accessor ac-vertical-text-position   :initarg :ac-vertical-text-position   :initform nil :documentation "ac-vertical-text-position")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-037CC1EC-8183-49B3-9F51-69AE8B282CC4
DimRadial Object (ActiveX)
"))

(defparameter *acad-dim-radial-properties* '(ac-alt-round-distance ac-alt-suppress-leading-zeros ac-alt-suppress-trailing-zeros ac-alt-suppress-zero-feet ac-alt-suppress-zero-inches ac-alt-text-prefix ac-alt-text-suffix ac-alt-tolerance-precision ac-alt-tolerance-suppress-leading-zeros ac-alt-tolerance-suppress-trailing-zeros ac-alt-tolerance-suppress-zero-feet ac-alt-tolerance-suppress-zero-inches ac-alt-units ac-alt-units-format ac-alt-units-precision ac-alt-units-scale ac-application ac-arrowhead-block ac-arrowhead-size ac-arrowhead-type ac-center-mark-size ac-center-type ac-decimal-separator ac-dim-constr-desc ac-dim-constr-expression ac-dim-constr-form ac-dim-constr-name ac-dim-constr-reference ac-dim-constr-value ac-dimension-line-color ac-dimension-linetype ac-dimension-line-weight ac-dim-line-suppress ac-dim-txt-direction ac-document ac-entity-transparency ac-fit ac-force-line-inside ac-fraction-format ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-leader-length ac-linear-scale-factor ac-linetype ac-linetype-scale ac-lineweight ac-material ac-measurement ac-normal ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-primary-units-precision ac-rotation ac-round-distance ac-scale-factor ac-style-name ac-suppress-leading-zeros ac-suppress-trailing-zeros ac-suppress-zero-feet ac-suppress-zero-inches ac-text-color ac-text-fill ac-text-fill-color ac-text-gap ac-text-height ac-text-inside ac-text-inside-align ac-text-movement ac-text-outside-align ac-text-override ac-text-position ac-text-prefix ac-text-rotation ac-text-style ac-text-suffix ac-tolerance-display ac-tolerance-height-scale ac-tolerance-justification ac-tolerance-lower-limit ac-tolerance-precision ac-tolerance-suppress-leading-zeros ac-tolerance-suppress-trailing-zeros ac-tolerance-suppress-zero-feet ac-tolerance-suppress-zero-inches ac-tolerance-upper-limit ac-true-color ac-units-format ac-vertical-text-position ac-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-dim-radial-properties* *acad-dimension-properties*))
