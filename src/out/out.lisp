;;;; ./src/out/out.lisp

(defpackage #:dxf/out
  (:use #:cl #+nil #:mnas-string)
  (:export +code-length+
           dxf-code
           )
  (:export txt-string
           txt-double
           txt-point-2d
           txt-point-3d
           txt-point
           txt-hex
           txt-int16
           txt-int32
           txt-int64
           txt-int128
           )
  (:export bin-string
           bin-double
           bin-point-2d
           bin-point-3d
           bin-point
           bin-hex
           bin-int16
           bin-int32
           bin-int64
           bin-int128
           )
  (:export txt
           bin
           )
  (:export txt-sections
           bin-sections
           ))

(in-package :dxf/out)

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

;;;;

(defun txt-string (code string stream &key (max-octet-length 2048))
    (if (and (stringp string)
	     (<= (length (babel:string-to-octets string)) max-octet-length))
	(format stream "~A~%~A~%" (dxf-code code) string)
;;;;	(break "dxf-t-string: code=~A; ~A~%" code string)
	))

(defun txt-double (code x stream)
  (if  (numberp x)
       (format stream "~A~%~,12F~%" (dxf-code code) x)
;;;;   (break "txt-double: (numberp x) : code=~A x=~A" code x)
       ))

(defun txt-point-2d (code point-2d stream)
  (txt-double (+ 0 code) (svref point-2d 0) stream)
  (txt-double (+ 10 code) (svref point-2d 1) stream))

(defun txt-point-3d (code point-3d stream)
  (txt-double (+ 0 code) (svref point-3d 0) stream)
  (txt-double (+ 10 code) (svref point-3d 1) stream)
  (txt-double (+ 20 code) (svref point-3d 2) stream))

(defun txt-point (code point stream)
  (cond
    ((and (vectorp point)
	  (= 2 (array-dimension point 0)))
     (txt-point-2d code point stream))
    ((and (vectorp point)
	  (= 3 (array-dimension point 0))) 
     (txt-point-3d code point stream))))

;;;;

(defun txt-hex (code hex stream)
  (if  (and (integerp hex) (< (integer-length hex) 128))
       (format stream "~A~%~X~%" (dxf-code code) hex)))

(defun txt-int16 (code int16 stream)
  (if  (and (integerp int16) (< (integer-length int16) 16))
       (format stream "~A~%~6D~%" (dxf-code code) int16)))

(defun txt-int32 (code int32 stream)
  (if  (and (integerp int32) (< (integer-length int32) 32))
       (format stream "~A~%~9D~%" (dxf-code code) int32)))

(defun txt-int64 (code int64 stream)
  (if  (and (integerp int64) (< (integer-length int64)  64))
       (format stream "~A~%~18D~%" (dxf-code code) int64)))

(defun txt-int128 (code int128 stream)
  (if  (and (integerp int128) (< (integer-length int128) 128))
       (format stream "~A~%~D~%" (dxf-code code) int128)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
(defun bin-string (code string stream &key (max-octet-length 2048))
  (if (and (stringp string)
	   (<= (length (babel:string-to-octets string)) max-octet-length))
      (progn
	(dxf/b-arr:put-u2 code)
	(write-sequence dxf/b-arr:*byte-aray-2* stream)
	(write-sequence (babel:string-to-octets (concatenate 'string string (format nil "~C" #\NUL))) stream))
;;;;      (break "dxf-b-string: code=~A; ~A~%" code string)
      ))
;;;;

(defun bin-double (code x stream)
  (if  (numberp x)
       (progn
	 (dxf/b-arr:put-u2 code)
	 (write-sequence dxf/b-arr:*byte-aray-2* stream)
;;;;	 (dxf/b-arr:put-u8 (ie3fp:encode-ieee-double (coerce x 'double-float)))
	 (dxf/b-arr:put-u8 (ieee-floats:encode-float64 (coerce x 'double-float)))	 
	 (write-sequence dxf/b-arr:*byte-aray-8* stream))
;;;;       (break "bin-double: (numberp x) : code=~A x=~A" code x)
       ))

(defun bin-point-2d (code point-2d stream)
  (bin-double (+ 0 code) (svref point-2d 0) stream)
  (bin-double (+ 10 code) (svref point-2d 1) stream))

(defun bin-point-3d (code point-3d stream)
  (bin-double (+ 0 code) (svref point-3d 0) stream)
  (bin-double (+ 10 code) (svref point-3d 1) stream)
  (bin-double (+ 20 code) (svref point-3d 2) stream))

(defun bin-point (code point stream)
  (cond
    ((and (vectorp point)
	  (= 2 (array-dimension point 0))) 
     (bin-point-2d code point stream))
    ((and (vectorp point)
	  (= 3 (array-dimension point 0))) 
     (bin-point-3d code point stream))))

(defun bin-hex (code hex stream)
  (if  (and (integerp hex) (< (integer-length hex) 128))
       (bin-string code (format nil "~X" hex) stream)))

(defun bin-int16 (code int16 stream)
  (if  (and (integerp int16) (< (integer-length int16) 16))
       (progn
	 (dxf/b-arr:put-u2 code)
	 (write-sequence dxf/b-arr:*byte-aray-2* stream)
 	 (dxf/b-arr:put-u2 int16)
	 (write-sequence dxf/b-arr:*byte-aray-2* stream))))

(defun bin-int32 (code int32 stream)
  (if  (and (integerp int32) (< (integer-length int32) 32))
       (progn
	 (dxf/b-arr:put-u2 code)
	 (write-sequence dxf/b-arr:*byte-aray-2* stream)
	 (dxf/b-arr:put-u4 int32)
	 (write-sequence dxf/b-arr:*byte-aray-4* stream))))

(defun bin-int64 (code int64 stream)
  (if  (and (integerp int64) (< (integer-length int64)  64))
       (progn
	 (dxf/b-arr:put-u2 code)
 	 (write-sequence dxf/b-arr:*byte-aray-2* stream)
 	 (dxf/b-arr:put-u8 int64)
	 (write-sequence dxf/b-arr:*byte-aray-8* stream))))

(defun bin-int128 (code int128 stream)
  (if  (and (integerp int128) (< (integer-length int128) 128))
       (progn
	 (dxf/b-arr:put-u2 code)
  	 (write-sequence dxf/b-arr:*byte-aray-2* stream)
 	 (dxf/b-arr:put-u16 int128)
	 (write-sequence dxf/b-arr:*byte-aray-16* stream))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun txt (code value stream)
  ""
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (txt-string code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (txt-hex    code value stream))
    ((<= 10 code 19)     (txt-double code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (txt-double code value stream)) 
    ((<= 40 code 59)     (txt-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (txt-int32  code value stream)) ;;;; 32-bit integer value
    ((= 100 code)        (txt-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 102 code)        (txt-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    #+nil
    ((= 105 code)        (txt-string code value stream :max-octet-length 127)) ;;;; String representing hexadecimal (hex) handle value
    ((=  105 code)       (txt-hex    code value stream))
    ((<= 110 code 119)   (txt-double code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (txt-double code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (txt-double code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (txt-double code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (txt-int64  code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (txt-int64  code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (txt-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (txt-int16  code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (txt-string code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (txt-hex    code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (txt-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (txt-hex    code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (txt-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (txt-string code value stream)) ;;;; String
    ((<= 420 code 429)   (txt-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (txt-string code value stream)) ;;;; String
    ((<= 440 code 449)   (txt-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (txt-int64  code value stream)) ;;;; Long
    ((<= 460 code 469)   (txt-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (txt-string code value stream)) ;;;; String
    ((<= 480 code 481)   (txt-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (txt-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (txt-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (txt-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (txt-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (txt-int32  code value stream)) ;;;; 32-bit integer value
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun bin (code value stream)
  ""
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (bin-string code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (bin-hex    code value stream))
    ((<= 10 code 19)     (bin-point  code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (bin-double code value stream)) 
    ((<= 40 code 59)     (bin-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (bin-int32  code value stream)) ;;;; 32-bit integer value
    ((= 100 code)        (bin-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 102 code)        (bin-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    #+nil
    ((= 105 code)        (bin-string code value stream :max-octet-length 127)) ;;;; String representing hexadecimal (hex) handle value
    ((=  105 code)       (bin-hex    code value stream))
    ((<= 110 code 119)   (bin-double code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (bin-double code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (bin-double code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (bin-double code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (bin-int64  code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (bin-int64  code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (bin-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (bin-int16  code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (bin-string code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (bin-hex    code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (bin-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (bin-hex    code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (bin-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (bin-string code value stream)) ;;;; String
    ((<= 420 code 429)   (bin-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (bin-string code value stream)) ;;;; String
    ((<= 440 code 449)   (bin-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (bin-int64  code value stream)) ;;;; Long
    ((<= 460 code 469)   (bin-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (bin-string code value stream)) ;;;; String
    ((<= 480 code 481)   (bin-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (bin-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (bin-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (bin-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (bin-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (bin-int32  code value stream)) ;;;; 32-bit integer value
    ))

;;;;

(defun txt-sections (sections stream)
  "@b(Описание:) функция @b(txt-sections) выводит в текстовый поток
 @b(stream) посекционное представление dxf-файла, заданное списком
 @b(sections).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (let ((data
        (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* \"2018.dxf\"))))
  (with-open-file (dxf \"txt-sections.dxf\" :direction :output :if-exists :supersede)
    (txt-sections data dxf)))
@end(code)
"
  (map nil #'(lambda (sectoin)
	    (txt 0 dxf/sec:*section* stream)
	    (map nil #'(lambda (el)
		      (txt (first el) (second el) stream))
		  sectoin)
	    (txt 0 dxf/sec:*endsec* stream))
	sections)
  (txt 0 dxf/sec:*eof* stream))

(defun bin-sections (sections stream)
    "@b(Описание:) функция @b(txt-sections) выводит в бинарный поток
 @b(stream) посекционное представление dxf-файла, заданное списком
 @b(sections).

 @b(Пример использования:)
@begin[lang=lisp](code)
  (let ((data
          (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* \"2018.dxf\"))))
    (with-open-file (dxf \"bin-sections.dxf\" :direction :output :if-exists :supersede
                                            :element-type 'unsigned-byte)
      (bin-sections data dxf)))
@end(code)
"
  (map nil #'(lambda (sectoin)
	    (bin 0 dxf/sec:*section* stream)
	    (map nil #'(lambda (el)
		      (bin (first el) (second el) stream))
		  sectoin)
	    (bin 0 dxf/sec:*endsec* stream))
	sections)
  (bin 0 dxf/sec:*eof* stream))


