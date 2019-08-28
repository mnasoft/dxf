;;;; test-2.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *dxf-path* "d:/PRG/msys/home/namatv/quicklisp/local-projects/acad/dxf/dxf/")

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

(defun read-code-value (i-stream)
  
  )




(defun read-dxf-code-value-t (is-dxf-t)
  (let ((code (parse-integer (string-trim "" (read-line is-dxf-t))))
	(str  (string-trim "" (read-line is-dxf-t))))
  (list code  str)
  ))

(read-dxf-code-value-t *is* )

(defparameter *str* (second (read-dxf-code-value-t *is* )))

(read-from-string *str*)

(require :mnas-string )

(defun read-from-string-string (str) str)

(defun read-from-string-int16 (str) (parse-integer str))

(defun read-from-string-int32 (str) (parse-integer str))

(defun read-from-string-int64 (str) (parse-integer str))

(defun read-from-string-hex (str) (parse-integer str :radix 16))

(defun read-from-string-double (str)
  "Выполняет чтение из строки вещественного числа.
Если число не удалось считать - возвращается default.
Пример использования:

 (read-from-string-double \"1.0\")
 (read-from-string-double \"1.0e10\")
 (read-from-string-double \"1.0E5\")
"
  (let ((s-e-d (mnas-string:string-replace-all
		(mnas-string:string-replace-all
		 (mnas-string:string-replace-all str "e" "d") "E" "d")"D" "d")))
    (if (member #\d (coerce  s-e-d 'list ))
	(read-from-string s-e-d)
	(read-from-string (concatenate 'string s-e-d "d0")))))


(defun dxf-in-t-read-from-string (code str)
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (read-from-string-string str)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (read-from-string-hex    str))
    ((<= 10 code 19)     (read-from-string-double str)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (read-from-string-double str)) 
    ((<= 40 code 59)     (read-from-string-double str)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (read-from-string-int32  str)) ;;;; 32-bit integer value
    ((= 100 code)        (read-from-string-string str)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 102 code)        (read-from-string-string str)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 105 code)        (read-from-string-hex    str)) ;;;; String representing hexadecimal (hex) handle value
    ((<= 110 code 119)   (read-from-string-double str)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (read-from-string-double str)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (read-from-string-double str)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (read-from-string-double str)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (read-from-string-int64  str)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (read-from-string-int64  str)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (read-from-string-double str)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (read-from-string-int16  str)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (read-from-string-string str)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (read-from-string-hex    str)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (read-from-string-hex    str)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (read-from-string-hex    str)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (read-from-string-hex    str)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (read-from-string-string str)) ;;;; String
    ((<= 420 code 429)   (read-from-string-int32  str)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (read-from-string-string str)) ;;;; String
    ((<= 440 code 449)   (read-from-string-int32  str)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (read-from-string-int64  str)) ;;;; Long
    ((<= 460 code 469)   (read-from-string-double str)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (read-from-string-string str)) ;;;; String
    ((<= 480 code 481)   (read-from-string-hex    str)) ;;;; String representing hex handle value
    ((= 999 code)        (read-from-string-string str)) ;;;; string)
    ((<= 1000 code 1009) (read-from-string-string str)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (read-from-string-double str)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (read-from-string-int16  str)) ;;;; 16-bit integer value
    ((= 1071 code)       (read-from-string-int32  str)) ;;;; 32-bit integer value
    (t (error "dxf-in-t-read-from-string code=~a str=~a~%Ucnoun code." code str  ))
    ))

(defun dxf-in-t-pair (stream)
  ""
  (let* ((code-string (read-dxf-code-value-t stream))
	 (code (first code-string ))
	 (str (second code-string )))
    (list code (dxf-in-t-read-from-string code str))))



(defun dxf-in-t (fname)
  (with-open-file (is fname)
    (let ((pairs-lst nil))
      (do ((pair (dxf-in-t-pair is) (dxf-in-t-pair is)))
	  ((and (= 0 (first pair )) (string= (second pair) "EOF")) (nreverse pairs-lst))
	(push pair pairs-lst)))))

(dxf-in-t "d:/PRG/msys/home/namatv/quicklisp/local-projects/acad/dxf/dxf/2000-txt-clean.dxf")

(defun dxf-in-t-sections (pairs-list)
  (
   (0 "ENDSEC")

   (mapc 
