(in-package :dxf)

(defclass <acad-plane-surface> (<acad-surface>)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-edge-extension-distances :accessor ac-edge-extension-distances :initarg :ac-edge-extension-distances :initform nil :documentation "ac-edge-extension-distances")
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
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-show-associativity       :accessor ac-show-associativity       :initarg :ac-show-associativity       :initform nil :documentation "ac-show-associativity")
  (ac-surface-type             :accessor ac-surface-type             :initarg :ac-surface-type             :initform nil :documentation "ac-surface-type")
  (ac-surf-trim-associativity  :accessor ac-surf-trim-associativity  :initarg :ac-surf-trim-associativity  :initform nil :documentation "ac-surf-trim-associativity")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-u-isoline-density        :accessor ac-u-isoline-density        :initarg :ac-u-isoline-density        :initform nil :documentation "ac-u-isoline-density")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  (ac-v-isoline-density        :accessor ac-v-isoline-density        :initarg :ac-v-isoline-density        :initform nil :documentation "ac-v-isoline-density")
  (ac-wireframe-type           :accessor ac-wireframe-type           :initarg :ac-wireframe-type           :initform nil :documentation "ac-wireframe-type")
  )
  (:documentation "A planar surface."))

(defparameter *acad-plane-surface-properties* '(ac-application ac-document ac-edge-extension-distances ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-maintain-associativity ac-material ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-show-associativity ac-surface-type ac-surf-trim-associativity ac-true-color ac-u-isoline-density ac-visible ac-v-isoline-density ac-wireframe-type))

(mapcar #'dxf/utils:make-slot (set-difference *acad-plane-surface-properties* *acad-surface-properties*))
