(in-package :dxf)

(defclass <acad-database-preferences> (<object>)
  (
  (ac-allow-long-symbol-names  :accessor ac-allow-long-symbol-names  :initarg :ac-allow-long-symbol-names  :initform nil :documentation "ac-allow-long-symbol-names")
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-contourlines-per-surface :accessor ac-contourlines-per-surface :initarg :ac-contourlines-per-surface :initform nil :documentation "ac-contourlines-per-surface")
  (ac-display-silhouette       :accessor ac-display-silhouette       :initarg :ac-display-silhouette       :initform nil :documentation "ac-display-silhouette")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-lineweight-display       :accessor ac-lineweight-display       :initarg :ac-lineweight-display       :initform nil :documentation "ac-lineweight-display")
  (ac-max-active-viewports     :accessor ac-max-active-viewports     :initarg :ac-max-active-viewports     :initform nil :documentation "ac-max-active-viewports")
  (ac-object-sort-by-plotting  :accessor ac-object-sort-by-plotting  :initarg :ac-object-sort-by-plotting  :initform nil :documentation "ac-object-sort-by-plotting")
  (ac-object-sort-by-ps-output :accessor ac-object-sort-by-ps-output :initarg :ac-object-sort-by-ps-output :initform nil :documentation "ac-object-sort-by-ps-output")
  (ac-object-sort-by-redraws   :accessor ac-object-sort-by-redraws   :initarg :ac-object-sort-by-redraws   :initform nil :documentation "ac-object-sort-by-redraws")
  (ac-object-sort-by-regens    :accessor ac-object-sort-by-regens    :initarg :ac-object-sort-by-regens    :initform nil :documentation "ac-object-sort-by-regens")
  (ac-object-sort-by-selection :accessor ac-object-sort-by-selection :initarg :ac-object-sort-by-selection :initform nil :documentation "ac-object-sort-by-selection")
  (ac-object-sort-by-snap      :accessor ac-object-sort-by-snap      :initarg :ac-object-sort-by-snap      :initform nil :documentation "ac-object-sort-by-snap")
  (ac-ole-launch               :accessor ac-ole-launch               :initarg :ac-ole-launch               :initform nil :documentation "ac-ole-launch")
  (ac-render-smoothness        :accessor ac-render-smoothness        :initarg :ac-render-smoothness        :initform nil :documentation "ac-render-smoothness")
  (ac-segment-per-polyline     :accessor ac-segment-per-polyline     :initarg :ac-segment-per-polyline     :initform nil :documentation "ac-segment-per-polyline")
  (ac-solid-fill               :accessor ac-solid-fill               :initarg :ac-solid-fill               :initform nil :documentation "ac-solid-fill")
  (ac-text-frame-display       :accessor ac-text-frame-display       :initarg :ac-text-frame-display       :initform nil :documentation "ac-text-frame-display")
  (ac-x-ref-edit               :accessor ac-x-ref-edit               :initarg :ac-x-ref-edit               :initform nil :documentation "ac-x-ref-edit")
  (ac-x-ref-layer-visibility   :accessor ac-x-ref-layer-visibility   :initarg :ac-x-ref-layer-visibility   :initform nil :documentation "ac-x-ref-layer-visibility")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B03F622D-9D1D-4149-A170-1DF2AC62DA37
DatabasePreferences Object (ActiveX)
"))

(defparameter *acad-database-preferences-properties* '(ac-allow-long-symbol-names ac-application ac-contourlines-per-surface ac-display-silhouette ac-lineweight ac-lineweight-display ac-max-active-viewports ac-object-sort-by-plotting ac-object-sort-by-ps-output ac-object-sort-by-redraws ac-object-sort-by-regens ac-object-sort-by-selection ac-object-sort-by-snap ac-ole-launch ac-render-smoothness ac-segment-per-polyline ac-solid-fill ac-text-frame-display ac-x-ref-edit ac-x-ref-layer-visibility))

(mapcar #'dxf/utils:make-slot (set-difference *acad-database-preferences-properties* *object-properties*))
