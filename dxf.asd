;;;; dxf.asd

(defsystem "dxf"
  :description
  "@b(Описание:) система @b(dxf) проект определяет функции для чтения
  и записи файлов в формате
  [[https://en.wikipedia.org/wiki/AutoCAD_DXF][DXF]]."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :serial nil
  :in-order-to ((test-op (test-op "dxf/tests")))
  :depends-on ("mnas-string"
               "dxf/color"
               "dxf/sec"
               "dxf/out"
               "dxf/vars")
;;;; "babel" "ieee-floats"
  :components ((:module "src"
		:serial t
                :components ((:file "dxf")
	                     (:file "test-color")
	                     (:file "test-dxf")
                             ;;(:file "test")	       
                             ))))

(defsystem "dxf/sec"
  :description
  "@b(Описание:) система @b(dxf/sec) содержит строковые константы,
 используемые для текстового представления dxf файла."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :components ((:module "src/sec"
		:serial t
		:components ((:file "sec")))))

(defsystem "dxf/color"
  :description
  "@b(Описание:) система @b(dxf/color) определяет базовые операции с
 цветом."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/b-arr :tests))
  :components ((:module "src/color"
		:serial t
		:components ((:file "color")))))

(defsystem "dxf/b-arr"
  :description
  "@b(Описание:) система @b(dxf/b-arr) определяет низкоуровневые
   функции чтения записи dxf - файла AutoCAD."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/b-arr :tests))
  :components ((:module "src/b-arr"
		:serial t
		:components ((:file "b-arr")))))

(defsystem "dxf/out"
  :description
  "@b(Описание:) система @b(dxf/b-arr) определяет низкоуровневые
   функции чтения записи dxf - файла AutoCAD."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :depends-on ("babel" "ieee-floats" "dxf/b-arr")
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/b-arr :tests))
  :components ((:module "src/out"
		:serial t
		:components ((:file "out")))))

(defsystem "dxf/vars"
  :description
  "@b(Описание:) система @b(dxf/vars) содержит системные переменные
   AutoCAD. Её назначение состоит исключительно для документирования
   системных переменных."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/vars :tests))
  :components ((:module "src/vars"
		:serial t
		:components ((:file "vars")))))

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
