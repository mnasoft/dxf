;;;; ./src/color/color.lisp

(defpackage #:dxf/color
  (:use #:cl)
  (:export *bylayer*
           *byblock*
           *byentity*
           *byentity-start*
           *byentity-end*
           *byindex*
           *byindex-start*
           *byindex-end*
           )
  (:export index->rgb
           rgb-to-index
           rgb-to-true
           true->rgb
           rgb
           index))

(in-package :dxf/color)

(defparameter *bylayer*  (* -64 256 256 256)
  "@b(Описание:) переменная @b(*byblock*) определяет значение цвета по блоку.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (format t \"~X~%\" *bylayer*) => -40000000
@end(code)
"
  )

(defparameter *byblock*  (* -63 256 256 256)
  "@b(Описание:) переменная @b(*byblock*) определяет значение цвета по блоку.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (format t \"~X~%\" *byblock*) => -3F000000
@end(code)
"
  )

(defparameter *byentity*
  (* -62 256 256 256)  
    "@b(Описание:) переменная @b(*byentity*) участвует в вычислении
 параметров цвета по EntityColor.")

(defparameter *byentity-start*
  *byentity*)

(defparameter *byentity-end*
  (+ (+ (* 256 256 255) (* 256 255) 255) *byentity*))
    
(defparameter *byindex* (* -61 256 256 256)
  "@b(Описание:) переменная @b(*byindex*) участвует в вычислении
 параметров цвета по его индексу.
")

(defparameter *byindex-start*
  (+ 1   *byindex*))

(defparameter *byindex-end*
  (+ 255 *byindex*))

(defparameter +index->rgb+
  '((0   (  0   0   0))
    (1   (255   0   0))
    (2   (255 255   0))
    (3   (  0 255   0))
    (4   (  0 255 255))
    (5   (  0   0 255))
    (6   (255   0 255))
    (7   (255 255 255))
    (8   (128 128 128))
    (9   (192 192 192))
    (10  (255   0   0))
    (11  (255 127 127))
    (12  (204   0   0))
    (13  (204 102 102))
    (14  (153   0   0))
    (15  (153  76  76))
    (16  (127   0   0))
    (17  (127  63  63))
    (18  ( 76   0   0))
    (19  ( 76  38  38))
    (20  (255  63   0))
    (21  (255 159 127))
    (22  (204  51   0))
    (23  (204 127 102))
    (24  (153  38   0))
    (25  (153  95  76))
    (26  (127  31   0))
    (27  (127  79  63))
    (28  ( 76  19   0))
    (29  ( 76  47  38))
    (30  (255 127   0))
    (31  (255 191 127))
    (32  (204 102   0))
    (33  (204 153 102))
    (34  (153  76   0))
    (35  (153 114  76))
    (36  (127  63   0))
    (37  (127  95  63))
    (38  ( 76  38   0))
    (39  ( 76  57  38))
    (40  (255 191   0))
    (41  (255 223 127))
    (42  (204 153   0))
    (43  (204 178 102))
    (44  (153 114   0))
    (45  (153 133  76))
    (46  (127  95   0))
    (47  (127 111  63))
    (48  ( 76  57   0))
    (49  ( 76  66  38))
    (50  (255 255   0))
    (51  (255 255 127))
    (52  (204 204   0))
    (53  (204 204 102))
    (54  (153 153   0))
    (55  (153 153  76))
    (56  (127 127   0))
    (57  (127 127  63))
    (58  ( 76  76   0))
    (59  ( 76  76  38))
    (60  (191 255   0))
    (61  (223 255 127))
    (62  (153 204   0))
    (63  (178 204 102))
    (64  (114 153   0))
    (65  (133 153  76))
    (66  ( 95 127   0))
    (67  (111 127  63))
    (68  ( 57  76   0))
    (69  ( 66  76  38))
    (70  (127 255   0))
    (71  (191 255 127))
    (72  (102 204   0))
    (73  (153 204 102))
    (74  ( 76 153   0))
    (75  (114 153  76))
    (76  ( 63 127   0))
    (77  ( 95 127  63))
    (78  ( 38  76   0))
    (79  ( 57  76  38))
    (80  ( 63 255   0))
    (81  (159 255 127))
    (82  ( 51 204   0))
    (83  (127 204 102))
    (84  ( 38 153   0))
    (85  ( 95 153  76))
    (86  ( 31 127   0))
    (87  ( 79 127  63))
    (88  ( 19  76   0))
    (89  ( 47  76  38))
    (90  (  0 255   0))
    (91  (127 255 127))
    (92  (  0 204   0))
    (93  (102 204 102))
    (94  (  0 153   0))
    (95  ( 76 153  76))
    (96  (  0 127   0))
    (97  ( 63 127  63))
    (98  (  0  76   0))
    (99  ( 38  76  38))
    (100 (  0 255  63))
    (101 (127 255 159))
    (102 (  0 204  51))
    (103 (102 204 127))
    (104 (  0 153  38))
    (105 ( 76 153  95))
    (106 (  0 127  31))
    (107 ( 63 127  79))
    (108 (  0  76  19))
    (109 ( 38  76  47))
    (110 (  0 255 127))
    (111 (127 255 191))
    (112 (  0 204 102))
    (113 (102 204 153))
    (114 (  0 153  76))
    (115 ( 76 153 114))
    (116 (  0 127  63))
    (117 ( 63 127  95))
    (118 (  0  76  38))
    (119 ( 38  76  57))
    (120 (  0 255 191))
    (121 (127 255 223))
    (122 (  0 204 153))
    (123 (102 204 178))
    (124 (  0 153 114))
    (125 ( 76 153 133))
    (126 (  0 127  95))
    (127 ( 63 127 111))
    (128 (  0  76  57))
    (129 ( 38  76  66))
    (130 (  0 255 255))
    (131 (127 255 255))
    (132 (  0 204 204))
    (133 (102 204 204))
    (134 (  0 153 153))
    (135 ( 76 153 153))
    (136 (  0 127 127))
    (137 ( 63 127 127))
    (138 (  0  76  76))
    (139 ( 38  76  76))
    (140 (  0 191 255))
    (141 (127 223 255))
    (142 (  0 153 204))
    (143 (102 178 204))
    (144 (  0 114 153))
    (145 ( 76 133 153))
    (146 (  0  95 127))
    (147 ( 63 111 127))
    (148 (  0  57  76))
    (149 ( 38  66  76))
    (150 (  0 127 255))
    (151 (127 191 255))
    (152 (  0 102 204))
    (153 (102 153 204))
    (154 (  0  76 153))
    (155 ( 76 114 153))
    (156 (  0  63 127))
    (157 ( 63  95 127))
    (158 (  0  38 76))
    (159 ( 38  57 76))
    (160 (  0  63 255))
    (161 (127 159 255))
    (162 (  0  51 204))
    (163 (102 127 204))
    (164 (  0  38 153))
    (165 ( 76  95 153))
    (166 (  0  31 127))
    (167 ( 63  79 127))
    (168 (  0  19  76))
    (169 ( 38  47  76))
    (170 (  0   0 255))
    (171 (127 127 255))
    (172 (  0   0 204))
    (173 (102 102 204))
    (174 (  0   0 153))
    (175 ( 76  76 153))
    (176 (  0   0 127))
    (177 ( 63  63 127))
    (178 (  0   0  76))
    (179 ( 38  38  76))
    (180 ( 63   0 255))
    (181 (159 127 255))
    (182 ( 51   0 204))
    (183 (127 102 204))
    (184 ( 38   0 153))
    (185 ( 95  76 153))
    (186 ( 31   0 127))
    (187 ( 79  63 127))
    (188 ( 19   0  76))
    (189 ( 47  38  76))
    (190 (127   0 255))
    (191 (191 127 255))
    (192 (102   0 204))
    (193 (153 102 204))
    (194 ( 76   0 153))
    (195 (114  76 153))
    (196 ( 63   0 127))
    (197 ( 95  63 127))
    (198 ( 38   0  76))
    (199 ( 57  38  76))
    (200 (191   0 255))
    (201 (223 127 255))
    (202 (153   0 204))
    (203 (178 102 204))
    (204 (114   0 153))
    (205 (133  76 153))
    (206 ( 95   0 127))
    (207 (111  63 127))
    (208 ( 57   0  76))
    (209 ( 66  38  76))
    (210 (255   0 255))
    (211 (255 127 255))
    (212 (204   0 204))
    (213 (204 102 204))
    (214 (153   0 153))
    (215 (153  76 153))
    (216 (127   0 127))
    (217 (127  63 127))
    (218 ( 76   0  76))
    (219 ( 76  38  76))
    (220 (255   0 191))
    (221 (255 127 223))
    (222 (204   0 153))
    (223 (204 102 178))
    (224 (153   0 114))
    (225 (153  76 133))
    (226 (127   0  95))
    (227 (127  63 111))
    (228 ( 76   0  57))
    (229 ( 76  38  66))
    (230 (255   0 127))
    (231 (255 127 191))
    (232 (204   0 102))
    (233 (204 102 153))
    (234 (153   0  76))
    (235 (153  76 114))
    (236 (127   0  63))
    (237 (127  63  95))
    (238 ( 76   0  38))
    (239 ( 76  38  57))
    (240 (255   0  63))
    (241 (255 127 159))
    (242 (204   0  51))
    (243 (204 102 127))
    (244 (153   0  38))
    (245 (153  76  95))
    (246 (127   0  31))
    (247 (127  63  79))
    (248 ( 76   0  19))
    (249 ( 76  38  47))
    (250 ( 51  51  51))
    (251 ( 91  91  91))
    (252 (132 132 132))
    (253 (173 173 173))
    (254 (214 214 214))
    (255 (255 255 255))
    (256 (  0   0   0))))

(defun index->rgb (index)
  "@b(Описание:) функция @b(index->rgb) преобразует @b(index)
в диапазоне от 1 до 256 в представление rgb.

 @b(Пример использования:) @begin[lang=lisp](code)
 (index->rgb 0) => NIL 
 (index->rgb 1) => (255 0   0)
 (index->rgb 2) => (255 255 0)
 (index->rgb 4) => (0   255 255)
 (index->rgb 7) => (255 255 255)
 (index->rgb 250) => (51 51 51)
 (index->rgb 253) => (173 173 173)
 (index->rgb 256) => NIL
@end(code)
"
  (cadr (assoc index +index->rgb+)))

(defun rgb-to-index (rgb)
  "@b(Описание:) функция @b(rgb-to-index) преобразует цвет в
представлении rgb в индекс системы AutoCad.

 @b(Пример использования:) @begin[lang=lisp](code)
 (rgb-to-index '(256 0 0))    => 1 
 (rgb-to-index '(0 256 0))    => 3
 (rgb-to-index '(0 0 256))    => 5
 (rgb-to-index '(56  56  56)) => 250 
 (rgb-to-index '(114 208 47))
 #+nil
 (dotimes (i 50)  (let ((r (random 255))	(g (random 255)) (b (random 255)))
		   (format t \"(= ~A (rgb-2-ac-ci '~S))~%\"
			   (rgb-to-index (list r g b ))
			   (list r g b))))

@end(code)
"
  (assert (and (consp rgb) (= (length rgb) 3)))
  (caadar  (sort (mapcar #'(lambda (el)
			     (let ((r  (- (first (cadr el)) (first  rgb)))
				   (g (- (second (cadr el)) (second rgb)))
				   (b (- (third  (cadr el)) (third  rgb))))
			       (list (+ (* r r) (* g g) (* b b)) el)))
			 +index->rgb+)
		 #'<
		 :key #'(lambda (el)(first el)))))


(defun rgb-to-true (rgb)
  "
 @b(Пример использования:)
@begin[lang=lisp](code)
   (rgb-to-true '(114 208 47))   7524399
@end(code)
"
  (+ (* (first rgb) 256 256) (* (second rgb) 256) (*  (third rgb))))

;;; (true->rgb  -1023449293)

(defun true->rgb (truecolor)
  "@b(Описание:) функция @b(true->rgb) выполяет преобразование цвета,
  представленного в 32-битном выражении EntityColor список трех целых
  RGB.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (true->rgb *byblock*)   => '(0 0 0)
 (true->rgb *bylayer*)   => '(0 0 0)
 (true->rgb -1032662993) => '(114 208 47)
 (true->rgb     7524399) => '(114 208 47)

 (true->rgb -7524399)    => '(141 47 209)
@end(code)
"
  (let* ((rg-b (multiple-value-list (floor  truecolor 256)))
	 (b    (+ 256 -256 (second rg-b)))
	 (r-g  (multiple-value-list (floor (first rg-b) 256)))
	 (g    (+ 256 -256 (second r-g)))
	 (r-   (multiple-value-list (floor (first r-g) 256)))
	 (r    (+ 256 -256 (second r-))))
    (list r g b )))

(defun rgb (rgb)
  "@b(Описание:) функция @b(rgb) 

 @b(Пример использования:)
@begin[lang=lisp](code)
 (rgb '(230 200 200)) => (254 15124680)
@end(code)
"
  (rgb-to-true rgb))

(defun index (index)
  "@b(Описание:) функция @b(index)

 @b(Пример использования:)
@begin[lang=lisp](code)
  (index 1)    => 16711680 (24 bits, #xFF0000)
  (index 255) 16777215 (24 bits, #xFFFFFF) 
@end(code)
"
  (rgb-to-true (index->rgb index)))

(defun rgb->entity (rgb)
  "@b(Описание:) функция @b(rgb->entity)
"
  (+ (* 65536 (first rgb))
     (* 256 (second rgb))
     (third rgb)
     *byentity*))

(defun index->entity (index)
  "@b(Описание:) функция @b(index->entity)

 @b(Пример использования:)
@begin[lang=lisp](code)
 (index->entity   1) => -1023410175
 (index->entity   4) => -1023410172
 (index->entity   7) => -1023410169
 (index->entity 255) => -1023409921
@end(code)"
  (+ index *byindex*))

(defun entity->index (entity-color)
  "@b(Описание:) функция @b(entity->index)

 @b(Пример использования:)
@begin[lang=lisp](code)
 (entity->index -1023410175) => 1 
 (entity->index -1023410172) => 4 
 (entity->index -1023410169) => 7
 (entity->index -1023409921) => 255
@end(code)
"
  (- entity-color  *byindex*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <i-acad-ac-cm-color> ()
  ((entity-color
    :accessor entity-color
    :initarg :entity-color
    :initform *bylayer*
    :documentation
    "Код 62 и 420"))
  (:documentation
   "; Blue (RO) = 0
; BookName (RO) = \"\"
; ColorIndex = 18
; ColorMethod = 194
; ColorName (RO) = \"\"
; EntityColor = -1040187392
; Green (RO) = 0
; Red (RO) = 0

(setf (entity-color *color*) -1023409921)
(setf (entity-color *color*) -1023410175)

(red *color*)

(setf (entity-color *color*) (rgb-to-entitycolor '(105 110 112)))

(index->rgb 1)
(index->rgb 1)

(red *color*)

#+nil (
       IAcadAcCmColor (New)
       EntityColor - Property
       ColorName - Property
       BookName - Property
       Red - Property
       Blue - Property
       Green - Property
       ColorMethod - Property
       ColorIndex - Property
       SetColorBookColor - Method
       SetNames - Method
       Delete - Method
       SetRGB - Method)"
   ))

(defparameter *color* (make-instance '<i-acad-ac-cm-color>))

(defmethod red ((color <i-acad-ac-cm-color>))
  (let ((ec (entity-color color)))
    (cond
      ((= ec *bylayer*) 0)
      ((= ec *byblock*) 0)
      ((<= *byindex-start* ec *byindex-end*)
       (first (index->rgb (entity->index ec))))
      ((< *byentity-start* ec *byentity-end*)
       (first (true->rgb ec))))))

(defmethod green ((color <i-acad-ac-cm-color>))
  (let ((ec (entity-color color)))
    (cond
      ((= ec *bylayer*) 0)
      ((= ec *byblock*) 0)
      ((<= *byindex-start* ec *byindex-end*)
       (second (index->rgb (entity->index ec))))
      ((< *byentity-start* ec *byentity-end*)
       (second (true->rgb ec))))))

(defmethod blue ((color <i-acad-ac-cm-color>))
  (let ((ec (entity-color color)))
    (cond
      ((= ec *bylayer*) 0)
      ((= ec *byblock*) 0)
      ((<= *byindex-start* ec *byindex-end*)
       (third (index->rgb (entity->index ec))))
      ((< *byentity-start* ec *byentity-end*)
       (third (true->rgb ec))))))


