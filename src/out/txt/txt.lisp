;;;; ./src/out/txt/txt.lisp

(defpackage #:dxf/out/txt
  (:use #:cl)
  (:intern order
           print-number
           )
  (:export +code-length+
           dxf-code
           )
  (:export code-string
           code-double
           )
  (:export code-hex
           code-b-chunk
           )
  (:export code-int16
           code-int32
           code-int64
           code-int128 
           )
  (:export 2d-point
           3d-point
           nd-point 
           )
  (:export pair
           )
  (:export sections
           ))

(in-package :dxf/out/txt)

(defparameter +code-length+ 3
  "@b(Описание:) переменная @b(+code-length+) задает
минримальую ширину поля для вывода dxf кода в текстовом режиме.")

(defun dxf-code (code &optional (overal-length +code-length+))
  "@b(Описание:) функция @b(dxf-code) возвращает строку,
  представляющую @b(code) dxf. @b(Code) печатается смещенным вправо с
  пробельными заполнителяи. Параметр @b(overal-length) задает
  минимальную ширину поля вывода.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (dxf-code 4) -> \"  4\"
 (dxf-code 123456) -> \"123456\"
@end(code)"
  (format nil (format nil "~~~A,' d" overal-length) code))


(defun code-string (code string stream &key (max-octet-length 2048))
    (when (and (stringp string)
	     (<= (length (babel:string-to-octets string)) max-octet-length))
      (format stream "~A~%~A~%" (dxf-code code) string)))

;;;;

(defun order (val)
  "@b(Описание:) функция @b(order) возвращает порядок величины @b(val).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (order 5.55) => 0, 0.744293
 (order -55.5) => 1, 0.744293
@end(code)
"
  (let ((x (abs val)))
    (when (zerop x) (return-from order  0))
    (floor (log x 10))))

(defun print-number (val &optional (digits 16))
  "@b(Описание:) функция @b(print-number) осуществляет вывод числа с
  плавающей точкой в формате dxf-AutoCAD.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (print-number -156.123456789012345678D0) 
@end(code)"
  (let* ((od (- (order val)))
         (str-0 (format nil 
                        (format nil "~~,~AF" (+ -1 od digits))     
                        val))
         (str-1 (if (find #\. str-0)
                    (string-right-trim "0" str-0)
                    str-0))
         (str-2 (if (eq #\. (char str-1 (1- (length str-1))))
                    (concatenate 'string str-1 "0")
                    str-1)))
    str-2))

(defun code-double (code x stream)
  (when (numberp x)
    (format stream "~A~%~A~%" (dxf-code code) (print-number x))
    #+nil (format stream "~A~%~,12F~%" (dxf-code code) x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun 2d-point (code point-2d stream)
  (code-double (+ 0 code) (svref point-2d 0) stream)
  (code-double (+ 10 code) (svref point-2d 1) stream))

(defun 3d-point (code point-3d stream)
  (code-double (+ 0 code) (svref point-3d 0) stream)
  (code-double (+ 10 code) (svref point-3d 1) stream)
  (code-double (+ 20 code) (svref point-3d 2) stream))

(defun nd-point (code point stream)
  (cond
    ((and (vectorp point)
	  (= 2 (array-dimension point 0)))
     (2d-point code point stream))
    ((and (vectorp point)
	  (= 3 (array-dimension point 0))) 
     (3d-point code point stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun code-hex (code hex stream)
  (if  (and (integerp hex) (< (integer-length hex) 128))
       (format stream "~A~%~X~%" (dxf-code code) hex)))

(defun code-b-chunk (code string stream &key (max-octet-length 2048))
  "@b(Описание:) функция @b(code-b-chunk) введена для кодов от 310 до 319.
"
    (if (and (stringp string)
	     (<= (length (babel:string-to-octets string)) max-octet-length))
	(format stream "~A~%~A~%" (dxf-code code) string)
;;;;	(break "dxf-t-string: code=~A; ~A~%" code string)
	))

(defun code-int16 (code int16 stream)
  (if  (and (integerp int16) (< (integer-length int16) 16))
       (format stream "~A~%~6D~%" (dxf-code code) int16)))

(defun code-int32 (code int32 stream)
  (if  (and (integerp int32) (< (integer-length int32) 32))
       (format stream "~A~%~9D~%" (dxf-code code) int32)))

(defun code-int64 (code int64 stream)
  (if  (and (integerp int64) (< (integer-length int64)  64))
       (format stream "~A~%~18D~%" (dxf-code code) int64)))

(defun code-int128 (code int128 stream)
  (if  (and (integerp int128) (< (integer-length int128) 128))
       (format stream "~A~%~D~%" (dxf-code code) int128)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun pair (code value stream)
  "@b(Описание:) функция @b(pair) выводит в поток @b(stream) пару
  @b(code) и @b(value) в формате текстовом формате dxf."
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (code-string code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (code-hex    code value stream))
    ((<= 10 code  19)    (code-double code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code  39)    (code-double code value stream)) 
    ((<= 40 code  59)    (code-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code  79)    (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code  99)    (code-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 100 code 102)   (code-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((=  105 code)       (code-hex    code value stream)) ;;;; String representing hexadecimal (hex) handle value
    ((<= 110 code 119)   (code-double code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (code-double code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (code-double code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (code-double code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (code-int64  code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (code-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (code-int16  code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (code-string code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (code-b-chunk code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (code-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (code-hex    code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (code-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (code-string code value stream)) ;;;; String
    ((<= 420 code 429)   (code-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (code-string code value stream)) ;;;; String
    ((<= 440 code 449)   (code-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (code-int64  code value stream)) ;;;; Long
    ((<= 460 code 469)   (code-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (code-string code value stream)) ;;;; String
    ((<= 480 code 481)   (code-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (code-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (code-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (code-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (code-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (code-int32  code value stream)) ;;;; 32-bit integer value
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun sections (sections stream)
  "@b(Описание:) функция @b(sections) выводит в текстовый поток
 @b(stream) посекционное представление dxf-файла, заданное списком
 @b(sections).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (let ((data
        (dxf/in/txt:read-file 
           (concatenate 'string dxf::*dxf-path* \"txt/2018.dxf\"))))
  (with-open-file (dxf \"txt-sections.dxf\" :direction :output :if-exists :supersede)
    (sections data dxf)))
@end(code)
"
  (map nil #'(lambda (sectoin)
	    (pair 0 dxf/sec:*section* stream)
	    (map nil #'(lambda (el)
		      (pair (first el) (second el) stream))
		  sectoin)
	    (pair 0 dxf/sec:*endsec* stream))
	sections)
  (pair 0 dxf/sec:*eof* stream))
