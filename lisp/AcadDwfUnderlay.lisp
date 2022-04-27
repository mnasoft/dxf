(in-package :dxf)

(defclass <acad-dwf-underlay> (<acad-underlay>)
  (
  (pr-adjust-for-background    :accessor pr-adjust-for-background    :initarg :pr-adjust-for-background    :initform nil :documentation "pr-adjust-for-background")
  (pr-application              :accessor pr-application              :initarg :pr-application              :initform nil :documentation "pr-application")
  (pr-clipping-enabled         :accessor pr-clipping-enabled         :initarg :pr-clipping-enabled         :initform nil :documentation "pr-clipping-enabled")
  (pr-contrast                 :accessor pr-contrast                 :initarg :pr-contrast                 :initform nil :documentation "pr-contrast")
  (pr-document                 :accessor pr-document                 :initarg :pr-document                 :initform nil :documentation "pr-document")
  (pr-entity-transparency      :accessor pr-entity-transparency      :initarg :pr-entity-transparency      :initform nil :documentation "pr-entity-transparency")
  (pr-fade                     :accessor pr-fade                     :initarg :pr-fade                     :initform nil :documentation "pr-fade")
  (pr-file                     :accessor pr-file                     :initarg :pr-file                     :initform nil :documentation "pr-file")
  (pr-handle                   :accessor pr-handle                   :initarg :pr-handle                   :initform nil :documentation "pr-handle")
  (pr-has-extension-dictionary :accessor pr-has-extension-dictionary :initarg :pr-has-extension-dictionary :initform nil :documentation "pr-has-extension-dictionary")
  (pr-height                   :accessor pr-height                   :initarg :pr-height                   :initform nil :documentation "pr-height")
  (pr-hyperlinks               :accessor pr-hyperlinks               :initarg :pr-hyperlinks               :initform nil :documentation "pr-hyperlinks")
  (pr-item-name                :accessor pr-item-name                :initarg :pr-item-name                :initform nil :documentation "pr-item-name")
  (pr-layer                    :accessor pr-layer                    :initarg :pr-layer                    :initform nil :documentation "pr-layer")
  (pr-linetype                 :accessor pr-linetype                 :initarg :pr-linetype                 :initform nil :documentation "pr-linetype")
  (pr-linetype-scale           :accessor pr-linetype-scale           :initarg :pr-linetype-scale           :initform nil :documentation "pr-linetype-scale")
  (pr-lineweight               :accessor pr-lineweight               :initarg :pr-lineweight               :initform nil :documentation "pr-lineweight")
  (pr-material                 :accessor pr-material                 :initarg :pr-material                 :initform nil :documentation "pr-material")
  (pr-monochrome               :accessor pr-monochrome               :initarg :pr-monochrome               :initform nil :documentation "pr-monochrome")
  (pr-object-id                :accessor pr-object-id                :initarg :pr-object-id                :initform nil :documentation "pr-object-id")
  (pr-object-name              :accessor pr-object-name              :initarg :pr-object-name              :initform nil :documentation "pr-object-name")
  (pr-owner-id                 :accessor pr-owner-id                 :initarg :pr-owner-id                 :initform nil :documentation "pr-owner-id")
  (pr-plot-style-name          :accessor pr-plot-style-name          :initarg :pr-plot-style-name          :initform nil :documentation "pr-plot-style-name")
  (pr-position                 :accessor pr-position                 :initarg :pr-position                 :initform nil :documentation "pr-position")
  (pr-rotation                 :accessor pr-rotation                 :initarg :pr-rotation                 :initform nil :documentation "pr-rotation")
  (pr-scale-factor             :accessor pr-scale-factor             :initarg :pr-scale-factor             :initform nil :documentation "pr-scale-factor")
  (pr-true-color               :accessor pr-true-color               :initarg :pr-true-color               :initform nil :documentation "pr-true-color")
  (pr-underlay-layer-override-applied :accessor pr-underlay-layer-override-applied :initarg :pr-underlay-layer-override-applied :initform nil :documentation "pr-underlay-layer-override-applied")
  (pr-underlay-name            :accessor pr-underlay-name            :initarg :pr-underlay-name            :initform nil :documentation "pr-underlay-name")
  (pr-underlay-visibility      :accessor pr-underlay-visibility      :initarg :pr-underlay-visibility      :initform nil :documentation "pr-underlay-visibility")
  (pr-visible                  :accessor pr-visible                  :initarg :pr-visible                  :initform nil :documentation "pr-visible")
  (pr-width                    :accessor pr-width                    :initarg :pr-width                    :initform nil :documentation "pr-width")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1205069A-A64A-4E21-9B9A-3EAF58F2EF26\"](DwfUnderlay Object (ActiveX))"))

(defparameter *acad-dwf-underlay-properties* '(pr-adjust-for-background pr-application pr-clipping-enabled pr-contrast pr-document pr-entity-transparency pr-fade pr-file pr-handle pr-has-extension-dictionary pr-height pr-hyperlinks pr-item-name pr-layer pr-linetype pr-linetype-scale pr-lineweight pr-material pr-monochrome pr-object-id pr-object-name pr-owner-id pr-plot-style-name pr-position pr-rotation pr-scale-factor pr-true-color pr-underlay-layer-override-applied pr-underlay-name pr-underlay-visibility pr-visible pr-width))

(mapcar #'dxf/utils:make-slot (set-difference *acad-dwf-underlay-properties* *acad-underlay-properties*))
