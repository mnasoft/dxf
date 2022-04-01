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
  "@b(Описание:) функция @b(read-string) выполняет считывание строки
  из потока @b(stream).

 @b(Пример использования:)
@begin[lang=lisp](code)

@end(code)"
  )
