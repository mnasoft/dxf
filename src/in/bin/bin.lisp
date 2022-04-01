;;;; ./src/in/bin/bin.lisp

(defpackage #:dxf/in/bin
  (:use #:cl #:mnas-string)
  (:intern read-string
           read-int16
           read-int32
           read-int64
           read-hex
           read-double)
  (:intern
           dxf-in-b-read-from-string
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
    ((= bt 0) (babel:octets-to-string
               (map '(vector (unsigned-byte 8))
                    #'(lambda (el) el) (nreverse rez))))))
