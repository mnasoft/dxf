;;;; ./src/in/txt/txt.lisp

(defpackage #:dxf/in/txt
  (:use #:cl #:mnas-string)
  (:intern read-from-string-string
           read-from-string-int16
           read-from-string-int32
           read-from-string-int64
           read-from-string-hex
           read-from-string-double
           dxf-in-t-read-from-string
           read-dxf-code-value-t
           dxf-in-t-pair
           dxf-in-t-pairs
           dxf-in-t-split-by-sections
           )
  (:export dxf-in-t-fname
           )
  (:documentation "@b(Описание:) пакет @b(dxf/in/txt) позволяет
  преобразовать dxf-файл, сохраненный в текстовом формате в его
  посекционное представление.
 Главная функция проекта - @b(dxf-in-t-fname).
"))

(in-package #:dxf/in/txt)

(defun read-from-string-string (str)
  str)

(defun read-from-string-int16 (str)
  (parse-integer str))

(defun read-from-string-int32 (str)
  (parse-integer str))

(defun read-from-string-int64 (str)
  (parse-integer str))

(defun read-from-string-hex   (str)
  (if (string/= str "")
      (parse-integer str :radix 16)
      0))

(defun read-from-string-hex-string (str)
  str)

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
    ((<= 310 code 319)   (read-from-string-hex-string str)) ;;;; String representing hex value of b chunk
    ((<= 320 code 329)   (read-from-string-hex str)) ;;;; String representing hex handle value
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
    (do ((pair (dxf-in-t-pair stream)
               (dxf-in-t-pair stream)))
	((and (= 0 (first pair ))
              (string= (second pair) "EOF"))
         (nreverse pairs-lst))
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

(defun dxf-in-t-fname (fname)
  "@b(Описание:) функция @b(dxf-in-t-fname) выполняет попытку
 считывания текстового dxf-файла в формате:
@begin(list)
 @item(версий с 2000 по 2004 [:external-format :cp1251])
 @item(версий с 2007 по 2018 [:external-format :utf8].)
@end(list)

 Возвращает посекционное представление dxf-файда:
 список секций, каждый подсписок, которого содержит
 пары - код и значение.

 @b(Пример использования:)
@begin[lang=lisp](code)

 (dxf-in-t-fname 
   \"~/quicklisp/local-projects/acad/dxf/dxf/Drawing-sty.dxf\")
 => (((2 \"HEADER\") (9 \"$ACADVER\") (1 \"AC1027\") (9 \"$ACADMAINTVER\") (70 20) ...)
     ((2 \"CLASSES\") (0 \"CLASS\") (1 \"ACDBDICTIONARYWDFLT\") ...)
     ((2 \"TABLES\") (0 \"TABLE\") (2 \"VPORT\") (5 8) (330 0) (100 \"AcDbSymbolTable\") ...)
     ((2 \"BLOCKS\") (0 \"BLOCK\") (5 32) (330 31) (100 \"AcDbEntity\") (8 \"0\") ...)
     ((2 \"ENTITIES\") (0 \"LINE\") (5 628) (330 31) (100 \"AcDbEntity\") (8 \"0\") ...)
     ((2 \"OBJECTS\") (0 \"DICTIONARY\") (5 12) (330 0) (100 \"AcDbDictionary\") (281 1) ...)
     ((2 \"ACDSDATA\") (70 2) (71 7) (0 \"ACDSSCHEMA\") (90 0) ...))
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
