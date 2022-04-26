(in-package :dxf)

(defclass <acad-database> (<object>)
  (
  (ac-blocks                   :accessor ac-blocks                   :initarg :ac-blocks                   :initform nil :documentation "ac-blocks")
  (ac-dictionaries             :accessor ac-dictionaries             :initarg :ac-dictionaries             :initform nil :documentation "ac-dictionaries")
  (ac-dim-styles               :accessor ac-dim-styles               :initarg :ac-dim-styles               :initform nil :documentation "ac-dim-styles")
  (ac-elevation-model-space    :accessor ac-elevation-model-space    :initarg :ac-elevation-model-space    :initform nil :documentation "ac-elevation-model-space")
  (ac-elevation-paper-space    :accessor ac-elevation-paper-space    :initarg :ac-elevation-paper-space    :initform nil :documentation "ac-elevation-paper-space")
  (ac-groups                   :accessor ac-groups                   :initarg :ac-groups                   :initform nil :documentation "ac-groups")
  (ac-layers                   :accessor ac-layers                   :initarg :ac-layers                   :initform nil :documentation "ac-layers")
  (ac-layouts                  :accessor ac-layouts                  :initarg :ac-layouts                  :initform nil :documentation "ac-layouts")
  (ac-limits                   :accessor ac-limits                   :initarg :ac-limits                   :initform nil :documentation "ac-limits")
  (ac-linetypes                :accessor ac-linetypes                :initarg :ac-linetypes                :initform nil :documentation "ac-linetypes")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-model-space              :accessor ac-model-space              :initarg :ac-model-space              :initform nil :documentation "ac-model-space")
  (ac-paper-space              :accessor ac-paper-space              :initarg :ac-paper-space              :initform nil :documentation "ac-paper-space")
  (ac-plot-configurations      :accessor ac-plot-configurations      :initarg :ac-plot-configurations      :initform nil :documentation "ac-plot-configurations")
  (ac-preferences              :accessor ac-preferences              :initarg :ac-preferences              :initform nil :documentation "ac-preferences")
  (ac-registered-applications  :accessor ac-registered-applications  :initarg :ac-registered-applications  :initform nil :documentation "ac-registered-applications")
  (ac-section-manager          :accessor ac-section-manager          :initarg :ac-section-manager          :initform nil :documentation "ac-section-manager")
  (ac-summary-info             :accessor ac-summary-info             :initarg :ac-summary-info             :initform nil :documentation "ac-summary-info")
  (ac-text-styles              :accessor ac-text-styles              :initarg :ac-text-styles              :initform nil :documentation "ac-text-styles")
  (ac-user-coordinate-systems  :accessor ac-user-coordinate-systems  :initarg :ac-user-coordinate-systems  :initform nil :documentation "ac-user-coordinate-systems")
  (ac-viewports                :accessor ac-viewports                :initarg :ac-viewports                :initform nil :documentation "ac-viewports")
  (ac-views                    :accessor ac-views                    :initarg :ac-views                    :initform nil :documentation "ac-views")
  )
  (:documentation "
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31D8D654-572D-4D2B-A138-4D8793ECE135
"))

(defparameter *acad-database-properties* '(ac-blocks ac-dictionaries ac-dim-styles ac-elevation-model-space ac-elevation-paper-space ac-groups ac-layers ac-layouts ac-limits ac-linetypes ac-material ac-model-space ac-paper-space ac-plot-configurations ac-preferences ac-registered-applications ac-section-manager ac-summary-info ac-text-styles ac-user-coordinate-systems ac-viewports ac-views))

(mapcar #'dxf/utils:make-slot (set-difference *acad-database-properties* *object-properties*))
