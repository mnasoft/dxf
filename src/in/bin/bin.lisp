;;;; ./src/in/bin/bin.lisp

(defpackage #:dxf/in/bin
  (:use #:cl #:mnas-string)
  (:export read-string
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
  (:export read-hex
           read-float
           read-double)
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
