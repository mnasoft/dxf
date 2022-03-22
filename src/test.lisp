;;;; test.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *dxf-path* "~/quicklisp/local-projects/acad/dxf/dxf/")


(defparameter *Drawing-sty* (dxf-in-t-fname (concatenate 'string *dxf-path* "Drawing-sty.dxf")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *model-space*
  (list
   (make-instance '<acad-point>)
   (make-instance '<acad-point> :coordinates (vector 35 45 15) :ecs-angle (/ pi 6) :layer "Points"
                                :true-color (dxf/color:index 6)
                                :normal (vector 0 1 0))
   (make-instance '<acad-line>)
   (make-instance '<acad-line>  :startpoint (vector 10. 30. 50.0) :endpoint (vector 20. 40. 10.0) :layer "Lines" :true-color (dxf/color:index 3))
   (make-instance '<acad-circle>)
   (make-instance '<acad-circle> :center (vector 51 65 0) :radius 48.6 :true-color (dxf/color:index 75) :layer "Circles")
   (make-instance '<acad-arc>)
   (make-instance '<acad-arc> :center (vector 25 15 0) :radius 18.6 :true-color (dxf/color:index 70) :start-angle (* 1.9999 pi) :end-angle (* 3.999 pi))
   (make-instance '<acad-text> :insertion-point (vector 30 20 0) :rotation (* *degree-to-radian* 120)
                               :text-string "This is the TEXT string!" :scale-factor 1/3 :oblique-angle (* *degree-to-radian* 15))
   (make-instance '<acad-ellipse>)
   (make-instance '<acad-ellipse>
                  :center (vector 10 20 0)
                  :true-color 3
                  :layer "Ellipses"
                  :major-axis (vector 2 0 0)
                  :radius-ratio 0.5D0
                  :start-parameter (* *degree-to-radian* 120)
                  :end-parameter (* *degree-to-radian* 390))
   
   (make-instance '<acad-ray>)
   (make-instance '<acad-ray> :base-point (vector 51 65 0) :direction-vector (vector 1 0 0))
   ))

(dxf-out-text
 (make-instance '<acad-point>
                :coordinates #(10 20 30)
                :true-color
                #+nil (dxf/color:index->entity 4)
                (dxf/color:rgb->entity '(255 0 255)))
 t)

(loop :for r :from 0 :to 255 :do
  (loop :for g :from 0 :to 255 :do
    (loop :for b :from 0 :to 255 :do
          )))

(with-open-file (os "~/points-rgb.dxf" :direction :output :if-exists :supersede)
  (loop :for r :from 0 :to 255 :do
    (loop :for g :from 0 :to 255 :do
      (loop :for b :from 11 :to 20  :do
        (dxf-out-text
         (make-instance '<acad-point>
                        :coordinates (vector (* r 10) (* g 10) (* b 10))
                        :true-color (dxf/color:rgb->entity `(,r ,g ,b)) #+nil (dxf/color:index->entity 4))
         os)))))


(dxf/color:rgb->entity `(0 0 255))




                                        ;   0
                                        ; POINT
                                        ; 100
                                        ; AcDbEntity
                                        ;   8
                                        ; 0
                                        ;  62
                                        ; 6
                                        ; 420
                                        ; 16711935
                                        ; 100
                                        ; AcDbPoint
                                        ;  10
                                        ; 10.000000000000
                                        ;  20
                                        ; 20.000000000000
                                        ;  30
                                        ; 30.000000000000
                                        ;  => NIL

62
     6
420
 16711935





(defparameter *ap* (make-instance '<acad-point>))
(layer                *ap*)
(line-type            *ap*)
(line-type-scale      *ap*)
(line-weight          *ap*) ;;;; -1 это странно
(true-color           *ap*)
(visible              *ap*)

(entity-transparency)
(hyperlinks)
(material)
(PlotStyleName)

(normal *ap* )
(ecs-angle *ap*)
(coordinates *ap*)
(thickness *ap*)



(mapcar #'(lambda (el)
            (dxf-out-text el t)) 
        *model-space*)

;;;;

(defun test-bin ()
  (defparameter *o* (open (concatenate 'string *dxf-path* "12345-bin.dxf" )  :direction :output :element-type 'unsigned-byte :if-exists :supersede))
  (dxf-out-b-header *o*)
  (dxf-out-b-string 0 *section* *o*)
  (dxf-out-b-string 2 *section-entities* *o*)
  (mapc #'(lambda (el)
            (dxf-out-binary el *o*))
        *model-space* )
  (dxf-out-b-string 0 *endsec* *o*)
  (dxf-out-b-string 0 *eof* *o*)
  (close *o*))

(test-bin) 

(defun test-txt ()
  (defparameter *o* (open (concatenate 'string *dxf-path* "12345-txt.dxf" )  :direction :output :if-exists :supersede))
  (dxf-out-t-header *o*)
  (dxf-out-t-string 0 *section* *o*)
  (dxf-out-t-string 2 *section-entities* *o*)
  (mapc #'(lambda (el)
            (dxf-out-text el *o*))
        *model-space*)
  (dxf-out-t-string 0 *endsec* *o*)
  (dxf-out-t-string 0 *eof* *o*)
  (close *o*))

(test-txt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование для секции заголовка
(let ((h (make-instance '<db-header>))) (header-vars h) (dxf-out-text h t))

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
;;;; Тестирование <Acad-Line>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (defparameter *line* (make-instance '<acad-line>))
  (dxf-in-text *line* '((0 "LINE") (5 2499) (330 112)
			(100 "AcDbEntity") (8 "0") (6 "158-2 Трамвайные линии") (62 0)
			(100 "AcDbLine") (10 -52.76377270404833d0) (20 2.063090847165234d0) (30 0.0d0)
			(11 37.07532904481968d0) (21 -81.68118962192304d0) (31 0.0d0)))
  (dxf-out-text *line* t)
  (dxf-in-text *line* '((0 "LINE") (5 2498) (330 112) (100 "AcDbEntity") (8 "0") (6 "158-2 Трамвайные линии") (100 "AcDbLine") (10 37.07532904481968d0) (20 85.8073713162535d0) (30 0.0d0) (11 37.07532904481968d0) (21 -81.68118962192304d0) (31 0.0d0)))
  (dxf-out-text *line* t)
  (dxf-in-text *line* '((0 "LINE") (5 2497) (330 112) (100 "AcDbEntity") (8 "0") (6 "158-2 Трамвайные линии") (62 4) (100 "AcDbLine") (10 -52.76377270404833d0) (20 2.063090847165234d0) (30 0.0d0) (11 37.07532904481968d0) (21 85.8073713162535d0) (31 0.0d0)))
  (dxf-out-text *line* t)
  (dxf-in-text *line* '((0 "LINE") (5 2496) (330 112) (100 "AcDbEntity") (8 "488880") (6 "158-2 Трамвайные линии") (62 72) (420 7524399) (100 "AcDbLine") (10 -6.881102092627656d0) (20 2.063090847165234d0) (30 0.0d0) (11 -83.53985847650065d0) (21 2.063090847165234d0) (31 0.0d0)))
  (dxf-out-text *line* t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-circle>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (defparameter *circle* (make-instance '<acad-circle>))
  (dxf-out-text *circle* t)
  (dxf-in-text *circle*
	       '((0 "CIRCLE") (5 1227) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "158-2 Трамвайные линии") (62 72) (420 7524399)
		 (100 "AcDbCircle")
		 (10 -6.881102092627656d0) (20 2.063090847165234d0) (30 0.0d0) (40 45.88267061142068d0)))
  (dxf-out-text *circle* t)
  (dxf-in-text *circle*
	       '((0 "CIRCLE") (5 1227) (330 112) (100 "AcDbEntity") (8 "0") (6 "158-2 Трамвайные линии") (62 72) (420 7524399)
		 (100 "AcDbCircle") (10 -2.063090847165234d0) (20 -5.959209218249812d0) (30 3.440551046313827d0) (40 45.88267061142068d0)
		 (210 -0.5d0) (220 0.0d0) (230 0.8660254037844387d0)))
  (dxf-in-text *circle*
	       '((0 "CIRCLE") (5 1227) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "158-2 Трамвайные линии") (62 72) (420 7524399) (60 1)
		 (100 "AcDbCircle") (39 151.56d0) (10 -2.063090847165234d0) (20 -5.959209218249812d0) (30 3.440551046313826d0)
		 (40 45.88267061142068d0) (210 -0.5d0) (220 0.0d0) (230 0.8660254037844387d0)))

  (dxf-out-text *circle* t)
  (dxf-out-text *circle* t)

  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-arc>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *arc* (make-instance '<acad-arc>))
  (dxf-out-text *arc* t)
  (dxf-in-text *arc*)
  (dxf-in-text *arc*
	       '((0 "ARC") (5 2973) (330 112) (100 "AcDbEntity") (8 "0") (6 "ByBlock") (62 31)
		 (420 16698470) (100 "AcDbCircle") (39 56.55d0) (10 206.7245431057085d0)
		 (20 -101.416406435207d0) (30 58.55278955561129d0) (40 162.4715052489367d0)
		 (210 -0.5d0) (220 0.0d0) (230 0.8660254037844387d0) (100 "AcDbArc")
		 (50 162.0765372707215d0) (51 209.8212019122531d0)))
  (dxf-out-text *arc* t)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-point>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *point* (make-instance '<acad-point>))
  (dxf-out-text *point* t)
  (dxf-in-text *point*
	       '((0 "POINT") (5 3379) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги") (62 3) (370 -3)
		 ;; 370 -3 - default		 
		 (100 "AcDbPoint") (10 -169.7435348687984d0) (20 -147.2871708604306d0) (30 0.0d0)
		 (50 15.0d0))) 
  (dxf-in-text *point*
	       '((0 "POINT") (5 3087) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "ByBlock") (62 2) (48 3.0d0) (370 -2)
		 ;; 370 -2 - byblock 
		 (100 "AcDbPoint") (10 -233.9734901124375d0) (20 -31.91689564773179d0) (30 0.0d0)
		 (210 -0.7071067811865475d0) (220 1.0d-16) (230 0.7071067811865476d0)
		 (50 105.0d0)))
  (dxf-in-text *point*
	       '((0 "POINT") (5 3077) (330 112)
		 (100 "AcDbEntity") (8 "0")
		 (6 "155 Железные дороги") (62 1)
		 ;; 370 -1 or epsent - bylayer
		 (100 "AcDbPoint") (10 -205.8950251475403d0) (20 -154.6513322087467d0) (30 0.0d0)
		 (50 15.0d0)))
  )

(ecs-angle *point*)
(line-type-scale *point*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование acad-ray
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *ray* (make-instance 'acad-ray))
  (dxf-out-text *ray* t)
  (dxf-in-text *ray*
	       '((0 "RAY") (5 3417) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги") (62 2)
		 (100 "AcDbRay") (10 -82.66110209262766d0) (20 2.063090847165234d0) (30 131.2548101975695d0)
		 (11 0.2019479073924674d0) (21 -0.6936380848077369d0) (31 -0.6914356441521208d0))) 
  (dxf-in-text *ray*
	       '((0 "RAY") (5 3416) (330 112) (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги") (62 3)
		 (100 "AcDbRay") (10 -6.881102092627656d0) (20 2.063090847165234d0) (30 -1.8d-15) (11 -0.2735290549332379d0) (21 -0.9618637409255688d0) (31 0.0d0)))
  (dxf-in-text *ray*
	       '((0 "RAY") (5 3415) (330 112) (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги") (62 1)
		 (100 "AcDbRay") (10 -44.32545295625914d0) (20 -129.6098073281781d0) (30 0.0d0) (11 0.8617222312211023d0) (21 0.5073803269928046d0) (31 0.0d0)))
  )


(ecs-angle *ray*)
(line-type-scale *ray*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-xline>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *xline* (make-instance '<acad-xline>))
  (dxf-out-text *xline* t)
  (dxf-in-text *xline*
	       '((0 "XLINE") (5 3454) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги") (62 3)
		 (100 "AcDbXline") (10 -82.66110209262766d0) (20 2.063090847165234d0) (30 131.2548101975695d0)
		 (11 0.5000000000000001d0) (21 0.0d0) (31 -0.8660254037844389d0))) 
  (dxf-in-text *xline*
	       '((0 "XLINE") (5 3453) (330 112)
		 (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги") (62 1)
		 (100 "AcDbXline") (10 -82.66110209262766d0) (20 2.063090847165234d0) (30 131.2548101975695d0)
		 (11 0.2019479073924676d0) (21 -0.6936380848077432d0) (31 -0.6914356441521143d0))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование acad-ellipse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *ellipse* (make-instance 'acad-ellipse))
  (dxf-out-text *ellipse* t)
  (dxf-in-text *ellipse*
	       '((0 "ELLIPSE") (5 3498) (330 112) (100 "AcDbEntity") (8 "0")
		 (6 "155 Железные дороги") (100 "AcDbEllipse") (10 -46.06217253453486d0)
		 (20 2.063090847165232d0) (30 141.061463816504d0) (11 -4.0d-15)
		 (21 -69.99580859820539d0) (31 -5.0d-16) (210 -0.2588190451025207d0)
		 (220 0.0d0) (230 0.9659258262890682d0) (40 0.5413181268824068d0) (41 0.0d0)
		 (42 6.283185307179586d0)))
  (dxf-in-text *ellipse*
	       '((0 "ELLIPSE") (5 3497) (330 112) (100 "AcDbEntity") (8 "0")
		 (100 "AcDbEllipse") (10 -183.0690620716486d0) (20 4.074238142333342d0)
		 (30 0.0d0) (11 -22.77678210401791d0) (21 -18.99224937603867d0) (31 0.0d0)
		 (210 0.0d0) (220 0.0d0) (230 1.0d0) (40 0.5139533603459778d0)
		 (41 0.4805807624550848d0) (42 4.757323805338355d0)))
  (dxf-in-text *ellipse*
	       '((0 "ELLIPSE") (5 3497) (330 112) (100 "AcDbEntity") (8 "0") (6 "155 Железные дороги")
		 (100 "AcDbEllipse") (10 -183.0690620716486d0) (20 4.074238142333342d0) (30 0.0d0)
		 (11 -22.77678210401791d0) (21 -18.99224937603867d0) (31 0.0d0)
		 (210 0.0d0) (220 0.0d0) (230 1.0d0)
		 (40 0.5139533603459778d0) (41 0.0d0) (42 6.283185307179586d0))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-database>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *database* (make-instance '<acad-database>))

(elevationmodelspace *database*)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-layer>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *layer* (make-instance '<acad-layer>))
  (dxf-out-text *layer* t)
  (dxf-in-text *layer*
	       '((0 "LAYER") (5 4055) (330 2) (100 "AcDbSymbolTableRecord")
		 (100 "AcDbLayerTableRecord") (2 "Layer3") (70 7) (62 -81) (420 10616730)
		 (6 "Continuous") (290 0) (370 -3) (390 15) (347 33) (348 0)
		 (1001 "AcCmTransparency") (1071 0) (1001 "AcAecLayerStandard") (1000 "")
		 (1000 "Это чисто просто главно шмавно йоханно")))

  (name            *layer*)
  (handle          *layer*)
  (owner-id        *layer*)
  (plotstylename   *layer*)
  (plottable       *layer*)
  (material        *layer*)
  (freeze          *layer*)
  (viewportdefault *layer*)
  (used            *layer*)
  (layeron         *layer*)
  (line-type       *layer*)
  (line-weight     *layer*)
  (true-color      *layer*)
  )

(pairs             *layer*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-layers>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *layers* (make-instance '<acad-layers>))
  (dxf-in-text *layers* (split-tables *Drawing-sty*))
  (items *layers*)
  )

(dxf-in-text *layers* (table-and-items *acad-layer-class-marker* (split-tables *Drawing-sty*)))

(pairs *layers*)

(handle   *layers*)
(owner-id *layers*)

(setf (pairs *layers*) '((2 "LAYER") (5 2) (102 "{ACAD_XDICTIONARY") (360 442) (102 "}") (330 0) (100 "AcDbSymbolTable") (70 4)))

(dxf-in-text *layers* '((2 "LAYER") (5 2) (102 "{ACAD_XDICTIONARY") (360 442) (102 "}") (330 0) (100 "AcDbSymbolTable") (70 4)))
(dxf-out-text *layers* t)


'((2 "LTYPE") (5 5) (330 0) (100 "AcDbSymbolTable") (70 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Тестирование <acad-linetype>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(table-and-items "LTYPE" (split-tables *Drawing-sty*))

(progn 
  (defparameter *linetype* (make-instance '<acad-linetype>))
  (dxf-in-text *linetype*
	       '((0 "LTYPE") (5 91) (330 5) (100 "AcDbSymbolTableRecord")
		 (100 "AcDbLinetypeTableRecord") (2 "ByBlock") (70 0) (3 "") (72 65) (73 0)
		 (40 0.0d0)))
  (dxf-in-text *linetype*
	       '((0 "LTYPE") (5 92) (330 5) (100 "AcDbSymbolTableRecord")
		 (100 "AcDbLinetypeTableRecord") (2 "ByLayer") (70 0) (3 "") (72 65) (73 0)
		 (40 0.0d0)))
  (dxf-in-text *linetype*
	       '((0 "LTYPE") (5 92) (330 5) (100 "AcDbSymbolTableRecord")
		 (100 "AcDbLinetypeTableRecord") (2 "ByLayer") (70 0) (3 "") (72 65) (73 0)
		 (40 0.0d0)))
  (dxf-in-text *linetype*
	       '((0 "LTYPE") (5 464) (330 5) (100 "AcDbSymbolTableRecord")
		 (100 "AcDbLinetypeTableRecord") (2 "CENTER") (70 0)
		 (3 "________ _ ________ _ ________ _ ________ _ ___") (72 65) (73 5)
		 (40 20.5d0) (49 5.0d0) (74 0) (49 -2.0d0) (74 0) (49 0.5d0) (74 0)
		 (49 -2.0d0) (74 0) (49 11.0d0) (74 0)))
  (name *linetype*)
  (description *linetype*)
  (dxf-out-text *linetype* t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Тестирование <acad-linetypes>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *linetypes* (make-instance '<acad-linetypes>))
  (dxf-in-text *linetypes* (split-tables *Drawing-sty*))
  (items *linetypes*)
  )

(mapc
 #'(lambda (el)
     (dxf-out-text el t))
 (items *linetypes*))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Тестирование <acad-document>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *document* (make-instance '<acad-document>))

  (dxf-in-text *document* *Drawing-sty*)
  
  (activedimstyle  *document*)
  (activelayer     *document*)
  (activelayout    *document*)
  (activelinetype  *document*)
  (activematerial  *document*)
  (activespace     *document*)
  (activetextstyle *document*)

  (activetextstyle *document*)
  (activedimstyle  *document*)
  (activespace     *document*)

  (layers          *document*)
  (items (layers   *document*))
  )

(section-entities *document*)


(mapc
 #'(lambda (layer )
     (dxf-out-text layer t))
 (items (layers   *document*)))

(sec-classes *document*)

(sec-header *document*)

(with-open-file (os-dxf "d:/PRG/msys32/home/namatv/123.dxf" :direction :output :if-exists :supersede)
  (dxf-out-text  *document* os-dxf))

(dxf-out-text  *document* t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(mapcar #'car *Drawing-sty*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter *Drawing-sty* (dxf-in-t-fname "~/quicklisp/local-projects/acad/dxf/dxf/Drawing-sty.dxf"))
  )

(defparameter *t* nil)


(defun handent ())
(parse-integer "58" :radix 16)
(format t "~X" 623)

(mapcar
 #'(lambda (tbl)
     (list tbl (table-and-items tbl *s-tbl*)))
 '( "VPORT" "LTYPE" "LAYER" "STYLE" "VIEW" "UCS" "APPID" "DIMSTYLE" "BLOCK_RECORD"))



(setq mycircle
      (vla-addCircle mSpace
		     (vlax-3d-point '(3.0 3.0 0.0)) 2.0))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

'((2 "CLASSES")
  (0 "CLASS") (1 "ACDBDICTIONARYWDFLT")  (2 "AcDbDictionaryWithDefault")             (3 "ObjectDBX Classes")       (90 0)    (91 1)  (280 0) (281 0)
  (0 "CLASS") (1 "DICTIONARYVAR")        (2 "AcDbDictionaryVar")                     (3 "ObjectDBX Classes")       (90 0)    (91 9)  (280 0) (281 0)
  (0 "CLASS") (1 "TABLESTYLE")           (2 "AcDbTableStyle")                        (3 "ObjectDBX Classes")       (90 4095) (91 1)  (280 0) (281 0)
  (0 "CLASS") (1 "MATERIAL")             (2 "AcDbMaterial")                          (3 "ObjectDBX Classes")       (90 1153) (91 3)  (280 0) (281 0)
  (0 "CLASS") (1 "VISUALSTYLE")          (2 "AcDbVisualStyle")                       (3 "ObjectDBX Classes")       (90 4095) (91 24) (280 0) (281 0)
  (0 "CLASS") (1 "SCALE")                (2 "AcDbScale")                             (3 "ObjectDBX Classes")       (90 1153) (91 17) (280 0) (281 0)
  (0 "CLASS") (1 "MLEADERSTYLE")         (2 "AcDbMLeaderStyle")                      (3 "ACDB_MLEADERSTYLE_CLASS") (90 4095) (91 1)  (280 0) (281 0)
  (0 "CLASS") (1 "CELLSTYLEMAP")         (2 "AcDbCellStyleMap")                      (3 "ObjectDBX Classes")       (90 1152) (91 2)  (280 0) (281 0)
  (0 "CLASS") (1 "EXACXREFPANELOBJECT")  (2 "ExAcXREFPanelObject")                   (3 "EXAC_ESW")                (90 1025) (91 1)  (280 0) (281 0)
  (0 "CLASS") (1 "NPOCOLLECTION")        (2 "AcDbImpNonPersistentObjectsCollection") (3 "ObjectDBX Classes")       (90 1153) (91 1)  (280 0) (281 0)
  (0 "CLASS") (1 "LAYER_INDEX")          (2 "AcDbLayerIndex")                        (3 "ObjectDBX Classes")       (90 0)    (91 0)  (280 0) (281 0)
  (0 "CLASS") (1 "SPATIAL_INDEX")        (2 "AcDbSpatialIndex")                      (3 "ObjectDBX Classes")       (90 0)    (91 0)  (280 0) (281 0)
  (0 "CLASS") (1 "IDBUFFER")             (2 "AcDbIdBuffer")                          (3 "ObjectDBX Classes")       (90 0)    (91 0)  (280 0) (281 0)
  (0 "CLASS") (1 "ACDBSECTIONVIEWSTYLE") (2 "AcDbSectionViewStyle")                  (3 "ObjectDBX Classes")       (90 1025) (91 1)  (280 0) (281 0)
  (0 "CLASS") (1 "ACDBDETAILVIEWSTYLE")  (2 "AcDbDetailViewStyle")                   (3 "ObjectDBX Classes")       (90 1025) (91 1)  (280 0) (281 0))



(0 "TABLE")
(2 "APPID") (5 9) (330 0) (100 "AcDbSymbolTable") (70 9)

(0 "APPID") (5 18) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "ACAD") (70 0)
(0 "APPID") (5 158) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "ACAD_PSEXT") (70 0)
(0 "APPID") (5 307) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "AcadAnnoPO") (70 0)
(0 "APPID") (5 308) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "AcadAnnotative") (70 0)
(0 "APPID") (5 309) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "ACAD_DSTYLE_DIMJAG") (70 0)
(0 "APPID") (5 310) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "ACAD_DSTYLE_DIMTALN") (70 0)
(0 "APPID") (5 357) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "ACAD_MLEADERVER") (70 0)
(0 "APPID") (5 535) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "ACAD_NAV_VCDISPLAY") (70 0)
(0 "APPID") (5 560) (330 9) (100 "AcDbSymbolTableRecord") (100 "AcDbRegAppTableRecord") (2 "SHCKALA") (70 0)

(0 "ENDTAB") 


(dxf:
