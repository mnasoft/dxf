(defclass acad-ac-cm-color (object)
  (
  (ac-blue                     :accessor ac-blue                     :initarg :ac-blue                     :initform nil :documentation "ac-blue")
  (ac-book-name                :accessor ac-book-name                :initarg :ac-book-name                :initform nil :documentation "ac-book-name")
  (ac-color-index              :accessor ac-color-index              :initarg :ac-color-index              :initform nil :documentation "ac-color-index")
  (ac-color-method             :accessor ac-color-method             :initarg :ac-color-method             :initform nil :documentation "ac-color-method")
  (ac-color-name               :accessor ac-color-name               :initarg :ac-color-name               :initform nil :documentation "ac-color-name")
  (ac-entity-color             :accessor ac-entity-color             :initarg :ac-entity-color             :initform nil :documentation "ac-entity-color")
  (ac-green                    :accessor ac-green                    :initarg :ac-green                    :initform nil :documentation "ac-green")
  (ac-red                      :accessor ac-red                      :initarg :ac-red                      :initform nil :documentation "ac-red")
  )
  (:documentation "AutoCAD true color object."))

(defparameter *acad-ac-cm-color-properties* '(ac-blue ac-book-name ac-color-index ac-color-method ac-color-name ac-entity-color ac-green ac-red))

(mapcar #'make-slot (set-difference *acad-ac-cm-color-properties* *object-properties*))