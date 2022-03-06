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
  (write-sequence (babel:string-to-octets *dxf-header*)
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
;;;; db-classes.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun make-slot (el)
  "Вспмогательная функция для формирования слотов"
  (list  el
	 :accessor el
	 :initarg (read-from-string (concatenate 'string ":"(symbol-name el)))
	 :initform nil
	 :documentation (symbol-name el)))

(defparameter *radian-to-degree* (/ 180 pi))

(defparameter *degree-to-radian* (/ pi 180))

(defclass ge-point-3d ()
    ((point-3d :accessor point-3d :initarg :point-3d :initform (vector 0 0 0))))

(defmethod write-dxf-binary (code (point-3d ge-point-3d) stream)
  (dxf-out-binary-double (+ 00 code) (svref (point-3d point-3d) 0) stream)
  (dxf-out-binary-double (+ 10 code) (svref (point-3d point-3d) 1) stream)
  (dxf-out-binary-double (+ 20 code) (svref (point-3d point-3d) 2) stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass rx-object ()
  ((name :accessor name :initarg :name :initform "")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass dxf-pairs ()
  ((pairs :accessor pairs        :initarg :pairs        :initform nil :documentation "pairs"))
  (:documentation
   "Содержит dxf-представление объекта"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(export 'dxf-in-text)

(defgeneric dxf-in-text (object pairs)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-in-text) считывает данные из
@b(pairs) в @b(object).
")
  )

(defmethod  dxf-in-text ((object dxf-pairs) (pairs cons))
;;; (break "dxf-in-text ((object dxf-pairs) (pairs cons))")
  object)

(defmethod  dxf-in-text :after ((object dxf-pairs) (pairs cons))
;;; (break "dxf-in-text :after ((object dxf-pairs) (pairs cons))")
  (setf (pairs object) (copy-list pairs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass object () ())

(defparameter *object-properties* '())
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Acad-Object-class-marker* "OBJECT")

(defparameter *Acad-Object-subclass-marker* "AcDbObject")

(defclass acad-object (object)
  ((ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
   (ac-document                 :accessor ac-document                 :initarg :ac-document                 :initform nil :documentation "ac-document")
   (ac-handle                   :accessor ac-handle                   :initarg :ac-handle                   :initform nil :documentation "Код   5. Дескриптор ac-handle  -> Handle") 
   (ac-has-extension-dictionary :accessor ac-has-extension-dictionary :initarg :ac-has-extension-dictionary :initform nil :documentation "ac-has-extension-dictionary")
   (ac-object-id                :accessor ac-object-id                :initarg :ac-object-id                :initform nil :documentation "ac-object-id")
   (ac-object-name              :accessor ac-object-name              :initarg :ac-object-name              :initform nil :documentation "ac-object-name")
   (ac-owner-id                 :accessor ac-owner-id                 :initarg :ac-owner-id                 :initform nil :documentation "Код 330. ac-owner-id -> Owner-ID")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (next-handle      :accessor next-handle   :initarg :next-handle   :initform 1   :allocation :class))
  (:documentation "The standard interface for a basic AutoCAD object."))

(defparameter *acad-object-properties* '(Application Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(mapcar #'make-slot (set-difference *acad-object-properties* *object-properties*))

(export 'dxf-out-text)

(defgeneric dxf-out-text (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в текстовом формате."))

(defmethod dxf-out-text ((x Acad-Object) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-text :after ((x Acad-Object) stream)
  (let (
	(hdl (Handle x))
	(own (Owner-ID x)))
    (when hdl (dxf-out-t-hex   5 hdl stream))
    (when own (dxf-out-t-hex 330 own stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric dxf-out-binary (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в двоичном формате."))

(defmethod dxf-out-binary ((x Acad-Object) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x Acad-Object) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf-out-t-hex 330 own stream))
    (when hdl (dxf-out-t-hex   5 hdl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text ((object acad-object) (pairs cons))
;;; (break "dxf-in-text ((object acad-object) (pairs cons))")
    )

(defmethod  dxf-in-text :after ((object acad-object) (pairs cons))
;;; (break "dxf-in-text :after ((object acad-object) (pairs cons))")

  (let ((c-5   (cadr (assoc   5 pairs :test #'equal)))
	(c-330 (cadr (assoc 330 pairs :test #'equal))))
    ;;    (break "~A ~A"  c-5 c-330)
    (when c-5   (setf (Handle   object) c-5))
    (when c-330 (setf (Owner-ID object) c-330))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-entity-class-marker* "ENTITY")

(defparameter *acad-entity-subclass-marker* "AcDbEntity")

(defclass acad-entity (acad-object)
  ((layer                :accessor layer           :initarg :layer  :initform "0" :documentation "Код   8. Имя слоя  entity-layer -> Layer" )
   (entity-transparency)
   (line-type            :accessor line-type       :initarg :line-type  :initform "BYLAYER" :documentation "Код   6. Linetype name (present if not BYLAYER). The special name BYBLOCK indicates a floating linetype (optional) | BYLAYER |" )
   (hyperlinks)
   (line-type-scale      :accessor line-type-scale :initarg :line-type-scale  :initform 1.0d0 :documentation "Код 48")
   (line-weight          :accessor line-weight     :initarg :line-weight      :initform -1    :documentation "| 370 | Lineweight enum value. Stored and moved around as a 16-bit integer. | not omitted |")
   (material)
   (PlotStyleName)
   (truecolor            :accessor truecolor       :initarg :truecolor :initform *color-bylayer* :documentation "Код   62 и 420" )
   (visible              :accessor visible         :initarg :visible :initform t :documentation " 60 | Object visibility (optional): 0 = Visible 1 = Invisible | 0"))
; (plotstylename :accessor plotstylename :initarg :plotstylename :initform nil :documentation "plotstylename")
; (material :accessor material :initarg :material :initform nil :documentation "material")

  (:documentation "См. ./dbmain.h:class ADESK_NO_VTABLE AcDbEntity: public AcDbObject

"))

(defparameter *acad-entity-properties* '(Application Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-entity-properties* *acad-object-properties*)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-text ((x acad-entity) stream)
  (dxf-out-t-string 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-entity) stream)
  (dxf-out-t-string 100 *acad-entity-subclass-marker* stream)
  (let ((la  (Layer  x))
	(cl  (truecolor x))
	(lt  (line-type  x))
	(vi  (visible   x))
	(lts (line-type-scale x))
	(lw  (line-weight x))
	)
    (dxf-out-t-string 8 la stream)
    (unless (string= "BYLAYER" lt ) (dxf-out-t 6 lt stream))
    (cond
      ((= 256 (first cl)))
      ((= 0   (first cl)) (dxf-out-t 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf-out-t-int16 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf-out-t-int16 62  (first cl) stream)
       (dxf-out-t-int32 420 (color-rgb-to-truecolor (second cl)) stream)))
    (unless (= lts 1.d0) (dxf-out-t 48 lts stream))
    (unless (= lw -1) (dxf-out-t-int16  370 lw stream))
    (unless vi  (dxf-out-t 60 1   stream))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LLLL;;

(defmethod dxf-out-binary ((x acad-entity) stream)
  (dxf-out-b-string 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-entity) stream)
  (dxf-out-b-string 100 *acad-entity-subclass-marker* stream)
  (let ((hdl (Handle x))
	(la (Layer x))
	(cl (truecolor x)))
    (when hdl (dxf-out-b-hex 5 hdl stream))
    (dxf-out-b-string 8 la stream)
    (unless (= 256 cl) (dxf-out-b-int16 62  cl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text :after ((object acad-entity) (pairs cons))
  (let ((c-8   (cadr (assoc   8 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal)))
	(c-60  (cadr (assoc  60 pairs :test #'equal)))
	(c-48  (cadr (assoc  48 pairs :test #'equal)))
	(c-370 (cadr (assoc 370 pairs :test #'equal)))
	)
    (when c-8   (setf (layer     object) c-8))
    (when c-6   (setf (line-type  object) c-6))
    (cond
      ((and c-62 c-420)
       (setf (truecolor object)
	     (list c-62 (color-truecolor-to-rgb   c-420))))
      (c-62
       (setf (truecolor object)
	     (list c-62 nil)))
      (t
       (setf (truecolor object) (list 256 nil))))
    (cond
      ((numberp c-48) (setf (line-type-scale  object) c-48))
      ((null    c-48) (setf (line-type-scale  object) 1.d0))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-48 value ~A" c-48)))
    (cond
      ((null    c-370) (setf (line-weight object) -1))
      ((numberp c-370) (setf (line-weight object) c-370))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-370 value ~A" c-370)))
    (cond
      ((null c-60)           (setf (visible object) t))
      ((and c-60 (= c-60 0)) (setf (visible object) t))
      ((and c-60 (= c-60 1)) (setf (visible object) nil))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-60 value ~A" c-60)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-curve-class-marker* "CURVE")

(defparameter *db-curve-subclass-marker* "AcDbCurve")

(defclass db-curve (acad-entity) ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-line-class-marker* "LINE")

(defparameter *acad-line-subclass-marker* "AcDbLine")

(defclass acad-line (acad-entity)
  ((StartPoint :accessor StartPoint  :initarg :StartPoint  :initform (vector 0d0 0d0 0d0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (EndPoint   :accessor EndPoint    :initarg :EndPoint    :initform (vector 0d0 0d0 0d0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (Thickness  :accessor Thickness   :initarg :thickness   :initform 0d0                   :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (Normal     :accessor Normal      :initarg :Normal      :initform (vector 0d0 0d0 1d0)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (Angle)
   (Delta)
   (Length))

  (:documentation "См. ./dbents.h:class AcDbLine: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66

LINE (DXF)
К объектам линии применяются следующие групповые коды.
Групповые коды линии
|---------------+---------------------------------------------------------------------------|
| Групповой код | Описание                                                                  |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLine)                                               |
|---------------+---------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Начальная точка (в МСК)                                                   |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начальной точки (в МСК)                      |
|---------------+---------------------------------------------------------------------------|
|            11 | Конечная точка (в МСК)                                                    |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z конечной точки (в МСК)                           |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|---------------+---------------------------------------------------------------------------|

;   Angle (RO) = 2.54047
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff77d4470f8>
;   Delta (RO) = (-1.58936 1.08997 0.0)
;   Document (RO) = #<VLA-OBJECT IAcadDocument 00000142daa47188>
;   EndPoint = (-1.58936 1.09759 0.0)
;   EntityTransparency = \"ByLayer\"
;   Handle (RO) = \"162\"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 00000142eeeb8188>
;   Layer = \"0\"
;   Length (RO) = 1.9272
;   Linetype = \"ByLayer\"
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = \"ByBlock\"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 42
;   ObjectName (RO) = \"AcDbLine\"
;   OwnerID (RO) = 43
;   PlotStyleName = \"ByLayer\"
;   StartPoint = (0.0 0.00762657 0.0)
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 00000142eeebf020>
;   Visible = -1
"))

(defmethod dxf-out-text ((x Acad-Line) stream)
  (dxf-out-t-string 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-text :after ((x Acad-Line) stream)
  (dxf-out-t-string 100 *Acad-Line-subclass-marker* stream)
  (let ((th  (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-s stream)
    (dxf-out-t-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf-out-t-point-3d nrm 210 stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Acad-Line) stream)
  (dxf-out-b-string 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-binary :after ((x Acad-Line) stream)
  (dxf-out-b-string 100 *Acad-Line-subclass-marker* stream)
  (let ((th (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-s stream)
    (dxf-out-b-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf-out-b-point-3d nrm 210 stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-line) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-line-class-marker*)))

(defmethod  dxf-in-text :after ((object Acad-Line) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	(c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (StartPoint object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (StartPoint object) (vector c-10 c-20 0d0)))
      (t                           (setf  (StartPoint object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (EndPoint   object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (EndPoint   object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (EndPoint   object) (vector 0.d0 0.d0 0.d0))))
    (cond
      (c-39     (setf  (thickness   object) c-39))
      (t        (setf  (thickness   object) 0.0d0)))
    (cond
      ((and c-210 c-220 c-230)     (setf  (normal   object) (vector c-210 c-220 c-230)))
      (t                           (setf  (normal   object) (vector 0.0d0 0.0d0 1.0d0))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-point-class-marker* "POINT")

(defparameter *acad-point-subclass-marker* "AcDbPoint")

(defclass acad-point (acad-entity)
  ((coordinates :accessor coordinates :initarg :coordinates    :initform (vector 0.0d0 0.0d0 0.0d0) :documentation "Код  10. Положение точки")
   (thickness   :accessor thickness   :initarg :thickness      :initform 0.0d0                      :documentation "Код  39. Высота выдавливания")
   (normal      :accessor normal      :initarg :normal         :initform (vector 0.0d0 0.0d0 1.0d0) :documentation "Код 210. Направление выдавливания")
   (ecs-angle   :accessor ecs-angle   :initarg :ecs-angle      :initform 0.0d0                      :documentation "Код  50. Поворот системы координат объекта"))

  (:documentation "См. ./dbents.h:class AcDbPoint: public AcDbEntity
		  http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317
		  http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317

POINT (DXF)
К точечным объектам применяются следующие групповые коды.
Групповые коды точки 
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbPoint)                                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            10 | Местоположение точки (в МСК)                                                                                                              |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для местоположения точки (в МСК)                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                                                                                        |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                                                                 |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Угол оси X для ПСК, используемый при построении точки (необязательно, по умолчанию = 0); используется, если параметр PDMODE не равен нулю |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
"))

(defparameter *acad-point-properties* '(Application Coordinates Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Thickness TrueColor Visible))

(mapcar #'make-slot (set-difference *acad-point-properties* *acad-entity-properties*))

(defmethod dxf-out-text ((x acad-point) stream)
    (dxf-out-t-string 0 *acad-point-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-point) stream)
  (dxf-out-t-string 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th  0) (dxf-out-t-double  39 th stream))
    (dxf-out-t-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-t-double 50 ecs stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-point) stream)
  (dxf-out-b-string 0 *acad-point-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-point) stream)
  (dxf-out-b-string 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf-out-b-double 50 ecs stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-point) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-point-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-point) (pairs cons))
  (let ((c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	(c-50  (cadr (assoc  50 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (coordinates object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (coordinates object) (vector c-10 c-20 0.d0)))
      (t                           (setf  (coordinates object) (vector 0.d0 0.d0 0.d0))))
    (cond
      (c-39     (setf  (thickness   object) c-39))
      (t        (setf  (thickness   object) 0.0d0)))
    (cond
      ((and c-210 c-220 c-230)     (setf  (normal   object) (vector c-210 c-220 c-230)))
      (t                           (setf  (normal   object) (vector 0.0d0 0.0d0 1.0d0))))
    (cond
      (c-50     (setf  (ecs-angle   object) c-50))
      (t        (setf  (ecs-angle   object) 0.0d0)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-ray-class-marker* "RAY")

(defparameter *acad-ray-subclass-marker* "AcDbRay")

(defclass acad-ray (acad-entity)
  ((base-point       :accessor base-point       :initarg :base-point       :initform (vector 0.0d0 0.0d0 0.0d0) :documentation "Код 10. Базовая точка")
   (direction-vector :accessor direction-vector :initarg :direction-vector :initform (vector 1.0d0 0.0d0 0.0d0) :documentation "Код 11. Едининчный вектор в МСК, задающий направление")
;;;; (second-point :accessor second-point :initarg :second-point :initform nil :documentation "second-point")
   )
  (:documentation "См. ./dbray.h:class AcDbRay: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415

RAY (DXF)
К объектам луча применяются следующие групповые коды.
Групповые коды луча 
|---------------+--------------------------------------------------------------|
| Групповой код | Описание                                                     |
|---------------+--------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbRay)                                   |
|---------------+--------------------------------------------------------------|
|            10 | Начальная точка (в МСК)                                      |
|               | Файл DXF: значение X; приложение: 3D-точка                   |
|---------------+--------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начальной точки (в МСК)         |
|---------------+--------------------------------------------------------------|
|            11 | Вектор единичного направления (в МСК)                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                  |
|---------------+--------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z вектора направления единицы (в МСК) |
|---------------+--------------------------------------------------------------|
"))

(defparameter *acad-ray-properties* '(Application BasePoint DirectionVector Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName SecondPoint TrueColor Visible))

(mapcar #'make-slot (set-difference *acad-ray-properties* *acad-entity-properties*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-text ((x acad-ray) stream)
  (dxf-out-t-string 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-text  :after ((x acad-ray) stream)
  (dxf-out-t-string 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-t-point-3d 10 b-p stream)
    (dxf-out-t-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x acad-ray) stream)
  (dxf-out-b-string 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-binary  :after ((x acad-ray) stream)
  (dxf-out-b-string 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-b-point-3d 10 b-p stream)
    (dxf-out-b-point-3d 11 u-d stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-ray) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-ray-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-ray) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (base-point object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (base-point object) (vector c-10 c-20 0d0)))
      (t                           (setf  (base-point object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (direction-vector object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (direction-vector object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (direction-vector object) (vector 1.d0 0.d0 0.d0))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-xline-class-marker* "XLINE")

(defparameter *acad-xline-subclass-marker* "AcDbXline")

(defclass acad-xline (acad-entity)
  ((base-point :accessor base-point :initarg :base-point :initform (vector 0 0 0) :documentation "Код 10. Первая точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (direction-vector   :accessor direction-vector   :initarg :direction-vector   :initform (vector 1 0 0) :documentation "Код 40. Вектор единичного направления (в МСК). Файл DXF: значение X; приложение: 3D-вектор")
;;; (secondpoint :accessor secondpoint :initarg :secondpoint :initform nil :documentation "secondpoint")
   )
  (:documentation "См. ./dbxline.h:class AcDbXline: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A

XLINE (DXF)
К объектам XLINE применяются следующие групповые коды.
Групповые коды XLINE
|---------------+--------------------------------------------------------------|
| Групповой код | Описание                                                     |
|---------------+--------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbXline)                                 |
|---------------+--------------------------------------------------------------|
|            10 | Первая точка (в МСК)                                         |
|               | Файл DXF: значение X; приложение: 3D-точка                   |
|---------------+--------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z первой точки (в МСК)                |
|---------------+--------------------------------------------------------------|
|            11 | Вектор единичного направления (в МСК)                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                  |
|---------------+--------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z вектора направления единицы (в МСК) |
|---------------+--------------------------------------------------------------|
"))


(defparameter *acad-xline-properties* '(Application BasePoint DirectionVector Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName SecondPoint TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-xline-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x acad-xline) stream)
  (dxf-out-t-string 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-text  :after ((x acad-xline) stream)
  (dxf-out-t-string 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-t-point-3d 10 b-p stream)
    (dxf-out-t-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x acad-xline) stream)
  (dxf-out-b-string 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-binary  :after ((x acad-xline) stream)
  (dxf-out-b-string 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf-out-b-point-3d 10 b-p stream)
    (dxf-out-b-point-3d 11 u-d stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-xline) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-xline-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-xline) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (base-point object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (base-point object) (vector c-10 c-20 0d0)))
      (t                           (setf  (base-point object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (direction-vector object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (direction-vector object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (direction-vector object) (vector 1.d0 0.d0 0.d0))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *Acad-Circle-class-marker* "CIRCLE")

(defparameter *Acad-Circle-subclass-marker* "AcDbCircle")

(defclass  acad-circle (acad-entity) 
  ((center    :accessor center     :initarg :center    :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius    :accessor radius     :initarg :radius    :initform 1              :documentation "Код 40. Радиус")
   (thickness :accessor thickness  :initarg :thickness :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal    :accessor normal     :initarg :normal    :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (area)
   (circumference)
   (diameter) 
   )
  (:documentation
   "См. ./dbents.h:class AcDbCircle: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18

CIRCLE (DXF)
К объектам CIRCLE применяются следующие групповые коды.
Групповые коды CIRCLE 
| Групповой код | Описание                                                                  |
|           100 | Маркер подкласса (AcDbCircle)                                             |
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Центральная точка (в ОСК)                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в ОСК)                    |
|            40 | Радиус                                                                    |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|               | Понятия, связанные с данным                                               |
|---------------+---------------------------------------------------------------------------|
"))

(defmethod dxf-out-text ((x Acad-Circle) stream)
  (dxf-out-t-string 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-text  :after ((x Acad-Circle) stream)
  (dxf-out-t-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x Acad-Circle) stream)
  (dxf-out-b-string 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-binary :after ((x Acad-Circle) stream)
  (dxf-out-b-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object Acad-Circle) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *Acad-Circle-class-marker*))))

(defmethod  dxf-in-text :after ((object Acad-Circle) (pairs cons))
  (let ((c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (if  c-39 (setf  (thickness object) c-39)
	 (setf  (thickness object) 0.0d0))
    (if  c-40 (setf  (radius object) c-40)
	 (setf  (radius object) 1.0d0))
    (if (and c-10 c-20 c-30)
	(setf  (center object) (vector c-10 c-20 c-30))
	(setf  (center object) (vector 0.0d0 0.0d0 0.0d0)))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-arc-class-marker* "ARC")

(defparameter *acad-arc-subclass-marker* "AcDbArc")

(defclass acad-arc (acad-entity)
  ((center      :accessor center      :initarg :center      :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius      :accessor radius      :initarg :radius      :initform 1              :documentation "Код 40. Радиус")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-angle :accessor start-angle :initarg :start-angle :initform 0              :documentation "Код 50. Начальный угол")
   (end-angle   :accessor end-angle   :initarg :end-angle   :initform (* -1 pi)      :documentation "Код 51. Конечный угол")
;(totalangle :accessor totalangle :initarg :totalangle :initform nil :documentation "totalangle")
;(startpoint :accessor startpoint :initarg :startpoint :initform nil :documentation "startpoint")
;(endpoint :accessor endpoint :initarg :endpoint :initform nil :documentation "endpoint")
;(area :accessor area :initarg :area :initform nil :documentation "area")
;(arclength :accessor arclength :initarg :arclength :initform nil :documentation "arclength")
   )

  (:documentation "./dbents.h:class AcDbArc: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8

ARC (DXF)
К объектам дуги применяются следующие групповые коды.
Групповые коды дуги 
|---------------+---------------------------------------------------------------------------|
| Групповой код | Описание                                                                  |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbCircle)                                             |
|---------------+---------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Центральная точка (в ОСК)                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в ОСК)                    |
|---------------+---------------------------------------------------------------------------|
|            40 | Радиус                                                                    |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbArc)                                                |
|---------------+---------------------------------------------------------------------------|
|            50 | Начальный угол                                                            |
|---------------+---------------------------------------------------------------------------|
|            51 | Конечный угол                                                             |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|---------------+---------------------------------------------------------------------------|

"))

(defparameter *acad-arc-properties* '(Application ArcLength Area Center Document EndAngle EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Radius StartAngle StartPoint Thickness TotalAngle TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-arc-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x acad-arc) stream)
  (dxf-out-t-string 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-arc) stream)
  (dxf-out-t-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-double 40 rad stream)
    (dxf-out-t-string 100 *acad-arc-subclass-marker* stream)
    (dxf-out-t-double 50 s-a stream)
    (dxf-out-t-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))))

(dxf-out-t-point-3d 210 (vector 1 2 3)t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-arc) stream)
  (dxf-out-b-string 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-arc) stream)
  (dxf-out-b-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-double 40 rad stream)
    (dxf-out-b-string 100 *acad-arc-subclass-marker* stream)
    (dxf-out-b-double 50 s-a stream)
    (dxf-out-b-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-arc) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-arc-class-marker*))))

(defmethod  dxf-in-text :after ((object acad-arc) (pairs cons))
  (let (
	(c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-50  (cadr (assoc  50 pairs :test #'equal)))
	(c-51  (cadr (assoc  51 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (if  c-39 (setf  (thickness object) c-39)
	 (setf  (thickness object) 0.0d0))
    (cond
      ((and c-10 c-20 c-30)
       (setf  (center object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30))
       (setf  (center object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object acad-arc) (pairs cons)): wrong values c-10 c-20 c-30 ~A ~A ~A" c-10 c-20 c-30)))
    (if  c-40 (setf  (radius object) c-40)
	 (setf  (radius object) 1.0d0))
    (if  c-50 (setf  (start-angle object) c-50)
	 (error "dxf-in-text :after ((object acad-arc) (pairs cons)) c-50 not defined"))
    (if  c-51 (setf  (end-angle object) c-51)
	 (error "dxf-in-text :after ((object acad-arc) (pairs cons)) c-51 not defined"))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-text-class-marker* "TEXT")

(defparameter *acad-text-subclass-marker* "AcDbText")

(defclass acad-text (acad-entity)
  ((thickness            :accessor thickness            :initarg :thickness            :initform 0              :documentation "Код  39. Thickness (optional; default = 0)")
   (insertion-point      :accessor insertion-point      :initarg :insertion-point      :initform (vector 0 0 0) :documentation "Код  10. First alignment point (in OCS) DXF: X value; APP: 3D point")
   (height               :accessor height               :initarg :height               :initform 3.5            :documentation "Код  40. Text height")
   (text-string          :accessor text-string          :initarg :text-string          :initform ""             :documentation "Код   1. Default value (the string itself)")
   (rotation             :accessor rotation             :initarg :rotation             :initform 0              :documentation "Код  50. Text rotation (optional; default = 0)")
   (scale-factor         :accessor scale-factor         :initarg :scale-factor         :initform 1              :documentation "Код  41. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (oblique-angle        :accessor oblique-angle        :initarg :oblique-angle        :initform 0              :documentation "Код  51. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (style-name           :accessor style-name           :initarg :style-name           :initform "STANDARD"     :documentation "Код   7. Text style name (optional, default = STANDARD")
   (mirror-in-xy         :accessor mirror-in-xy         :initarg :mirror-in-xy         :initform 0              :documentation "Код  71. Text generation flags (optional, default = 0): 2 = Text is backward (mirrored in X) ; 4 = Text is upside down (mirrored in Y)")
;;;(backward :accessor backward :initarg :backward :initform nil :documentation "backward")  
;;;(upsidedown :accessor upsidedown :initarg :upsidedown :initform nil :documentation "upsidedown")
   (text-alignment-point :accessor text-alignment-point :initarg :text-alignment-point :initform (vector 0 0 0) :documentation "Код  11. Second alignment point (in OCS) (optional). DXF: X value; APP: 3D point. This value is meaningful only if the value of a 72 or 73 group is nonzero (if the justification is anything other than baseline/left)")
   (normal               :accessor normal               :initarg :normal               :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (hor-justification    :accessor hor-justification    :initarg :hor-justification    :initform 0              :documentation "Код  72. Horizontal text justification type (optional, default = 0) integer codes (not bit-coded). 0 = Left; 1= Center; 2 = Right; 3 = Aligned (if vertical alignment = 0); 4 = Middle (if vertical alignment = 0); 5 = Fit (if vertical alignment = 0). See the Group 72 and 73 integer codes table for clarification")
   (ver-justification    :accessor ver-justification    :initarg :ver-justification    :initform 0              :documentation "Код  73. Vertical text justification type (optional, default = 0): integer codes (not bit-coded): 0 = Baseline; 1 = Bottom; 2 = Middle; 3 = Top. See the Group 72 and 73 integer codes table for clarification")
;;;;(alignment :accessor alignment :initarg :alignment :initform nil :documentation "alignment")
;;;;(textgenerationflag :accessor textgenerationflag :initarg :textgenerationflag :initform nil :documentation "textgenerationflag")   
   )

  (:documentation "См. ./dbents.h:class AcDbText: public AcDbEntity
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363

TEXT (DXF)
К объектам текста применяются следующие групповые коды.
Групповые коды текста
| Групповой код | Описание                                                                                                                                          |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbText)                                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                                                                                                |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            10 | Первая точка выравнивания (в ОСК)                                                                                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z первой точки выравнивания (в ОСК)                                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            40 | Высота текста                                                                                                                                     |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|             1 | Значение по умолчанию (сама строка)                                                                                                               |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Поворот текста (необязательно; значение по умолчанию = 0)                                                                                         |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            41 | Относительный масштабный коэффициент по оси X: ширина (необязательно; значение по умолчанию = 1)                                                  |
|               | Это значение также корректируется при использовании вписываемого текста                                                                           |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            51 | Угол наклона (необязательно; значение по умолчанию = 0)                                                                                           |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|             7 | Имя стиля текста (необязательно, значение по умолчанию = STANDARD)                                                                                |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            71 | Флаги создания текста (необязательно, значение по умолчанию = 0):                                                                                 |
|               | 2 = текст в обратном направлении (зеркально отражен по X)                                                                                         |
|               | 4 = текст перевернут (зеркально отражен по Y)                                                                                                     |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            72 | Тип выравнивания текста по горизонтали (необязательно, значение по умолчанию = 0); целочисленные коды (не битовые):                               |
|               | 0 = слева                                                                                                                                         |
|               | 1 = по центру                                                                                                                                     |
|               | 2 = справа                                                                                                                                        |
|               | 3 = параллельно (если выравнивание по вертикали = 0)                                                                                              |
|               | 4 = посередине (если выравнивание по вертикали = 0)                                                                                               |
|               | 5 = вписать (если выравнивание по вертикали = 0)                                                                                                  |
|               | Подробности см. в таблице целочисленных групповых кодов 72 и 73                                                                                   |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            11 | Вторая точка выравнивания (в ОСК) (необязательно)                                                                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                        |
|               | Это значение имеет смысл, только если значение групп 72 или 73 не равно нулю (если выравнивание не является выравниванием по базовой линии/слева) |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z второй точки выравнивания (в ОСК) (необязательно)                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                                                                         |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                                                                             |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbText)                                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            73 | Тип выравнивания текста по вертикали (необязательно, значение по умолчанию = 0); целочисленные коды (не битовые):                                 |
|               | 0 = по базовой линии                                                                                                                              |
|               | 1 = снизу                                                                                                                                         |
|               | 2 = посередине                                                                                                                                    |
|               | 3 = сверху                                                                                                                                        |
|               | Подробности см. в таблице целочисленных групповых кодов 72 и 73                                                                                   |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|

В следующей таблице подробно описываются групповые коды 72 (выравнивание по горизонтали) и 73 (выравнивание по вертикали). 
Целочисленные групповые коды 72 и 73 
|----------------------+----------+----------+----------+--------------+----------+-----------|
| Группа с кодом 73    | Группа с | Группа с | Группа с | Группа с     | Группа с | Группа с  |
|                      | кодом 72 | кодом 72 | кодом 72 | кодом 72     | кодом 72 | кодом 72  |
|                      | 0        | 1        | 2        | 3            | 4        | 5         |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 3 (сверху)           | ВЛ       | ВЦ       | ВП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 2 (посередине)       | СЛ       | СЦ       | СП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 1 (снизу)            | НЛ       | НЦ       | НП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 0 (по базовой линии) | Левая    | Центр    | Справа   | Параллельный | Середина | По ширине |
|----------------------+----------+----------+----------+--------------+----------+-----------|
Если значения групп с кодом 72 и (или) 73 не равны нулю, то значения первой точки выравнивания игнорируются, 
и приложением AutoCAD рассчитываются новые значения на основе второй точки выравнивания и длины и высоты 
самой текстовой строки (после применения стиля текста). Если значения групп с кодами 72 и 73 равны нулю или 
отсутствуют, то вторая точка выравнивания является нерелевантной. 

"))

(defparameter *acad-text-properties* '(Alignment Application Backward Document EntityTransparency Handle HasExtensionDictionary Height Hyperlinks InsertionPoint Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor StyleName TextAlignmentPoint TextGenerationFlag TextString Thickness TrueColor UpsideDown Visible))

(mapcar #'make-slot (set-difference *acad-text-properties* *acad-entity-properties*))


(defmethod dxf-out-text ((x acad-text) stream)
    (dxf-out-t-string 0 *acad-text-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-text) stream)
  (dxf-out-t-string 100 *acad-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (insertion-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (scale-factor x))
	(ob  (oblique-angle x))
	(st  (style-name x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (text-alignment-point x))
	;;(a-p-x (svref (normal x) 0))
	;;(a-p-y (svref (normal x) 1))
	;;(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (dxf-out-t-double 39 th stream))
    (dxf-out-t-point-3d 10 p-p stream)
    (dxf-out-t-double 40 h stream)
    (dxf-out-t-string 1 t-s stream)
    (dxf-out-t-double 50 (* *radian-to-degree* rot) stream)
    (dxf-out-t-double 41 w-f stream)
    (dxf-out-t-double 51 (* *radian-to-degree* ob) stream)
    (dxf-out-t-string 7 st stream)
    (unless (= mir 0) (dxf-out-t-int16 71 mir stream))
    (unless (= h-j 0) (dxf-out-t-int16 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf-out-t-point-3d 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-t-point-3d 210 nrm stream))
    (dxf-out-t-string 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf-out-t-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-text) stream)
  (dxf-out-b-string 0 *acad-text-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-text) stream)
  (dxf-out-b-string 100 *acad-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (insertion-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (scale-factor x))
	(ob  (oblique-angle x))
	(st  (style-name x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (text-alignment-point x))
	;(a-p-x (svref (normal x) 0))
	;(a-p-y (svref (normal x) 1))
	;(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (dxf-out-b-double 39 th stream))
    (dxf-out-b-point-3d 10 p-p stream)
    (dxf-out-b-double 40 h stream)
    (dxf-out-b-string 1 t-s stream)
    (dxf-out-b-double 50 (* *radian-to-degree* rot) stream)
    (dxf-out-b-double 41 w-f stream)
    (dxf-out-b-double 51 (* *radian-to-degree* ob) stream)
    (dxf-out-b-string 7 st stream)
    (unless (= mir 0) (dxf-out-b-int16 71 mir stream))
    (unless (= h-j 0) (dxf-out-b-int16 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf-out-b-point-3d 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf-out-b-point-3d 210 nrm stream))
    (dxf-out-b-string 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf-out-b-int16 73 v-j stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-ellipse-class-marker* "ELLIPSE")

(defparameter *acad-ellipse-subclass-marker* "AcDbEllipse")

(defclass acad-ellipse (acad-entity)
  (
;;;(area         :accessor area         :initarg :area         :initform nil            :documentation "area")
   (center       :accessor center       :initarg :center       :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (major-axis   :accessor major-axis   :initarg :major-axis   :initform (vector 1 0 0) :documentation "Код 11. Конечная точка главной оси относительно центральной точки (в МСК) (mapcar #'+ center major-axis)")
;;;(majorradius :accessor majorradius :initarg :majorradius :initform nil :documentation "majorradius")
;;;(minoraxis :accessor minoraxis :initarg :minoraxis :initform nil :documentation "minoraxis")
;;;(minorradius :accessor minorradius :initarg :minorradius :initform nil :documentation "minorradius")

   (normal          :accessor normal          :initarg :normal          :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-parameter :accessor start-parameter :initarg :start-parameter :initform 0.0d0 :documentation "startparameter")
;;;(startangle :accessor startangle :initarg :startangle :initform nil :documentation "startangle")
;;;(startpoint :accessor startpoint :initarg :startpoint :initform nil :documentation "startpoint"))
   (end-parameter   :accessor end-parameter   :initarg :end-parameter    :initform (* 2.0d0 pi)       :documentation "Код 42. Конечный параметр")
;;;(endangle :accessor endangle :initarg :endangle :initform nil :documentation "endangle")
;;;(endpoint :accessor endpoint :initarg :endpoint :initform nil :documentation "endpoint")
   (radius-ratio :accessor radius-ratio :initarg :radius-ratio :initform 0.5d0          :documentation "Код 40. Соотношение малой и главной осей"))
  (:documentation "См. ./dbelipse.h:class AcDbEllipse: public  AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB

ELLIPSE (DXF)
К объектам эллипса применяются следующие групповые коды.
Групповые коды эллипса
|---------------+------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                       |
|---------------+------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbEllipse)                                                                 |
|---------------+------------------------------------------------------------------------------------------------|
|            10 | Центральная точка (в МСК)                                                                      |
|               | Файл DXF: значение X; приложение: 3D-точка                                                     |
|---------------+------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в МСК)                                         |
|---------------+------------------------------------------------------------------------------------------------|
|            11 | Конечная точка главной оси относительно центральной точки (в МСК)                              |
|               | Файл DXF: значение X; приложение: 3D-точка                                                     |
|---------------+------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z для конечной точки главной оси относительно центральной точки (в МСК) |
|---------------+------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                      |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                    |
|---------------+------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                          |
|---------------+------------------------------------------------------------------------------------------------|
|            40 | Соотношение малой и главной осей                                                               |
|---------------+------------------------------------------------------------------------------------------------|
|            41 | Начальный параметр (значение для полного эллипса — 0,0)                                        |
|---------------+------------------------------------------------------------------------------------------------|
|            42 | Конечный параметр (значение для полного эллипса — 2 пи)                                        |
|---------------+------------------------------------------------------------------------------------------------|

"))


(defparameter *acad-acad-ellipse-properties* '(Application Area Center Document EndAngle EndParameter EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight MajorAxis MajorRadius Material MinorAxis MinorRadius Normal ObjectID ObjectName OwnerID PlotStyleName RadiusRatio StartAngle StartParameter StartPoint TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-acad-ellipse-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x acad-ellipse) stream)
  (dxf-out-t-string 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-ellipse) stream)
  (dxf-out-t-string 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf-out-t-point-3d 10 p-c stream)
    (dxf-out-t-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf-out-t-point-3d 210 u-n stream))
    (dxf-out-t-double 40 r-r stream)
    (dxf-out-t-double 41 s-p stream)
    (dxf-out-t-double 42 e-p stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-ellipse) stream)
  (dxf-out-b-string 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-ellipse) stream)
  (dxf-out-b-string 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf-out-b-point-3d 10 p-c stream)
    (dxf-out-b-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf-out-b-point-3d 210 u-n stream))
    (dxf-out-b-double 40 r-r stream)
    (dxf-out-b-double 41 s-p stream)
    (dxf-out-b-double 42 e-p stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-ellipse) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*))))

(defmethod  dxf-in-text :after ((object acad-ellipse) (pairs cons))
  (let ((c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-41  (cadr (assoc  41 pairs :test #'equal)))
	(c-42  (cadr (assoc  42 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (cond
      ((and c-10 c-20 c-30)
       (setf  (center object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30))
       (setf  (center object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): wrong values c-10 c-20 c-30 ~A ~A ~A" c-10 c-20 c-30)))
    (cond
      ((and c-11 c-21 c-31)
       (setf  (major-axis object) (vector c-10 c-20 c-30)))
      ((and c-11 c-21 (null c-31))
       (setf  (major-axis object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): wrong values c-11 c-21 c-31 ~A ~A ~A" c-11 c-21 c-31)))
    (if  c-40
	 (setf  (radius-ratio object) c-40)
	 (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): c-40 not defined"))
    (if  c-41
	 (setf  (start-parameter object) c-41)
	 (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): c-41 not defined"))
    (if  c-42   (setf  (end-parameter object) c-42)
	 (error "dxf-in-text :after ((object acad-ellipse) (pairs cons)): c-42 not defined"))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-symboltablerecord-subclass-marker* "AcDbSymbolTableRecord")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-layer-class-marker* "LAYER")

(defparameter *acad-layer-subclass-marker* "AcDbLayerTableRecord")

(defclass acad-layer (acad-object)
;;;;"AcDbLayerTableRecord"
  ((name             :accessor name            :initarg :name            :initform "LAYER1"       :documentation "name")
   (description      :accessor description     :initarg :description     :initform nil            :documentation "description")
   (truecolor        :accessor truecolor       :initarg :truecolor       :initform '(7 nil)       :documentation "Код  62. Номер цвета (если значение отрицательное, слой отключен)")
   (line-type        :accessor line-type       :initarg :line-type       :initform "Continuous"   :documentation "Код   6. Имя типа линий")
   (plottable        :accessor plottable       :initarg :plottable       :initform t              :documentation "Код 290. Флаг печати. Если задано значение 0, этот слой не выводится на печать")
   (plotstylename    :accessor plotstylename   :initarg :plotstylename   :initform nil            :documentation "Код 390. Идентификатор/дескриптор жесткого указателя на объект PlotStyleName")
   (line-weight      :accessor line-weight     :initarg :line-weight     :initform -3             :documentation "Код 370. Значение из перечисления весов линии")
   (material         :accessor material        :initarg :material        :initform nil            :documentation "Код 347. Идентификатор/дескриптор жесткого указателя на объект материала")
   (freeze           :accessor freeze          :initarg :freeze          :initform nil            :documentation "freeze")
   (layeron          :accessor layeron         :initarg :layeron         :initform t              :documentation "layeron")
   (lock             :accessor lock            :initarg :lock            :initform nil            :documentation "lock")
   (used             :accessor used            :initarg :used            :initform nil            :documentation "used")
   (viewportdefault  :accessor viewportdefault :initarg :viewportdefault :initform nil            :documentation "viewportdefault")
;;;   (layer-tr-visual-style  :accessor layer-tr-visual-style :initarg :layer-tr-visual-style :initform nil            :documentation "Код 348? Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)?")
   )

  (:documentation "
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
====================================================================================================
" ))

(defparameter *acad-layer-properties* '(Application Description Document Freeze Handle HasExtensionDictionary LayerOn Linetype Lineweight Lock Material Name ObjectID ObjectName OwnerID PlotStyleName Plottable TrueColor Used  ViewportDefault ))

(reverse (mapcar #'make-slot (set-difference *acad-layer-properties* *acad-object-properties*)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-text ((x acad-layer) stream)
  (dxf-out-t-string 0 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-layer) stream)
  (dxf-out-t-string 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf-out-t-string 100 *acad-layer-subclass-marker* stream)
  (let ((name            (name            x))
	(freeze          (freeze          x))
	(viewportdefault (viewportdefault x))
	(lock            (lock x))
	(used            (used            x))
	(layeron         (if (layeron x) 1 -1))
	(plottable       (if (null (plottable x)) 0 1))
	(cl              (truecolor x))
        (l-ltype         (line-type x))
	(l-lweight       (line-weight x))
	(l-pstyle        (plotstylename x))
	(l-mat           (material x))
;;;	(l-vstyle        (layer-tr-visual-style x))
	(c-70            0))
    (block c-70
      (when freeze          (setf c-70 (dpb 1 (byte 1 0) c-70)))
      (when viewportdefault (setf c-70 (dpb 1 (byte 1 1) c-70)))
      (when lock            (setf c-70 (dpb 1 (byte 1 2) c-70)))
;;; (when lock            (setf c-70 (dpb 1 (byte 1 3) c-70)))
;;; (when lock            (setf c-70 (dpb 1 (byte 1 4) c-70)))
      (when used            (setf c-70 (dpb 1 (byte 1 5) c-70))))
    (dxf-out-t-string  2 name   stream)
    (dxf-out-t-int16  70 c-70   stream)
    (cond
      ((= 0   (first cl)) (dxf-out-t 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf-out-t-int16 62 (* (first cl) layeron) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf-out-t-int16 62  (* (first cl) layeron) stream)
       (dxf-out-t-int32 420 (color-rgb-to-truecolor (second cl)) stream)))
    (dxf-out-t         6 l-ltype   stream)
    (dxf-out-t       290 plottable stream)
    (dxf-out-t       370 l-lweight stream)
    (dxf-out-t       390 l-pstyle  stream)
    (dxf-out-t       347 l-mat     stream)
;;; (dxf-out-t       348 l-vstyle  stream)
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-layer) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-layer-class-marker*))
;;; (break "dxf-in-text  ((object acad-layer) (pairs cons))")
  )

(defmethod  dxf-in-text :after ((object acad-layer) (pairs cons))
;;; (break "dxf-in-text :after ((object acad-layer) (pairs cons))")
  (let ((c-2   (cadr (assoc   2 pairs :test #'equal)))
	(c-70  (cadr (assoc  70 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-290 (cadr (assoc 290 pairs :test #'equal)))
	(c-370 (cadr (assoc 370 pairs :test #'equal)))
	(c-390 (cadr (assoc 390 pairs :test #'equal)))
	(c-347 (cadr (assoc 347 pairs :test #'equal)))
	;; (c-348 (cadr (assoc 348 pairs :test #'equal)))
	)
    (cond
      (c-2 (setf  (name object) c-2))
      ((error "dxf-in-text :after ((object acad-layer) (pairs cons)): c-2 not exist.")))
    (cond
      (c-390 (setf  (plotstylename object) c-390))
      ((error "dxf-in-text :after ((object acad-layer) (pairs cons)): c-390 not exist.")))
    (cond
      (c-347 (setf  (material object) c-347))
      ((error "dxf-in-text :after ((object acad-layer) (pairs cons)): c-347 not exist.")))
    (when c-70
      (setf  (freeze          object) (= 1 (ldb (byte 1 0) c-70)))
      (setf  (viewportdefault object) (= 1 (ldb (byte 1 1) c-70)))
      (setf  (lock            object) (= 1 (ldb (byte 1 2) c-70)))
;;;; (setf  (lock            object) (= 1 (ldb (byte 1 3) c-70)))
;;;; (setf  (lock            object) (= 1 (ldb (byte 1 4) c-70)))
      (setf  (used            object) (= 1 (ldb (byte 1 5) c-70))))
    (cond
      ((and c-62 c-420)
       (setf (truecolor object)
	     (list (abs c-62) (color-truecolor-to-rgb   c-420))))
      (c-62
       (setf (truecolor object)
	     (list (abs c-62) nil)))
      (t
       (setf (truecolor object) (list 256 nil))))
    (when c-62  (setf (layeron    object) (not (minusp c-62))))
    (when c-6   (setf (line-type  object) c-6))
    (when c-290 (setf (plottable  object) (if (/= 0 c-290) t nil)))
    (cond
      ((null    c-370) (setf (line-weight object) -3))
      ((numberp c-370) (setf (line-weight object) c-370))
      (t (error "dxf-in-text :after ((object acad-entity) (pairs cons)): wrong c-370 value ~A" c-370)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-symboltable-subclass-marker* "AcDbSymbolTable")

(defclass acad-layers (acad-object)
  ((count  :accessor a-count :initarg :count :initform 0   :documentation "70 count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)")
   )
  (:documentation "
"))

(defparameter *acad-layers-properties* '(Application Count Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(reverse (mapcar #'make-slot (set-difference *acad-layers-properties* *acad-object-properties*)))

(defmethod dxf-out-text ((x acad-layers) stream)
  (dxf-out-t-string 2 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-layers) stream)
  (dxf-out-t-string 100 *acad-symboltable-subclass-marker* stream)
  (let ((a-count (a-count x))
	(items   (items   x)))
    (dxf-out-t-int16  70 a-count   stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) items)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-in-text  ((object acad-layers) (tables cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object)

(defmethod dxf-in-text :after ((object acad-layers) (tables cons))
  (multiple-value-bind (items-data list-item-data) (table-and-items *acad-layer-class-marker* tables)
    (setf (items object)
	  (mapcar
	   #'(lambda (item-data)
	       (let ((it (make-instance 'acad-layer)))
		 (dxf-in-text it item-data)
		 it))
	   list-item-data)
	  (a-count  object ) (length (items object)))))
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass acad-documents (acad-object)
  ((ac-application              :accessor ac-application              :initarg :ac-application              :initform nil :documentation "ac-application")
   (ac-count                    :accessor ac-count                    :initarg :ac-count                    :initform nil :documentation "ac-count"))
  (:documentation "The collection of all AutoCAD drawings that are open in the current session."))

(defclass acad-database (object)
  ((ac-blocks                   :accessor ac-blocks                   :initarg :ac-blocks                   :initform nil :documentation "ac-blocks")
   (ac-dictionaries             :accessor ac-dictionaries             :initarg :ac-dictionaries             :initform nil :documentation "ac-dictionaries")
   (ac-dim-styles               :accessor ac-dim-styles               :initarg :ac-dim-styles               :initform nil :documentation "ac-dim-styles")
   (ac-elevation-model-space    :accessor ac-elevation-model-space    :initarg :ac-elevation-model-space    :initform nil :documentation "ac-elevation-model-space")
   (ac-elevation-paper-space    :accessor ac-elevation-paper-space    :initarg :ac-elevation-paper-space    :initform nil :documentation "ac-elevation-paper-space")
   (ac-groups                   :accessor ac-groups                   :initarg :ac-groups                   :initform nil :documentation "ac-groups")
   (ac-layers                   :accessor ac-layers                   :initarg :ac-layers                   :initform (make-instance 'acad-layers) :documentation "ac-layers")
   (ac-layouts                  :accessor ac-layouts                  :initarg :ac-layouts                  :initform nil :documentation "ac-layouts")
   (ac-limits                   :accessor ac-limits                   :initarg :ac-limits                   :initform nil :documentation "ac-limits")
   (ac-linetypes                :accessor ac-linetypes                :initarg :ac-linetypes                :initform (make-instance 'acad-linetypes) :documentation "ac-linetypes")
   (ac-material                 :accessor ac-material                 :initarg :ac-material                 :initform nil :documentation "ac-material")
   (ac-model-space              :accessor ac-model-space              :initarg :ac-model-space              :initform nil :documentation "ac-model-space")
   (ac-paper-space              :accessor ac-paper-space              :initarg :ac-paper-space              :initform nil :documentation "ac-paper-space")
   (ac-plot-configurations      :accessor ac-plot-configurations      :initarg :ac-plot-configurations      :initform nil :documentation "ac-plot-configurations")
   (ac-preferences              :accessor ac-preferences              :initarg :ac-preferences              :initform nil :documentation "ac-preferences")
   (ac-registered-applications  :accessor ac-registered-applications  :initarg :ac-registered-applications  :initform nil :documentation "ac-registered-applications")
   (ac-section-manager          :accessor ac-section-manager          :initarg :ac-section-manager          :initform nil :documentation "ac-section-manager")
   (ac-summary-info             :accessor ac-summary-info             :initarg :ac-summary-info             :initform nil :documentation "ac-summary-info")
   (ac-text-styles              :accessor ac-text-styles              :initarg :ac-text-styles              :initform nil :documentation "ac-text-styles")
   (ac-user-coordinate-systems  :accessor ac-user-coordinate-systems  :initarg :ac-user-coordinate-systems  :initform nil :documentation "ac-user-coordinate-systems")
   (ac-viewports                :accessor ac-viewports                :initarg :ac-viewports                :initform nil :documentation "ac-viewports")
   (ac-views                    :accessor ac-views                    :initarg :ac-views                    :initform nil :documentation "ac-views"))
  (:documentation "The contents of an XRef block."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-database-properties* '(Blocks Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace Groups Layers Layouts Limits Linetypes Material ModelSpace PaperSpace PlotConfigurations Preferences RegisteredApplications SectionManager SummaryInfo TextStyles UserCoordinateSystems Viewports Views))

(mapcar #'make-slot (set-difference *acad-database-properties* nil))

(defclass acad-document (acad-database)
  ((active                :accessor active                :initarg :active                :initform nil :documentation "active")
   (activedimstyle        :accessor activedimstyle        :initarg :activedimstyle        :initform nil :documentation "activedimstyle")
   (activelayer           :accessor activelayer           :initarg :activelayer           :initform nil :documentation "activelayer")
   (activelayout          :accessor activelayout          :initarg :activelayout          :initform nil :documentation "activelayout")
   (activelinetype        :accessor activelinetype        :initarg :activelinetype        :initform nil :documentation "activelinetype")
   (activematerial        :accessor activematerial        :initarg :activematerial        :initform nil :documentation "activematerial")
   (activepviewport       :accessor activepviewport       :initarg :activepviewport       :initform nil :documentation "activepviewport")
   (activeselectionset    :accessor activeselectionset    :initarg :activeselectionset    :initform nil :documentation "activeselectionset")
   (activespace           :accessor activespace           :initarg :activespace           :initform nil :documentation "activespace")
   (activetextstyle       :accessor activetextstyle       :initarg :activetextstyle       :initform nil :documentation "activetextstyle")
   (activeucs             :accessor activeucs             :initarg :activeucs             :initform nil :documentation "activeucs")
   (activeviewport        :accessor activeviewport        :initarg :activeviewport        :initform nil :documentation "activeviewport")
   (application           :accessor application           :initarg :application           :initform nil :documentation "application")
   (database              :accessor database              :initarg :database              :initform nil :documentation "database")
   (fullname              :accessor fullname              :initarg :fullname              :initform nil :documentation "fullname")
   (height                :accessor height                :initarg :height                :initform nil :documentation "height")
   (hwnd                  :accessor hwnd                  :initarg :hwnd                  :initform nil :documentation "hwnd")
   (materials             :accessor materials             :initarg :materials             :initform nil :documentation "materials")
   (mspace                :accessor mspace                :initarg :mspace                :initform nil :documentation "mspace")
   (name                  :accessor name                  :initarg :name                  :initform nil :documentation "name")
   (objectsnapmode        :accessor objectsnapmode        :initarg :objectsnapmode        :initform nil :documentation "objectsnapmode")
   (path                  :accessor path                  :initarg :path                  :initform nil :documentation "path")
   (pickfirstselectionset :accessor pickfirstselectionset :initarg :pickfirstselectionset :initform nil :documentation "pickfirstselectionset")
   (plot                  :accessor plot                  :initarg :plot                  :initform nil :documentation "plot")
   (readonly              :accessor readonly              :initarg :readonly              :initform nil :documentation "readonly")
   (saved                 :accessor saved                 :initarg :saved                 :initform nil :documentation "saved")
   (selectionsets         :accessor selectionsets         :initarg :selectionsets         :initform nil :documentation "selectionsets")
   (utility               :accessor utility               :initarg :utility               :initform nil :documentation "utility")
   (width                 :accessor width                 :initarg :width                 :initform nil :documentation "width")
   (windowstate           :accessor windowstate           :initarg :windowstate           :initform nil :documentation "windowstate")
   (windowtitle           :accessor windowtitle           :initarg :windowtitle           :initform nil :documentation "windowtitle")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (sec-header            :accessor sec-header            :initarg :sec-header            :initform nil :documentation "header      - Представление секции HEADER")
   (sec-classes           :accessor sec-classes           :initarg :sec-classes           :initform nil :documentation "classes     - Представление секции CLASSES")
   (sec-table-appid       :accessor sec-table-appid       :initarg :sec-table-appid       :initform nil :documentation "table-appid - Представление секции TABLE-APPID")

   )
  (:documentation "
 "))

(defparameter *acad-document-properties* '( Active ActiveDimStyle ActiveLayer ActiveLayout ActiveLinetype ActiveMaterial ActivePViewport ActiveSelectionSet ActiveSpace ActiveTextStyle ActiveUCS ActiveViewport Application Blocks Database Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace FullName Groups Height HWND Layers Layouts Limits Linetypes Materials ModelSpace MSpace Name ObjectSnapMode PaperSpace Path PickfirstSelectionSet Plot PlotConfigurations Preferences ReadOnly RegisteredApplications Saved SectionManager SelectionSets SummaryInfo TextStyles UserCoordinateSystems Utility Viewports Views Width WindowState WindowTitle))

(reverse (mapcar #'make-slot (set-difference *acad-document-properties* *acad-database-properties*)) )


(defmethod  dxf-in-text  ((object acad-document) (sections cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object
  )

(defmethod  dxf-in-text :after ((object acad-document) (sections cons))
	    (let ((header  (split-header   sections))
		  (classes (split-classes  sections))
		  (tables  (split-tables   sections))
		  )
	      (setf (activedimstyle  object) (get-acad-variable-as-list "DIMSTYLE"   header))
	      (setf (activelayer     object) (get-acad-variable-as-list "CLAYER"     header))

	      (setf (activelinetype  object) (get-acad-variable-as-list "CELTYPE"    header))
	      (setf (activematerial  object) (get-acad-variable-as-list "CMATERIAL"  header))
	      (setf (activespace     object) (get-acad-variable-as-list "TILEMODE"   header))
	      (setf (activetextstyle object) (get-acad-variable-as-list "TEXTSTYLE"  header))
;;;;
;;;    (setf (activelayout       object) (get-acad-variable-as-list "CLAYOUT"  header))    
;;;    (setf (activeviewport     object) (get-acad-variable-as-list "CLAYOUT"  header))
;;;    (setf (activepviewport    object) (get-acad-variable-as-list "CLAYOUT"  header))    
;;;    (setf (activeselectionset object) (get-acad-variable-as-list "CLAYOUT"  header))
;;;;	      
	      (setf  (layers      object) (dxf-in-text (layers    object) tables))
	      (setf  (linetypes   object) (dxf-in-text (linetypes object) tables))
;;;;	      
	      (setf  (sec-header  object) header)
      	      (setf  (sec-classes object) classes)
	      ))

(defmethod dxf-out-text ((x acad-document) stream))

(defmethod dxf-out-text :after ((x acad-document) stream)
  (block section-header
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "HEADER"  stream)
    (mapc #'(lambda (header)
	      (mapc #'(lambda (el) (dxf-out-t (first el) (second el) stream)) header))
	  (sec-header x))
    (dxf-out-t 0 "ENDSEC" stream))
  (block section-classes
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "CLASSES" stream)
    (mapc #'(lambda (class)
	      (mapc #'(lambda (el) (dxf-out-t (first el) (second el) stream)) class))
	  (sec-classes x))
    (dxf-out-t 0 "ENDSEC" stream))
  (block section-tables
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "TABLES" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
  (block section-blocks
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "BLOCKS" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
  (block section-entities
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "ENTITIES" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
  (block section-objects
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "OBJECTS" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
    (block section-objects
    (dxf-out-t 0 "SECTION" stream)
    (dxf-out-t 2 "ACDSDATA" stream)
;;;
    (dxf-out-t 0 "ENDSEC" stream)
    )
    
    (dxf-out-t 0 "EOF" stream)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *acad-linetype-class-marker* "LTYPE")

(defparameter *acad-linetype-subclass-marker* "AcDbLinetypeTableRecord")

(defclass acad-linetype  (acad-object)
  ((name        :accessor name        :initarg :name        :initform "CONTINUOUS" :documentation "name")
   (description :accessor description :initarg :description :initform ""           :documentation "description"))
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================

"))

(defparameter *acad-linetype-properties* '(Application Description Document Handle HasExtensionDictionary Name ObjectID ObjectName OwnerID))

(mapcar #'make-slot (set-difference *acad-linetype-properties* *acad-object-properties*))

(defmethod dxf-out-text ((x acad-linetype) stream)
  (dxf-out-t-string 0 *acad-linetype-class-marker* stream))

(defmethod dxf-out-text :after ((x acad-linetype) stream)
  (dxf-out-t-string 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf-out-t-string 100 *acad-linetype-subclass-marker* stream)
  (let ((name            (name            x))
	(description     (description     x))
	(pairs           (pairs           x)))
    (dxf-out-t-string  2 name   stream)
    (dxf-out-t-int16  70 (cadr (assoc 70 pairs))   stream)
    (dxf-out-t-string  3 description stream)
    (mapcar
     #'(lambda (el)
	 (dxf-out-t (car el) (cadr el) t))
     (member (assoc 72 pairs) pairs))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod dxf-out-binary ((x acad-linetype) stream)
  (dxf-out-t-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x acad-linetype) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf-out-t-hex 330 own stream))
    (when hdl (dxf-out-t-hex   5 hdl stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod  dxf-in-text  ((object acad-linetype) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-linetype-class-marker*)))

(defmethod  dxf-in-text :after ((object acad-linetype) (pairs cons))
  (setf (pairs object) (copy-list pairs))
  (let ((c-2   (cadr (assoc   2 pairs :test #'equal)))
	(c-3   (cadr (assoc   3 pairs :test #'equal))))
    (when c-2   (setf (name        object) c-2))
    (when c-3   (setf (description object) c-3))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass acad-linetypes (acad-object)
  ((count  :accessor a-count :initarg :count :initform 0   :documentation "70 count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)"))
  (:documentation "
"))

(defparameter *acad-linetypes-properties* '(Application Count Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(reverse (mapcar #'make-slot (set-difference *acad-linetypes-properties* *acad-object-properties*)))

(defmethod dxf-in-text  ((object acad-linetypes) (tables cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object)

(defmethod dxf-in-text :after ((object acad-linetypes) (tables cons))
      (multiple-value-bind (items-data list-item-data) (table-and-items *acad-linetype-class-marker* tables)
      (setf (items object)
	    (mapcar
	     #'(lambda (item-data)
		 (let ((it (make-instance 'acad-linetype)))
		   (dxf-in-text it item-data)
		   it))
	     list-item-data)
	    (a-count  object ) (length (items object)))))

(defmethod dxf-in-text :after ((object acad-linetypes) (pairs cons))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

'(
  acad-documents
  acad-document
  acad-database
  
  acad-linetypes
  acad-layers

  acad-layer
  acad-linetype
  
  ge-point-3d
  rx-object
  dxf-pairs
  
  acad-object
  acad-entity
  
  db-curve
  acad-line
  acad-point
  acad-ray
  acad-xline
  acad-circle
  acad-arc
  acad-text
  acad-ellipse
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; db-symbol-table-record-classes.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *symbol-tbl-class-marker* "TABLE")

(defparameter *symbol-tbl-subclass-marker* "AcDbSymbolTable")

(defclass db-symbol-tbl ( acad-object )
  ((Object-Name  :accessor Object-Name       :initarg :Object-Name  :initform "SYMBOL-TABLE" :documentation "Код   2. Имя таблицы")
   (Count        :accessor symbol-tbl-flag   :initarg :Count  :initform 0              :documentation "Код  70. Стандартные флаги")
   (symbol-tbl-items :accessor symbol-tbl-items  :initarg :symbol-tbl-items :initform nil            :documentation "Записи таблицы."))
  (:documentation "См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295

Group codes that apply to all symbol tables
| Group code | Description                                                                                                                                                          |   |
|------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+---|
|         -1 | APP: entity name (changes each time a drawing is opened)                                                                                                             |   |
|          0 | Object type (TABLE)                                                                                                                                                  |   |
|          2 | Table name                                                                                                                                                           |   |
|          5 | Handle                                                                                                                                                               |   |
|        102 | “{ACAD_XDICTIONARY” indicates the start of an extension dictionary group. This group exists only if persistent reactors have been attached to this object (optional) |   |
|        360 | Hard owner ID/handle to owner dictionary (optional)                                                                                                                  |   |
|        102 | End of group, “}” (optional)                                                                                                                                         |   |
|        330 | Soft-pointer ID/handle to owner object                                                                                                                               |   |
|        100 | Subclass marker (AcDbSymbolTable)                                                                                                                                    |   |
|         70 | Maximum number of entries in table                                                                                                                                   |   |

Пример DXF-кода:
  (0 \"TABLE\") (2 \"BLOCK_RECORD\") (5 1) (330 0) (100 \"AcDbSymbolTable\") (70 1)
    ...
   (0 \"ENDTAB\")
"))

(defclass acad-blocks()
    ((Object-Name ))
  (:documentation "
* Methods
Add
GetExtensionDictionary
GetXData
Item
SetXData
* Properties
Application
Count
Document
Handle
HasExtensionDictionary
ObjectID
ObjectName
OwnerID
* Events
None
* END

"))


(defmethod dxf-out-text ((x db-symbol-tbl) stream)
  (dxf-out-t-string 0 *symbol-tbl-class-marker* stream)
    (let ((st-name (Object-Name x)))
    (dxf-out-t-string 2 st-name stream)))

(defmethod dxf-out-text :after ((x db-symbol-tbl) stream)
  (dxf-out-t-string 100 *db-symbol-tr-subclass-marker* stream)
  (let ((st-flag  (symbol-tbl-flag x))
	(st-items (reverse (symbol-tbl-items x))))
    (dxf-out-t-int16 70 st-flag stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) st-items)
    (dxf-out-t-string 0 *end-tab* stream)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-block-rec ( db-e symbol-tbl )
  ((block-tbl-name  :accessor block-tbl-name    :initarg :block-tbl-name :initform "SYMBOL-TABLE" :documentation "Код   2. Имя таблицы")
   )
  (:documentation "
| Group code | Description                                                                                                                                                                                                                                                                                                                                                                                               |
|------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        100 | Subclass marker (AcDbBlockTableRecord)                                                                                                                                                                                                                                                                                                                                                                    |
|          2 | Block name                                                                                                                                                                                                                                                                                                                                                                                                |
|        340 | Hard-pointer ID/handle to associated LAYOUT object                                                                                                                                                                                                                                                                                                                                                        |
|         70 | Block insertion units.                                                                                                                                                                                                                                                                                                                                                                                    |
|        280 | Block explodability                                                                                                                                                                                                                                                                                                                                                                                       |
|        281 | Block scalability                                                                                                                                                                                                                                                                                                                                                                                         |
|        310 | DXF: Binary data for bitmap preview (optional)                                                                                                                                                                                                                                                                                                                                                            |
|       1001 | Xdata application name “ACAD” (optional)                                                                                                                                                                                                                                                                                                                                                                  |
|       1000 | Xdata string data “DesignCenter Data” (optional)                                                                                                                                                                                                                                                                                                                                                          |
|       1002 | Begin xdata “{“ (optional)                                                                                                                                                                                                                                                                                                                                                                                |
|       1070 | Autodesk Design Center version number                                                                                                                                                                                                                                                                                                                                                                     |
|       1070 | Insert units: 0 = Unitless 1 = Inches 2 = Feet 3 = Miles 4 = Millimeters 5 = Centimeters 6 = Meters 7 = Kilometers 8 = Microinches 9 = Mils 10 = Yards 11 = Angstroms 12 = Nanometers 13 = Microns 14 = Decimeters 15 = Decameters 16 = Hectometers 17 = Gigameters 18 = Astronomical units 19 = Light years 20 = Parsecs 21 = US Survey Feet 22 = US Survey Inch 23 = US Survey Yard 24 = US Survey Mile |
|       1002 | End xdata “}“                                                                                                                                                                                                                                                                                                                                                                                             |

Пример DXF-кода
 (0 \"TABLE\") (2 \"BLOCK_RECORD\") (5 1) (330 0) (100 \"AcDbSymbolTable\") (70 1)
  (0 \"BLOCK_RECORD\") (5 112) (330 1) (100 \"AcDbSymbolTableRecord\") (100 \"AcDbBlockTableRecord\") (2 \"*Model_Space\") (340 115) (70 0) (280 1) (281 0) 
  (0 \"BLOCK_RECORD\") (5 108) (330 1) (100 \"AcDbSymbolTableRecord\") (100 \"AcDbBlockTableRecord\") (2 \"*Paper_Space\") (340 111) (70 0) (280 1) (281 0) 
  (0 \"BLOCK_RECORD\") (5 116) (330 1) (100 \"AcDbSymbolTableRecord\") (100 \"AcDbBlockTableRecord\") (2 \"*Paper_Space0\") (340 119) (70 0) (280 1) (281 0) 
 (0 \"ENDTAB\")


| Methods    | Add         | GetExtensionDictionary | GetXData | Item   | SetXData               |          |            |         |

| Properties | Application | Count                  | Document | Handle | HasExtensionDictionary | ObjectID | ObjectName | OwnerID |

| Events     | None        |                        |          |        |                        |          |            |         |




"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-symbol-tr-class-marker* "SYMBOL")

(defparameter *db-symbol-tr-subclass-marker* "AcDbSymbolTableRecord")

(defclass db-symbol-tr ( db-object )
  ((symbol-tr-name :accessor symbol-tr-name  :initarg :symbol-tr-name :initform "Undefined"    :documentation "Код   2. Имя таблицы")
   (symbol-tr-flag :accessor symbol-tr-flag  :initarg :symbol-tr-flag :initform 0              :documentation "Код  70. Стандартные флаги"))
  (:documentation "См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-5926A569-3E40-4ED2-AE06-6ACCE0EFC813
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-5926A569-3E40-4ED2-AE06-6ACCE0EFC813

Общие групповые коды записей таблицы обозначений (DXF)

В следующей таблице приведены групповые коды, которые применяются ко всем записям таблицы обозначений в файлах DXF. 
Обращаясь к таблице групповых кодов для объектов определенных типов, необходимо помнить, 
что указанные здесь коды также могут присутствовать.

Групповые коды, которые применяются ко всем записям таблицы обозначений
|---------------+----------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                           |
|---------------+----------------------------------------------------------------------------------------------------|
|            -1 | Приложение: имя объекта (изменяется при каждом открытии чертежа)                                   |
|---------------+----------------------------------------------------------------------------------------------------|
|             0 | Тип объекта (имя таблицы)                                                                          |
|---------------+----------------------------------------------------------------------------------------------------|
|             5 | Дескриптор (все, кроме DIMSTYLE)                                                                   |
|---------------+----------------------------------------------------------------------------------------------------|
|           105 | Дескриптор (только таблица DIMSTYLE)                                                               |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Начало определенной приложением группы \"{имя_приложения\". Например, \"{ACAD_REACTORS\"           |
|               | обозначает начало группы постоянных реакторов AutoCAD (необязательно)                              |
|---------------+----------------------------------------------------------------------------------------------------|
|         коды, | Коды и значения в пределах групп с кодом 102 определяются приложением (необязательно)              |
|  определенные |                                                                                                    |
|   приложением |                                                                                                    |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Конец группы, \"}\" (необязательно)                                                                |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | \"{ACAD_REACTORS\" обозначает начало группы постоянных реакторов AutoCAD. Эта группа присутствует, |
|               | только если постоянные реакторы были присоединены к данному объекту (необязательно)                |
|---------------+----------------------------------------------------------------------------------------------------|
|           330 | Идентификатор/дескриптор символьного указателя на словарь владельца (необязательно)                |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Конец группы, \"}\" (необязательно)                                                                |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | \"{ACAD_XDICTIONARY\" обозначает начало группы словаря расширений. Эта группа присутствует,        |
|               | только если к данному объекту были присоединены постоянные реакторы (необязательно)                |
|---------------+----------------------------------------------------------------------------------------------------|
|           360 | Идентификатор/дескриптор жесткой ссылки-владельца для владельца словаря (необязательно)            |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Конец группы, \"}\" (необязательно)                                                                |
|---------------+----------------------------------------------------------------------------------------------------|
|           330 | Идентификатор/дескриптор символьного указателя на объект владельца                                 |
|---------------+----------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbSymbolTableRecord)                                                           |
|---------------+----------------------------------------------------------------------------------------------------|

"))

(defmethod dxf-out-text ((x db-symbol-tr) stream)
  (dxf-out-t-string 0 *db-symbol-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x db-symbol-tr) stream)
  (dxf-out-t-string 100 *db-symbol-tr-subclass-marker* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-regapp-tr (db-symbol-tr)
  ()
  (:documentation "./dbsymtb.h:class AcDbRegAppTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-6E3140E9-E560-4C77-904E-480382F0553E
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-6E3140E9-E560-4C77-904E-480382F0553E
==================================================
APPID (DXF)
К записям таблицы обозначений APPID применяются следующие групповые коды.
Групповые коды APPID 
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbRegAppTableRecord)                                                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
|             2 | Имя приложения, созданное пользователем или приложением (для расширенных данных).                                             |
|               | В этих записях таблицы содержится набор имен всех зарегистрированных приложений                                               |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                                       |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                                               |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается                                    |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                                  |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.                               |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF) |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-block-tr-class-marker* "BLOCK_RECORD")

(defparameter *db-block-tr-subclass-marker* "AcDbBlockTableRecord")

(defclass db-block-tr (db-symbol-tr)
  ((block-tr-layout            :accessor block-tr-layout              :initarg :block-tr-layout            :initform nil                 :documentation "Код  340. Идентификатор/дескриптор жесткого указателя на связанный объект LAYOUT")
   (block-tr-explodability     :accessor block-tr-explodability       :initarg :block-tr-explodability     :initform 0                   :documentation "Код  280. Расчленяемость блока")
   (block-tr-scalability       :accessor block-tr-scalability         :initarg :block-tr-scalability       :initform 1                   :documentation "Код  281. Масштабируемость блока")
   (block-tr-bitmap            :accessor block-tr-bitmap              :initarg :block-tr-bitmap            :initform nil                 :documentation "Код  310. Файл DXF: двоичные данные предварительного просмотра растрового изображения (необязательно)")
   (block-tr-xdata-app-name    :accessor block-tr-xdata-app-name      :initarg :block-tr-xdata-app-name    :initform nil                 :documentation "Код 1001. Имя приложения расширенных данных, \"ACAD\" (необязательно)")
   (block-tr-xdata-string-data :accessor block-tr-xdata-string-data   :initarg :block-tr-xdata-string-data :initform nil                 :documentation "Код 1000. Данные строк расширенных данных, \"DesignCenter Data\" (необязательно)")
   (block-tr-xdata-begin       :accessor block-tr-xdata-begin         :initarg :block-tr-xdata-begin       :initform nil                 :documentation "Код 1002. Начало расширенных данных, \"{\" (необязательно)")
   (block-tr-dc-version        :accessor block-tr-dc-version          :initarg :block-tr-dc-version        :initform nil                 :documentation "Код 1070. Номер версии Центра управления Adesk")
   (block-tr-insert-units      :accessor block-tr-insert-units        :initarg :block-tr-insert-units      :initform nil                 :documentation "Код 1070. Номер версии Центра управления Adesk")
   (block-tr-xdata-end         :accessor block-tr-xdata-end           :initarg :block-tr-xdata-end         :initform nil                 :documentation "Код 1002. Конец расширенных данных, \"}\""))
  (:documentation "find . -name \"*.h\" | xargs grep \"class AcDbBlockTableRecord\"
/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/dbsymtb.h:class AcDbBlockTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
====================================================================================================
BLOCK_RECORD (DXF)
К записям таблицы обозначений BLOCK_RECORD применяются следующие групповые коды.
Групповые коды BLOCK_RECORD
|---------------+---------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                    |
|---------------+---------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbBlockTableRecord)                                                     |
|---------------+---------------------------------------------------------------------------------------------|
|             2 | Имя блока                                                                                   |
|---------------+---------------------------------------------------------------------------------------------|
|           340 | Идентификатор/дескриптор жесткого указателя на связанный объект LAYOUT                      |
|---------------+---------------------------------------------------------------------------------------------|
|            70 | Единицы вставки блока.                                                                      |
|---------------+---------------------------------------------------------------------------------------------|
|           280 | Расчленяемость блока                                                                        |
|---------------+---------------------------------------------------------------------------------------------|
|           281 | Масштабируемость блока                                                                      |
|---------------+---------------------------------------------------------------------------------------------|
|           310 | Файл DXF: двоичные данные предварительного просмотра растрового изображения (необязательно) |
|---------------+---------------------------------------------------------------------------------------------|
|          1001 | Имя приложения расширенных данных, \"ACAD\" (необязательно)                                 |
|---------------+---------------------------------------------------------------------------------------------|
|          1000 | Данные строк расширенных данных, \"DesignCenter Data\" (необязательно)                      |
|---------------+---------------------------------------------------------------------------------------------|
|          1002 | Начало расширенных данных, \"{\" (необязательно)                                            |
|---------------+---------------------------------------------------------------------------------------------|
|          1070 | Номер версии Центра управления Autodesk                                                     |
|---------------+---------------------------------------------------------------------------------------------|
|          1070 | Единицы вставки:                                                                            |
|               | 0 = безразмерн.                                                                             |
|               | 1 = дюймы                                                                                   |
|               | 2 = футы                                                                                    |
|               | 3 = мили                                                                                    |
|               | 4 = миллиметры                                                                              |
|               | 5 = сантиметры                                                                              |
|               | 6 = метры                                                                                   |
|               | 7 = километры                                                                               |
|               | 8 = микродюймы                                                                              |
|               | 9 = милы                                                                                    |
|               | 10 = ярды                                                                                   |
|               | 11 = ангстремы                                                                              |
|               | 12 = нанометры                                                                              |
|               | 13 = микроны                                                                                |
|               | 14 = дециметры                                                                              |
|               | 15 = декаметры                                                                              |
|               | 16 = гектометры                                                                             |
|               | 17 = гигаметры                                                                              |
|               | 18 = астрономические единицы                                                                |
|               | 19 = световые годы                                                                          |
|               | 20 = парсеки                                                                                |
|               | 21 = футы США                                                                               |
|               | 22 = дюймы США                                                                              |
|               | 23 = ярды США                                                                               |
|               | 24 = мили США                                                                               |
|---------------+---------------------------------------------------------------------------------------------|
|          1002 | Конец расширенных данных, \"}\"                                                             |
|---------------+---------------------------------------------------------------------------------------------|
"))

(defmethod dxf-out-text ((x db-block-tr) stream)
  (dxf-out-t-string 0 *db-block-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x db-block-tr) stream)
  (dxf-out-t-string 100 *db-block-tr-subclass-marker* stream)
  (let ((st-name (symbol-tr-name x))
	(st-flag (symbol-tr-flag x))
	(lay (block-tr-layout x))
	(e-ty (block-tr-explodability x))
	(s-ty (block-tr-scalability x))
	(b-p  (block-tr-bitmap x)))
    (dxf-out-t-string 2 st-name stream)
    (when lay (dxf-out-t-hex 340 lay stream))
    (dxf-out-t-int16 70 st-flag stream)
    (dxf-out-t-int16 280 e-ty stream)
    (dxf-out-t-int16 281 s-ty stream)
    (when b-p (dxf-out-t-hex 310 b-p stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-dimstyle-tr (db-symbol-tr)
  ((dimstyle-tr-dimpost   :accessor dimstyle-tr-dimpost   :initarg :dimstyle-tr-dimpost   :initform nil :documentation "Код  3. DIMPOST")
   (dimstyle-tr-dimapost  :accessor dimstyle-tr-dimapost  :initarg :dimstyle-tr-dimapost  :initform nil :documentation "Код  4. DIMAPOST")
;   (dimstyle-tr-dimblk    :accessor dimstyle-tr-dimblk    :initarg :dimstyle-tr-dimblk    :initform nil :documentation "Код  5. DIMBLK (устарело, теперь это идентификатор объекта)")
;   (dimstyle-tr-dimblk1   :accessor dimstyle-tr-dimblk1   :initarg :dimstyle-tr-dimblk1   :initform nil :documentation "Код  6. DIMBLK1 (устарело, теперь это идентификатор объекта)")   
;   (dimstyle-tr-dimblk2   :accessor dimstyle-tr-dimblk2   :initarg :dimstyle-tr-dimblk2   :initform nil :documentation "Код  7. DIMBLK2 (устарело, теперь это идентификатор объекта)")
   (dimstyle-tr-dimscale  :accessor dimstyle-tr-dimscale  :initarg :dimstyle-tr-dimscale  :initform nil :documentation "Код  40. DIMSCALE")
   (dimstyle-tr-dimasz    :accessor dimstyle-tr-dimasz    :initarg :dimstyle-tr-dimasz    :initform nil :documentation "Код  41. DIMASZ")
   (dimstyle-tr-dimexo    :accessor dimstyle-tr-dimexo    :initarg :dimstyle-tr-dimexo    :initform nil :documentation "Код  42. DIMEXO")
   (dimstyle-tr-dimdli    :accessor dimstyle-tr-dimdli    :initarg :dimstyle-tr-dimdli    :initform nil :documentation "Код  43. DIMDLI")
   (dimstyle-tr-dimexe    :accessor dimstyle-tr-dimexe    :initarg :dimstyle-tr-dimexe    :initform nil :documentation "Код  44. DIMEXE")
   (dimstyle-tr-dimrnd    :accessor dimstyle-tr-dimrnd    :initarg :dimstyle-tr-dimrnd    :initform nil :documentation "Код  45. DIMRND")
   (dimstyle-tr-dimdle    :accessor dimstyle-tr-dimdle    :initarg :dimstyle-tr-dimdle    :initform nil :documentation "Код  46. DIMDLE")
   (dimstyle-tr-dimtp     :accessor dimstyle-tr-dimtp     :initarg :dimstyle-tr-dimtp     :initform nil :documentation "Код  47. DIMTP")
   (dimstyle-tr-dimtm     :accessor dimstyle-tr-dimtm     :initarg :dimstyle-tr-dimtm     :initform nil :documentation "Код  48. DIMTM")
   (dimstyle-tr-dimtxt    :accessor dimstyle-tr-dimtxt    :initarg :dimstyle-tr-dimtxt    :initform nil :documentation "Код  140. DIMTXT")
   (dimstyle-tr-dimcen    :accessor dimstyle-tr-dimcen    :initarg :dimstyle-tr-dimcen    :initform nil :documentation "Код  141. DIMCEN")
   (dimstyle-tr-dimtsz    :accessor dimstyle-tr-dimtsz    :initarg :dimstyle-tr-dimtsz    :initform nil :documentation "Код  142. DIMTSZ")
   (dimstyle-tr-dimaltf   :accessor dimstyle-tr-dimaltf   :initarg :dimstyle-tr-dimaltf   :initform nil :documentation "Код  143. DIMALTF")
   (dimstyle-tr-dimlfac   :accessor dimstyle-tr-dimlfac   :initarg :dimstyle-tr-dimlfac   :initform nil :documentation "Код  144. DIMLFAC")
   (dimstyle-tr-dimtvp    :accessor dimstyle-tr-dimtvp    :initarg :dimstyle-tr-dimtvp    :initform nil :documentation "Код  145. DIMTVP")
   (dimstyle-tr-dimtfac   :accessor dimstyle-tr-dimtfac   :initarg :dimstyle-tr-dimtfac   :initform nil :documentation "Код  146. DIMTFAC")
   (dimstyle-tr-dimgap    :accessor dimstyle-tr-dimgap    :initarg :dimstyle-tr-dimgap    :initform nil :documentation "Код  147. DIMGAP")
   (dimstyle-tr-dimaltrnd :accessor dimstyle-tr-dimaltrnd :initarg :dimstyle-tr-dimaltrnd :initform nil :documentation "Код  148. DIMALTRND")
   (dimstyle-tr-dimtol    :accessor dimstyle-tr-dimtol    :initarg :dimstyle-tr-dimtol    :initform nil :documentation "Код  71. DIMTOL")
   (dimstyle-tr-dimlim    :accessor dimstyle-tr-dimlim    :initarg :dimstyle-tr-dimlim    :initform nil :documentation "Код  72. DIMLIM")
   (dimstyle-tr-dimtih    :accessor dimstyle-tr-dimtih    :initarg :dimstyle-tr-dimtih    :initform nil :documentation "Код  73. DIMTIH")
   (dimstyle-tr-dimtoh    :accessor dimstyle-tr-dimtoh    :initarg :dimstyle-tr-dimtoh    :initform nil :documentation "Код  74. DIMTOH")
   (dimstyle-tr-dimse1    :accessor dimstyle-tr-dimse1    :initarg :dimstyle-tr-dimse1    :initform nil :documentation "Код  75. DIMSE1")
   (dimstyle-tr-dimse2    :accessor dimstyle-tr-dimse2    :initarg :dimstyle-tr-dimse2    :initform nil :documentation "Код  76. DIMSE2")
   (dimstyle-tr-dimtad    :accessor dimstyle-tr-dimtad    :initarg :dimstyle-tr-dimtad    :initform nil :documentation "Код  77. DIMTAD")
   (dimstyle-tr-dimzin    :accessor dimstyle-tr-dimzin    :initarg :dimstyle-tr-dimzin    :initform nil :documentation "Код  78. DIMZIN")
   (dimstyle-tr-dimazin   :accessor dimstyle-tr-dimazin   :initarg :dimstyle-tr-dimazin   :initform nil :documentation "Код  79. DIMAZIN")
   (dimstyle-tr-dimalt    :accessor dimstyle-tr-dimalt    :initarg :dimstyle-tr-dimalt    :initform nil :documentation "Код  170. DIMALT")
   (dimstyle-tr-dimaltd   :accessor dimstyle-tr-dimaltd   :initarg :dimstyle-tr-dimaltd   :initform nil :documentation "Код  171. DIMALTD")
   (dimstyle-tr-dimtofl   :accessor dimstyle-tr-dimtofl   :initarg :dimstyle-tr-dimtofl   :initform nil :documentation "Код  172. DIMTOFL")
   (dimstyle-tr-dimsah    :accessor dimstyle-tr-dimsah    :initarg :dimstyle-tr-dimsah    :initform nil :documentation "Код  173. DIMSAH")
   (dimstyle-tr-dimtix    :accessor dimstyle-tr-dimtix    :initarg :dimstyle-tr-dimtix    :initform nil :documentation "Код  174. DIMTIX")
   (dimstyle-tr-dimsoxd   :accessor dimstyle-tr-dimsoxd   :initarg :dimstyle-tr-dimsoxd   :initform nil :documentation "Код  175. DIMSOXD")
   (dimstyle-tr-dimclrd   :accessor dimstyle-tr-dimclrd   :initarg :dimstyle-tr-dimclrd   :initform nil :documentation "Код  176. DIMCLRD")
   (dimstyle-tr-dimclre   :accessor dimstyle-tr-dimclre   :initarg :dimstyle-tr-dimclre   :initform nil :documentation "Код  177. DIMCLRE")
   (dimstyle-tr-dimclrt   :accessor dimstyle-tr-dimclrt   :initarg :dimstyle-tr-dimclrt   :initform nil :documentation "Код  178. DIMCLRT")
   (dimstyle-tr-dimadec   :accessor dimstyle-tr-dimadec   :initarg :dimstyle-tr-dimadec   :initform nil :documentation "Код  179. DIMADEC")
;  (dimstyle-tr-dimunit   :accessor dimstyle-tr-dimunit   :initarg :dimstyle-tr-dimunit   :initform nil :documentation "Код  270. DIMUNIT (устарело, теперь используется DIMLUNIT и DIMFRAC)")
   (dimstyle-tr-dimdec    :accessor dimstyle-tr-dimdec    :initarg :dimstyle-tr-dimdec    :initform nil :documentation "Код  271. DIMDEC")
   (dimstyle-tr-dimtdec   :accessor dimstyle-tr-dimtdec   :initarg :dimstyle-tr-dimtdec   :initform nil :documentation "Код  272. DIMTDEC")
   (dimstyle-tr-dimaltu   :accessor dimstyle-tr-dimaltu   :initarg :dimstyle-tr-dimaltu   :initform nil :documentation "Код  273. DIMALTU")
   (dimstyle-tr-dimalttd  :accessor dimstyle-tr-dimalttd  :initarg :dimstyle-tr-dimalttd  :initform nil :documentation "Код  274. DIMALTTD")
   (dimstyle-tr-dimaunit  :accessor dimstyle-tr-dimaunit  :initarg :dimstyle-tr-dimaunit  :initform nil :documentation "Код  275. DIMAUNIT")
   (dimstyle-tr-dimfrac   :accessor dimstyle-tr-dimfrac   :initarg :dimstyle-tr-dimfrac   :initform nil :documentation "Код  276. DIMFRAC")
   (dimstyle-tr-dimlunit  :accessor dimstyle-tr-dimlunit  :initarg :dimstyle-tr-dimlunit  :initform nil :documentation "Код  277. DIMLUNIT")
   (dimstyle-tr-dimdsep   :accessor dimstyle-tr-dimdsep   :initarg :dimstyle-tr-dimdsep   :initform nil :documentation "Код  278. DIMDSEP")
   (dimstyle-tr-dimtmove  :accessor dimstyle-tr-dimtmove  :initarg :dimstyle-tr-dimtmove  :initform nil :documentation "Код  279. DIMTMOVE")
   (dimstyle-tr-dimjust   :accessor dimstyle-tr-dimjust   :initarg :dimstyle-tr-dimjust   :initform nil :documentation "Код  280. DIMJUST")
   (dimstyle-tr-dimsd1    :accessor dimstyle-tr-dimsd1    :initarg :dimstyle-tr-dimsd1    :initform nil :documentation "Код  281. DIMSD1")
   (dimstyle-tr-dimsd2    :accessor dimstyle-tr-dimsd2    :initarg :dimstyle-tr-dimsd2    :initform nil :documentation "Код  282. DIMSD2")
   (dimstyle-tr-dimtolj   :accessor dimstyle-tr-dimtolj   :initarg :dimstyle-tr-dimtolj   :initform nil :documentation "Код  283. DIMTOLJ")
   (dimstyle-tr-dimtzin   :accessor dimstyle-tr-dimtzin   :initarg :dimstyle-tr-dimtzin   :initform nil :documentation "Код  284. DIMTZIN")
   (dimstyle-tr-dimaltz   :accessor dimstyle-tr-dimaltz   :initarg :dimstyle-tr-dimaltz   :initform nil :documentation "Код  285. DIMALTZ")
   (dimstyle-tr-dimalttz  :accessor dimstyle-tr-dimalttz  :initarg :dimstyle-tr-dimalttz  :initform nil :documentation "Код  286. DIMALTTZ")
;  (dimstyle-tr-dimfit    :accessor dimstyle-tr-dimfit    :initarg :dimstyle-tr-dimfit    :initform nil :documentation "Код  287. DIMFIT (устарело, теперь используется DIMATFIT и DIMTMOVE)")
   (dimstyle-tr-dimupt    :accessor dimstyle-tr-dimupt    :initarg :dimstyle-tr-dimupt    :initform nil :documentation "Код  288. DIMUPT")
   (dimstyle-tr-dimatfit  :accessor dimstyle-tr-dimatfit  :initarg :dimstyle-tr-dimatfit  :initform nil :documentation "Код  289. DIMATFIT")
   (dimstyle-tr-dimtxsty  :accessor dimstyle-tr-dimtxsty  :initarg :dimstyle-tr-dimtxsty  :initform nil :documentation "Код  340. DIMTXSTY (дескриптор связанного элемента STYLE)")
   (dimstyle-tr-dimldrblk :accessor dimstyle-tr-dimldrblk :initarg :dimstyle-tr-dimldrblk :initform nil :documentation "Код  341. DIMLDRBLK (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimblk    :accessor dimstyle-tr-dimblk    :initarg :dimstyle-tr-dimblk    :initform nil :documentation "Код  342. DIMBLK (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimblk1   :accessor dimstyle-tr-dimblk1   :initarg :dimstyle-tr-dimblk1   :initform nil :documentation "Код  343. DIMBLK1 (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimblk2   :accessor dimstyle-tr-dimblk2   :initarg :dimstyle-tr-dimblk2   :initform nil :documentation "Код  344. DIMBLK2 (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimlwd    :accessor dimstyle-tr-dimlwd    :initarg :dimstyle-tr-dimlwd    :initform nil :documentation "Код  371. DIMLWD (значение перечисления веса линий)")
   (dimstyle-tr-dimlwe    :accessor dimstyle-tr-dimlwe    :initarg :dimstyle-tr-dimlwe    :initform nil :documentation "Код  372. DIMLWE (значение перечня веса линий)"))
  (:documentation "find . -name \"*.h\" | xargs grep \"class AcDbBlockTableRecord\"
/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/dbsymtb.h:class AcDbBlockTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
====================================================================================================  
DIMSTYLE (DXF)
К записям таблицы обозначений DIMSTYLE применяются следующие групповые коды.
Групповые коды DIMSTYLE
|---------------+-------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbDimStyleTableRecord)                                                            |
|---------------+-------------------------------------------------------------------------------------------------------|
|             2 | Имя размерного стиля                                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                               |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки;                      |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается;           |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,          |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.       |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, |
|               | записывающих файлы DXF)                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             3 | DIMPOST                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             4 | DIMAPOST                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|             5 | DIMBLK (устарело, теперь это идентификатор объекта)                                                   |
|---------------+-------------------------------------------------------------------------------------------------------|
|             6 | DIMBLK1 (устарело, теперь это идентификатор объекта)                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
|             7 | DIMBLK2 (устарело, теперь это идентификатор объекта)                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
|            40 | DIMSCALE                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|            41 | DIMASZ                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            42 | DIMEXO                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            43 | DIMDLI                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            44 | DIMEXE                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            45 | DIMRND                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            46 | DIMDLE                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            47 | DIMTP                                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------|
|            48 | DIMTM                                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------|
|           140 | DIMTXT                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           141 | DIMCEN                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           142 | DIMTSZ                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           143 | DIMALTF                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           144 | DIMLFAC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           145 | DIMTVP                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           146 | DIMTFAC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           147 | DIMGAP                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           148 | DIMALTRND                                                                                             |
|---------------+-------------------------------------------------------------------------------------------------------|
|            71 | DIMTOL                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            72 | DIMLIM                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            73 | DIMTIH                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            74 | DIMTOH                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            75 | DIMSE1                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            76 | DIMSE2                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            77 | DIMTAD                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            78 | DIMZIN                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            79 | DIMAZIN                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           170 | DIMALT                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           171 | DIMALTD                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           172 | DIMTOFL                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           173 | DIMSAH                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           174 | DIMTIX                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           175 | DIMSOXD                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           176 | DIMCLRD                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           177 | DIMCLRE                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           178 | DIMCLRT                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           179 | DIMADEC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           270 | DIMUNIT (устарело, теперь используется DIMLUNIT и DIMFRAC)                                            |
|---------------+-------------------------------------------------------------------------------------------------------|
|           271 | DIMDEC                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           272 | DIMTDEC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           273 | DIMALTU                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           274 | DIMALTTD                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           275 | DIMAUNIT                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           276 | DIMFRAC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           277 | DIMLUNIT                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           278 | DIMDSEP                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           279 | DIMTMOVE                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           280 | DIMJUST                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           281 | DIMSD1                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           282 | DIMSD2                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           283 | DIMTOLJ                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           284 | DIMTZIN                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           285 | DIMALTZ                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           286 | DIMALTTZ                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           287 | DIMFIT (устарело, теперь используется DIMATFIT и DIMTMOVE)                                            |
|---------------+-------------------------------------------------------------------------------------------------------|
|           288 | DIMUPT                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           289 | DIMATFIT                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           340 | DIMTXSTY (дескриптор связанного элемента STYLE)                                                       |
|---------------+-------------------------------------------------------------------------------------------------------|
|           341 | DIMLDRBLK (дескриптор связанного элемента BLOCK)                                                      |
|---------------+-------------------------------------------------------------------------------------------------------|
|           342 | DIMBLK (дескриптор связанного элемента BLOCK)                                                         |
|---------------+-------------------------------------------------------------------------------------------------------|
|           343 | DIMBLK1 (дескриптор связанного элемента BLOCK)                                                        |
|---------------+-------------------------------------------------------------------------------------------------------|
|           344 | DIMBLK2 (дескриптор связанного элемента BLOCK)                                                        |
|---------------+-------------------------------------------------------------------------------------------------------|
|           371 | DIMLWD (значение перечисления веса линий)                                                             |
|---------------+-------------------------------------------------------------------------------------------------------|
|           372 | DIMLWE (значение перечня веса линий)                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
"))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defclass db-textstyle-tr (db-symbol-tr)
  (
   (textstyle-tr-text-height      :accessor textstyle-tr-text-height       :initarg :textstyle-tr-text-height       :initform 0     :documentation "Код   40. Фиксированная высота текста; значение 0, если нефиксированная")
   (textstyle-tr-width-factor     :accessor textstyle-tr-width-factor      :initarg :textstyle-tr-width-factor      :initform 0     :documentation "Код   41. Коэффициент сжатия")
   (textstyle-tr-oblique-angle    :accessor textstyle-tr-oblique-angle     :initarg :textstyle-tr-oblique-angle     :initform 0     :documentation "Код   50. Угол наклона")
   (textstyle-tr-text-gen-flags   :accessor textstyle-tr-text-gen-flags    :initarg :textstyle-tr-text-gen-flags    :initform 0     :documentation "Код   71. Флаги создания текста: 2 = текст в обратном направлении (зеркально отражен по X); 4 = текст перевернут (зеркально отражен по Y)")
   (textstyle-tr-last-used-height :accessor textstyle-tr-last-used-height  :initarg :textstyle-tr-last-used-height  :initform 0     :documentation "Код   42. Последняя использованная высота")
   (textstyle-tr-pri-font-fname   :accessor textstyle-tr-pri-font-fname    :initarg :textstyle-tr-pri-font-fname    :initform 0     :documentation "Код    3. Имя файла основного шрифта ")
   (textstyle-tr-big-font-fname   :accessor textstyle-tr-big-font-fname    :initarg :textstyle-tr-big-font-fname    :initform 0     :documentation "Код    4. Имя файла большого шрифта; значение пусто, если файл отсутствует")
   (textstyle-tr-font-family      :accessor textstyle-tr-font-family       :initarg :textstyle-tr-font-family       :initform 0     :documentation "Код 1071. Длинное значение, содержащее шаг и семейство шрифта TrueType, набор символов и флаги полужирного шрифта и курсива")   
   )
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================
"))

(defclass db-ucs-tr (db-symbol-tr)
  ((ucs-tr-origin           :accessor ucs-tr-origin           :initarg :ucs-tr-origin           :initform (vector 0 0 0) :documentation "Код   10. Начало координат (в МСК)")
   (ucs-tr-x-axis-direction :accessor ucs-tr-x-axis-direction :initarg :ucs-tr-x-axis-direction :initform (vector 1 0 0) :documentation "Код   11. Направление оси X (в МСК)")
   (ucs-tr-y-axis-direction :accessor ucs-tr-y-axis-direction :initarg :ucs-tr-y-axis-direction :initform (vector 0 1 0) :documentation "Код   12. Направление оси Y (в МСК)")
   (ucs-tr-always-flag      :accessor ucs-tr-always-flag      :initarg :ucs-tr-always-flag      :initform (vector 0 1 0) :documentation "Код   79. Всегда равно 0")
   (ucs-tr-elevation        :accessor ucs-tr-elevation        :initarg :ucs-tr-elevation        :initform 0.0            :documentation "Код  146. Уровень")
   (ucs-tr-base             :accessor ucs-tr-base             :initarg :ucs-tr-base             :initform nil            :documentation "Код  346. Идентификатор/дескриптор базовой ПСК при работе с ортогональным изображением. Этот код отсутствует, если код 79 равен 0. Если этот код отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК")
   (ucs-tr-ortho-type       :accessor ucs-tr-ortho-type       :initarg :ucs-tr-ortho-type       :initform nil            :documentation "Код   71. Тип ортогонального изображения (необязательно; всегда отображается в паре с кодами 13, 23, 33): 1 = сверху; 2 = снизу; 3 = спереди; 4 = сзади; 5 = слева; 6 = справа")
   (ucs-tr-ortho-origin     :accessor ucs-tr-ortho-origin     :initarg :ucs-tr-ortho-origin     :initform nil            :documentation "Код   13. Начало координат данного типа ортогонального изображения относительно данной ПСК"))
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
==================================================================================================== 
"))

(defclass db-view-tr (db-symbol-tr)
  ((view-tr-height          :accessor view-tr-height         :initarg :view-tr-height         :initform 0              :documentation "Код  40. Высота вида (в РСК)")
   (view-tr-center-point    :accessor view-tr-center-point   :initarg :view-tr-center-point   :initform (vector 0 0)   :documentation "Код  10. Центральная точка вида (в РСК).  2D-точка")
   (view-tr-width           :accessor view-tr-width          :initarg :view-tr-width          :initform 420.0          :documentation "Код  41. Ширина вида (в РСК)")
   (view-tr-direction       :accessor view-tr-direction      :initarg :view-tr-direction      :initform (vector 0 0 1) :documentation "Код  11. Направление взгляда из целевой точки (в МСК). 3D-вектор")
   (view-tr-target-point    :accessor view-tr-target-point   :initarg :view-tr-target-point   :initform (vector 0 0 0) :documentation "Код  12. Целевая точка (в МСК)")
   (view-tr-lens-length     :accessor view-tr-lens-length    :initarg :view-tr-lens-length    :initform 0              :documentation "Код  42. Фокусное расстояние")
   (view-tr-fcp-offset      :accessor view-tr-fcp-offset     :initarg :view-tr-fcp-offset     :initform 100.0          :documentation "Код  43. Передняя плоскость подрезки (смещение от целевой точки)")
   (view-tr-bcp-offset      :accessor view-tr-bcp-offset     :initarg :view-tr-bcp-offset     :initform 100.0          :documentation "Код  44. Задняя плоскость подрезки (смещение от целевой точки)") 
   (view-tr-twist-angle     :accessor view-tr-twist-angle    :initarg :view-tr-twist-angle    :initform 100.0          :documentation "Код  50. Угол закручивания") 
   (view-tr-view-mode       :accessor view-tr-view-mode      :initarg :view-tr-view-mode      :initform 0              :documentation "Код  71. Режим просмотра (см. системную переменную VIEWMODE)")
   (view-tr-render-mode     :accessor view-tr-render-mode    :initarg :view-tr-render-mode    :initform 0              :documentation "Код 281. Режим визуализации: 0 = оптимизированное 2D (классическое 2D); 1 = каркас; 2 = скрытие линий; 3 = плоское; 4 = по Гуро; 5 = плоское с каркасом; 6 = по Гуро с каркасом; Все режимы визуализации кроме \"Оптимизированное 2D\" задействуют новую систему 3D-графики; Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode")
   (view-tr-ucs-associated  :accessor view-tr-ucs-associated :initarg :view-tr-ucs-associated :initform 0              :documentation "Код  72. 1, если имеется ПСК, связанная с этим видом; 0 в противном случае")
   (view-tr-plottable       :accessor view-tr-plottable      :initarg :view-tr-plottable      :initform 0              :documentation "Код  73. 1, если данные с камеры выводятся на печать")
   (view-tr-background      :accessor view-tr-background     :initarg :view-tr-background     :initform nil            :documentation "Код 332. Идентификатор/дескриптор символьного указателя на объект фона (необязательно)")
   (view-tr-live-section    :accessor view-tr-live-section   :initarg :view-tr-live-section   :initform nil            :documentation "Код 334. Идентификатор/дескриптор символьного указателя на объект псевдоразреза (необязательно)")
   (view-tr-visual-style    :accessor view-tr-visual-style   :initarg :view-tr-visual-style   :initform nil            :documentation "Код 348. Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)")
   (view-tr-sun             :accessor view-tr-sun            :initarg :view-tr-sun            :initform 0              :documentation "Код 361. Идентификатор солнца с жестким правом владения. Следующие коды отображаются только в том случае, если для кода 72 установлено значение 1. С их помощью определяется ПСК, связанная с этим видом. Эта ПСК становится текущей ПСК каждый раз при восстановлении этого вида (если значение кода 72 равно 0, ПСК не изменяется)."))
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord

==================================================================================================== 
"))

(defclass db-vport-tr (db-symbol-tr) 
  (
;  (vport-name  :accessor vport-name  :initarg :vport-name  :initform "*Active" :documentation "Код 2. Имя видового экрана")
;  (vport-flags :accessor vport-flags :initarg :vport-flags :initform 0		:documentation "Код 70. Стандартные значения флагов (кодовые битовые значения): 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки; 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается; 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз, на запись таблицы ссылался хотя бы один объект на чертеже. Этот флаг нужен для команд AutoCAD. Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF")
   (vport-tr-lower-left-corner    :accessor vport-tr-lower-left-corner    :initarg :vport-tr-lower-left-corner    :initform (vector 0.0 0.0)        :documentation "Код  10. Левый нижний угол видового экрана. Файл DXF: значение X; приложение: 2D-точка ")
   (vport-tr-upper-right-corner   :accessor vport-tr-upper-right-corner   :initarg :vport-tr-upper-right-corner   :initform (vector 1.0 1.0)        :documentation "Код  11. Правый верхний угол видового экрана. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-tr-view-center-point    :accessor vport-tr-view-center-point    :initarg :vport-tr-view-center-point    :initform (vector 420.0 297.0)    :documentation "Код  12. Центральная точка вида (в РСК). Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-tr-snap-base-point      :accessor vport-tr-snap-base-point      :initarg :vport-tr-snap-base-point      :initform (vector 0.0 0.0)        :documentation "Код  13. Базовая точка привязки (в РСК). Файл DXF: значение X; приложение: 2D-точка") 
   (vport-tr-snap-spacing         :accessor vport-tr-snap-spacing         :initarg :vport-tr-snap-spacing         :initform (vector 10.0 10.0)      :documentation "Код  14. Шаг привязки по оси X и Y. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-tr-grid-spacing         :accessor vport-tr-grid-spacing         :initarg :vport-tr-grid-spacing         :initform (vector 10.0 10.0)      :documentation "Код  15. Шаг сетки по осям X и Y. Файл DXF: значение X; приложение: 2D-точка") 
   (vport-tr-view-direction       :accessor vport-tr-view-direction       :initarg :vport-tr-view-direction       :initform (vector 0.0 0.0 1.0)    :documentation "Код  16. Направление взгляда из целевой точки (в МСК). Файл DXF: значение X; приложение: 3D-точка") 
   (vport-tr-view-target-point    :accessor vport-tr-view-target-point    :initarg :vport-tr-view-target-point    :initform (vector 0.0 0.0 0.0)    :documentation "Код  17. Целевая точка вида (в МСК). Файл DXF: значение X; приложение: 3D-точка ") 
   (vport-tr-lens-length          :accessor vport-tr-lens-length          :initarg :vport-tr-lens-length          :initform 50.0                    :documentation "Код  42. Фокусное расстояние") 
   (vport-tr-front-clipping-plane :accessor vport-tr-front-clipping-plane :initarg :vport-tr-front-clipping-plane :initform 0.0                     :documentation "Код  43. Передняя плоскость подрезки (смещение от целевой точки)") 
   (vport-tr-back-clipping-plane  :accessor vport-tr-back-clipping-plane  :initarg :vport-tr-back-clipping-plane  :initform 0.0                     :documentation "Код  44. Задняя плоскость подрезки (смещение от целевой точки)") 
   (vport-tr-view-height          :accessor vport-tr-view-height          :initarg :vport-tr-view-height          :initform 594.0                   :documentation "Код  45. Высота вида") 
   (vport-tr-snap-rotation-angle  :accessor vport-tr-snap-rotation-angle  :initarg :vport-tr-snap-rotation-angle  :initform 0.0                     :documentation "Код  50. Угол поворота привязки") 
   (vport-tr-view-twist-angle     :accessor vport-tr-view-twist-angle     :initarg :vport-tr-view-twist-angle     :initform 0.0                     :documentation "Код  51. Угол закручивания вида") 
   (vport-tr-circle-sides         :accessor vport-tr-circle-sides         :initarg :vport-tr-circle-sides         :initform 0.0                     :documentation "Код  72. Стороны круга")
   (vport-tr-frozen-layer-id      :accessor vport-tr-frozen-layer-id      :initarg :vport-tr-frozen-layer-id      :initform nil                     :documentation "Код 331 или 441. Идентификатор/дескриптор символьного или жесткого указателя на объекты замороженного слоя; повторяется для каждого замороженного слоя")
   (vport-tr-bit-flags            :accessor vport-tr-bit-flags            :initarg :vport-tr-bit-flags            :initform 0.0                     :documentation "Код  70. Флаги битов и режим перспективной проекции") 
   (vport-tr-plot-style-sheet     :accessor vport-tr-plot-style-sheet     :initarg :vport-tr-plot-style-sheet     :initform 0.0                     :documentation "Код   1. Таблица стилей печати")
   (vport-tr-render-mode          :accessor vport-tr-render-mode          :initarg :vport-tr-render-mode          :initform 0                       :documentation "Код 281. Режим визуализации: 0 = оптимизированное 2D (классическое 2D); 1 = каркас; 2 = скрытие линий; 3 = плоское; 4 = по Гуро; 5 = плоское с каркасом; 6 = по Гуро с каркасом. Все режимы визуализации, кроме 'Оптимизированное 2D',задействуют новую систему 3D-графики. Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode") 
   (vport-tr-view-mode            :accessor vport-tr-view-mode            :initarg :vport-tr-view-mode            :initform 0                       :documentation "Код  71. Режим просмотра (см. системную переменную VIEWMODE)") 
   (vport-tr-ucsicon-setting      :accessor vport-tr-ucsicon-setting      :initarg :vport-tr-ucsicon-setting      :initform 3                       :documentation "Код  74. Параметр ЗНАКПСК")
   (vport-tr-ucs-origin           :accessor vport-tr-ucs-origin           :initarg :vport-tr-ucs-origin           :initform (vector 0.0 0.0 0.0)    :documentation "Код 110. Начало координат ПСК. Файл DXF: значение X; приложение: 3D-точка")
   (vport-tr-ucs-x-axis           :accessor vport-tr-ucs-origin           :initarg :vport-tr-ucs-origin           :initform (vector 1.0 0.0 0.0)    :documentation "Код 111. Ось X ПСК. Файл DXF: значение X; приложение: 3D-вектор") 
   (vport-tr-ucs-y-axis           :accessor vport-tr-ucs-origin           :initarg :vport-tr-ucs-origin           :initform (vector 0.0 1.0 0.0)    :documentation "Код 112. Ось Y ПСК. Файл DXF: значение X; приложение: 3D-вектор") 
   (vport-tr-ucs-id-name          :accessor vport-tr-ucs-id-name          :initarg :vport-tr-ucs-id-name          :initform nil                     :documentation "Код 345. Идентификатор/дескриптор AcDbUCSTableRecord, если ПСК является именованной ПСК. Если значение отсутствует, то ПСК является неименованной") 
   (vport-tr-ucs-id-base          :accessor vport-tr-ucs-id-base          :initarg :vport-tr-ucs-id-base          :initform nil                     :documentation "Код 346. Идентификатор/дескриптор AcDbUCSTableRecord базовой ПСК, если ПСК является ортогональной (код 79 не равен нулю). Если значение отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК") 
   (vport-tr-ucs-ortho-type       :accessor vport-tr-ucs-ortho-type       :initarg :vport-tr-ucs-ortho-type       :initform 0                       :documentation "Код  79. Ортогональный тип ПСК: 0 = ПСК не ортогональна; 1 = сверху; 2 = снизу; 3 = спереди; 4 = сзади; 5 = слева; 6 = справа") 
   (vport-tr-elevation            :accessor vport-tr-elevation            :initarg :vport-tr-elevation            :initform 0.0                     :documentation "Код 146. Уровень") 
   (vport-tr-shade-plot-setting   :accessor vport-tr-shade-plot-setting   :initarg :vport-tr-shade-plot-setting   :initform nil                     :documentation "Код 170. Тонирование печати")
   (vport-tr-major-grid-lines     :accessor vport-tr-major-grid-lines     :initarg :vport-tr-major-grid-lines     :initform 5                       :documentation "Код  61. Основные линии сетки")
   (vport-tr-background-id        :accessor vport-tr-background-id        :initarg :vport-tr-background-id        :initform nil                     :documentation "Код 332. Идентификатор/дескриптор символьного указателя на объект фона (необязательно)")
   (vport-tr-shade-plot-id        :accessor vport-tr-shade-plot-id        :initarg :vport-tr-shade-plot-id        :initform nil                     :documentation "Код 333. Идентификатор/дескриптор символьного указателя на объект режима печати оттенков (необязательно)")
   (vport-tr-visual-style-id      :accessor vport-tr-visual-style-id      :initarg :vport-tr-visual-style-id      :initform "2A"                    :documentation "Код 348. Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)")
   (vport-tr-lighting-on-flag     :accessor vport-tr-lighting-on-flag     :initarg :vport-tr-lighting-on-flag     :initform 1                       :documentation "Код 292. Флаг включения освещения по умолчанию")
   (vport-tr-lighting-type        :accessor vport-tr-lighting-type        :initarg :vport-tr-lighting-type        :initform 1                       :documentation "Код 282. Тип освещения по умолчанию: 0 = один удаленный источник света; 1 = два удаленных источника света")
   (vport-tr-brightness           :accessor vport-tr-brightness           :initarg :vport-tr-brightness           :initform 0.0                     :documentation "Код 141. Яркость")
   (vport-tr-contrast             :accessor vport-tr-contrast             :initarg :vport-tr-contrast             :initform 0.0                     :documentation "Код 142. Контрастность")
   (vport-tr-ambient-color        :accessor vport-tr-contrast             :initarg :vport-tr-contrast             :initform (vector 250 3355443 0)  :documentation "Код 63, 421, 431. Рассеиваемый цвет (выводится, только если цвет не черный)")
   )
  (:documentation "./dbents.h:class AcDbViewport: public AcDbEntity
====================================================================================================
"
 )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dxf-in-t-sections.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(defun read-from-string-hex   (str)
  (if (string/= str "")
      (parse-integer str :radix 16)
      0))

(defun read-from-string-double (str)
  "Выполняет чтение из строки вещественного числа.
Если число не удалось считать - возвращается default.
Пример использования:

 (read-from-string-double \"1.0\")
 (read-from-string-double \"1.0e10\")
 (read-from-string-double \"1.0E5\")
"
  (let ((s-e-d (mnas-string:replace-all
		(mnas-string:replace-all
		 (mnas-string:replace-all str "e" "d") "E" "d")"D" "d")))
    (if (member #\d (coerce  s-e-d 'list ))
	(read-from-string s-e-d)
	(read-from-string (concatenate 'string s-e-d "d0")))))


(defun dxf-in-t-read-from-string (code str)
;;  (format t "~A ~A~%" code str)
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
    ((= 101 code)        (read-from-string-string str)) ;;;; ACDSRECORD
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
	 (code (first code-string))
	 (str (second code-string))
	 (val (dxf-in-t-read-from-string code str)))
;;    (format t "~A ~A ~A~%" code str val)
    (list code val)))

(defun dxf-in-t-pairs (stream)
  "(with-open-file (stream \"~/quicklisp/local-projects/acad/dxf/dxf/Drawing-sty.dxf\") (dxf-in-t-pairs stream))"
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

(export 'dxf-in-t-fname)

(defun dxf-in-t-fname (fname)
  "@b(Описание:) функция @b(dxf-in-t-fname) выполняет
попытку считывания текстового dxf-файла в формате:
@begin(list)
 @item(версий с 2000 по 2004 [:external-format :cp1251])
 @item(версий с 2007 по 2018 [:external-format :utf8].)

Возвращает список, каждый подсписок, которого содержит пары - код и значение.
@end(list)

Пример использования:
@begin[lang=lisp](code)
 (dxf-in-t-fname \"~/quicklisp/local-projects/acad/dxf/dxf/Drawing-sty.dxf\")
@end(code)
"
  (cond
    ((ignore-errors
       (with-open-file (stream fname :external-format :cp1251)
	 (dxf-in-t-split-by-sections stream))))
    ((ignore-errors
       (with-open-file (stream fname :external-format :utf8)
	 (dxf-in-t-split-by-sections stream))))
    (t (error "Cannot read file ~a." fname))))

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
    ((= 101 code)        (dxf-out-t-string code value stream :max-octet-length 255)) 
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun incf-handseed (sections)
  (1- (incf (cadadr (member '(9 "$HANDSEED")
			    (assoc '(2 "HEADER") sections :test #'equal)
			    :test #'equal)))))

(defun handseed (sections)
  (cadadr (member '(9 "$HANDSEED")
		  (assoc '(2 "HEADER") sections :test #'equal)
		  :test #'equal)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(export  '*section-names*)

(defparameter *section-names*
  '("HEADER" "CLASSES" "TABLES" "BLOCKS" "ENTITIES" "OBJECTS" "ACDSDATA")
  "Наименования секций dxf-файла.
@begin(list)
 @item(HEADER   - содержит системные переменные.)
 @item(CLASSES  - ) 
 @item(TABLES   - ) 
 @item(BLOCKS   - ) 
 @item(ENTITIES - ) 
 @item(OBJECTS  - )
 @item(ACDSDATA - )
@end(list)
"
  )
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-header (sections)
  "Пример использования:
 (split-CLASSES *Drawing-sty*)
"
  (do ((hdr-rec (reverse (cdr (assoc (list 2 "HEADER") sections :test #'equal)))
		(cdr hdr-rec))
       (header-item nil)
       (header-rez nil))
      ((null hdr-rec) header-rez)
    (push (first hdr-rec) header-item)
    (when (= 9 (first (first header-item)))
      (push header-item header-rez)
      (setf header-item nil))))

(defun get-acad-variable-as-list (variable-name splited-header-section)
  "Возвращает значение системной переменной variable-name.

Значение возвращается в виде списка.

Пример использования:
 (get-acad-variable-as-list \"ELEVATION\" (split-HEADER *Drawing-sty*)) => ((9 \"$ELEVATION\") (40 10.55d0))
"
  (assoc (concatenate 'string "$" (string-upcase variable-name))
	 splited-header-section :key #'second :test #'string=))

(defun get-acad-variable-names (splited-header-section)
  "Возвращает список

Пример использования:

 (get-acad-variable-names (split-HEADER *Drawing-sty*)) => (\"ACADVER\" ... \"SHADOWPLANELOCATION\")

 (length (get-acad-variable-names (split-HEADER *Drawing-sty*))) => 253
"
  (mapcar
   #'(lambda (el) (string-left-trim "$" (second (first el))))
   splited-header-section))

(defun get-acad-variable-name-codes (splited-header-section)
  "
Пример использования:

 (get-acad-variable-name-codes  (split-HEADER *Drawing-sty*))
"
  (mapcar
   #'(lambda (el) (list (string-left-trim "$" (second (first el))) (first (second el))))
   splited-header-section))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun split-classes (sections)
  "Пример использования
 (split-classes *Drawing-sty*)
"
  (let ((pairs-list (reverse (cdr (assoc '(2 "CLASSES") sections :test #'equal))))
	(classes nil)
	(class   nil))
    (dolist (i pairs-list (nreverse classes))
      (push i class)
      (when (equal i '(0 "CLASS"))
	(push class classes)
	(setf class nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun split-tables (sections)
  "Пример использования:
 (split-TABLES *Drawing-sty*)
"
  (let ((pairs-list (cdr (assoc '(2 "TABLES") sections :test #'equal)))
	(tables nil)
	(table  nil))
    (dolist (i pairs-list (nreverse tables))
      (push i table)
      (when (equal i '(0 "ENDTAB"))
	(push (cdr (nreverse (cdr table))) tables)
	(setf table nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *table-names*
  '("VPORT" "LTYPE" "LAYER" "STYLE" "VIEW" "UCS" "APPID" "DIMSTYLE" "BLOCK_RECORD"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun table-and-items (tbl-name tables-pairs )
  "Пример использования:
 (table-and-items \"BLOCK_RECORD\" *s-tbl*)
"
  (assert (member tbl-name *table-names* :test #'string=  ))
  (assert (consp tables-pairs))
  (let ((pairs-list  (assoc
			  (list 2 tbl-name)
			  tables-pairs
			  :test #'equal))
	(rez nil)
	(block-items nil)
	(blk nil))
    (setf rez 
	  (dolist (i pairs-list (nreverse (push (nreverse blk) block-items)))
	    (push i blk)
	    (when (= (car i) 0)
	      (push (nreverse  (cdr blk)) block-items)
	      (setf blk nil)
	      (push i blk))))
    (values (car rez) (cdr rez))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-blocks (sections)
  "Пример использования:
  (split-blocks *Drawing-sty*)
"
  "split-blocks - not yet defined")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(export 'split-entities)

(defun split-entities (sections)
  "@b(Описание:) функция @b(split-entities) выделяет
из посекционного представления dxf - файла секцию ENTITIES
и преобразует ее в список с dxf - представлениями объектов.

 @b(Пример использования:)
@begin[lang=lisp](code)
  (split-entities *Drawing-sty*)
@end(code)
"
  (let ((pairs-list (reverse (cdr (assoc '(2 "ENTITIES") sections :test #'equal))))
	(entities nil)
	(entity   nil))
    (dolist (i pairs-list (nreverse entities))
      (push i entity)
      (when (= (car i) 0)
	(push entity entities)
	(setf entity nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-objects (sections)
"Пример использования
 (split-objects *Drawing-sty*)
"
"split-objects - not yet defined"
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-acdsdata (sections)
"Пример использования
 (split-acdsdata *Drawing-sty*)
"
"split-acdsdata - not yet defined"
)
