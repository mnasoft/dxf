;;;; ./src/out/bin/bin.lisp

(defpackage #:dxf/out/bin
  (:use #:cl #+nil #:mnas-string)
  (:export wrt-int16
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
  (:export bin-string
           bin-double
           bin-hex
           bin-b-chunk
           bin-int16
           bin-int32
           bin-int64
           bin-int128
           )
  (:export bin-point-2d
           bin-point-3d
           bin-point
           )
  (:export bin
           )
  (:export bin-sections
           ))

(in-package :dxf/out/bin)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; binary-dxf-func

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
  (write-sequence
   (babel:string-to-octets
    (concatenate 'string string (format nil "~C" #\NUL)))
   stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun bin-string (code string stream &key (max-octet-length 2048))
  (if (and (stringp string)
	   (<= (length (babel:string-to-octets string)) max-octet-length))
      (progn
        (wrt-uint16 code stream)
        (wrt-string string stream))))

(defun bin-double (code x stream)
  (if  (numberp x)
       (progn
         (wrt-uint16 code stream)
         (wrt-double (coerce x 'double-float) stream))))

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

(defun bin-b-chunk (code string stream)
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

(defun bin-int16 (code int16 stream)
  (wrt-uint16 code stream)
  (wrt-int16 int16 stream))

(defun bin-int32 (code int32 stream)
  (wrt-uint16 code stream)
  (wrt-int32 int32 stream))

(defun bin-int64 (code int64 stream)
  (wrt-uint16 code stream)
  (wrt-int64 int64 stream))

(defun bin-int128 (code int128 stream)
  (wrt-uint16 code stream)
  (wrt-int128 int128 stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun bin (code value stream)
  ""
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (bin-string   code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (bin-hex      code value stream))
    ((<= 10 code 19)     (bin-double   code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (bin-double   code value stream)) 
    ((<= 40 code 59)     (bin-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (bin-int32    code value stream)) ;;;; 32-bit integer value
    ((<= 100 code 102)   (bin-string   code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings) 
    ((=  105 code)       (bin-hex      code value stream)) ;;;; String representing hexadecimal (hex) handle value
    ((<= 110 code 119)   (bin-double   code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (bin-double   code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (bin-double   code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (bin-double   code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (bin-int64    code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (bin-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (bin-int16    code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (bin-string   code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (bin-b-chunk code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (bin-hex      code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (bin-hex      code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (bin-string   code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (bin-string   code value stream)) ;;;; String
    ((<= 420 code 429)   (bin-int32    code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (bin-string   code value stream)) ;;;; String
    ((<= 440 code 449)   (bin-int32    code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (bin-int64    code value stream)) ;;;; Long
    ((<= 460 code 469)   (bin-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (bin-string   code value stream)) ;;;; String
    ((<= 480 code 481)   (bin-string   code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (bin-string   code value stream)) ;;;; string)
    ((<= 1000 code 1009) (bin-string   code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (bin-double   code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (bin-int16    code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (bin-int32    code value stream)) ;;;; 32-bit integer value
    ))

;;;;

(defun bin-sections (sections stream)
    "@b(Описание:) функция @b(bin-sections) выводит в бинарный поток
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
  (map nil #'(lambda (sectoin)
	    (bin 0 dxf/sec:*section* stream)
	    (map nil #'(lambda (el)
		      (bin (first el) (second el) stream))
		  sectoin)
	    (bin 0 dxf/sec:*endsec* stream))
	sections)
  (bin 0 dxf/sec:*eof* stream))
