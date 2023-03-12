;;;; ./dxf/tests/dxf-text.lisp

(in-package :dxf/tests)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Тестирование dxf-in-t-sections.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def-suite dxf-t-tests
  :description "Мастер-набор тестов текстового режима проекта dxf."
  :in all-tests)

(in-suite dxf-t-tests)

(def-fixture fix-dxf-text ()
  (let  ((dxf-path (concatenate 'string (namestring (asdf:system-source-directory  :dxf)) "dxf/")))
    (let* ((lt-2000-metric (dxf:dxf-in-t-fname (concatenate 'string dxf-path "metric/LT-2000-metric.dxf")))
	   (lt-2004-metric (dxf:dxf-in-t-fname (concatenate 'string dxf-path "metric/LT-2004-metric.dxf")))
	   (lt-2007-metric (dxf:dxf-in-t-fname (concatenate 'string dxf-path "metric/LT-2007-metric.dxf")))
	   (lt-2010-metric (dxf:dxf-in-t-fname (concatenate 'string dxf-path "metric/LT-2010-metric.dxf")))
	   (lt-2013-metric (dxf:dxf-in-t-fname (concatenate 'string dxf-path "metric/LT-2013-metric.dxf")))
	   (ac-2018-metric (dxf:dxf-in-t-fname (concatenate 'string dxf-path "metric/AutoCAD-2018-metric.dxf")))
	   (Drawing-sty    (dxf:dxf-in-t-fname (concatenate 'string dxf-path "Drawing-sty.dxf"))))
      (&body))))

(def-test dxf-text-dxf-in-t-fname ()
  "Проверка считывания файлов."
  (with-fixture fix-dxf-text ()
    (is-true lt-2000-metric)
    (is-true lt-2004-metric)
    (is-true lt-2007-metric)
    (is-true lt-2010-metric)
    (is-true lt-2013-metric)
    (is-true ac-2018-metric)
    ))

;;;; (dxf:split-entities (dxf:dxf-in-t-fname "~/quicklisp/local-projects/acad/dxf/dxf/Drawing-sty.dxf"))
;;;;(split-entities *Drawing-sty*)
;;;;(table-and-items "LAYER" (split-tables *Drawing-sty*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
