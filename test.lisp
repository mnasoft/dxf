;;;; test.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *dxf-path* "~/quicklisp/local-projects/clisp/dxf/dxf/")

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
   ;;(make-instance 'Db-Ray)
   ;;(make-instance 'Db-Ray :base-point (vector 51 65 0) :unit-dir (vector 1 0 0))
   ))

(defun test-bin ()
  (defparameter *o* (open (concatenate 'string *dxf-path* "12345-bin.dxf" )  :direction :output :element-type 'unsigned-byte :if-exists :supersede))
  (dxf-out-b-header *o*) (dxf-out-b-string 0 *section* *o*) (dxf-out-b-string 2 *entities* *o*)
  (mapc #'(lambda (el) (dxf-out-binary el *o*)) *model-space* )
  (dxf-out-b-string 0 *endsec* *o*)
  (dxf-out-b-string 0 *eof* *o*)
  (close *o*))

(test-bin)

(defun test-txt ()
  (defparameter *o* (open (concatenate 'string *dxf-path* "12345-txt.dxf" )  :direction :output :if-exists :supersede))
  (dxf-out-t-header *o*) (dxf-out-t-string 0 *section* *o*) (dxf-out-t-string 2 *entities* *o*)
  (mapc #'(lambda (el) (dxf-out-text el *o*)) *model-space* )
  (dxf-out-t-string 0 *endsec* *o*)
  (dxf-out-t-string 0 *eof* *o*)
  (close *o*))

(test-txt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование для секции заголовка
(let ((h (make-instance 'Db-Header))) (header-vars h) (dxf-out-text h t))





