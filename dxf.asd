;;;; dxf.asd

(defsystem "dxf"
  :description "Describe dxf here"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :serial nil
  :in-order-to ((test-op (test-op "dxf/tests")))
  :depends-on ("babel" "ieee-floats" "mnas-string")
  :components ((:module "src"
		:serial t
                :components ((:file "package")
	                     (:file "code-by-value-range")
	                     (:file "dxf")	       
	                     (:file "header-section-group-codes")
	                     (:file "header-section-group-codes-list")
	                     (:file "db-classes")
                             (:file "db-symbol-table-record-classes")
 	                     (:file "dxf-in-t-sections")
	                     (:file "test-color")
	                     (:file "test-dxf")
                             ;;(:file "test")	       
                             ))))

(defsystem "dxf/tests"
  :description "Тестирование систем, входящих  в проект Dfx"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on (:dxf :fiveam)
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/tests :tests))
  :components ((:module "tests"
		:serial t
		:components ((:file "package")
			     (:file "main")
			     (:file "dxf-text")
			     (:file "main-run")))))

(defsystem "dxf/docs"
  :description "Зависимости для сборки документации"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("dxf" "codex" "mnas-package")
  :components ((:module "src/docs"
		:serial nil
                :components ((:file "docs")))))
