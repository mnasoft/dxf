(in-package :dxf/classes)

(defclass <acad-wipeout> (<acad-raster-image>)
  (
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-brightness               :accessor pr-brightness               :initarg :pr-brightness               :initform nil :documentation "pr-brightness")
  (pr-clipping-enabled         :accessor pr-clipping-enabled         :initarg :pr-clipping-enabled         :initform nil :documentation "pr-clipping-enabled")
  (pr-contrast                 :accessor pr-contrast                 :initarg :pr-contrast                 :initform nil :documentation "pr-contrast")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-fade                     :accessor pr-fade                     :initarg :pr-fade                     :initform nil :documentation "pr-fade")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-height                   :accessor pr-height                   :initarg :pr-height                   :initform nil :documentation "pr-height")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-image-file               :accessor pr-image-file               :initarg :pr-image-file               :initform nil :documentation "pr-image-file")
  (pr-image-height             :accessor pr-image-height             :initarg :pr-image-height             :initform nil :documentation "pr-image-height")
  (pr-image-visibility         :accessor pr-image-visibility         :initarg :pr-image-visibility         :initform nil :documentation "pr-image-visibility")
  (pr-image-width              :accessor pr-image-width              :initarg :pr-image-width              :initform nil :documentation "pr-image-width")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-name                     :accessor pr-name                     :initarg :pr-name                     :initform nil :documentation "pr-name")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-origin                   :accessor pr-origin                   :initarg :pr-origin                   :initform nil :documentation "pr-origin")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-rotation                 :accessor pr-rotation                 :initarg :pr-rotation                 :initform nil :documentation "pr-rotation")
  (pr-scale-factor             :accessor pr-scale-factor             :initarg :pr-scale-factor             :initform nil :documentation "pr-scale-factor")
  (pr-show-rotation            :accessor pr-show-rotation            :initarg :pr-show-rotation            :initform nil :documentation "pr-show-rotation")
  (pr-transparency             :accessor pr-transparency             :initarg :pr-transparency             :initform nil :documentation "pr-transparency")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  (pr-width                    :accessor pr-width                    :initarg :pr-width                    :initform nil :documentation "pr-width")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C978B807-6636-4DE4-AC63-7ACFF232B9EB\"](Wipeout Object (ActiveX))"))

(defparameter *acad-wipeout-properties* '(pr-application pr-brightness pr-clipping-enabled pr-contrast pr-document pr-entity-transparency pr-fade pr-handle pr-has-extension-dictionary pr-height pr-hyperlinks pr-image-file pr-image-height pr-image-visibility pr-image-width pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-material pr-name pr-object-id pr-object-name pr-origin pr-owner-id pr-plot-style-name pr-rotation pr-scale-factor pr-show-rotation pr-transparency pr-true-color pr-visible pr-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-wipeout-properties* *acad-raster-image-properties*))
