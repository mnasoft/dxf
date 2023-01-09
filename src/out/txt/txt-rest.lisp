



(defun dxf-pair (code value stream)
  "@b(Описание:) функция @b(dxf-pair) выводит в поток @b(stream) пару
  @b(code) и @b(value) в формате текстовом формате dxf."
  (cond
    ((or (<= 0 code 4)
	 (<= 6 code 9))
     (code-string code value stream))
;;; String [with the introduction of extended symbol names in AutoCAD
;;; 2000, the 255-character limit has been increased to 2049
;;; single-byte characters not including the newline at the end of
;;; the line]
    ((=  5  code)        (code-hex    code value stream))
    ((<= 10 code  19)    (code-double code value stream)) ;;;; Double precision 3D point value
    ((<= 20 code  39)    (code-double code value stream)) 
    ((<= 40 code  59)    (code-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 60 code  79)    (code-int16  code value stream)) ;;;; 16-bit integer value
    ((<= 90 code  99)    (code-int32  code value stream)) ;;;; 32-bit integer value
    ((<= 100 code 102)   (code-string code value stream
                                      :max-octet-length 255)) ;;;; String (255-character maximum; less for Unicode strings)
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
    ((<= 480 code 481)   (code-string code value stream
                                      :max-octet-length 127)) ;;;; String representing hex handle value
    ((= 999 code)        (code-string code value stream)) ;;;; string)
    ((<= 1000 code 1009) (code-string code value stream)) ;;;; String (same limits as indicated with 0-9 code range)
    ((<= 1010 code 1059) (code-double code value stream)) ;;;; Double-precision floating-point value
    ((<= 1060 code 1070) (code-int16  code value stream)) ;;;; 16-bit integer value
    ((= 1071 code)       (code-int32  code value stream)) ;;;; 32-bit integer value
    ))




