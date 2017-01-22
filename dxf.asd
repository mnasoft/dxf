;;;; dxf.asd

(asdf:defsystem #:dxf
  :description "Describe dxf here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :serial t
  :depends-on (#:babel #:ie3fp)
  :components ((:file "package")
	       (:file "colors")
	       (:file "line-weights")
	       (:file "byte-array")
	       (:file "code-by-value-range")
	       (:file "dxf")	       
	       (:file "header-section-group-codes")
	       (:file "db-classes")
	       (:file "db-symbol-table-record-classes")
	       ))


