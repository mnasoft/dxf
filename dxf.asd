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
               #+nil "dxf/out"
               "dxf/out/txt"
               "dxf/out/bin"               
               "dxf/vars"
               "dxf/in/txt"
               "dxf/in/bin"
               "dxf/utils")
;;;; "babel" "ieee-floats"
  :components ((:module "src"
		:serial t
                :components ((:file "dxf")
	                     (:file "test-color")
	                     ;;(:file "test-dxf")
                             ;;(:file "test")	       
                             ))))

(defsystem "dxf/in/txt"
  :description
  "@b(Описание:) система @b(dxf/in/txt) содержит низкоуровневые
 функции для преобразования dxf-файла в перечень dxf-пар."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :depends-on ("dxf/split" "mnas-string")
  :components ((:module "src/in/txt"
		:serial t
		:components ((:file "txt")))))

(defsystem "dxf/in/bin"
  :description
  "@b(Описание:) система @b(dxf/in/bin) позволяет преобразовать
  dxf-файл, сохраненный в бинарном формате в его посекционное
  представление. Главная функция проекта - @b(dxf-in-b-fname).  

  Кроме того, система содержит низкоуровневые функции чтения:
@begin(list)
 @item(знаковых и беззнаковых целых чисел размером 2, 4, 8 и 16 байт;)
 @item(вещественнх чисел и плавающей точкой размером 4 и 8 байт.)
@end(list)
  "
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :depends-on ("babel" "dxf/const" "dxf/split" "dxf/b-arr" "ieee-floats")
  :components ((:module "src/in/bin"
		:serial t
		:components ((:file "bin")))))

(defsystem "dxf/const"
  :description
  "@b(Описание:) система @b(dxf/const) определяет константы для операций
 чтениня и записи.
  "
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :components ((:module "src/const"
		:serial t
		:components ((:file "const")))))

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

(defsystem "dxf/out/txt"
  :description
  "@b(Описание:) система @b(dxf/b-arr) определяет низкоуровневые
   функции записи dxf в текстовом формате - файла AutoCAD."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :depends-on ("babel" "dxf/sec" )
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/b-arr :tests))
  :components ((:module "src/out/txt"
		:serial t
		:components ((:file "txt")))))

(defsystem "dxf/out/bin"
  :description
  "@b(Описание:) система @b(dxf/b-arr) определяет низкоуровневые
   функции записи dxf в бинарном формате - файла AutoCAD."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :depends-on ("babel" "ieee-floats" "dxf/b-arr" "dxf/const" "dxf/sec")
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/b-arr :tests))
  :components ((:module "src/out/bin"
		:serial t
		:components ((:file "bin")))))

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

(defsystem "dxf/utils"
  :description
  "@b(Описание:) система @b(dxf/utils) содержит вспомогательные 
 функции для построения кода."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :components ((:module "src/utils"
		:serial t
		:components ((:file "utils")))))

(defsystem "dxf/split"
  :description
  "@b(Описание:) система @b(dxf/split) содержит вспомогательные функции
   для разделения dxf-пар на группы, представляющие данные какого-то
   объекта."
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"
  :depends-on ("dxf/sec")
  :components ((:module "src/split"
		:serial t
		:components ((:file "split")))))

(defsystem "dxf/docs"
  :description "Зависимости для сборки документации"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("dxf" "codex" "mnas-package")
  :components ((:module "src/docs"
		:serial nil
                :components ((:file "docs")))))

(defsystem "dxf/tests"
  :description "Тестирование систем, входящих  в проект dxf"
  :author "Nick Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("dxf" "fiveam")
  :perform (test-op (o s)
		    (uiop:symbol-call :dxf/tests :run-tests))
  :components ((:module "src/tests"
		:serial nil
                :components ((:file "tests")))
               (:module "src/tests/suites"
                :depends-on ("src/tests")
		:serial nil
                :components ((:file "core")
                             ))
               (:module "src/tests/run"
                :depends-on ("src/tests/suites")
		:serial nil
                :components ((:file "run")))))


