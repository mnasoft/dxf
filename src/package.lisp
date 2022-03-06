;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; package.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defpackage #:dxf
  (:use #:cl #:mnas-string)
  (:export *section-names*)
  (:export dxf-in-t-fname
	   dxf-out-text
	   dxf-in-text
	   split-entities
	   )
;;;; color
  (:export *color-index-to-rgb*
           *color-bylayer*
           *color-byblock*)
  (:export
   color-index-to-rgb
   color-rgb-to-index
   color-rgb-to-truecolor
   color-truecolor-to-rgb
   color-rgb
   color-index)
  )

;;;; (declaim (optimize (compilation-speed 0) (debug 3) (safety 0) (space 0) (speed 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dxf-string.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package #:dxf)

(defparameter *section*          "SECTION")

(defparameter *endsec*           "ENDSEC")

(defparameter *eof*              "EOF")

(defparameter *section-classes*  "CLASSES")

(defparameter *section-header*   "HEADER")

(defparameter *section-classes*  "CLASSES")

(defparameter *section-tables*   "TABLES")

(defparameter *section-blocks*   "BLOCKS")

(defparameter *section-entities* "ENTITIES")

(defparameter *section-objects*  "OBJECTS")

(defparameter *section-acdsdata* "ACDSDATA")

(defparameter *end-tab*          "ENDTAB")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; colors.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *color-bylayer*  (* -64 256 256 256))

(defparameter *color-byblock*  (* -63 256 256 256))

(defparameter *color-index-to-rgb*
  '((1  (255 0 0))
    (2  (255 255 0))
    (3  (0 255 0))
    (4  (0 255 255))
    (5  (0 0 255))
    (6  (255 0 255))
    (7  (255 255 255))
    (8  (128 128 128))
    (9  (192 192 192))
    (10  (255 0 0))
    (11  (255 127 127))
    (12  (204 0 0))
    (13  (204 102 102))
    (14  (153 0 0))
    (15  (153 76 76))
    (16  (127 0 0))
    (17  (127 63 63))
    (18  (76 0 0))
    (19  (76 38 38))
    (20  (255 63 0))
    (21  (255 159 127))
    (22  (204 51 0))
    (23  (204 127 102))
    (24  (153 38 0))
    (25  (153 95 76))
    (26  (127 31 0))
    (27  (127 79 63))
    (28  (76 19 0))
    (29  (76 47 38))
    (30  (255 127 0))
    (31  (255 191 127))
    (32  (204 102 0))
    (33  (204 153 102))
    (34  (153 76 0))
    (35  (153 114 76))
    (36  (127 63 0))
    (37  (127 95 63))
    (38  (76 38 0))
    (39  (76 57 38))
    (40  (255 191 0))
    (41  (255 223 127))
    (42  (204 153 0))
    (43  (204 178 102))
    (44  (153 114 0))
    (45  (153 133 76))
    (46  (127 95 0))
    (47  (127 111 63))
    (48  (76 57 0))
    (49  (76 66 38))
    (50  (255 255 0))
    (51  (255 255 127))
    (52  (204 204 0))
    (53  (204 204 102))
    (54  (153 153 0))
    (55  (153 153 76))
    (56  (127 127 0))
    (57  (127 127 63))
    (58  (76 76 0))
    (59  (76 76 38))
    (60  (191 255 0))
    (61  (223 255 127))
    (62  (153 204 0))
    (63  (178 204 102))
    (64  (114 153 0))
    (65  (133 153 76))
    (66  (95 127 0))
    (67  (111 127 63))
    (68  (57 76 0))
    (69  (66 76 38))
    (70  (127 255 0))
    (71  (191 255 127))
    (72  (102 204 0))
    (73  (153 204 102))
    (74  (76 153 0))
    (75  (114 153 76))
    (76  (63 127 0))
    (77  (95 127 63))
    (78  (38 76 0))
    (79  (57 76 38))
    (80  (63 255 0))
    (81  (159 255 127))
    (82  (51 204 0))
    (83  (127 204 102))
    (84  (38 153 0))
    (85  (95 153 76))
    (86  (31 127 0))
    (87  (79 127 63))
    (88  (19 76 0))
    (89  (47 76 38))
    (90  (0 255 0))
    (91  (127 255 127))
    (92  (0 204 0))
    (93  (102 204 102))
    (94  (0 153 0))
    (95  (76 153 76))
    (96  (0 127 0))
    (97  (63 127 63))
    (98  (0 76 0))
    (99  (38 76 38))
    (100  (0 255 63))
    (101  (127 255 159))
    (102  (0 204 51))
    (103  (102 204 127))
    (104  (0 153 38))
    (105  (76 153 95))
    (106  (0 127 31))
    (107  (63 127 79))
    (108  (0 76 19))
    (109  (38 76 47))
    (110  (0 255 127))
    (111  (127 255 191))
    (112  (0 204 102))
    (113  (102 204 153))
    (114  (0 153 76))
    (115  (76 153 114))
    (116  (0 127 63))
    (117  (63 127 95))
    (118  (0 76 38))
    (119  (38 76 57))
    (120  (0 255 191))
    (121  (127 255 223))
    (122  (0 204 153))
    (123  (102 204 178))
    (124  (0 153 114))
    (125  (76 153 133))
    (126  (0 127 95))
    (127  (63 127 111))
    (128  (0 76 57))
    (129  (38 76 66))
    (130  (0 255 255))
    (131  (127 255 255))
    (132  (0 204 204))
    (133  (102 204 204))
    (134  (0 153 153))
    (135  (76 153 153))
    (136  (0 127 127))
    (137  (63 127 127))
    (138  (0 76 76))
    (139  (38 76 76))
    (140  (0 191 255))
    (141  (127 223 255))
    (142  (0 153 204))
    (143  (102 178 204))
    (144  (0 114 153))
    (145  (76 133 153))
    (146  (0 95 127))
    (147  (63 111 127))
    (148  (0 57 76))
    (149  (38 66 76))
    (150  (0 127 255))
    (151  (127 191 255))
    (152  (0 102 204))
    (153  (102 153 204))
    (154  (0 76 153))
    (155  (76 114 153))
    (156  (0 63 127))
    (157  (63 95 127))
    (158  (0 38 76))
    (159  (38 57 76))
    (160  (0 63 255))
    (161  (127 159 255))
    (162  (0 51 204))
    (163  (102 127 204))
    (164  (0 38 153))
    (165  (76 95 153))
    (166  (0 31 127))
    (167  (63 79 127))
    (168  (0 19 76))
    (169  (38 47 76))
    (170  (0 0 255))
    (171  (127 127 255))
    (172  (0 0 204))
    (173  (102 102 204))
    (174  (0 0 153))
    (175  (76 76 153))
    (176  (0 0 127))
    (177  (63 63 127))
    (178  (0 0 76))
    (179  (38 38 76))
    (180  (63 0 255))
    (181  (159 127 255))
    (182  (51 0 204))
    (183  (127 102 204))
    (184  (38 0 153))
    (185  (95 76 153))
    (186  (31 0 127))
    (187  (79 63 127))
    (188  (19 0 76))
    (189  (47 38 76))
    (190  (127 0 255))
    (191  (191 127 255))
    (192  (102 0 204))
    (193  (153 102 204))
    (194  (76 0 153))
    (195  (114 76 153))
    (196  (63 0 127))
    (197  (95 63 127))
    (198  (38 0 76))
    (199  (57 38 76))
    (200  (191 0 255))
    (201  (223 127 255))
    (202  (153 0 204))
    (203  (178 102 204))
    (204  (114 0 153))
    (205  (133 76 153))
    (206  (95 0 127))
    (207  (111 63 127))
    (208  (57 0 76))
    (209  (66 38 76))
    (210  (255 0 255))
    (211  (255 127 255))
    (212  (204 0 204))
    (213  (204 102 204))
    (214  (153 0 153))
    (215  (153 76 153))
    (216  (127 0 127))
    (217  (127 63 127))
    (218  (76 0 76))
    (219  (76 38 76))
    (220  (255 0 191))
    (221  (255 127 223))
    (222  (204 0 153))
    (223  (204 102 178))
    (224  (153 0 114))
    (225  (153 76 133))
    (226  (127 0 95))
    (227  (127 63 111))
    (228  (76 0 57))
    (229  (76 38 66))
    (230  (255 0 127))
    (231  (255 127 191))
    (232  (204 0 102))
    (233  (204 102 153))
    (234  (153 0 76))
    (235  (153 76 114))
    (236  (127 0 63))
    (237  (127 63 95))
    (238  (76 0 38))
    (239  (76 38 57))
    (240  (255 0 63))
    (241  (255 127 159))
    (242  (204 0 51))
    (243  (204 102 127))
    (244  (153 0 38))
    (245  (153 76 95))
    (246  (127 0 31))
    (247  (127 63 79))
    (248  (76 0 19))
    (249  (76 38 47))
    (250  (51 51 51))
    (251  (91 91 91))
    (252  (132 132 132))
    (253  (173 173 173))
    (254  (214 214 214))
    (255  (255 255 255))))

(defun color-index-to-rgb (index)
  "@b(Описание:) функция @b(color-index-to-rgb) преобразует @b(index)
в диапазоне от 1 до 256 в представление rgb.

 @b(Пример использования:) @begin[lang=lisp](code)
 (color-index-to-rgb 0) => NIL 
 (color-index-to-rgb 1) => (255 0   0)
 (color-index-to-rgb 2) => (255 255 0)
 (color-index-to-rgb 4) => (0   255 255)
 (color-index-to-rgb 7) => (255 255 255)
 (color-index-to-rgb 250) => (51 51 51)
 (color-index-to-rgb 253) => (173 173 173)
@end(code)
"
  (cadr (assoc index *color-index-to-rgb*)))

(defun color-rgb-to-index (rgb)
  "@b(Описание:) функция @b(color-rgb-to-index) преобразует цвет в
представлении rgb в индекс системы AutoCad.

 @b(Пример использования:) @begin[lang=lisp](code)
 (color-rgb-to-index '(256 0 0))    => 1 
 (color-rgb-to-index '(0 256 0))    => 3
 (color-rgb-to-index '(0 0 256))    => 5
 (color-rgb-to-index '(56  56  56)) => 250 
 (color-rgb-to-index '(114 208 47))
 #+nil
 (dotimes (i 50)  (let ((r (random 255))	(g (random 255)) (b (random 255)))
		   (format t \"(= ~A (rgb-2-ac-ci '~S))~%\"
			   (color-rgb-to-index (list r g b ))
			   (list r g b))))

@end(code)
"
  (assert (and (consp rgb) (= (length rgb) 3)))
  (caadar  (sort (mapcar #'(lambda (el)
			     (let ((r  (- (first (cadr el)) (first  rgb)))
				   (g (- (second (cadr el)) (second rgb)))
				   (b (- (third  (cadr el)) (third  rgb))))
			       (list (+ (* r r) (* g g) (* b b)) el)))
			 *color-index-to-rgb*)
		 #'<
		 :key #'(lambda (el)(first el)))))


(defun color-rgb-to-truecolor (rgb)
  "
 @b(Пример использования:)
@begin[lang=lisp](code)
   (color-rgb-to-truecolor '(114 208 47))   7524399
@end(code)
"
  (+ (* (first rgb) 256 256) (* (second rgb) 256) (*  (third rgb))))


(defun color-truecolor-to-rgb (truecolor)
  "Примеры использования:
 (color-truecolor-to-rgb *color-byblock*)
 (color-truecolor-to-rgb *color-bylayer*)
 (color-truecolor-to-rgb -1032662993)
 (color-truecolor-to-rgb -7524399)
 (color-truecolor-to-rgb 7524399)
"
  (let* ((rg-b (multiple-value-list (floor  truecolor 256)))
	 (b    (+ 256 -256 (second rg-b)))
	 (r-g  (multiple-value-list (floor (first rg-b) 256)))
	 (g    (+ 256 -256 (second r-g)))
	 (r-   (multiple-value-list (floor (first r-g) 256)))
	 (r    (+ 256 -256 (second r-))))
    (list r g b )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun color-rgb (rgb)
  "@b(Описание:) функция @b(rgb) 

 @b(Пример использования:)
@begin[lang=lisp](code)
 (rgb '(230 200 200)) => (254 15124680)
@end(code)
"
  (color-rgb-to-truecolor rgb))

(defun color-index (index)
  "@b(Описание:) функция @b(color-index)

 @b(Пример использования:)
@begin[lang=lisp](code)
  (color-index 1)    => 16711680 (24 bits, #xFF0000)
  (color-index 255) 16777215 (24 bits, #xFFFFFF) 
@end(code)
"
  (color-rgb-to-truecolor (color-index-to-rgb index)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; line-weights.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; http://help.autodesk.com/view/ACD/2017/RUS/

(defparameter *line-weight-enum*
  '(("kLnWt000" 0)
    ("kLnWt005" 5)
    ("kLnWt009" 9)
    ("kLnWt013" 13)
    ("kLnWt015" 15)
    ("kLnWt018" 18)
    ("kLnWt020" 20)
    ("kLnWt025" 25)
    ("kLnWt030" 30)
    ("kLnWt035" 35)
    ("kLnWt040" 40)
    ("kLnWt050" 50)
    ("kLnWt053" 53)
    ("kLnWt060" 60)
    ("kLnWt070" 70)
    ("kLnWt080" 80)
    ("kLnWt090" 90)
    ("kLnWt100" 100)
    ("kLnWt106" 106)
    ("kLnWt120" 120)
    ("kLnWt140" 140)
    ("kLnWt158" 158)
    ("kLnWt200" 200)
    ("kLnWt211" 211)
    ("kLnWtByLayer" -1)
    ("kLnWtByBlock" -2)
    ("kLnWtByLwDefault" -3)))

(defun line-weight-ByLayer()     (second (assoc "kLnWtByLayer" *line-weight-enum* :test #'string=)))

(defun line-weight-ByBlock()     (second (assoc "kLnWtByBlock" *line-weight-enum* :test #'string=)))

(defun line-weight-ByLwDefault() (second (assoc "kLnWtByLwDefault" *line-weight-enum* :test #'string=)))

(defun line-weight-round (lw)
  "Пример использования:
;;;; (line-weight-round -3)
;;;; (line-weight-round 205)
;;;; (line-weight-round 250)
;;;; (line-weight-round \"ByLayer\")
;;;; (line-weight-round \"ByBlock\")
;;;; (line-weight-round \"Default\")"
  (cond
    ((and (stringp lw) (string= "ByLayer" lw))
     (line-weight-ByLayer))
    ((and (stringp lw) (string= "ByBlock" lw))
     (line-weight-ByBlock))
    ((and (stringp lw) (string= "Default" lw))
     (line-weight-ByLwDefault))
    ((and (integerp lw)
	  (second
	   (second
	    (first
	     (sort
	      (mapcar
	       #'(lambda (el)
		   (list (* (- lw (second el)) (- lw (second el))) el)) *line-weight-enum*)
	      #'< :key #'first)))) ))
    (t (line-weight-ByLwDefault))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; byte-array.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *byte-aray-2* (make-array 2 :element-type 'unsigned-byte))

(defparameter *byte-aray-4* (make-array 4 :element-type 'unsigned-byte))

(defparameter *byte-aray-8* (make-array 8 :element-type 'unsigned-byte))

(defparameter *byte-aray-16* (make-array 16 :element-type 'unsigned-byte))

(defun put-u2 (int)
  (setf (aref *byte-aray-2* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-2* #x1) (ldb (byte 8 #x08) int)))
 
(defun put-u4 (int)
  (setf (aref *byte-aray-4* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-4* #x1) (ldb (byte 8 #x08) int))
  (setf (aref *byte-aray-4* #x2) (ldb (byte 8 #x10) int))
  (setf (aref *byte-aray-4* #x3) (ldb (byte 8 #x18) int)))

(defun put-u8 (int)
  (setf (aref *byte-aray-8* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-8* #x1) (ldb (byte 8 #x08) int))
  (setf (aref *byte-aray-8* #x2) (ldb (byte 8 #x10) int))
  (setf (aref *byte-aray-8* #x3) (ldb (byte 8 #x18) int))
  (setf (aref *byte-aray-8* #x4) (ldb (byte 8 #x20) int))
  (setf (aref *byte-aray-8* #x5) (ldb (byte 8 #x28) int))
  (setf (aref *byte-aray-8* #x6) (ldb (byte 8 #x30) int))
  (setf (aref *byte-aray-8* #x7) (ldb (byte 8 #x38) int)))

(defun put-u16 (int)
  (setf (aref *byte-aray-16* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-16* #x1) (ldb (byte 8 #x08) int))
  (setf (aref *byte-aray-16* #x2) (ldb (byte 8 #x10) int))
  (setf (aref *byte-aray-16* #x3) (ldb (byte 8 #x18) int))
  (setf (aref *byte-aray-16* #x4) (ldb (byte 8 #x20) int))
  (setf (aref *byte-aray-16* #x5) (ldb (byte 8 #x28) int))
  (setf (aref *byte-aray-16* #x6) (ldb (byte 8 #x30) int))
  (setf (aref *byte-aray-16* #x7) (ldb (byte 8 #x38) int))
  (setf (aref *byte-aray-16* #x8) (ldb (byte 8 #x40) int))
  (setf (aref *byte-aray-16* #x9) (ldb (byte 8 #x48) int))
  (setf (aref *byte-aray-16* #xa) (ldb (byte 8 #x50) int))
  (setf (aref *byte-aray-16* #xb) (ldb (byte 8 #x58) int))
  (setf (aref *byte-aray-16* #xc) (ldb (byte 8 #x60) int))
  (setf (aref *byte-aray-16* #xd) (ldb (byte 8 #x68) int))
  (setf (aref *byte-aray-16* #xe) (ldb (byte 8 #x70) int))
  (setf (aref *byte-aray-16* #xf) (ldb (byte 8 #x78) int)))

;;; "dxf" goes here. Hacks and glory await!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; code-by-value-range.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dxf-out-t-string (code string stream &key (max-octet-length 2048))
    (if (and (stringp string)
	     (<= (length (babel:string-to-octets string)) max-octet-length))
	(format stream "~A~%~A~%" (dxf-code code) string)
;;;;	(break "dxf-t-string: code=~A; ~A~%" code string)
	))
;;;;

(defun dxf-out-t-double (code x stream)
  (if  (numberp x)
       (format stream "~A~%~,12F~%" (dxf-code code) x)
;;;;   (break "dxf-out-t-double: (numberp x) : code=~A x=~A" code x)
       ))
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
;;;;      (break "dxf-b-string: code=~A; ~A~%" code string)
      ))

;;;;

(defun dxf-out-b-double (code x stream)
  (if  (numberp x)
       (progn
	 (put-u2 code)
	 (write-sequence *byte-aray-2* stream)
;;;;	 (put-u8 (ie3fp:encode-ieee-double (coerce x 'double-float)))
	 (put-u8 (ieee-floats:encode-float64 (coerce x 'double-float)))	 
	 (write-sequence *byte-aray-8* stream))
;;;;       (break "dxf-out-b-double: (numberp x) : code=~A x=~A" code x)
       ))

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
    ((<= 10 code 19)     (dxf-out-t-double code value stream)) ;;;; Double precision 3D point value
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dxf.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *dxf-header*
  (format nil "AutoCAD Binary DXF~C~%~C~C"
                 (code-char 13)
                 (code-char 26)
                 (code-char 0)))

(defun dxf-out-t-header (stream) stream)

(defun dxf-out-b-header (stream)
  (write-sequence (babel:
                   string-to-octets *dxf-header*)
                  stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *dxf-code-overal-length* 3
  "@b(Описание:) переменная @b(dxf-code-overal-length) задает
минримальую ширину поля для вывода dxf кода в текстовом режиме.")

(defun dxf-code (code &optional (overal-length *dxf-code-overal-length*))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; header-section-group-codes.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *$ACADMAINTVER* '("$ACADMAINTVER" 70 ) "Maintenance version number (should be ignored)")

(defparameter *$ACADVER* '("$ACADVER" 1 ) "The AutoCAD drawing database version number: 
AC1006 = R10;
AC1009 = R11 and R12;                                                                                              
AC1012 = R13; AC1014 = R14;
AC1015 = AutoCAD 2000;
AC1018 = AutoCAD 2004;
AC1021 = AutoCAD 2007;
AC1024 = AutoCAD 2010")

(defparameter *$ANGBASE* '("$ANGBASE" 50 ) "Angle 0 direction")

(defparameter *$ANGDIR* '("$ANGDIR" 70 ) "1 = Clockwise angles; 0 = Counterclockwise angles")

(defparameter *$ATTMODE* '("$ATTMODE"70 ) "Attribute visibility: 0 = None; 1 = Normal; 2 = All")

(defparameter *$AUNITS* '("$AUNITS" 70 ) "Units format for angles")

(defparameter *$AUPREC* '("$AUPREC" 70 ) "Units precision for angles")

(defparameter *$CECOLOR* '("$CECOLOR" 62 ) "Current entity color number: 0 = BYBLOCK; 256 = BYLAYER")

(defparameter *$CELTSCALE* '("$CELTSCALE" 40 ) "Current entity linetype scale")

(defparameter *$CELTYPE* '("$CELTYPE" 6 ) "Entity linetype name, or BYBLOCK or BYLAYER")

(defparameter *$CELWEIGHT* '("$CELWEIGHT" 370 ) "Lineweight of new objects")

(defparameter *$CEPSNID* '("$CEPSNID" 390 ) "Plotstyle handle of new objects; if CEPSNTYPE is 3, then this value indicates the handle")

(defparameter *$CEPSNTYPE* '("$CEPSNTYPE" 380 ) "Plot style type of new objects:  0 = Plot style by layer; 1 = Plot style by block; 2 = Plot style by dictionary default; 3 = Plot style by object ID/handle")


(defparameter *$CHAMFERA* '("$CHAMFERA" 40 ) "First chamfer distance")

(defparameter *$CHAMFERB* '("$CHAMFERB" 40 )  "Second chamfer distance")

(defparameter *$CHAMFERC* '("$CHAMFERC" 40 ) "Chamfer length")

(defparameter *$CHAMFERD* '("$CHAMFERD" 40 ) "Chamfer angle")

(defparameter *$CLAYER* '("$CLAYER" 8 ) "Current layer name")

(defparameter *$CMLJUST* '("$CMLJUST" 70 ) "Current multiline justification: 0 = Top; 1 = Middle; 2 = Bottom")

(defparameter *$CMLSCALE* '("$CMLSCALE" 40 ) "Current multiline scale")

(defparameter *$CMLSTYLE* '("$CMLSTYLE" 2 ) "Current multiline style name")

(defparameter *$CSHADOW* '("$CSHADOW" 280 ) "Shadow mode for a 3D object: 
  0 = Casts and receives shadows 
  1 = Casts shadows 
  2 = Receives shadows 
  3 = Ignores shadows")


(defparameter *$DIMADEC* '("$DIMADEC" 70 )
  "Number of precision places displayed in angular dimensions")

(defparameter *$DIMALT* '("$DIMALT" 70 )
  "Alternate unit dimensioning performed if nonzero")

(defparameter *$DIMALTD* '("$DIMALTD" 70 )
  "Alternate unit decimal places")

(defparameter *$DIMALTF* '("$DIMALTF" 40 )
  "Alternate unit scale factor")

(defparameter *$DIMALTRND* '("$DIMALTRND" 40 )
  "Determines rounding of alternate units")

(defparameter *$DIMALTTD* '("$DIMALTTD" 70 )
  "Number of decimal places for tolerance values of an alternate units dimension")

(defparameter *$DIMALTTZ* '("$DIMALTTZ" 70 )
  "Controls suppression of zeros for alternate tolerance values:
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches                                                                  
3 = Includes zero inches and suppresses zero feet")


(defparameter *$DIMALTU* '("$DIMALTU" 70 )
  "Units format for alternate units of all dimension style family members except angular: 
1 = Scientific; 2 = Decimal; 3 = Engineering;
4 = Architectural (stacked); 5 = Fractional (stacked);
6 = Architectural; 7 = Fractional")


(defparameter *$DIMALTZ* '("$DIMALTZ" 70 )
  "Controls suppression of zeros for alternate unit dimension values: 
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches
3 = Includes zero inches and suppresses zero feet")


(defparameter *$DIMAPOST* '("$DIMAPOST"1 )
  " Alternate dimensioning suffix")

(defparameter *$DIMASO* '("$DIMASO"70 )
  "1 = Create associative dimensioning
0 = Draw individual entities")


(defparameter *$DIMASSOC* '("$DIMASSOC" 280 )
  "Controls the associativity of dimension objects
0 = Creates exploded dimensions; there is no association between elements of the dimension, and the lines, arcs, arrowheads, and text of a dimension are drawn as separate objects;
1 = Creates non-associative dimension objects; the elements of the dimension are formed into a single object, and if the definition point on the object moves,then the dimension value is updated;
2 = Creates associative dimension objects; the elements of the dimension are formed into a single object and one or more definition points of the dimension are coupled with association points on geometric objects")


(defparameter *$DIMASZ* '("$DIMASZ" 40 )
  "Dimensioning arrow size")

(defparameter *$DIMATFIT* '("$DIMATFIT" 70 )
  "Controls dimension text and arrow placement when space is not sufficient to place both within the extension lines:
0 = Places both text and arrows outside extension lines
1 = Moves arrows first, then text
2 = Moves text first, then arrows
3 = Moves either text or arrows, whichever fits best
AutoCAD adds a leader to moved dimension text when DIMTMOVE is set to 1")


(defparameter *$DIMAUNIT* '("$DIMAUNIT" 70 )
  "Angle format for angular dimensions: 
0 = Decimal degrees; 1 = Degrees/minutes/seconds;
2 = Gradians; 
3 = Radians; 
4 = Surveyor's units")


(defparameter *$DIMAZIN* '("$DIMAZIN" 70 )
  "Controls suppression of zeros for angular dimensions: 
0 = Displays all leading and trailing zeros
1 = Suppresses leading zeros in decimal dimensions
2 = Suppresses trailing zeros in decimal dimensions
3 = Suppresses leading and trailing zeros")


(defparameter *$DIMBLK* '("$DIMBLK" 1 )
  "Arrow block name")

(defparameter *$DIMBLK1* '("$DIMBLK1" 1 )
  "First arrow block name")

(defparameter *$DIMBLK2* '("$DIMBLK2" 1 )
  "Second arrow block name")

(defparameter *$DIMCEN* '("$DIMCEN" 40 )
  "Size of center mark/lines")

(defparameter *$DIMCLRD* '("$DIMCLRD" 70 )
  "Dimension line color: range is 0 = BYBLOCK; 256 = BYLAYER")


(defparameter *$DIMCLRE* '("$DIMCLRE" 70 )
  "Dimension extension line color: range is 0 = BYBLOCK; 256 = BYLAYER")


(defparameter *$DIMCLRT* '("$DIMCLRT" 70 )
  "Dimension text color: range is 0 = BYBLOCK; 256 = BYLAYER")


(defparameter *$DIMDEC* '("$DIMDEC" 70 )
  "Number of decimal places for the tolerance values of a primary units dimension")

(defparameter *$DIMDLE* '("$DIMDLE" 40 )
  "Dimension line extension")

(defparameter *$DIMDLI* '("$DIMDLI" 40 )
  "Dimension line increment")

(defparameter *$DIMDSEP* '("$DIMDSEP" 70 )
  "Single-character decimal separator used when creating dimensions whose unit format is decimal")

(defparameter *$DIMEXE* '("$DIMEXE" 40 )
  "Extension line extension")

(defparameter *$DIMEXO* '("$DIMEXO" 40 )
  "Extension line offset")

(defparameter *$DIMFAC* '("$DIMFAC" 40 )
  "Scale factor used to calculate the height of text for dimension fractions and tolerances. 
AutoCAD multiplies DIMTXT by DIMTFAC to set the fractional or tolerance text height")


(defparameter *$DIMGAP* '("$DIMGAP" 40 )
  "Dimension line gap")

(defparameter *$DIMJUST* '("$DIMJUST" 70 )
  "Horizontal dimension text position: 
0 = Above dimension line and center-justified between extension lines
1 = Above dimension line and next to first extension line
2 = Above dimension line and next to second extension line
3 = Above and center-justified to first extension line
4 = Above and center-justified to second extension line")


(defparameter *$DIMLDRBLK* '("$DIMLDRBLK" 1 )
  "Arrow block name for leaders")

(defparameter *$DIMLFAC* '("$DIMLFAC" 40 )
  "Linear measurements scale factor")

(defparameter *$DIMLIM* '("$DIMLIM" 70 )
  "Dimension limits generated if nonzero")

(defparameter *$DIMLUNIT* '("$DIMLUNIT" 70 )
  "Sets units for all dimension types except Angular: 
1 = Scientific; 2 = Decimal; 3 = Engineering;
4 = Architectural; 5 = Fractional; 6 = Windows desktop")

(defparameter *$DIMLWD* '("$DIMLWD" 70 )
  "Dimension line lineweight: 
-3 = Standard
-2 = ByLayer
-1 = ByBlock
0-211 = an integer representing 100th of mm")


(defparameter *$DIMLWE* '("$DIMLWE" 70 )
  "Extension line lineweight: 
-3 = Standard
-2 = ByLayer
-1 = ByBlock
0-211 = an integer representing 100th of mm")


(defparameter *$DIMPOST* '("$DIMPOST" 1 ) "General dimensioning suffix")

(defparameter *$DIMRND* '("$DIMRND" 40 ) "Rounding value for dimension distances")

(defparameter *$DIMSAH* '("$DIMSAH" 70 ) "Use separate arrow blocks if nonzero")

(defparameter *$DIMSCALE* '("$DIMSCALE" 40 ) "Overall dimensioning scale factor")

(defparameter *$DIMSD1* '("$DIMSD1" 70 ) "Suppression of first extension line: 0 = Not suppressed; 1 = Suppressed")


(defparameter *$DIMSD2* '("$DIMSD2" 70 ) "Suppression of second extension line: 0 = Not suppressed; 1 = Suppressed")




(defparameter *$DIMSE1* '("$DIMSE1" 70 )
    " First extension line suppressed if nonzero")

(defparameter *$DIMSE2* '("$DIMSE2" 70 )
  " Second extension line suppressed if nonzero")

(defparameter *$DIMSHO* '("$DIMSHO" 70 )
  " 1 = Recompute dimensions while dragging 0 = Drag original image")


(defparameter *$DIMSOXD* '("$DIMSOXD" 70 )
  " Suppress outside-extensions dimension lines if nonzero")

(defparameter *$DIMSTYLE* '("$DIMSTYLE" 2 )
  " Dimension style name")

(defparameter *$DIMTAD* '("$DIMTAD" 70 )
  " Text above dimension line if nonzero")

(defparameter *$DIMTDEC* '("$DIMTDEC" 70 )
  " Number of decimal places to display the tolerance values")

(defparameter *$DIMTFAC* '("$DIMTFAC" 40 )
  " Dimension tolerance display scale factor")

(defparameter *$DIMTIH* '("$DIMTIH" 70 )
  " Text inside horizontal if nonzero")

(defparameter *$DIMTIX* '("$DIMTIX" 70 )
  " Force text inside extensions if nonzero")

(defparameter *$DIMTM* '("$DIMTM" 40 )
  " Minus tolerance")

(defparameter *$DIMTMOVE* '("$DIMTMOVE" 70 )
  " Dimension text movement rules: 
0 = Moves the dimension line with dimension text
1 = Adds a leader when dimension text is moved
2 = Allows text to be moved freely without a leader")


(defparameter *$DIMTOFL* '("$DIMTOFL" 70 )
  " If text is outside extensions, force line extensions between extensions if nonzero")

(defparameter *$DIMTOH* '("$DIMTOH" 70 )
  " Text outside horizontal if nonzero")

(defparameter *$DIMTOL* '("$DIMTOL" 70 )
  " Dimension tolerances generated if nonzero")

(defparameter *$DIMTOLJ* '("$DIMTOLJ" 70 )
  " Vertical justification for tolerance values: 
0 = Top; 1 = Middle; 2 = Bottom")


(defparameter *$DIMTP* '("$DIMTP" 40 )
  " Plus tolerance")

(defparameter *$DIMTSZ* '("$DIMTSZ" 40 )
  " Dimensioning tick size: 0 = No ticks")


(defparameter *$DIMTVP* '("$DIMTVP" 40 )
  " Text vertical position")

(defparameter *$DIMTXSTY* '("$DIMTXSTY" 7 )
  " Dimension text style")

(defparameter *$DIMTXT* '("$DIMTXT" 40 )
  " Dimensioning text height")

(defparameter *$DIMTZIN* '("$DIMTZIN" 70 )
  " Controls suppression of zeros for tolerance values: 
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches
3 = Includes zero inches and suppresses zero feet")

(defparameter *$DIMUPT* '("$DIMUPT" 70 )
  " Cursor functionality for user-positioned text: 
0 = Controls only the dimension line location
1 = Controls the text position as well as the dimension line location")


(defparameter *$DIMZIN* '("$DIMZIN" 70 )
  " Controls suppression of zeros for primary unit values: 
0 = Suppresses zero feet and precisely zero inches
1 = Includes zero feet and precisely zero inches
2 = Includes zero feet and suppresses zero inches
3 = Includes zero inches and suppresses zero feet")


(defparameter *$DISPSILH* '("$DISPSILH" 70 )
  " Controls the display of silhouette curves of body objects in Wireframe mode: 
0 = Off; 1 = On")


(defparameter *$DRAGVS* '("$DRAGVS" 349 )
  " Hard-pointer ID to visual style while creating 3D solid primitives. 
The defualt value is NULL")


(defparameter *$DWGCODEPAGE* '("$DWGCODEPAGE" 3 )
  " Drawing code page; set to the system code page when a new drawing is created, but not otherwise maintained by AutoCAD")


(defparameter *$ELEVATION* '("$ELEVATION" 40 )
  " Current elevation set by ELEV command")

(defparameter *$ENDCAPS* '("$ENDCAPS" 280 )
  " Lineweight endcaps setting for new objects: 0 = none; 1 = round; 2 = angle; 3 = square")


(defparameter *$EXTMAX* '("$EXTMAX" '(10 20 30) )
  " X, Y, and Z drawing extents upper-right corner (in WCS)")

(defparameter *$EXTMIN* '("$EXTMIN" '(10 20 30) )
  " X, Y, and Z drawing extents lower-left corner (in WCS)")

(defparameter *$EXTNAMES* '("$EXTNAMES" 290 )
  " Controls symbol table naming: 
0 = Release 14 compatibility. Limits names to 31 characters in length.
Names can include the letters A to Z, the numerals 0 to 9, and the special
characters dollar sign ($), underscore (_), and hyphen (-).
1 = AutoCAD 2000. Names can be up to 255 characters in length, and can include
the letters A to Z, the numerals 0 to 9, spaces, and any special characters not
used for other purposes by Microsoft Windows and AutoCAD")


(defparameter *$FILLETRAD* '("$FILLETRAD" 40 )
  " Fillet radius")

(defparameter *$FILLMODE* '("$FILLMODE" 70 )
  " Fill mode on if nonzero")

(defparameter *$FINGERPRINTGUID* '("$FINGERPRINTGUID" 2 )
  " Set at creation time, uniquely identifies a particular drawing")

(defparameter *$HALOGAP* '("$HALOGAP" 280 )
  " Specifies a gap to be displayed where an object is hidden by another object; 
the value is specified as a percent of one unit and is independent of the
zoom level. A haloed line is shortened at the point where it is hidden when
HIDE or the Hidden option of SHADEMODE is used")


(defparameter *$HANDSEED* '("$HANDSEED" 5 )
  " Next available handle")

(defparameter *$HIDETEXT* '("$HIDETEXT" 290 )
  " Specifies HIDETEXT system variable: 
0 = HIDE ignores text objects when producing the hidden view
1 = HIDE does not ignore text objects")


(defparameter *$HYPERLINKBASE* '("$HYPERLINKBASE" 1 )
  " Path for all relative hyperlinks in the drawing. If null, the drawing path is used")

(defparameter *$INDEXCTL* '("$INDEXCTL" 280 )
  " Controls whether layer and spatial indexes are created and saved in drawing files: 
0 = No indexes are created
1 = Layer index is created
2 = Spatial index is created
3 = Layer and spatial indexes are created")


(defparameter *$INSBASE* '("$INSBASE" '(10 20 30) )
  " Insertion base set by BASE command (in WCS)")

(defparameter *$INSUNITS* '("$INSUNITS" 70 )
  "Default drawing units for AutoCAD DesignCenter blocks: 
0 = Unitless; 1 = Inches; 2 = Feet; 3 = Miles; 4 = Millimeters;
5 = Centimeters; 6 = Meters; 7 = Kilometers; 8 = Microinches;
9 = Mils; 10 = Yards; 11 = Angstroms; 12 = Nanometers;
13 = Microns; 14 = Decimeters; 15 = Decameters;
16 = Hectometers; 17 = Gigameters; 18 = Astronomical units;
19 = Light years; 20 = Parsecs")


(defparameter *$INTERFERECOLOR* '("$INTERFERECOLOR" 62 )
  "Represents the ACI color index of the \"interference objects\" created during the interfere command.Default value is 1")


(defparameter *$INTERFEREOBJVS* '("$INTERFEREOBJVS" 345 )
  " Hard-pointer ID to the visual style for interference objects. Default visual style is Conceptual.")


(defparameter *$INTERFEREVPVS* '("$INTERFEREVPVS" 346 )
  " Hard-pointer ID to the visual style for the viewport during interference checking. Default visual style is 3d Wireframe.")


(defparameter *$INTERSECTIONCOLOR* '("$INTERSECTIONCOLOR" 70 )
  " Specifies the entity color of intersection polylines: 
Values 1-255 designate an AutoCAD color index (ACI)
0 = Color BYBLOCK
256 = Color BYLAYER
257 = Color BYENTITY")


(defparameter *$INTERSECTIONDISPLAY* '("$INTERSECTIONDISPLAY" 290 )
  " Specifies the display of intersection polylines: 
0 = Turns off the display of intersection polylines
1 = Turns on the display of intersection polylines")


(defparameter *$JOINSTYLE* '("$JOINSTYLE" 280 )
  " Lineweight joint setting for new objects: 0=none; 1= round; 2 = angle; 3 = flat")


(defparameter *$LIMCHECK* '("$LIMCHECK" 70 )
  " Nonzero if limits checking is on")

(defparameter *$LIMMAX* '("$LIMMAX"  '(10 20) )
  " XY drawing limits upper-right corner (in WCS)")

(defparameter *$LIMMIN* '("$LIMMIN"  '(10 20) )
  " XY drawing limits lower-left corner (in WCS)")

(defparameter *$LTSCALE* '("$LTSCALE" 40 )
  " Global linetype scale")

(defparameter *$LUNITS* '("$LUNITS" 70 )
  " Units format for coordinates and distances")

(defparameter *$LUPREC* '("$LUPREC" 70 )
  " Units precision for coordinates and distances")

(defparameter *$LWDISPLAY* '("$LWDISPLAY" 290 )
  " Controls the display of lineweights on the Model or Layout tab: 
0 = Lineweight is not displayed
1 = Lineweight is displayed")


(defparameter *$MAXACTVP* '("$MAXACTVP" 70 )
  " Sets maximum number of viewports to be regenerated")

(defparameter *$MEASUREMENT* '("$MEASUREMENT" 70 )
  " Sets drawing units: 0 = English; 1 = Metric")

(defparameter *$MENU* '("$MENU" 1 )
  " Name of menu file")

(defparameter *$MIRRTEXT* '("$MIRRTEXT" 70 )
  " Mirror text if nonzero")

(defparameter *$OBSCOLOR* '("$OBSCOLOR" 70 )
  " Specifies the color of obscured lines. An obscured line is a hidden line made visible by changing its color and linetype and is visible only when the HIDE or SHADEMODE command is used. The OBSCUREDCOLOR setting is visible only if the OBSCUREDLTYPE is turned ON by setting it to a value other than 0.
0 and 256 = Entity color 1-255 = An AutoCAD color index (ACI)")


(defparameter *$OBSLTYPE* '("$OBSLTYPE" 280 )
  " Specifies the linetype of obscured lines. Obscured linetypes are independent of zoom level, unlike regular AutoCAD linetypes. Value 0 turns off display of obscured lines and is the default.
Linetype values are defined as follows: 0 = Off 1 = Solid
2 = Dashed
3 = Dotted
4 = Short Dash
5 = Medium Dash
6 = Long Dash
7 = Double Short Dash
8 = Double Medium Dash
9 = Double Long Dash
10 = Medium Long Dash
11 = Sparse Dot")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *$ORTHOMODE* '("$ORTHOMODE" 70 )
  " Ortho mode on if nonzero")

(defparameter *$PDMODE* '("$PDMODE" 70 )
  " Point display mode")

(defparameter *$PDSIZE* '("$PDSIZE" 40 )
  " Point display size")

(defparameter *$PELEVATION* '("$PELEVATION" 40 )
  " Current paper space elevation")

(defparameter *$PEXTMAX* '("$PEXTMAX" '(10 20 30) )
  " Maximum X, Y, and Z extents for paper space")

(defparameter *$PEXTMIN* '("$PEXTMIN" '(10 20 30) )
  " Minimum X, Y, and Z extents for paper space")

(defparameter *$PINSBASE* '("$PINSBASE" '(10 20 30) )
  " Paper space insertion base point")

(defparameter *$PLIMCHECK* '("$PLIMCHECK" 70 )
  " Limits checking in paper space when nonzero")

(defparameter *$PLIMMAX* '("$PLIMMAX"  '(10 20) )
  " Maximum X and Y limits in paper space")

(defparameter *$PLIMMIN* '("$PLIMMIN"  '(10 20) )
  " Minimum X and Y limits in paper space")

(defparameter *$PLINEGEN* '("$PLINEGEN" 70 )
  " Governs the generation of linetype patterns around the vertices of a 2D polyline: 
1 = Linetype is generated in a continuous pattern around vertices of the polyline
0 = Each segment of the polyline starts and ends with a dash")


(defparameter *$PLINEWID* '("$PLINEWID" 40 )
  " Default polyline width")

(defparameter *$PROJECTNAME* '("$PROJECTNAME" 1 )
  " Assigns a project name to the current drawing. Used when an external reference or image is not found on its original path. The project name points to a section in
the registry that can contain one or more search paths for each project name defined.
Project names and their search directories are created from the Files tab of the Options dialog box")


(defparameter *$PROXYGRAPHICS* '("$PROXYGRAPHICS" 70 )
  " Controls the saving of proxy object images")

(defparameter *$PSLTSCALE* '("$PSLTSCALE" 70 )
  " Controls paper space linetype scaling: 
1 = No special linetype scaling
0 = Viewport scaling governs linetype scaling")


(defparameter *$PSTYLEMODE* '("$PSTYLEMODE" 290 )
  " Indicates whether the current drawing is in a Color-Dependent or Named Plot Style mode: 
0 = Uses named plot style tables in the current drawing
1 = Uses color-dependent plot style tables in the current drawing")


(defparameter *$PSVPSCALE* '("$PSVPSCALE" 40 )
  " View scale factor for new viewports: 
0 = Scaled to fit
>0 = Scale factor (a positive real value)")


(defparameter *$PUCSBASE* '("$PUCSBASE" 2 )
  " Name of the UCS that defines the origin and orientation of orthographic UCS settings (paper space only)")

(defparameter *$PUCSNAME* '("$PUCSNAME" 2 )
  " Current paper space UCS name")

(defparameter *$PUCSORG* '("$PUCSORG" '(10 20 30) )
  " Current paper space UCS origin")

(defparameter *$PUCSORGBACK* '("$PUCSORGBACK" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to BACK when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGBOTTOM* '("$PUCSORGBOTTOM" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to BOTTOM when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGFRONT* '("$PUCSORGFRONT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to FRONT when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGLEFT* '("$PUCSORGLEFT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to LEFT when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGRIGHT* '("$PUCSORGRIGHT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to RIGHT when PUCSBASE is set to WORLD")

(defparameter *$PUCSORGTOP* '("$PUCSORGTOP" '(10 20 30) )
  " Point which becomes the new UCS origin after changing paper space UCS to TOP when PUCSBASE is set to WORLD")

(defparameter *$PUCSORTHOREF* '("$PUCSORTHOREF" 2 )
  " If paper space UCS is orthographic (PUCSORTHOVIEW not equal to 0), this is the name of the UCS that the orthographic UCS is relative to. If blank, UCS is relative to WORLD")


(defparameter *$PUCSORTHOVIEW* '("$PUCSORTHOVIEW" 70 )
  " Orthographic view type of paper space UCS: 0 = UCS is not orthographic;
1 = Top; 2 = Bottom;
3 = Front; 4 = Back;
5 = Left; 6 = Right")


(defparameter *$PUCSXDIR* '("$PUCSXDIR" '(10 20 30) )
  " Current paper space UCS X axis")

(defparameter *$PUCSYDIR* '("$PUCSYDIR" '(10 20 30) )
  " Current paper space UCS Y axis")

(defparameter *$QTEXTMODE* '("$QTEXTMODE" 70 )
  " Quick Text mode on if nonzero")

(defparameter *$REGENMODE* '("$REGENMODE" 70 )
  " REGENAUTO mode on if nonzero")

(defparameter *$SHADEDGE* '("$SHADEDGE" 70 )
  " 0 = Faces shaded, edges not highlighted 
1 = Faces shaded, edges highlighted in black
2 = Faces not filled, edges in entity color
3 = Faces in entity color, edges in black")


(defparameter *$SHADEDIF* '("$SHADEDIF" 70 )
  " Percent ambient/diffuse light; range 1-100; default 70")

(defparameter *$SHADOWPLANELOCATION* '("$SHADOWPLANELOCATION" 40 )
  " Location of the ground shadow plane. This is a Z axis ordinate.")

(defparameter *$SKETCHINC* '("$SKETCHINC" 40 )
  " Sketch record increment")

(defparameter *$SKPOLY* '("$SKPOLY" 70 )
  " 0 = Sketch lines; 1 = Sketch polylines")

(defparameter *$SORTENTS* '("$SORTENTS" 280 )
  " Controls the object sorting methods; accessible from the Options dialog box User Preferences tab. 
SORTENTS uses the following bitcodes: 0 = Disables SORTENTS
1 = Sorts for object selection
2 = Sorts for object snap
4 = Sorts for redraws
8 = Sorts for MSLIDE command slide creation
16 = Sorts for REGEN commands
32 = Sorts for plotting
64 = Sorts for PostScript output")


(defparameter *$SPLINESEGS* '("$SPLINESEGS" 70 )
  " Number of line segments per spline patch")

(defparameter *$SPLINETYPE* '("$SPLINETYPE" 70 )
  " Spline curve type for PEDIT Spline")

(defparameter *$SURFTAB1* '("$SURFTAB1" 70 )
  " Number of mesh tabulations in first direction")

(defparameter *$SURFTAB2* '("$SURFTAB2" 70 )
  " Number of mesh tabulations in second direction")

(defparameter *$SURFTYPE* '("$SURFTYPE" 70 )
  " Surface type for PEDIT Smooth")

(defparameter *$SURFU* '("$SURFU" 70 )
  " Surface density (for PEDIT Smooth) in M direction")

(defparameter *$SURFV* '("$SURFV" 70 )
  " Surface density (for PEDIT Smooth) in N direction")

(defparameter *$TDCREATE* '("$TDCREATE" 40 )
  " Local date/time of drawing creation (see Special Handling of Date/Time Variables)")

(defparameter *$TDINDWG* '("$TDINDWG" 40 )
  " Cumulative editing time for this drawing (see Special Handling of Date/Time Variables)")

(defparameter *$TDUCREATE* '("$TDUCREATE" 40 )
  " Universal date/time the drawing was created (see Special Handling of Date/Time Variables)")

(defparameter *$TDUPDATE* '("$TDUPDATE" 40 )
  " Local date/time of last drawing update (see Special Handling of Date/Time Variables)")

(defparameter *$TDUSRTIMER* '("$TDUSRTIMER" 40 )
  " User-elapsed timer")

(defparameter *$TDUUPDATE* '("$TDUUPDATE" 40 )
  " Universal date/time of the last update/save (see Special Handling of Date/Time Variables)")

(defparameter *$TEXTSIZE* '("$TEXTSIZE" 40 )
  " Default text height")

(defparameter *$TEXTSTYLE* '("$TEXTSTYLE" 7 )
  " Current text style name")

(defparameter *$THICKNESS* '("$THICKNESS" 40 )
  " Current thickness set by ELEV command")

(defparameter *$TILEMODE* '("$TILEMODE" 70 )
  " 1 for previous release compatibility mode; 0 otherwise")

(defparameter *$TRACEWID* '("$TRACEWID" 40 )
  " Default trace width")

(defparameter *$TREEDEPTH* '("$TREEDEPTH" 70 )
  " Specifies the maximum depth of the spatial index")

(defparameter *$UCSBASE* '("$UCSBASE" 2 )
  " Name of the UCS that defines the origin and orientation of orthographic UCS settings")

(defparameter *$UCSNAME* '("$UCSNAME" 2 )
  " Name of current UCS")

(defparameter *$UCSORG* '("$UCSORG" '(10 20 30) )
  " Origin of current UCS (in WCS)")

(defparameter *$UCSORGBACK* '("$UCSORGBACK" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to BACK when UCSBASE is set to WORLD")

(defparameter *$UCSORGBOTTOM* '("$UCSORGBOTTOM" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to BOTTOM when UCSBASE is set to WORLD")

(defparameter *$UCSORGFRONT* '("$UCSORGFRONT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to FRONT when UCSBASE is set to WORLD")

(defparameter *$UCSORGLEFT* '("$UCSORGLEFT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to LEFT when UCSBASE is set to WORLD")

(defparameter *$UCSORGRIGHT* '("$UCSORGRIGHT" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to RIGHT when UCSBASE is set to WORLD")

(defparameter *$UCSORGTOP* '("$UCSORGTOP" '(10 20 30) )
  " Point which becomes the new UCS origin after changing model space UCS to TOP when UCSBASE is set to WORLD")

(defparameter *$UCSORTHOREF* '("$UCSORTHOREF" 2 )
  " If model space UCS is orthographic (UCSORTHOVIEW not equal to 0), this is the name of the UCS that the orthographic UCS is relative to. If blank, UCS is relative to WORLD")


(defparameter *$UCSORTHOVIEW* '("$UCSORTHOVIEW" 70 )
  " Orthographic view type of model space UCS: 
0 = UCS is not orthographic;
1 = Top; 2 = Bottom;
3 = Front; 4 = Back;
5 = Left; 6 = Right")


(defparameter *$UCSXDIR* '("$UCSXDIR" '(10 20 30) )
  " Direction of the current UCS X axis (in WCS)")

(defparameter *$UCSYDIR* '("$UCSYDIR" '(10 20 30) )
  " Direction of the current UCS Y axis (in WCS)")

(defparameter *$UNITMODE* '("$UNITMODE" 70 )
  " Low bit set = Display fractions, feet-and-inches, and surveyor's angles in input format")

(defparameter *$USERI1* '("$USERI1" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI2* '("$USERI2" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI3* '("$USERI3" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI4* '("$USERI4" 70) "Five integer variables intended for use by third-party developers")
(defparameter *$USERI5* '("$USERI5" 70) "Five integer variables intended for use by third-party developers")

(defparameter *$USERR1* '("$USERR1" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR2* '("$USERR2" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR3* '("$USERR3" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR4* '("$USERR4" 40) "Five real variables intended for use by third-party developers")
(defparameter *$USERR5* '("$USERR5" 40) "Five real variables intended for use by third-party developers")

(defparameter *$USRTIMER* '("$USRTIMER" 70 ) "0 = Timer off; 1 = Timer on")

(defparameter *$VERSIONGUID* '("$VERSIONGUID" 2 ) "Uniquely identifies a particular version of a drawing. Updated when the drawing is modified")

(defparameter *$VISRETAIN* '("$VISRETAIN" 70 ) "0 = Don't retain xref-dependent visibility settings; 1 = Retain xref-dependent visibility settings")

(defparameter *$WORLDVIEW* '("$WORLDVIEW" 70 ) "1 = Set UCS to WCS during DVIEW/VPOINT; 0 = Don't change UCS")


(defparameter *$XCLIPFRAME* '("$XCLIPFRAME" 290 ) "Controls the visibility of xref clipping boundaries: 
0 = Clipping boundary is not visible
1 = Clipping boundary is visible")


(defparameter *$XEDIT* '("$XEDIT" 290 ) "Controls whether the current drawing can be edited in-place when being referenced by another drawing. 1 = Can use in-place reference editing")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; header-section-group-codes-list.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *h-vars-list-min*
  '(("ACADVER"  1 "AC1027")
    ("HANDSEED" 5 97))
  "Мининмальный файл заголовка")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *h-vars-list*
  '(("ACADVER"               1   "AC1027")
    ("ACADMAINTVER"         70   20)
    ("DWGCODEPAGE"           3   "ANSI_1251")
    ("LASTSAVEDBY"           1   "namatv")
    ("REQUIREDVERSIONS"    160   0)
    ("INSBASE"              10   #(0.0 0.0 0.0))
    ("EXTMIN"               10   #(1.E+20 1.E+20 1.E+20))
    ("EXTMAX"               10   #(-1.E+20 -1.E+20 -1.E+20))
    ("LIMMIN"               10   #(0.0 0.0))
    ("LIMMAX"               10   #(420.0 297.0))
    ("ORTHOMODE"            70   0)
    ("REGENMODE"            70   1)
    ("FILLMODE"             70   1)
    ("QTEXTMODE"            70   0)
    ("MIRRTEXT"             70   0)
    ("LTSCALE"              40   1.0)
    ("ATTMODE"              70   1)
    ("TEXTSIZE"             40   2.5)
    ("TRACEWID"             40   1.0)
    ("TEXTSTYLE"             7   "Standard")
    ("CLAYER"                8   "0")
    ("CELTYPE"               6   "ByLayer")
    ("CECOLOR"              62   256)
    ("CELTSCALE"            40   1.0)
    ("DISPSILH"             70   0)
    ("DIMSCALE"             40   1.0)
    ("DIMASZ"               40   2.5)
    ("DIMEXO"               40   0.625)
    ("DIMDLI"               40   3.75)
    ("DIMRND"               40   0.0)
    ("DIMDLE"               40   0.0)
    ("DIMEXE"               40   1.25)
    ("DIMTP"                40   0.0)
    ("DIMTM"                40   0.0)
    ("DIMTXT"               40   2.5)
    ("DIMCEN"               40   2.5)
    ("DIMTSZ"               40   0.0)
    ("DIMTOL"               70   0)
    ("DIMLIM"               70   0)
    ("DIMTIH"               70   0)
    ("DIMTOH"               70   0)
    ("DIMSE1"               70   0)
    ("DIMSE2"               70   0)
    ("DIMTAD"               70   1)
    ("DIMZIN"               70   8)
    ("DIMBLK"                1   "")
    ("DIMASO"               70   1)
    ("DIMSHO"               70   1)
    ("DIMPOST"               1   "")
    ("DIMAPOST"              1   "")
    ("DIMALT"               70   0)
    ("DIMALTD"              70   3)
    ("DIMALTF"              40   0.03937007874016)
    ("DIMLFAC"              40   1.0)
    ("DIMTOFL"              70   1)
    ("DIMTVP"               40   0.0)
    ("DIMTIX"               70   0)
    ("DIMSOXD"              70   0)
    ("DIMSAH"               70   0)
    ("DIMBLK1"               1   "")
    ("DIMBLK2"               1   "")
    ("DIMSTYLE"              2   "ISO-25")
    ("DIMCLRD"              70   0)
    ("DIMCLRE"              70   0)
    ("DIMCLRT"              70   0)
    ("DIMTFAC"              40   1.0)
    ("DIMGAP"               40   0.625)
    ("DIMJUST"              70   0)
    ("DIMSD1"               70   0)
    ("DIMSD2"               70   0)
    ("DIMTOLJ"              70   0)
    ("DIMTZIN"              70   8)
    ("DIMALTZ"              70   0)
    ("DIMALTTZ"             70   0)
    ("DIMUPT"               70   0)
    ("DIMDEC"               70   2)
    ("DIMTDEC"              70   2)
    ("DIMALTU"              70   2)
    ("DIMALTTD"             70   3)
    ("DIMTXSTY"              7   "Standard")
    ("DIMAUNIT"             70   0)
    ("DIMADEC"              70   0)
    ("DIMALTRND"            40   0.0)
    ("DIMAZIN"              70   0)
    ("DIMDSEP"              70   44)
    ("DIMATFIT"             70   3)
    ("DIMFRAC"              70   0)
    ("DIMLDRBLK"             1   "")
    ("DIMLUNIT"             70   2)
    ("DIMLWD"               70   -2)
    ("DIMLWE"               70   -2)
    ("DIMTMOVE"             70   0)
    ("DIMFXL"               40   1.0)
    ("DIMFXLON"             70   0)
    ("DIMJOGANG"            40   0.7853981633974483)
    ("DIMTFILL"             70   0)
    ("DIMTFILLCLR"          70   0)
    ("DIMARCSYM"            70   0)
    ("DIMLTYPE"              6   "")
    ("DIMLTEX1"              6   "")
    ("DIMLTEX2"              6   "")
    ("DIMTXTDIRECTION"      70   0)
    ("LUNITS"               70   2)
    ("LUPREC"               70   4)
    ("SKETCHINC"            40   1.0)
    ("FILLETRAD"            40   0.0)
    ("AUNITS"               70   0)
    ("AUPREC"               70   0)
    ("MENU"                  1   ".")
    ("ELEVATION"            40   0.0)
    ("PELEVATION"           40   0.0)
    ("THICKNESS"            40   0.0)
    ("LIMCHECK"             70   0)
    ("CHAMFERA"             40   0.0)
    ("CHAMFERB"             40   0.0)
    ("CHAMFERC"             40   0.0)
    ("CHAMFERD"             40   0.0)
    ("SKPOLY"               70   0)
    ("TDCREATE"             40   2457804.467045579)
    ("TDUCREATE"            40   2457804.383712245)
    ("TDUPDATE"             40   2457804.467436215)
    ("TDUUPDATE"            40   2457804.384102882)
    ("TDINDWG"              40   0.0003909491)
    ("TDUSRTIMER"           40   0.0003908681)
    ("USRTIMER"             70   1)
    ("ANGBASE"              50   0.0)
    ("ANGDIR"               70   0)
    ("PDMODE"               70   0)
    ("PDSIZE"               40   0.0)
    ("PLINEWID"             40   0.0)
    ("SPLFRAME"             70   0)
    ("SPLINETYPE"           70   6)
    ("SPLINESEGS"           70   8)
    ("HANDSEED"              5   560) 
    ("SURFTAB1"             70   6)
    ("SURFTAB2"             70   6)
    ("SURFTYPE"             70   6)
    ("SURFU"                70   6)
    ("SURFV"                70   6)
    ("UCSBASE"               2   "")
    ("UCSNAME"               2   "")
    ("UCSORG"               10   #(0.0 0.0 0.0))
    ("UCSXDIR"              10   #(1.0 0.0 0.0))
    ("UCSYDIR"              10   #(0.0 1.0 0.0))
    ("UCSORTHOREF"           2   "")
    ("UCSORTHOVIEW"         70   0)
    ("UCSORGTOP"            10   #(0.0 0.0 0.0))
    ("UCSORGBOTTOM"         10   #(0.0 0.0 0.0))
    ("UCSORGLEFT"           10   #(0.0 0.0 0.0))
    ("UCSORGRIGHT"          10   #(0.0 0.0 0.0))
    ("UCSORGFRONT"          10   #(0.0 0.0 0.0))
    ("UCSORGBACK"           10   #(0.0 0.0 0.0))
    ("PUCSBASE"              2   "")
    ("PUCSNAME"              2   "")
    ("PUCSORG"              10   #(0.0 0.0 0.0))
    ("PUCSXDIR"             10   #(1.0 0.0 0.0))
    ("PUCSYDIR"             10   #(0.0 1.0 0.0))
    ("PUCSORTHOREF"          2   "")
    ("PUCSORTHOVIEW"        70   0)
    ("PUCSORGTOP"           10   #(0.0 0.0 0.0))
    ("PUCSORGBOTTOM"        10   #(0.0 0.0 0.0))
    ("PUCSORGLEFT"          10   #(0.0 0.0 0.0))
    ("PUCSORGRIGHT"         10   #(0.0 0.0 0.0))
    ("PUCSORGFRONT"         10   #(0.0 0.0 0.0))
    ("PUCSORGBACK"          10   #(0.0 0.0 0.0))
    ("USERI1"               70   0)
    ("USERI2"               70   0)
    ("USERI3"               70   0)
    ("USERI4"               70   0)
    ("USERI5"               70   0)
    ("USERR1"               40   0.0)
    ("USERR2"               40   0.0)
    ("USERR3"               40   0.0)
    ("USERR4"               40   0.0)
    ("USERR5"               40   0.0)
    ("WORLDVIEW"            70   1)
    ("SHADEDGE"             70   3)
    ("SHADEDIF"             70   70)
    ("TILEMODE"             70   1)
    ("MAXACTVP"             70   64)
    ("PINSBASE"             10   #(0.0 0.0 0.0))
    ("PLIMCHECK"            70   0)
    ("PEXTMIN"              10   #(0.0 0.0 0.0))
    ("PEXTMAX"              10   #(0.0 0.0 0.0))
    ("PLIMMIN"              10   #(0.0 0.0))
    ("PLIMMAX"              10   #(12.0 9.0))
    ("UNITMODE"             70   0)
    ("VISRETAIN"            70   1)
    ("PLINEGEN"             70   0)
    ("PSLTSCALE"            70   1)
    ("TREEDEPTH"            70   3020)
    ("CMLSTYLE"              2   "Standard")
    ("CMLJUST"              70   0)
    ("CMLSCALE"             40   20.0)
    ("PROXYGRAPHICS"        70   1)
    ("MEASUREMENT"          70   1)
    ("CELWEIGHT"           370   -1)
    ("ENDCAPS"             280   0)
    ("JOINSTYLE"           280   0)
    ("LWDISPLAY"           290   0)
    ("INSUNITS"             70   4)
    ("HYPERLINKBASE"         1   "")
    ("STYLESHEET"            1   "")
    ("XEDIT"               290   1)
    ("CEPSNTYPE"           380   0)
    ("PSTYLEMODE"          290   1)
    ("FINGERPRINTGUID"       2   "{A066C69A-91DF-4F34-A204-AF3BEC30AA17}")
    ("VERSIONGUID"           2   "{02B655AA-2030-4262-89BC-BE4F196822EC}")
    ("EXTNAMES"            290   1)
    ("PSVPSCALE"            40   0.0)
    ("OLESTARTUP"          290   0)
    ("SORTENTS"            280   127)
    ("INDEXCTL"            280   0)
    ("HIDETEXT"            280   1)
    ("XCLIPFRAME"          280   2)
    ("HALOGAP"             280   0)
    ("OBSCOLOR"             70   257)
    ("OBSLTYPE"            280   0)
    ("INTERSECTIONDISPLAY" 280   0)
    ("INTERSECTIONCOLOR"    70   257)
    ("DIMASSOC"            280   2)
    ("PROJECTNAME"           1   "")
    ("CAMERADISPLAY"       290   0)
    ("LENSLENGTH"           40   50.0)
    ("CAMERAHEIGHT"         40   0.0)
    ("STEPSPERSEC"          40   2.0)
    ("STEPSIZE"             40   6.0)
    ("3DDWFPREC"            40   2.0)
    ("PSOLWIDTH"            40   5.0)
    ("PSOLHEIGHT"           40   80.0)
    ("LOFTANG1"             40   1.570796326794896)
    ("LOFTANG2"             40   1.570796326794896)
    ("LOFTMAG1"             40   0.0)
    ("LOFTMAG2"             40   0.0)
    ("LOFTPARAM"            70   7)
    ("LOFTNORMALS"         280   1)
    ("LATITUDE"             40   37.795)
    ("LONGITUDE"            40   -122.394)
    ("NORTHDIRECTION"       40   0.0)
    ("TIMEZONE"             70   -8000)
    ("LIGHTGLYPHDISPLAY"   280   1)
    ("TILEMODELIGHTSYNCH"  280   1)
    ("CMATERIAL"           347   236) 
    ("SOLIDHIST"           280   0)
    ("SHOWHIST"            280   1)
    ("DWFFRAME"            280   2)
    ("DGNFRAME"            280   0)
    ("REALWORLDSCALE"      290   1)
    ("INTERFERECOLOR"       62   1)
    ("INTERFEREOBJVS"      345   249)
    ("INTERFEREVPVS"       346   246)
    ("CSHADOW"             280   0)
    ("SHADOWPLANELOCATION"  40   0.0)))

(defparameter *h-vars* (make-hash-table :test 'equal))

(mapc #'(lambda (el) (setf (gethash (first el) *h-vars*) (list (second el) (third el)))) *h-vars-list*)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-header ()
  ((header-vars :accessor header-vars :initarg :header-vars :initform *h-vars-list*
		:documentation "
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A85E8E67-27CD-4C59-BE61-4DC9FADBE74A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A85E8E67-27CD-4C59-BE61-4DC9FADBE74A
")))

(defmethod dxf-out-text :before ((x Db-Header) stream)
  (dxf-out-t-string 0 *section* stream)
  (dxf-out-t-string 2 *section-header* stream))

(defmethod dxf-out-text ((x Db-Header) stream)
  (mapc #'(lambda (el)
	    (when (third el)
	      (dxf-out-t-string 9 (concatenate 'string "$" (first el)) stream)
	      (dxf-out-t (second el) (third el) stream)))
	(header-vars x)))

(defmethod dxf-out-text :after ((x Db-Header) stream)
    (dxf-out-t-string 0 *endsec* stream))

(defparameter *hdr* (make-instance 'db-header))

(dxf-out-text *hdr* t)

(defparameter *hdr-min* (make-instance 'db-header :header-vars *h-vars-list-min* ))

(dxf-out-text *hdr-min* t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
