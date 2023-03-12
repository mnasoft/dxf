;;;; ./src/out/bin/bin.lisp

(defpackage :dxf/out/bin
  (:use #:cl #+nil #:mnas-string)
  (:export wrt-int8
           wrt-int16
           wrt-int32
           wrt-int64
           wrt-int128
           )
  (:export wrt-uint16 
           wrt-uint32
           wrt-uint64
           wrt-uint128
           )
  (:export wrt-float
           wrt-double
           wrt-string
           )
  (:export wrt-head
           )
  (:export code-string
           code-double
           code-hex
           code-b-chunk
           code-int8
           code-int16
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

(in-package :dxf/out/bin)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; binary-dxf-func

(defun wrt-int8 (int8 stream)
  (assert (and (integerp int8)
               (<= `,(- (/ (expt 2 8) 2))
                   int8
                   `,(1- (/ (expt 2 8) 2)))))
  (write-byte int8 stream))

(defun wrt-int16 (int16 stream)
  (assert (and (integerp int16)
               (<= `,(- (/ (expt 2 16) 2))
                   int16
                   `,(1- (/ (expt 2 16) 2)))))
  (dxf/b-arr:put-u2 int16)
  (write-sequence dxf/b-arr:*byte-aray-2* stream))

(defun wrt-uint16 (int16 stream)
  (assert (and (integerp int16)
               (<= 0
                   int16
                   `,(1- (expt 2 16)))))
  (dxf/b-arr:put-u2 int16)
  (write-sequence dxf/b-arr:*byte-aray-2* stream))

;;;;

(defun wrt-int32 (int32 stream)
  (assert (and (integerp int32)
               (<= `,(- (/ (expt 2 32) 2))
                   int32
                   `,(1- (/ (expt 2 32) 2)))))
  (dxf/b-arr:put-u4 int32)
  (write-sequence dxf/b-arr:*byte-aray-4* stream))

(defun wrt-uint32 (int32 stream)
  (assert (and (integerp int32)
               (<= 0
                   int32
                   `,(1- (expt 2 32)))))
  (dxf/b-arr:put-u4 int32)
  (write-sequence dxf/b-arr:*byte-aray-4* stream))

;;;;

(defun wrt-int64 (int64 stream)
  (assert (and (integerp int64)
               (<= `,(- (/ (expt 2 64) 2))
                   int64
                   `,(1- (/ (expt 2 64) 2)))))
  (dxf/b-arr:put-u8 int64)
  (write-sequence dxf/b-arr:*byte-aray-8* stream))

(defun wrt-uint64 (int64 stream)
  (assert (and (integerp int64)
               (<= 0
                   int64
                   `,(1- (expt 2 64)))))
  (dxf/b-arr:put-u8 int64)
  (write-sequence dxf/b-arr:*byte-aray-8* stream))

;;;;

(defun wrt-int128 (int128 stream)
  (assert (and (integerp int128)
               (<= `,(- (/ (expt 2 128) 2))
                   int128
                   `,(1- (/ (expt 2 128) 2)))))
  (dxf/b-arr:put-u16 int128)
  (write-sequence dxf/b-arr:*byte-aray-16* stream))

(defun wrt-uint128 (int128 stream)
  (assert (and (integerp int128)
               (<= 0
                   int128
                   `,(1- (expt 2 128)))))
  (dxf/b-arr:put-u16 int128)
  (write-sequence dxf/b-arr:*byte-aray-16* stream))

(defun wrt-float (val stream)
  (assert (eq 'single-float (type-of val)))
  (wrt-uint32 (ieee-floats:encode-float32 val) stream))

(defun wrt-double (val stream)
  (assert (eq 'double-float (type-of val)))
  (wrt-uint64 (ieee-floats:encode-float64 val) stream))

(defun wrt-string (string stream)
  "@b(Описание:) функция @b(wrt-string) выводит в бинарный поток
  @b(stream) строку @b(string). К символам строки @b(string) в поток
  добавляется терминирующий символ #\NUL."
  (write-sequence
   (babel:string-to-octets
    (concatenate 'string string (format nil "~C" #\NUL)))
   stream))

(defun wrt-head (stream)
  "@b(Описание:) функция @b(wrt-head) выводит в бинарный поток
  @b(stream) строку, обозначающую, что содержимое файла хранится в
  формате бинарного dxf-файла."
  (wrt-string dxf/const:*AutoCAD-Binary-DXF-21* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun code-string (code string stream &key (max-octet-length 2048))
  (if (and (stringp string)
	   (<= (length (babel:string-to-octets string)) max-octet-length))
      (progn
        (wrt-uint16 code stream)
        (wrt-string string stream))))

(defun code-double (code x stream)
  (if  (numberp x)
       (progn
         (wrt-uint16 code stream)
         (wrt-double (coerce x 'double-float) stream))))

(defun code-hex (code hex stream)
  (if  (and (integerp hex) (< (integer-length hex) 128))
       (code-string code (format nil "~X" hex) stream)))

(defun code-b-chunk (code string stream)
  (let ((sl (length string)))
    (wrt-uint16 code stream)
    (write-byte (ceiling sl 2) stream)
    (loop :for i :from 0 :by 2
          :for j :from 2 :to sl :by 2
          :do
             (write-byte
              (parse-integer string :start i :end j :radix 16)
              stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun code-int8 (code int8 stream)
  (wrt-uint16 code stream)
  (wrt-int8 int8 stream))

(defun code-int16 (code int16 stream)
  (wrt-uint16 code stream)
  (wrt-int16 int16 stream))

(defun code-int32 (code int32 stream)
  (wrt-uint16 code stream)
  (wrt-int32 int32 stream))

(defun code-int64 (code int64 stream)
  (wrt-uint16 code stream)
  (wrt-int64 int64 stream))

(defun code-int128 (code int128 stream)
  (wrt-uint16 code stream)
  (wrt-int128 int128 stream))

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

(defun pair (code value stream)
  "@b(Описание:) функция @b(pair) выводит в бинарный поток @b(stream)
 пару: код @b(code) и значение @b(value)."
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))
     (code-string   code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (code-hex      code value stream))
    ((<= 10 code 19)     (code-double   code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (code-double   code value stream)) 
    ((<= 40 code 59)     (code-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (code-int32    code value stream)) ;;;; 32-bit integer value
    ((<= 100 code 102)   (code-string   code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings) 
    ((=  105 code)       (code-hex      code value stream)) ;;;; String representing hexadecimal (hex) handle value
    ((<= 110 code 119)   (code-double   code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (code-double   code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (code-double   code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (code-double   code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (code-int64    code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (code-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (code-int8     code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (code-string   code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (code-b-chunk  code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (code-hex      code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (code-hex      code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (code-hex      code value stream)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (code-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (code-string   code value stream)) ;;;; String
    ((<= 420 code 429)   (code-int32    code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (code-string   code value stream)) ;;;; String
    ((<= 440 code 449)   (code-int32    code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (code-int64    code value stream)) ;;;; Long
    ((<= 460 code 469)   (code-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (code-string   code value stream)) ;;;; String
    ((<= 480 code 481)   (code-string   code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (code-string   code value stream)) ;;;; string)
    ((<= 1000 code 1009) (code-string   code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (code-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (code-int16    code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (code-int32    code value stream)) ;;;; 32-bit integer value
    ))

;;;;

(defun sections (sections stream)
  "@b(Описание:) функция @b(sections) выводит в бинарный поток
 @b(stream) посекционное представление dxf-файла, заданное списком
 @b(sections).

 @b(Пример использования:)
@begin[lang=lisp](code)
  (let ((data
          (dxf/in/txt:read-file 
           (concatenate 'string dxf::*dxf-path* \"txt/2018.dxf\"))))
    (with-open-file (dxf \"bin-sections.dxf\" :direction :output :if-exists :supersede
                                            :element-type 'unsigned-byte)
      (bin-sections data dxf)))
@end(code)
"
  (wrt-head stream)
  (map nil #'(lambda (sectoin)
	       (pair 0 dxf/sec:*section* stream)
	       (map nil #'(lambda (el)
		            (pair (first el) (second el) stream))
		    sectoin)
	       (pair 0 dxf/sec:*endsec* stream))
       sections)
  (pair 0 dxf/sec:*eof* stream))
