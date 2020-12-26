(defclass acad-layout (acad-plot-configuration)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-block                    :accessor ac-block                    :initarg :ac-block                    :initform nil :documentation "ac-block")
  (ac-canonical-media-name     :accessor ac-canonical-media-name     :initarg :ac-canonical-media-name     :initform nil :documentation "ac-canonical-media-name")
  (ac-center-plot              :accessor ac-center-plot              :initarg :ac-center-plot              :initform nil :documentation "ac-center-plot")
  (ac-config-name              :accessor ac-config-name              :initarg :ac-config-name              :initform nil :documentation "ac-config-name")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-model-type               :accessor ac-model-type               :initarg :ac-model-type               :initform nil :documentation "ac-model-type")
  (ac-name                     :accessor ac-name                     :initarg :ac-name                     :initform nil :documentation "ac-name")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-paper-units              :accessor ac-paper-units              :initarg :ac-paper-units              :initform nil :documentation "ac-paper-units")
  (ac-plot-hidden              :accessor ac-plot-hidden              :initarg :ac-plot-hidden              :initform nil :documentation "ac-plot-hidden")
  (ac-plot-origin              :accessor ac-plot-origin              :initarg :ac-plot-origin              :initform nil :documentation "ac-plot-origin")
  (ac-plot-rotation            :accessor ac-plot-rotation            :initarg :ac-plot-rotation            :initform nil :documentation "ac-plot-rotation")
  (ac-plot-type                :accessor ac-plot-type                :initarg :ac-plot-type                :initform nil :documentation "ac-plot-type")
  (ac-plot-viewport-borders    :accessor ac-plot-viewport-borders    :initarg :ac-plot-viewport-borders    :initform nil :documentation "ac-plot-viewport-borders")
  (ac-plot-viewports-first     :accessor ac-plot-viewports-first     :initarg :ac-plot-viewports-first     :initform nil :documentation "ac-plot-viewports-first")
  (ac-plot-with-lineweights    :accessor ac-plot-with-lineweights    :initarg :ac-plot-with-lineweights    :initform nil :documentation "ac-plot-with-lineweights")
  (ac-plot-with-plot-styles    :accessor ac-plot-with-plot-styles    :initarg :ac-plot-with-plot-styles    :initform nil :documentation "ac-plot-with-plot-styles")
  (ac-scale-lineweights        :accessor ac-scale-lineweights        :initarg :ac-scale-lineweights        :initform nil :documentation "ac-scale-lineweights")
  (ac-show-plot-styles         :accessor ac-show-plot-styles         :initarg :ac-show-plot-styles         :initform nil :documentation "ac-show-plot-styles")
  (ac-standard-scale           :accessor ac-standard-scale           :initarg :ac-standard-scale           :initform nil :documentation "ac-standard-scale")
  (ac-style-sheet              :accessor ac-style-sheet              :initarg :ac-style-sheet              :initform nil :documentation "ac-style-sheet")
  (ac-tab-order                :accessor ac-tab-order                :initarg :ac-tab-order                :initform nil :documentation "ac-tab-order")
  (ac-use-standard-scale       :accessor ac-use-standard-scale       :initarg :ac-use-standard-scale       :initform nil :documentation "ac-use-standard-scale")
  (ac-view-to-plot             :accessor ac-view-to-plot             :initarg :ac-view-to-plot             :initform nil :documentation "ac-view-to-plot")
  )
  (:documentation "The plot settings and visual properties of a model space or paper space block."))

(defparameter *acad-layout-properties* '(ac-application ac-block ac-canonical-media-name ac-center-plot ac-config-name ac-document ac-handle ac-has-extension-dictionary ac-model-type ac-name ac-object-id ac-object-name ac-owner-id ac-paper-units ac-plot-hidden ac-plot-origin ac-plot-rotation ac-plot-type ac-plot-viewport-borders ac-plot-viewports-first ac-plot-with-lineweights ac-plot-with-plot-styles ac-scale-lineweights ac-show-plot-styles ac-standard-scale ac-style-sheet ac-tab-order ac-use-standard-scale ac-view-to-plot))

(mapcar #'make-slot (set-difference *acad-layout-properties* *acad-plot-configuration-properties*))