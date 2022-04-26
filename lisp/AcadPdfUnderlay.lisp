(in-package :dxf)

(defclass <acad-pdf-underlay> (<acad-underlay>)
  (
  (ac-adjust-for-background    :accessor ac-adjust-for-background    :initarg :ac-adjust-for-background    :initform nil :documentation "ac-adjust-for-background")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-clipping-enabled         :accessor ac-clipping-enabled         :initarg :ac-clipping-enabled         :initform nil :documentation "ac-clipping-enabled")
  (ac-contrast                 :accessor ac-contrast                 :initarg :ac-contrast                 :initform nil :documentation "ac-contrast")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-fade                     :accessor ac-fade                     :initarg :ac-fade                     :initform nil :documentation "ac-fade")
  (ac-file                     :accessor ac-file                     :initarg :ac-file                     :initform nil :documentation "ac-file")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-item-name                :accessor ac-item-name                :initarg :ac-item-name                :initform nil :documentation "ac-item-name")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-monochrome               :accessor ac-monochrome               :initarg :ac-monochrome               :initform nil :documentation "ac-monochrome")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-position                 :accessor ac-position                 :initarg :ac-position                 :initform nil :documentation "ac-position")
  (ac-rotation                 :accessor ac-rotation                 :initarg :ac-rotation                 :initform nil :documentation "ac-rotation")
  (ac-scale-factor             :accessor ac-scale-factor             :initarg :ac-scale-factor             :initform nil :documentation "ac-scale-factor")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-underlay-layer-override-applied :accessor ac-underlay-layer-override-applied :initarg :ac-underlay-layer-override-applied :initform nil :documentation "ac-underlay-layer-override-applied")
  (ac-underlay-name            :accessor ac-underlay-name            :initarg :ac-underlay-name            :initform nil :documentation "ac-underlay-name")
  (ac-underlay-visibility      :accessor ac-underlay-visibility      :initarg :ac-underlay-visibility      :initform nil :documentation "ac-underlay-visibility")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  (ac-width                    :accessor ac-width                    :initarg :ac-width                    :initform nil :documentation "ac-width")
  )
  (:documentation "A source of PDF underlay content."))

(defparameter *acad-pdf-underlay-properties* '(ac-adjust-for-background ac-application ac-clipping-enabled ac-contrast ac-document ac-entity-transparency ac-fade ac-file ac-handle ac-has-extension-dictionary ac-height ac-hyperlinks ac-item-name ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-monochrome ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-position ac-rotation ac-scale-factor ac-true-color ac-underlay-layer-override-applied ac-underlay-name ac-underlay-visibility ac-visible ac-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-pdf-underlay-properties* *acad-underlay-properties*))
