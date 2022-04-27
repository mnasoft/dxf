(in-package :dxf)

(defclass <acad-ac-cm-color> (<object>)
  (
  (pr-blue                     :accessor pr-blue                     :initarg :pr-blue                     :initform nil :documentation "pr-blue")
  (pr-book-name                :accessor pr-book-name                :initarg :pr-book-name                :initform nil :documentation "pr-book-name")
  (pr-color-index              :accessor pr-color-index              :initarg :pr-color-index              :initform nil :documentation "pr-color-index")
  (pr-color-method             :accessor pr-color-method             :initarg :pr-color-method             :initform nil :documentation "pr-color-method")
  (pr-color-name               :accessor pr-color-name               :initarg :pr-color-name               :initform nil :documentation "pr-color-name")
  (pr-entity-color             :accessor pr-entity-color             :initarg :pr-entity-color             :initform nil :documentation "pr-entity-color")
  (pr-green                    :accessor pr-green                    :initarg :pr-green                    :initform nil :documentation "pr-green")
  (pr-red                      :accessor pr-red                      :initarg :pr-red                      :initform nil :documentation "pr-red")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D24C6BB5-5F87-42E7-907F-F27226B330E3\"](AcCmColor Object (ActiveX))"))

(defparameter *acad-ac-cm-color-properties* '(pr-blue pr-book-name pr-color-index pr-color-method pr-color-name pr-entity-color pr-green pr-red))

(mapcar #'dxf/utils:make-slot (set-difference *acad-ac-cm-color-properties* *object-properties*))
