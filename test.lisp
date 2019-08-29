;;;; test.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *dxf-path* "~/quicklisp/local-projects/acad/dxf/dxf/")

(defparameter *model-space*
  (list
   (make-instance 'db-point)
   (make-instance 'db-point :position-point (vector 35 45 15) :ecs-rotation (/ pi 6) :entity-layer "Points" :entity-color 6 :normal (vector 0 1 0))
   (make-instance 'db-line )
   (make-instance 'db-line :start-point (vector 10. 30. 50.0) :end-point (vector 20. 40. 10.0) :entity-layer "Lines" :entity-color 3)
   (make-instance 'db-circle)
   (make-instance 'db-circle :center (vector 51 65 0) :radius 48.6 :entity-color 75 :entity-layer "Circles" :entity-color 2)
   (make-instance 'db-arc)
   (make-instance 'db-arc :center (vector 25 15 0) :radius 18.6 :entity-color 70 :start-angle (* 1.9999 pi) :end-angle (* 3.999 pi))
   (make-instance 'db-text :position-point (vector 30 20 0) :rotation (* *degree-to-radian* 120) :text-string "This is the TEXT string!" :width-factor 1/3 :oblique (* *degree-to-radian* 15))
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;(make-instance 'Db-Ellipse)
   ;;(make-instance 'Db-Ellipse :center (vector 10 20 0) :entity-color 3 :entity-layer "Ellipses" :major-axis (vector 2 0 0) :radius-ratio 0.5D0 :start-param (* *degree-to-radian* 120) :end-param (* *degree-to-radian* 390))
   (make-instance 'Db-Ray)
   ;;(make-instance 'Db-Ray :base-point (vector 51 65 0) :unit-dir (vector 1 0 0))
   ))

(defun test-bin ()
  (defparameter *o* (open (concatenate 'string *dxf-path* "12345-bin.dxf" )  :direction :output :element-type 'unsigned-byte :if-exists :supersede))
  (dxf-out-b-header *o*) (dxf-out-b-string 0 *section* *o*) (dxf-out-b-string 2 *section-entities* *o*)
  (mapc #'(lambda (el) (dxf-out-binary el *o*)) *model-space* )
  (dxf-out-b-string 0 *endsec* *o*)
  (dxf-out-b-string 0 *eof* *o*)
  (close *o*))

(test-bin) 

(defun test-txt ()
  (defparameter *o* (open (concatenate 'string *dxf-path* "12345-txt.dxf" )  :direction :output :if-exists :supersede))
  (dxf-out-t-header *o*) (dxf-out-t-string 0 *section* *o*) (dxf-out-t-string 2 *section-entities* *o*)
  (mapc #'(lambda (el) (dxf-out-text el *o*)) *model-space* )
  (dxf-out-t-string 0 *endsec* *o*)
  (dxf-out-t-string 0 *eof* *o*)
  (close *o*))

(test-txt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование для секции заголовка
(let ((h (make-instance 'Db-Header))) (header-vars h) (dxf-out-text h t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Table-Block
(progn
  (defparameter *t-br*  (make-instance 'db-symbol-tbl :object-owner #x0 :object-handle #x1  :symbol-tbl-name "BLOCK_RECORD" :symbol-tbl-flag 1 ))
  (defparameter *m-s*   (make-instance 'db-block-tr   :object-handle #x1F :object-owner #x1 :symbol-tr-flag 0 :symbol-tr-name "*Model_Space"  :block-tr-layout #x22 :block-tr-explodability 1 :block-tr-scalability  0))
  (defparameter *p-s*   (make-instance 'db-block-tr   :object-handle #xD6 :object-owner #x1 :symbol-tr-flag 0 :symbol-tr-name "*Paper_Space"  :block-tr-layout #xD3 :block-tr-explodability 1 :block-tr-scalability  0))
  (defparameter *p-s-0* (make-instance 'db-block-tr   :object-handle #xD2 :object-owner #x1 :symbol-tr-flag 0 :symbol-tr-name "*Paper_Space0" :block-tr-layout #xD7 :block-tr-explodability 1 :block-tr-scalability  0))
  (mapc #'(lambda (el) (push el (symbol-tbl-items *t-br*))) (list *m-s* *p-s* *p-s-0*))
  (dxf-out-text *t-br* t))



;;;; Table-Layer
(progn
  (defparameter *t-la* (make-instance 'db-symbol-tbl :object-owner #x0 :object-handle #x2  :symbol-tbl-name "LAYER" :symbol-tbl-flag 1 ))
  (defparameter *la-0* (make-instance 'db-layer-tr
				      :object-handle #x10 :object-owner #x2
				      :symbol-tr-name "0" :symbol-tr-flag 0
				      :layer-tr-color 7 :layer-tr-ltype "Continuous"
				      :layer-tr-lweight -3 :layer-tr-plot-style #xF :layer-tr-material #xEE :layer-tr-visual-style #x0))
  (mapc #'(lambda (el) (push el (symbol-tbl-items *t-la*))) (list *la-0*))
  (dxf-out-text *t-la* t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dxf-sort-handles (fname)
  "Выборка handles из dxf-файла.

Пример использования:
@begin[lang=lisp](code)
 (dxf-sort-handles \"d:/PRG/msys32/home/namatv/quicklisp/local-projects/acad/dxf/dxf/Drawing1.dxf\")
@end(code)
"

  (with-open-file (fff fname)
    (do* ((lst nil)
	  (code (parse-integer (string-trim "" (read-line fff))) (parse-integer (string-trim "" (read-line fff)))) 
	  (str (string-trim "" (read-line fff)) (string-trim "" (read-line fff))))
	 ((and (= code 0) (string= str "EOF"))
	  (sort 
	   (mapcar 
	    #'(lambda (el)
		(list (first el) (second el) (parse-integer (second el) :radix 16) ))
	    lst) #'<  :key #'third))
      (when (= code 5) (push (list code str) lst)))))

(defun dxf-sort-handles (fname)
  "Выборка handles из dxf-файла."
  (with-open-file (fff fname)
    (do* ((lst nil)
	  (code (parse-integer (string-trim "" (read-line fff))) (parse-integer (string-trim "" (read-line fff)))) 
	  (str (string-trim "" (read-line fff)) (string-trim "" (read-line fff))))
	 ((and (= code 0) (string= str "EOF"))
	  (sort 
	   (mapcar 
	    #'(lambda (el)
		(list (first el) (second el) (parse-integer (second el) :radix 16) ))
	    lst) #'<  :key #'third))
      (when (= code 5) (push (list code str) lst)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Тестирование dxf-in-t-sections.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *s*
  (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/2000-txt-clean.dxf")
    (dxf-in-t-split-by-sections stream)))

(with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/2000-txt-clean-my.dxf" :direction :output :if-exists :supersede)
  (dxf-out-by-sections *s* stream))


(dxf-out-text (make-instance 'db-ray) t)

(progn
  (defparameter *lt-2-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))

  (defparameter *lt-2000-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2000-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))

  (defparameter *lt-2004-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2004-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))

  (defparameter *lt-2007-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2007-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))

  (defparameter *lt-2010-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2010-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))

  (defparameter *lt-2013-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/LT-2013-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))

  (defparameter *autocad-2018-metric*
    (with-open-file (stream "~/quicklisp/local-projects/acad/dxf/dxf/metric/AutoCAD-2018-metric.dxf" )
      (dxf-in-t-split-by-sections stream)))
  )
