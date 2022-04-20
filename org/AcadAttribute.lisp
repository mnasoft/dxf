(defclass <acad-attribute> (<acad-entity>)
  (
  (ac-alignment                :accessor ac-alignment                :initarg :ac-alignment                :initform nil :documentation "ac-alignment")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-backward                 :accessor ac-backward                 :initarg :ac-backward                 :initform nil :documentation "ac-backward")
  (ac-constant                 :accessor ac-constant                 :initarg :ac-constant                 :initform nil :documentation "ac-constant")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-field-length             :accessor ac-field-length             :initarg :ac-field-length             :initform nil :documentation "ac-field-length")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-height                   :accessor ac-height                   :initarg :ac-height                   :initform nil :documentation "ac-height")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-insertion-point          :accessor ac-insertion-point          :initarg :ac-insertion-point          :initform nil :documentation "ac-insertion-point")
  (ac-invisible                :accessor ac-invisible                :initarg :ac-invisible                :initform nil :documentation "ac-invisible")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-lock-position            :accessor ac-lock-position            :initarg :ac-lock-position            :initform nil :documentation "ac-lock-position")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-mode                     :accessor ac-mode                     :initarg :ac-mode                     :initform nil :documentation "ac-mode")
  (ac-m-text-attribute         :accessor ac-m-text-attribute         :initarg :ac-m-text-attribute         :initform nil :documentation "ac-m-text-attribute")
  (ac-m-text-attribute-content :accessor ac-m-text-attribute-content :initarg :ac-m-text-attribute-content :initform nil :documentation "ac-m-text-attribute-content")
  (ac-m-text-boundary-width    :accessor ac-m-text-boundary-width    :initarg :ac-m-text-boundary-width    :initform nil :documentation "ac-m-text-boundary-width")
  (ac-m-text-drawing-direction :accessor ac-m-text-drawing-direction :initarg :ac-m-text-drawing-direction :initform nil :documentation "ac-m-text-drawing-direction")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-oblique-angle            :accessor ac-oblique-angle            :initarg :ac-oblique-angle            :initform nil :documentation "ac-oblique-angle")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-preset                   :accessor ac-preset                   :initarg :ac-preset                   :initform nil :documentation "ac-preset")
  (ac-prompt-string            :accessor ac-prompt-string            :initarg :ac-prompt-string            :initform nil :documentation "ac-prompt-string")
  (ac-rotation                 :accessor ac-rotation                 :initarg :ac-rotation                 :initform nil :documentation "ac-rotation")
  (ac-scale-factor             :accessor ac-scale-factor             :initarg :ac-scale-factor             :initform nil :documentation "ac-scale-factor")
  (ac-style-name               :accessor ac-style-name               :initarg :ac-style-name               :initform nil :documentation "ac-style-name")
  (ac-tag-string               :accessor ac-tag-string               :initarg :ac-tag-string               :initform nil :documentation "ac-tag-string")
  (ac-text-alignment-point     :accessor ac-text-alignment-point     :initarg :ac-text-alignment-point     :initform nil :documentation "ac-text-alignment-point")
  (ac-text-generation-flag     :accessor ac-text-generation-flag     :initarg :ac-text-generation-flag     :initform nil :documentation "ac-text-generation-flag")
  (ac-text-string              :accessor ac-text-string              :initarg :ac-text-string              :initform nil :documentation "ac-text-string")
  (ac-thickness                :accessor ac-thickness                :initarg :ac-thickness                :initform nil :documentation "ac-thickness")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-upside-down              :accessor ac-upside-down              :initarg :ac-upside-down              :initform nil :documentation "ac-upside-down")
  (ac-verify                   :accessor ac-verify                   :initarg :ac-verify                   :initform nil :documentation "ac-verify")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "An object appearing as a text string that describes the characteristics of an attribute reference."))

(defparameter *acad-attribute-properties* '(ac-alignment ac-application ac-backward ac-constant ac-document ac-entity-transparency ac-field-length ac-handle ac-has-extension-dictionary ac-height ac-hyperlinks ac-insertion-point ac-invisible ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-lock-position ac-material ac-mode ac-m-text-attribute ac-m-text-attribute-content ac-m-text-boundary-width ac-m-text-drawing-direction ac-normal ac-object-id ac-object-name ac-oblique-angle ac-owner-id ac-plot-style-name ac-preset ac-prompt-string ac-rotation ac-scale-factor ac-style-name ac-tag-string ac-text-alignment-point ac-text-generation-flag ac-text-string ac-thickness ac-true-color ac-upside-down ac-verify ac-visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-attribute-properties* *acad-entity-properties*))
