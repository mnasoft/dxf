;;;; test-dxf.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *dxf-path*
  (concatenate 'string
               (namestring (asdf:system-source-directory  :dxf)) "dxf/"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Тестирование dxf-in-t-sections.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *lt-2-metric*         (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-R12-LT-2-metric.dxf"))))
(defparameter *lt-2000-metric*      (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-2000-LT-2000-metric.dxf"))))
(defparameter *lt-2004-metric*      (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-2004-LT-2004-metric.dxf"))))
(defparameter *lt-2007-metric*      (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-2007-LT-2007-metric.dxf"))))
(defparameter *lt-2010-metric*      (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-2010-LT-2010-metric.dxf"))))
(defparameter *lt-2013-metric*      (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-2013-LT-2013-metric.dxf"))))
(defparameter *autocad-2018-metric* (dxf/in/txt:read-file (probe-file (concatenate 'string *dxf-path* "metric/AutoCAD-2018-metric.dxf"))))
;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Drawing-sty*
  (dxf/in/txt:read-file (concatenate 'string *dxf-path* "txt/Drawing-sty.dxf")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*Drawing-sty*

(split-entities *Drawing-sty*)

(table-and-items "LAYER" (split-tables *Drawing-sty*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование секции заголовка
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *hdr* (make-instance '<db-header>))
(dxf-out-text *hdr* t)
(defparameter *hdr-min* (make-instance '<db-header> :header-vars *h-vars-list-min* ))
(dxf-out-text *hdr-min* t)
