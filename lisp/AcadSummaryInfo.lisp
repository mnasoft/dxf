(defclass <acad-summary-info> (<object>)
  (
  (ac-author                   :accessor ac-author                   :initarg :ac-author                   :initform nil :documentation "ac-author")
  (ac-comments                 :accessor ac-comments                 :initarg :ac-comments                 :initform nil :documentation "ac-comments")
  (ac-hyperlink-base           :accessor ac-hyperlink-base           :initarg :ac-hyperlink-base           :initform nil :documentation "ac-hyperlink-base")
  (ac-keywords                 :accessor ac-keywords                 :initarg :ac-keywords                 :initform nil :documentation "ac-keywords")
  (ac-last-saved-by            :accessor ac-last-saved-by            :initarg :ac-last-saved-by            :initform nil :documentation "ac-last-saved-by")
  (ac-revision-number          :accessor ac-revision-number          :initarg :ac-revision-number          :initform nil :documentation "ac-revision-number")
  (ac-subject                  :accessor ac-subject                  :initarg :ac-subject                  :initform nil :documentation "ac-subject")
  (ac-title                    :accessor ac-title                    :initarg :ac-title                    :initform nil :documentation "ac-title")
  )
  (:documentation "Accesses drawing properties such as the Title, Subject, Author, and Keywords properties."))

(defparameter *acad-summary-info-properties* '(ac-author ac-comments ac-hyperlink-base ac-keywords ac-last-saved-by ac-revision-number ac-subject ac-title))

(mapcar #'dxf/utils:make-slot (set-difference *acad-summary-info-properties* *object-properties*))
