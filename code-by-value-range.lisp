;;;; code-by-value-range.lisp

(in-package #:dxf)

(defun dxf-out-t-string (code string stream &key (max-octet-length 2048))
    (if (and (stringp string)
	     (<= (length (babel:string-to-octets string)) max-octet-length))
	(format stream "~A~%~A~%" (dxf-code code) string)
	(break "dxf-t-string: code=~A; ~A~%" code string)))
;;;;

(defun dxf-out-t-double (code x stream)
  (if  (numberp x)
       (format stream "~A~%~,12F~%" (dxf-code code) x)
       (break "dxf-out-t-double: (numberp x) : code=~A x=~A" code x)))

;;;;

(defun dxf-out-t-point-2d (code point-2d stream)
  (dxf-out-t-double (+ 0 code) (svref point-2d 0) stream)
  (dxf-out-t-double (+ 10 code) (svref point-2d 1) stream))

(defun dxf-out-t-point-3d (code point-3d stream)
  (dxf-out-t-double (+ 0 code) (svref point-3d 0) stream)
  (dxf-out-t-double (+ 10 code) (svref point-3d 1) stream)
  (dxf-out-t-double (+ 20 code) (svref point-3d 2) stream))

(defun dxf-out-t-point (code point stream)
  (cond
    ((and (vectorp point)
	  (= 2 (array-dimension point 0)))
     (dxf-out-t-point-2d code point stream))
    ((and (vectorp point)
	  (= 3 (array-dimension point 0))) 
     (dxf-out-t-point-3d code point stream))))

;;;;

(defun dxf-out-t-hex (code hex stream)
  (if  (and (integerp hex) (< (integer-length hex) 128))
       (format stream "~A~%~X~%" (dxf-code code) hex)))

;;;;

(defun dxf-out-t-int16 (code int16 stream)
  (if  (and (integerp int16) (< (integer-length int16) 16))
       (format stream "~A~%~D~%" (dxf-code code) int16)))

(defun dxf-out-t-int32 (code int32 stream)
  (if  (and (integerp int32) (< (integer-length int32) 32))
       (format stream "~A~%~D~%" (dxf-code code) int32)))

(defun dxf-out-t-int64 (code int64 stream)
  (if  (and (integerp int64) (< (integer-length int64)  64))
       (format stream "~A~%~D~%" (dxf-code code) int64)))

(defun dxf-out-t-int128 (code int128 stream)
  (if  (and (integerp int128) (< (integer-length int128) 128))
       (format stream "~A~%~D~%" (dxf-code code) int128)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
(defun dxf-out-b-string (code string stream &key (max-octet-length 2048))
  (if (and (stringp string)
	   (<= (length (babel:string-to-octets string)) max-octet-length))
      (progn
	(put-u2 code)
	(write-sequence *byte-aray-2* stream)
	(write-sequence (babel:string-to-octets (concatenate 'string string (format nil "~C" #\NUL))) stream))
      (break "dxf-b-string: code=~A; ~A~%" code string)))

;;;;

(defun dxf-out-b-double (code x stream)
  (if  (numberp x)
       (progn
	 (put-u2 code)
	 (write-sequence *byte-aray-2* stream)
	 (put-u8 (ie3fp:encode-ieee-double (coerce x 'double-float)))
	 (write-sequence *byte-aray-8* stream))
       (break "dxf-out-b-double: (numberp x) : code=~A x=~A" code x)))

;;;;

(defun dxf-out-b-point-2d (code point-2d stream)
  (dxf-out-b-double (+ 0 code) (svref point-2d 0) stream)
  (dxf-out-b-double (+ 10 code) (svref point-2d 1) stream))

(defun dxf-out-b-point-3d (code point-3d stream)
  (dxf-out-b-double (+ 0 code) (svref point-3d 0) stream)
  (dxf-out-b-double (+ 10 code) (svref point-3d 1) stream)
  (dxf-out-b-double (+ 20 code) (svref point-3d 2) stream))

(defun dxf-out-b-point (code point stream)
  (cond
    ((and (vectorp point)
	  (= 2 (array-dimension point 0))) 
     (dxf-out-b-point-2d code point stream))
    ((and (vectorp point)
	  (= 3 (array-dimension point 0))) 
     (dxf-out-b-point-3d code point stream))))

;;;;

(defun dxf-out-b-hex (code hex stream)
  (if  (and (integerp hex) (< (integer-length hex) 128))
       (dxf-out-b-string code (format nil "~X" hex) stream)))

;;;;

(defun dxf-out-b-int16 (code int16 stream)
  (if  (and (integerp int16) (< (integer-length int16) 16))
       (progn
	 (put-u2 code)
	 (write-sequence *byte-aray-2* stream)
 	 (put-u2 int16)
	 (write-sequence *byte-aray-2* stream))))

(defun dxf-out-b-int32 (code int32 stream)
  (if  (and (integerp int32) (< (integer-length int32) 32))
       (progn
	 (put-u2 code)
	 (write-sequence *byte-aray-2* stream)
	 (put-u4 int32)
	 (write-sequence *byte-aray-4* stream))))

(defun dxf-out-b-int64 (code int64 stream)
  (if  (and (integerp int64) (< (integer-length int64)  64))
       (progn
	 (put-u2 code)
 	 (write-sequence *byte-aray-2* stream)
 	 (put-u8 int64)
	 (write-sequence *byte-aray-8* stream))))

(defun dxf-out-b-int128 (code int128 stream)
  (if  (and (integerp int128) (< (integer-length int128) 128))
       (progn
	 (put-u2 code)
  	 (write-sequence *byte-aray-2* stream)
 	 (put-u16 int128)
	 (write-sequence *byte-aray-16* stream))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dxf-out-t (code value stream)
  ""
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (dxf-out-t-string code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (dxf-out-t-hex    code value stream))
    ((<= 10 code 19)     (dxf-out-t-point  code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (dxf-out-t-double code value stream)) 
    ((<= 40 code 59)     (dxf-out-t-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (dxf-out-t-int32  code value stream)) ;;;; 32-bit integer value
    ((= 100 code)        (dxf-out-t-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 102 code)        (dxf-out-t-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 105 code)        (dxf-out-t-string code value stream :max-octet-length 127)) ;;;; String representing hexadecimal (hex) handle value
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
    ((<= 480 code 481)   (dxf-out-t-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (dxf-out-t-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (dxf-out-t-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (dxf-out-t-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (dxf-out-t-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (dxf-out-t-int32  code value stream)) ;;;; 32-bit integer value
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dxf-out-b (code value stream)
  ""
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))  (dxf-out-b-string code value stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
    ((=  5  code)        (dxf-out-b-hex    code value stream))
    ((<= 10 code 19)     (dxf-out-b-point  code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code 39)     (dxf-out-b-double code value stream)) 
    ((<= 40 code 59)     (dxf-out-b-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code 79)     (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code 99)     (dxf-out-b-int32  code value stream)) ;;;; 32-bit integer value
    ((= 100 code)        (dxf-out-b-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 102 code)        (dxf-out-b-string code value stream :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
    ((= 105 code)        (dxf-out-b-string code value stream :max-octet-length 127)) ;;;; String representing hexadecimal (hex) handle value
    ((<= 110 code 119)   (dxf-out-b-double code value stream)) ;;;; Double precision floating-point value
    ((<= 120 code 129)   (dxf-out-b-double code value stream)) ;;;; Double precision floating-point value
    ((<= 130 code 139)   (dxf-out-b-double code value stream)) ;;;; Double precision floating-point value
    ((<= 140 code 149)   (dxf-out-b-double code value stream)) ;;;; Double precision scalar floating-point value
    ((<= 160 code 169)   (dxf-out-b-int64  code value stream)) ;;;; 64-bit integer value
    ((<= 170 code 179)   (dxf-out-b-int64  code value stream)) ;;;; 16-bit integer value
    ((<= 210 code 239)   (dxf-out-b-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 270 code 279)   (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 280 code 289)   (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 290 code 299)   (dxf-out-b-int16  code value stream)) ;;;; Boolean flag value (0 - off 1 - on)
    ((<= 300 code 309)   (dxf-out-b-string code value stream)) ;;;; Arbitrary text string
    ((<= 310 code 319)   (dxf-out-b-hex    code value stream)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (dxf-out-b-hex    code value stream)) ;;;; String representing hex handle value
    ((<= 330 code 369)   (dxf-out-b-hex    code value stream)) ;;;; String representing hex object IDs
    ((<= 370 code 379)   (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 380 code 389)   (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 390 code 399)   (dxf-out-b-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((<= 400 code 409)   (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 410 code 419)   (dxf-out-b-string code value stream)) ;;;; String
    ((<= 420 code 429)   (dxf-out-b-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 430 code 439)   (dxf-out-b-string code value stream)) ;;;; String
    ((<= 440 code 449)   (dxf-out-b-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 450 code 459)   (dxf-out-b-int64  code value stream)) ;;;; Long
    ((<= 460 code 469)   (dxf-out-b-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 470 code 479)   (dxf-out-b-string code value stream)) ;;;; String
    ((<= 480 code 481)   (dxf-out-b-string code value stream :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (dxf-out-b-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (dxf-out-b-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (dxf-out-b-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (dxf-out-b-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (dxf-out-b-int32  code value stream)) ;;;; 32-bit integer value
    ))

;;;; (defun dxf-in-b(code value stream) "")

