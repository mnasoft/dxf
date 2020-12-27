(defclass acad3-d-face (acad-entity)
  (
  (ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
  (ac-coordinate               :accessor ac-coordinate               :initarg :ac-coordinate               :initform nil :documentation "ac-coordinate")
  (ac-coordinates              :accessor ac-coordinates              :initarg :ac-coordinates              :initform nil :documentation "ac-coordinates")
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
  (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
  (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
  (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "ac-owner-id")
  (ac-plot-style-name          :accessor ac-plot-style-name          :initarg :ac-plot-style-name          :initform nil :documentation "ac-plot-style-name")
  (ac-true-color               :accessor ac-true-color               :initarg :ac-true-color               :initform nil :documentation "ac-true-color")
  (ac-visibility-edge1         :accessor ac-visibility-edge1         :initarg :ac-visibility-edge1         :initform nil :documentation "ac-visibility-edge1")
  (ac-visibility-edge2         :accessor ac-visibility-edge2         :initarg :ac-visibility-edge2         :initform nil :documentation "ac-visibility-edge2")
  (ac-visibility-edge3         :accessor ac-visibility-edge3         :initarg :ac-visibility-edge3         :initform nil :documentation "ac-visibility-edge3")
  (ac-visibility-edge4         :accessor ac-visibility-edge4         :initarg :ac-visibility-edge4         :initform nil :documentation "ac-visibility-edge4")
  (ac-visible                  :accessor ac-visible                  :initarg :ac-visible                  :initform nil :documentation "ac-visible")
  )
  (:documentation "A 3D triangle or quadrilateral plane section."))

(defparameter *acad3-d-face-properties* '(ac-application ac-coordinate ac-coordinates ac-document ac-entity-transparency ac-handle ac-has-extension-dictionary ac-hyperlinks ac-layer ac-linetype ac-linetype-scale ac-lineweight ac-material ac-object-id ac-object-name ac-owner-id ac-plot-style-name ac-true-color ac-visibility-edge1 ac-visibility-edge2 ac-visibility-edge3 ac-visibility-edge4 ac-visible))

(mapcar #'make-slot (set-difference *acad3-d-face-properties* *acad-entity-properties*))