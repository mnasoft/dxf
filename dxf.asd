;;;; dxf.asd

(defsystem #:dxf
  :description "Describe dxf here"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :serial t
;;;;  :depends-on (#:babel #:ie3fp #:mnas-string)
  :depends-on (#:babel #:ieee-floats #:mnas-string)
  :components ((:file "package")
	       (:file "dxf-string")
	       (:file "colors")
	       (:file "line-weights")
	       (:file "byte-array")
	       (:file "code-by-value-range")
	       (:file "dxf")	       
	       (:file "header-section-group-codes")
	       (:file "header-section-group-codes-list")
	       (:file "db-classes")
	       (:file "db-symbol-table-record-classes")
	       (:file "dxf-in-t-sections.lisp")
	       (:file "test-color")
	       
;	       (:file "test")
	       ))




