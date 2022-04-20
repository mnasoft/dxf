(defclass <acad-lofted-surface> (<acad-entity>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-closed                   :accessor ac-closed                   :initarg :ac-closed                   :initform nil :documentation "ac-closed")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-edge-extension-distances :accessor ac-edge-extension-distances :initarg :ac-edge-extension-distances :initform nil :documentation "ac-edge-extension-distances")
  (ac-end-draft-angle          :accessor ac-end-draft-angle          :initarg :ac-end-draft-angle          :initform nil :documentation "ac-end-draft-angle")
  (ac-end-draft-magnitude      :accessor ac-end-draft-magnitude      :initarg :ac-end-draft-magnitude      :initform nil :documentation "ac-end-draft-magnitude")
  (ac-end-smooth-continuity    :accessor ac-end-smooth-continuity    :initarg :ac-end-smooth-continuity    :initform nil :documentation "ac-end-smooth-continuity")
  (ac-end-smooth-magnitude     :accessor ac-end-smooth-magnitude     :initarg :ac-end-smooth-magnitude     :initform nil :documentation "ac-end-smooth-magnitude")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-maintain-associativity   :accessor ac-maintain-associativity   :initarg :ac-maintain-associativity   :initform nil :documentation "ac-maintain-associativity")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-num-cross-sections       :accessor ac-num-cross-sections       :initarg :ac-num-cross-sections       :initform nil :documentation "ac-num-cross-sections")
  (ac-num-guide-paths          :accessor ac-num-guide-paths          :initarg :ac-num-guide-paths          :initform nil :documentation "ac-num-guide-paths")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-periodic                 :accessor ac-periodic                 :initarg :ac-periodic                 :initform nil :documentation "ac-periodic")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-show-associativity       :accessor ac-show-associativity       :initarg :ac-show-associativity       :initform nil :documentation "ac-show-associativity")
  (ac-start-draft-angle        :accessor ac-start-draft-angle        :initarg :ac-start-draft-angle        :initform nil :documentation "ac-start-draft-angle")
  (ac-start-draft-magnitude    :accessor ac-start-draft-magnitude    :initarg :ac-start-draft-magnitude    :initform nil :documentation "ac-start-draft-magnitude")
  (ac-start-smooth-continuity  :accessor ac-start-smooth-continuity  :initarg :ac-start-smooth-continuity  :initform nil :documentation "ac-start-smooth-continuity")
  (ac-start-smooth-magnitude   :accessor ac-start-smooth-magnitude   :initarg :ac-start-smooth-magnitude   :initform nil :documentation "ac-start-smooth-magnitude")
  (ac-surface-normals          :accessor ac-surface-normals          :initarg :ac-surface-normals          :initform nil :documentation "ac-surface-normals")
  (ac-surface-type             :accessor ac-surface-type             :initarg :ac-surface-type             :initform nil :documentation "ac-surface-type")
  (ac-surf-trim-associativity  :accessor ac-surf-trim-associativity  :initarg :ac-surf-trim-associativity  :initform nil :documentation "ac-surf-trim-associativity")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-u-isoline-density        :accessor ac-u-isoline-density        :initarg :ac-u-isoline-density        :initform nil :documentation "ac-u-isoline-density")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  (ac-v-isoline-density        :accessor ac-v-isoline-density        :initarg :ac-v-isoline-density        :initform nil :documentation "ac-v-isoline-density")
  (ac-wireframe-type           :accessor ac-wireframe-type           :initarg :ac-wireframe-type           :initform nil :documentation "ac-wireframe-type")
  )
  (:documentation "A surface created by lofting through a set of two or more curves."))

(defparameter *acad-lofted-surface-properties* '(ac-application ac-closed ac-document ac-edge-extension-distances ac-end-draft-angle ac-end-draft-magnitude ac-end-smooth-continuity ac-end-smooth-magnitude ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-maintain-associativity ac-material ac-num-cross-sections ac-num-guide-paths ac-object-id ac-object-name ac-owner-id ac-periodic ac-plot-style-name ac-show-associativity ac-start-draft-angle ac-start-draft-magnitude ac-start-smooth-continuity ac-start-smooth-magnitude ac-surface-normals ac-surface-type ac-surf-trim-associativity ac-true-color ac-u-isoline-density ac-visible ac-v-isoline-density ac-wireframe-type))

(mapcar #'dxf/utils:make-slot (set-difference *acad-lofted-surface-properties* *acad-entity-properties*))
