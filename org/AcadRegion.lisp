(defclass acad-region (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-area                     :accessor ac-area                     :initarg :ac-area                     :initform nil :documentation "ac-area")
  (ac-centroid                 :accessor ac-centroid                 :initarg :ac-centroid                 :initform nil :documentation "ac-centroid")
  (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
  (ac-entity-transparency      :accessor ac-entity-transparency      :initarg :ac-entity-transparency      :initform nil :documentation "ac-entity-transparency")
  (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "ac-handle")
  (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
  (ac-hyperlinks               :accessor ac-hyperlinks               :initarg :ac-hyperlinks               :initform nil :documentation "ac-hyperlinks")
  (ac-layer                    :accessor ac-layer                    :initarg :ac-layer                    :initform nil :documentation "ac-layer")
  (ac-linetype                 :accessor ac-linetype                 :initarg :ac-linetype                 :initform nil :documentation "ac-linetype")
  (ac-linetype-scale           :accessor ac-linetype-scale           :initarg :ac-linetype-scale           :initform nil :documentation "ac-linetype-scale")
  (ac-lineweight               :accessor ac-lineweight               :initarg :ac-lineweight               :initform nil :documentation "ac-lineweight")
  (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
  (ac-moment-of-inertia        :accessor ac-moment-of-inertia        :initarg :ac-moment-of-inertia        :initform nil :documentation "ac-moment-of-inertia")
  (ac-normal                   :accessor ac-normal                   :initarg :ac-normal                   :initform nil :documentation "ac-normal")
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-perimeter                :accessor ac-perimeter                :initarg :ac-perimeter                :initform nil :documentation "ac-perimeter")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-principal-directions     :accessor ac-principal-directions     :initarg :ac-principal-directions     :initform nil :documentation "ac-principal-directions")
  (ac-principal-moments        :accessor ac-principal-moments        :initarg :ac-principal-moments        :initform nil :documentation "ac-principal-moments")
  (ac-product-of-inertia       :accessor ac-product-of-inertia       :initarg :ac-product-of-inertia       :initform nil :documentation "ac-product-of-inertia")
  (ac-radii-of-gyration        :accessor ac-radii-of-gyration        :initarg :ac-radii-of-gyration        :initform nil :documentation "ac-radii-of-gyration")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "A bounded planar face consisting of lines, circles, arcs, elliptical arcs, and spline curves."))

(defparameter *acad-region-properties* '(ac-application ac-area ac-centroid ac-document ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-moment-of-inertia ac-normal ac-object-id ac-object-name ac-owner-id ac-perimeter ac-plot-style-name ac-principal-directions ac-principal-moments ac-product-of-inertia ac-radii-of-gyration ac-true-color ac-visible))

(mapcar #'make-slot (set-difference *acad-region-properties* *acad-entity-properties*))