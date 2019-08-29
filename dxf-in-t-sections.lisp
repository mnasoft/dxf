;;;; dxf-in-t-sections.lisp

(in-package #:dxf)

(defun read-dxf-code-value-t (is-dxf-t)
  "Считывает пару:
@begin(list)
 @item(dxf-код - в виде целого значения;)
 @item(значение, присоединенное к коду dxf - в виде строки.)
@end(list)
"
  (let ((code (parse-integer (string-trim "" (read-line is-dxf-t))))
	(str  (string-trim "" (read-line is-dxf-t))))
  (list code  str)))

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
    (t (error "dxf-in-t-read-from-string code=~a str=~a~%Ucnoun code." code str  ))))

(defun dxf-in-t-pair (stream)
  "Считываете одной dxf пары - ключ и значение из потока stream.
Возврвщает в виде списка."
  (let* ((code-string (read-dxf-code-value-t stream))
	 (code (first code-string ))
	 (str (second code-string )))
    (list code (dxf-in-t-read-from-string code str))))

(defun dxf-in-t-pairs (stream)
      (let ((pairs-lst nil))
      (do ((pair (dxf-in-t-pair stream) (dxf-in-t-pair stream)))
	  ((and (= 0 (first pair )) (string= (second pair) "EOF")) (nreverse pairs-lst))
	(push pair pairs-lst))))

(defun dxf-in-t-split-by-sections (stream)
  (let ((pairs-list (dxf-in-t-pairs stream))
	(sections nil)
	(section  nil))
    (dolist (i pairs-list (nreverse sections))
      (push i section)
      (when (equal i '(0 "ENDSEC"))
	(push (cdr (nreverse (cdr section))) sections)
	(setf section nil)))))

(defun dxf-out-t-pairs (code value stream)
  ""
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (dxf-out-t-string code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (dxf-out-t-hex    code value stream))
    ((<= 10 code 19)     (dxf-out-t-double code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (dxf-out-t-double code value stream)) 
    ((<= 40 code 59)     (dxf-out-t-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (dxf-out-t-int32  code value stream)) ;;;; 32-bit integer value
    ((= 100 code)        (dxf-out-t-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 102 code)        (dxf-out-t-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 105 code)        (dxf-out-t-hex    code value stream)) ;;;; String representing hexadecimal (hex) handle value
    ((<= 110 code 119)   (dxf-out-t-double code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (dxf-out-t-double code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (dxf-out-t-double code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (dxf-out-t-double code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (dxf-out-t-int64  code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (dxf-out-t-int64  code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (dxf-out-t-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (dxf-out-t-int16  code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (dxf-out-t-string code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (dxf-out-t-hex    code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (dxf-out-t-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (dxf-out-t-hex    code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (dxf-out-t-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (dxf-out-t-string code value stream)) ;;;; String
    ((<= 420 code 429)   (dxf-out-t-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (dxf-out-t-string code value stream)) ;;;; String
    ((<= 440 code 449)   (dxf-out-t-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (dxf-out-t-int64  code value stream)) ;;;; Long
    ((<= 460 code 469)   (dxf-out-t-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (dxf-out-t-string code value stream)) ;;;; String
    ((<= 480 code 481)   (dxf-out-t-hex    code value stream)) ;;;; String representing hex handle value
    ((= 999 code)        (dxf-out-t-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (dxf-out-t-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (dxf-out-t-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (dxf-out-t-int32  code value stream)) ;;;; 32-bit integer value
    (t (error "dxf-out-t-pairs code=~a str=~a~%Ucnoun code." code value))))

(defun dxf-out-by-sections (sections stream)
  (mapc #'(lambda (sectoin)
	    (dxf-out-t-pairs 0 *section* stream)
	    (mapc #'(lambda (el)
		      (dxf-out-t-pairs (first el) (second el) stream))
		  sectoin)
	    (dxf-out-t-pairs 0 *endsec* stream))
	sections)
  (dxf-out-t-pairs 0 *eof* stream))

(defun incf-handseed (sections)
  (1- (incf (cadadr (member '(9 "$HANDSEED")
			    (assoc '(2 "HEADER") sections :test #'equal)
			    :test #'equal)))))

(defun handseed (sections)
  (cadadr (member '(9 "$HANDSEED")
		  (assoc '(2 "HEADER") sections :test #'equal)
		  :test #'equal)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

