(in-package :dxf/classes)

(defclass <acad-summary-info> (<object>)
  (
  (pr-author                   :accessor pr-author                   :initarg :pr-author                   :initform nil :documentation "pr-author")
  (pr-comments                 :accessor pr-comments                 :initarg :pr-comments                 :initform nil :documentation "pr-comments")
  (pr-hyperlink-base           :accessor pr-hyperlink-base           :initarg :pr-hyperlink-base           :initform nil :documentation "pr-hyperlink-base")
  (pr-keywords                 :accessor pr-keywords                 :initarg :pr-keywords                 :initform nil :documentation "pr-keywords")
  (pr-last-saved-by            :accessor pr-last-saved-by            :initarg :pr-last-saved-by            :initform nil :documentation "pr-last-saved-by")
  (pr-revision-number          :accessor pr-revision-number          :initarg :pr-revision-number          :initform nil :documentation "pr-revision-number")
  (pr-subject                  :accessor pr-subject                  :initarg :pr-subject                  :initform nil :documentation "pr-subject")
  (pr-title                    :accessor pr-title                    :initarg :pr-title                    :initform nil :documentation "pr-title")
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A029FB49-B0DB-43E4-8888-698E1BF49878\"](SummaryInfo Object (ActiveX))"))

(defparameter *acad-summary-info-properties* '(pr-author pr-comments pr-hyperlink-base pr-keywords pr-last-saved-by pr-revision-number pr-subject pr-title))

(mapcar #'dxf/utils:make-slot (set-difference *acad-summary-info-properties* *object-properties*))
