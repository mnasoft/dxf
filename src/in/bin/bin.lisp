;;;; ./src/in/bin/bin.lisp

(defpackage #:dxf/in/bin
  (:use #:cl #:mnas-string)
  (:export read-string
           read-hex
           )
  (:export read-uint16
           read-uint32
           read-uint64
           read-uint128
           )
  (:export read-int16
           read-int32
           read-int64
           read-int128
           )
  (:export read-float
           read-double
           )
  (:export read-head
           read-pair
           )
  (:intern dxf-in-b-read-from-string
           read-dxf-code-value-b
           dxf-in-b-pair
           dxf-in-b-pairs
           dxf-in-b-split-by-sections
           )
  (:export dxf-in-b-fname
           )
  (:documentation "@b(Описание:) пакет @b(dxf/in/bin) позволяет
  преобразовать dxf-файл, сохраненный в бинарном формате в его
  посекционное представление.
 Главная функция проекта - @b(dxf-in-b-fname).
"))

(in-package #:dxf/in/bin)

(defparameter *AutoCAD-Binary-DXF-18* (format nil "~A" "AutoCAD Binary DXF"))
(defparameter *AutoCAD-Binary-DXF-22* (format nil "~A~C~C~C~C" "AutoCAD Binary DXF" #\CR #\LF #\SUB #\NUL))
(defparameter *AutoCAD-Binary-DXF-21* (format nil "~A~C~C~C" "AutoCAD Binary DXF" #\CR #\LF #\SUB))



(defun read-string (stream)
  "@b(Описание:) функция @b(read-string) возвращает строку, считывамую
 из потока @b(stream). В потоке @b(stream) строка должна храниться как
 нуль-терминированная (заканчиваться на символ #\Nul). Указатель
 чтения потока @(stream) после выполнения функции указывет на символ,
 следующий за нуль-терминатором. Нуль-терминатор в возвращаемую
 строку не попадает.

 @b(Пример использования:) 
@begin[lang=lisp](code)
 (let ((s-01 (format nil \"~A~C~C~C~C\" \"AutoCAD Binary DXF\" #\\CR #\\LF #\\SUB #\\NUL))
       (s-02 (format nil \"~A~C\" \"Строка - 02\" #\\NUL)))
   (with-open-file (dxf (concatenate 'string dxf::*dxf-path* \"in-bin.dxf\")
                        :direction :output :if-exists :supersede
                        :element-type 'unsigned-byte)
     (write-sequence (babel:string-to-octets s-01) dxf)
     (write-sequence (babel:string-to-octets s-02) dxf))
   (with-open-file (dxf (concatenate 'string dxf::*dxf-path* \"in-bin.dxf\")
     :element-type 'unsigned-byte)
   (format t \"~S~%~S\" (read-string dxf) (read-string dxf))))
@end(code)"
  (do ((bt (read-byte stream) (read-byte stream))
       (i 0 (1+ i))
       (rez nil (push bt rez)))
      ((= bt 0)
       (babel:octets-to-string
        (map '(vector (unsigned-byte 8))
             #'(lambda (el) el) (nreverse rez))))))

(defun read-hex (stream)
  (let ((str (read-string stream)))
    (if (string/= str "")
        (parse-integer str :radix 16)
        0)))

(defun read-head (stream)
  "@b(Описание:) функция @b(read-head) возвращает: 
@begin(list)
 @item(T - если поток @b(stream) является бинарным;) 
 @item(NIL - если поток @b(stream) не является
       бинарным (предположительно является текстовым);)
@end(list)
"
  (read-string))



(defun read-uint16 (stream)
  "@b(Описание:) функция @b(read-uint16) целое неотрицательное число в
 диапазоне от 0 до 2^16-1, считываемое из потока @b(stream). В потоке
 @b(stream) число хранится как двухбитное: младший бит - первый;
 старший бит - последний.

 @b(Пример использования:)
@begin[lang=lisp](code)
  (let* ((n 16)
         (i (random `,(expt 2 n))))
    (with-open-file (dxf (concatenate 'string dxf::*dxf-path* \"in-bin.dxf\")
                         :direction :output :if-exists :supersede
                         :element-type 'unsigned-byte)
      (dxf/out:write-uint16 i dxf))
    (with-open-file (dxf (concatenate 'string dxf::*dxf-path* \"in-bin.dxf\")
                         :element-type 'unsigned-byte)
      (format t \"~A = ~A~%\" i (read-uint16 dxf))))
@end(code)"

  (let ((arr dxf/b-arr:*byte-aray-2*))
    (read-sequence arr stream)
    (loop :for i :from 0 :below (length arr)
          :summing (* (expt 256 i) (svref arr i)) :into rez
          :finally (return rez))))

(defun read-uint32 (stream)
  "@b(Описание:) функция @b(read-uint32) целое неотрицательное число в
 диапазоне от 0 до 2^32-1, считываемое из потока @b(stream). В потоке
 @b(stream) число хранится как двухбитное: младший бит - первый;
 старший бит - последний."
  (let ((arr dxf/b-arr:*byte-aray-4*))
    (read-sequence arr stream)
    (loop :for i :from 0 :below (length arr)
          :summing (* (expt 256 i) (svref arr i)) :into rez
          :finally (return rez))))

(defun read-uint64 (stream)
  "@b(Описание:) функция @b(read-uint64) целое неотрицательное число в
 диапазоне от 0 до 2^64-1, считываемое из потока @b(stream). В потоке
 @b(stream) число хранится как двухбитное: младший бит - первый;
 старший бит - последний.
"
  (let ((arr dxf/b-arr:*byte-aray-8*))
    (read-sequence arr stream)
    (loop :for i :from 0 :below (length arr)
          :summing (* (expt 256 i) (svref arr i)) :into rez
          :finally (return rez))))

(defun read-uint128 (stream)
  "@b(Описание:) функция @b(read-uint128) целое неотрицательное число в
 диапазоне от 0 до 2^128-1, считываемое из потока @b(stream). В потоке
 @b(stream) число хранится как двухбитное: младший бит - первый;
 старший бит - последний.
"
  (let ((arr dxf/b-arr:*byte-aray-16*))
    (read-sequence arr stream)
    (loop :for i :from 0 :below (length arr)
          :summing (* (expt 256 i) (svref arr i)) :into rez
          :finally (return rez))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun read-int16 (stream)
  "@b(Описание:) функция @b(read-int16) 
"
  (let ((x (read-uint16 stream)))
    (if (<= `,(/ (expt 2 16) 2) x)
        (- x `,(expt 2 16))
        x)))

(defun read-int32 (stream)
  (let ((x (read-uint32 stream)))
    (if (<= `,(/ (expt 2 32) 2) x)
        (- x `,(expt 2 32))
        x)))

(defun read-int64 (stream)
  (let ((x (read-uint64 stream)))
    (if (<= `,(/ (expt 2 64) 2) x)
        (- x `,(expt 2 64))
        x)))

(defun read-int128 (stream)
  (let ((x (read-uint128 stream)))
    (if (<= `,(/ (expt 2 128) 2) x)
        (- x `,(expt 2 128))
        x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun read-float (stream)
  "@b(Описание:) функция @b(read-double) осуществляет считывание
  вещественного числа длиной 8 байт из потока @b(stream).

 @b(Пример использования:)
@begin[lang=lisp](code)
  (let ((x 646.987654e0)
        (fn (concatenate 'string dxf::*dxf-path* \"in-bin.dxf\")))
    (with-open-file (dxf fn
                         :direction :output :if-exists :supersede
                         :element-type 'unsigned-byte)
      (dxf/out:write-float x dxf))
    (with-open-file (dxf fn :element-type 'unsigned-byte)
      (format t \"~A = ~A~%\" x (read-float dxf))))
@end(code)
"
  (ieee-floats:decode-float32 (read-uint32 stream)))

(defun read-double (stream)
  "@b(Описание:) функция @b(read-double) осуществляет считывание
  вещественного числа длиной 8 байт из потока @b(stream).

 @b(Пример использования:)
@begin[lang=lisp](code)
  (let ((x 646.987654d0)
        (fn (concatenate 'string dxf::*dxf-path* \"in-bin.dxf\")))
    (with-open-file (dxf fn
                         :direction :output :if-exists :supersede
                         :element-type 'unsigned-byte)
      (dxf/out:write-double x dxf))
    (with-open-file (dxf fn :element-type 'unsigned-byte)
      (format t \"~A = ~A~%\" x (read-double dxf))))
@end(code)
"
  (ieee-floats:decode-float64 (read-uint64 stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun read-pair (stream)
  "@b(Описание:) функция @b(read-pair) выполняет считывание пары ключ значение.
"
  (let ((code (read-uint16 stream)))
    (cond
      ((or (<= 0 code 4)
	   (<= 6 code 9))  (read-string stream)) ;;;; String (with the introduction of extended symbol names in AutoCAD 2000, the 255-character limit has been increased to 2049 single-byte characters not including the newline at the end of the line)
      ((=  5  code)        (read-hex    stream))
      ((<= 10 code 19)     (read-double stream)) ;;;; Double precision 3D point value
      ((<= 20 code 39)     (read-double stream)) 
      ((<= 40 code 59)     (read-double stream)) ;;;; Double-precision floating-point value
      ((<= 60 code 79)     (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 90 code 99)     (read-int32  stream)) ;;;; 32-bit integer value
      ((<= 100 code 102)   (read-string stream)) ;;;; String (255-character maximum; less for Unicode strings) 
      ((=  105 code)       (read-hex    stream)) ;;;; String representing hexadecimal (hex) handle value
      ((<= 110 code 119)   (read-double stream)) ;;;; Double precision floating-point value
      ((<= 120 code 129)   (read-double stream)) ;;;; Double precision floating-point value
      ((<= 130 code 139)   (read-double stream)) ;;;; Double precision floating-point value
      ((<= 140 code 149)   (read-double stream)) ;;;; Double precision scalar floating-point value
      ((<= 160 code 169)   (read-int64  stream)) ;;;; 64-bit integer value
      ((<= 170 code 179)   (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 210 code 239)   (read-double stream)) ;;;; Double-precision floating-point value
      ((<= 270 code 279)   (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 280 code 289)   (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 290 code 299)   (read-int16  stream)) ;;;; Boolean flag value (0 - off 1 - on)
      ((<= 300 code 309)   (read-string stream)) ;;;; Arbitrary text string
      ((<= 310 code 319)   (read-string stream)) ;;;; String representing hex value of b chunk
      ((<= 320 code 329)   (read-hex    stream)) ;;;; String representing hex handle value
      ((<= 330 code 369)   (read-hex    stream)) ;;;; String representing hex object IDs
      ((<= 370 code 379)   (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 380 code 389)   (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 390 code 399)   (read-string stream)) ;;;; String representing hex handle value
      ((<= 400 code 409)   (read-int16  stream)) ;;;; 16-bit integer value
      ((<= 410 code 419)   (read-string stream)) ;;;; String
      ((<= 420 code 429)   (read-int32  stream)) ;;;; 32-bit integer value
      ((<= 430 code 439)   (read-string stream)) ;;;; String
      ((<= 440 code 449)   (read-int32  stream)) ;;;; 32-bit integer value
      ((<= 450 code 459)   (read-int64  stream)) ;;;; Long
      ((<= 460 code 469)   (read-double stream)) ;;;; Double-precision floating-point value
      ((<= 470 code 479)   (read-string stream)) ;;;; String
      ((<= 480 code 481)   (read-string stream)) ;;;; String representing hex handle value
      ((= 999 code)        (read-string stream)) ;;;; string строка комментария
      ((<= 1000 code 1009) (read-string stream)) ;;;; String (same limits as indicated with 0-9 code range)
      ((<= 1010 code 1059) (read-double stream)) ;;;; Double-precision floating-point value
      ((<= 1060 code 1070) (read-int16  stream)) ;;;; 16-bit integer value
      ((= 1071 code)       (read-int32  stream)) ;;;; 32-bit integer value
      )))
