(in-package :dxf/classes)

(defclass <acad-dim-radial-large> (<acad-dimension>)
  (
  (pr-alt-round-distance       :accessor pr-alt-round-distance       :initarg :pr-alt-round-distance       :initform nil :documentation "pr-alt-round-distance")
  (pr-alt-suppress-leading-zeros :accessor pr-alt-suppress-leading-zeros :initarg :pr-alt-suppress-leading-zeros :initform nil :documentation "pr-alt-suppress-leading-zeros")
  (pr-alt-suppress-trailing-zeros :accessor pr-alt-suppress-trailing-zeros :initarg :pr-alt-suppress-trailing-zeros :initform nil :documentation "pr-alt-suppress-trailing-zeros")
  (pr-alt-suppress-zero-feet   :accessor pr-alt-suppress-zero-feet   :initarg :pr-alt-suppress-zero-feet   :initform nil :documentation "pr-alt-suppress-zero-feet")
  (pr-alt-suppress-zero-inches :accessor pr-alt-suppress-zero-inches :initarg :pr-alt-suppress-zero-inches :initform nil :documentation "pr-alt-suppress-zero-inches")
  (pr-alt-text-prefix          :accessor pr-alt-text-prefix          :initarg :pr-alt-text-prefix          :initform nil :documentation "pr-alt-text-prefix")
  (pr-alt-text-suffix          :accessor pr-alt-text-suffix          :initarg :pr-alt-text-suffix          :initform nil :documentation "pr-alt-text-suffix")
  (pr-alt-tolerance-precision  :accessor pr-alt-tolerance-precision  :initarg :pr-alt-tolerance-precision  :initform nil :documentation "pr-alt-tolerance-precision")
  (pr-alt-tolerance-suppress-leading-zeros :accessor pr-alt-tolerance-suppress-leading-zeros :initarg :pr-alt-tolerance-suppress-leading-zeros :initform nil :documentation "pr-alt-tolerance-suppress-leading-zeros")
  (pr-alt-tolerance-suppress-trailing-zeros :accessor pr-alt-tolerance-suppress-trailing-zeros :initarg :pr-alt-tolerance-suppress-trailing-zeros :initform nil :documentation "pr-alt-tolerance-suppress-trailing-zeros")
  (pr-alt-tolerance-suppress-zero-feet :accessor pr-alt-tolerance-suppress-zero-feet :initarg :pr-alt-tolerance-suppress-zero-feet :initform nil :documentation "pr-alt-tolerance-suppress-zero-feet")
  (pr-alt-tolerance-suppress-zero-inches :accessor pr-alt-tolerance-suppress-zero-inches :initarg :pr-alt-tolerance-suppress-zero-inches :initform nil :documentation "pr-alt-tolerance-suppress-zero-inches")
  (pr-alt-units                :accessor pr-alt-units                :initarg :pr-alt-units                :initform nil :documentation "pr-alt-units")
  (pr-alt-units-format         :accessor pr-alt-units-format         :initarg :pr-alt-units-format         :initform nil :documentation "pr-alt-units-format")
  (pr-alt-units-precision      :accessor pr-alt-units-precision      :initarg :pr-alt-units-precision      :initform nil :documentation "pr-alt-units-precision")
  (pr-alt-units-scale          :accessor pr-alt-units-scale          :initarg :pr-alt-units-scale          :initform nil :documentation "pr-alt-units-scale")
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-arrowhead-block          :accessor pr-arrowhead-block          :initarg :pr-arrowhead-block          :initform nil :documentation "pr-arrowhead-block")
  (pr-arrowhead-size           :accessor pr-arrowhead-size           :initarg :pr-arrowhead-size           :initform nil :documentation "pr-arrowhead-size")
  (pr-arrowhead-type           :accessor pr-arrowhead-type           :initarg :pr-arrowhead-type           :initform nil :documentation "pr-arrowhead-type")
  (pr-center                   :accessor pr-center                   :initarg :pr-center                   :initform nil :documentation "pr-center")
  (pr-center-mark-size         :accessor pr-center-mark-size         :initarg :pr-center-mark-size         :initform nil :documentation "pr-center-mark-size")
  (pr-center-type              :accessor pr-center-type              :initarg :pr-center-type              :initform nil :documentation "pr-center-type")
  (pr-chord-point              :accessor pr-chord-point              :initarg :pr-chord-point              :initform nil :documentation "pr-chord-point")
  (pr-decimal-separator        :accessor pr-decimal-separator        :initarg :pr-decimal-separator        :initform nil :documentation "pr-decimal-separator")
  (pr-dimension-line-color     :accessor pr-dimension-line-color     :initarg :pr-dimension-line-color     :initform nil :documentation "pr-dimension-line-color")
  (pr-dimension-linetype       :accessor pr-dimension-linetype       :initarg :pr-dimension-linetype       :initform nil :documentation "pr-dimension-linetype")
  (pr-dimension-line-weight    :accessor pr-dimension-line-weight    :initarg :pr-dimension-line-weight    :initform nil :documentation "pr-dimension-line-weight")
  (pr-dim-line-suppress        :accessor pr-dim-line-suppress        :initarg :pr-dim-line-suppress        :initform nil :documentation "pr-dim-line-suppress")
  (pr-dim-txt-direction        :accessor pr-dim-txt-direction        :initarg :pr-dim-txt-direction        :initform nil :documentation "pr-dim-txt-direction")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-fit                      :accessor pr-fit                      :initarg :pr-fit                      :initform nil :documentation "pr-fit")
  (pr-force-line-inside        :accessor pr-force-line-inside        :initarg :pr-force-line-inside        :initform nil :documentation "pr-force-line-inside")
  (pr-fraction-format          :accessor pr-fraction-format          :initarg :pr-fraction-format          :initform nil :documentation "pr-fraction-format")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-jog-angle                :accessor pr-jog-angle                :initarg :pr-jog-angle                :initform nil :documentation "pr-jog-angle")
  (pr-jog-location             :accessor pr-jog-location             :initarg :pr-jog-location             :initform nil :documentation "pr-jog-location")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linear-scale-factor      :accessor pr-linear-scale-factor      :initarg :pr-linear-scale-factor      :initform nil :documentation "pr-linear-scale-factor")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-measurement              :accessor pr-measurement              :initarg :pr-measurement              :initform nil :documentation "pr-measurement")
  (pr-normal                   :accessor pr-normal                   :initarg :pr-normal                   :initform nil :documentation "pr-normal")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-override-center          :accessor pr-override-center          :initarg :pr-override-center          :initform nil :documentation "pr-override-center")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-primary-units-precision  :accessor pr-primary-units-precision  :initarg :pr-primary-units-precision  :initform nil :documentation "pr-primary-units-precision")
  (pr-rotation                 :accessor pr-rotation                 :initarg :pr-rotation                 :initform nil :documentation "pr-rotation")
  (pr-round-distance           :accessor pr-round-distance           :initarg :pr-round-distance           :initform nil :documentation "pr-round-distance")
  (pr-scale-factor             :accessor pr-scale-factor             :initarg :pr-scale-factor             :initform nil :documentation "pr-scale-factor")
  (pr-style-name               :accessor pr-style-name               :initarg :pr-style-name               :initform nil :documentation "pr-style-name")
  (pr-suppress-leading-zeros   :accessor pr-suppress-leading-zeros   :initarg :pr-suppress-leading-zeros   :initform nil :documentation "pr-suppress-leading-zeros")
  (pr-suppress-trailing-zeros  :accessor pr-suppress-trailing-zeros  :initarg :pr-suppress-trailing-zeros  :initform nil :documentation "pr-suppress-trailing-zeros")
  (pr-suppress-zero-feet       :accessor pr-suppress-zero-feet       :initarg :pr-suppress-zero-feet       :initform nil :documentation "pr-suppress-zero-feet")
  (pr-suppress-zero-inches     :accessor pr-suppress-zero-inches     :initarg :pr-suppress-zero-inches     :initform nil :documentation "pr-suppress-zero-inches")
  (pr-text-color               :accessor pr-text-color               :initarg :pr-text-color               :initform nil :documentation "pr-text-color")
  (pr-text-fill                :accessor pr-text-fill                :initarg :pr-text-fill                :initform nil :documentation "pr-text-fill")
  (pr-text-fill-color          :accessor pr-text-fill-color          :initarg :pr-text-fill-color          :initform nil :documentation "pr-text-fill-color")
  (pr-text-gap                 :accessor pr-text-gap                 :initarg :pr-text-gap                 :initform nil :documentation "pr-text-gap")
  (pr-text-height              :accessor pr-text-height              :initarg :pr-text-height              :initform nil :documentation "pr-text-height")
  (pr-text-inside              :accessor pr-text-inside              :initarg :pr-text-inside              :initform nil :documentation "pr-text-inside")
  (pr-text-inside-align        :accessor pr-text-inside-align        :initarg :pr-text-inside-align        :initform nil :documentation "pr-text-inside-align")
  (pr-text-movement            :accessor pr-text-movement            :initarg :pr-text-movement            :initform nil :documentation "pr-text-movement")
  (pr-text-outside-align       :accessor pr-text-outside-align       :initarg :pr-text-outside-align       :initform nil :documentation "pr-text-outside-align")
  (pr-text-override            :accessor pr-text-override            :initarg :pr-text-override            :initform nil :documentation "pr-text-override")
  (pr-text-position            :accessor pr-text-position            :initarg :pr-text-position            :initform nil :documentation "pr-text-position")
  (pr-text-prefix              :accessor pr-text-prefix              :initarg :pr-text-prefix              :initform nil :documentation "pr-text-prefix")
  (pr-text-rotation            :accessor pr-text-rotation            :initarg :pr-text-rotation            :initform nil :documentation "pr-text-rotation")
  (pr-text-style               :accessor pr-text-style               :initarg :pr-text-style               :initform nil :documentation "pr-text-style")
  (pr-text-suffix              :accessor pr-text-suffix              :initarg :pr-text-suffix              :initform nil :documentation "pr-text-suffix")
  (pr-tolerance-display        :accessor pr-tolerance-display        :initarg :pr-tolerance-display        :initform nil :documentation "pr-tolerance-display")
  (pr-tolerance-height-scale   :accessor pr-tolerance-height-scale   :initarg :pr-tolerance-height-scale   :initform nil :documentation "pr-tolerance-height-scale")
  (pr-tolerance-justification  :accessor pr-tolerance-justification  :initarg :pr-tolerance-justification  :initform nil :documentation "pr-tolerance-justification")
  (pr-tolerance-lower-limit    :accessor pr-tolerance-lower-limit    :initarg :pr-tolerance-lower-limit    :initform nil :documentation "pr-tolerance-lower-limit")
  (pr-tolerance-precision      :accessor pr-tolerance-precision      :initarg :pr-tolerance-precision      :initform nil :documentation "pr-tolerance-precision")
  (pr-tolerance-suppress-leading-zeros :accessor pr-tolerance-suppress-leading-zeros :initarg :pr-tolerance-suppress-leading-zeros :initform nil :documentation "pr-tolerance-suppress-leading-zeros")
  (pr-tolerance-suppress-trailing-zeros :accessor pr-tolerance-suppress-trailing-zeros :initarg :pr-tolerance-suppress-trailing-zeros :initform nil :documentation "pr-tolerance-suppress-trailing-zeros")
  (pr-tolerance-suppress-zero-feet :accessor pr-tolerance-suppress-zero-feet :initarg :pr-tolerance-suppress-zero-feet :initform nil :documentation "pr-tolerance-suppress-zero-feet")
  (pr-tolerance-suppress-zero-inches :accessor pr-tolerance-suppress-zero-inches :initarg :pr-tolerance-suppress-zero-inches :initform nil :documentation "pr-tolerance-suppress-zero-inches")
  (pr-tolerance-upper-limit    :accessor pr-tolerance-upper-limit    :initarg :pr-tolerance-upper-limit    :initform nil :documentation "pr-tolerance-upper-limit")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-units-format             :accessor pr-units-format             :initarg :pr-units-format             :initform nil :documentation "pr-units-format")
  (pr-vertical-text-position   :accessor pr-vertical-text-position   :initarg :pr-vertical-text-position   :initform nil :documentation "pr-vertical-text-position")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E44150ED-D643-4BC5-AD6B-E4724A109DA5\"](DimRadialLarge Object (ActiveX))"))

(defparameter *acad-dim-radial-large-properties* '(pr-alt-round-distance pr-alt-suppress-leading-zeros pr-alt-suppress-trailing-zeros pr-alt-suppress-zero-feet pr-alt-suppress-zero-inches pr-alt-text-prefix pr-alt-text-suffix pr-alt-tolerance-precision pr-alt-tolerance-suppress-leading-zeros pr-alt-tolerance-suppress-trailing-zeros pr-alt-tolerance-suppress-zero-feet pr-alt-tolerance-suppress-zero-inches pr-alt-units pr-alt-units-format pr-alt-units-precision pr-alt-units-scale pr-application pr-arrowhead-block pr-arrowhead-size pr-arrowhead-type pr-center pr-center-mark-size pr-center-type pr-chord-point pr-decimal-separator pr-dimension-line-color pr-dimension-linetype pr-dimension-line-weight pr-dim-line-suppress pr-dim-txt-direction pr-document pr-entity-transparency pr-fit pr-force-line-inside pr-fraction-format pr-handle pr-has-extension-dictionary pr-hyperlinks pr-jog-angle pr-jog-location pr-layer pr-linear-scale-factor pr-linetype pr-linetype-scale pr-lineweight pr-material pr-measurement pr-normal pr-object-id pr-object-name pr-override-center pr-owner-id pr-plot-style-name pr-primary-units-precision pr-rotation pr-round-distance pr-scale-factor pr-style-name pr-suppress-leading-zeros pr-suppress-trailing-zeros pr-suppress-zero-feet pr-suppress-zero-inches pr-text-color pr-text-fill pr-text-fill-color pr-text-gap pr-text-height pr-text-inside pr-text-inside-align pr-text-movement pr-text-outside-align pr-text-override pr-text-position pr-text-prefix pr-text-rotation pr-text-style pr-text-suffix pr-tolerance-display pr-tolerance-height-scale pr-tolerance-justification pr-tolerance-lower-limit pr-tolerance-precision pr-tolerance-suppress-leading-zeros pr-tolerance-suppress-trailing-zeros pr-tolerance-suppress-zero-feet pr-tolerance-suppress-zero-inches pr-tolerance-upper-limit pr-true-color pr-units-format pr-vertical-text-position pr-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-dim-radial-large-properties* *acad-dimension-properties*))
