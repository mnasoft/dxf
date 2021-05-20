;;;; test-dxf.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *dxf-path*
  (concatenate 'string
               (namestring (asdf:system-source-directory  :dxf)) "dxf/"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Тестирование dxf-in-t-sections.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defparameter *lt-2-metric*         (dxf-in-t-fname "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2-metric.dxf"))
(defparameter *lt-2000-metric*      (dxf-in-t-fname (concatenate 'string *dxf-path* "metric/LT-2000-metric.dxf")))
(defparameter *lt-2004-metric*      (dxf-in-t-fname (concatenate 'string *dxf-path* "metric/LT-2004-metric.dxf")))
(defparameter *lt-2007-metric*      (dxf-in-t-fname (concatenate 'string *dxf-path* "metric/LT-2007-metric.dxf")))
(defparameter *lt-2010-metric*      (dxf-in-t-fname (concatenate 'string *dxf-path* "metric/LT-2010-metric.dxf")))
(defparameter *lt-2013-metric*      (dxf-in-t-fname (concatenate 'string *dxf-path* "metric/LT-2013-metric.dxf")))
(defparameter *autocad-2018-metric* (dxf-in-t-fname (concatenate 'string *dxf-path* "metric/AutoCAD-2018-metric.dxf")))
;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Drawing-sty*
  (dxf-in-t-fname (concatenate 'string *dxf-path* "Drawing-sty.dxf")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*Drawing-sty*

(split-entities *Drawing-sty*)

(table-and-items "LAYER" (split-tables *Drawing-sty*))

