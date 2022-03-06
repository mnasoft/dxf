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
