;;;; ./src/const/const.lisp

(defpackage :dxf/const
  (:use #:cl)
  (:export *AutoCAD-Binary-DXF-18*
           *AutoCAD-Binary-DXF-21*
           *AutoCAD-Binary-DXF-22*
           )
  (:documentation
   "@b(Описание:) пакет @b(dxf/const) определяет константы для операций
 чтениня и записи.
  "))

(in-package :dxf/const)

(defparameter *AutoCAD-Binary-DXF-18*
  (format nil "~A" "AutoCAD Binary DXF")
  "@b(Описание:) параметр @b(*AutoCAD-Binary-DXF-18*) определяет
   строку-маркер для идентификации файла как двоичного dxf-файла.
   Строка-маркер не содержит символов перевода строки.")

(defparameter *AutoCAD-Binary-DXF-21*
  (format nil "~A~C~C~C" *AutoCAD-Binary-DXF-18* #\CR #\LF #\SUB)
  "@b(Описание:) параметр @b(*AutoCAD-Binary-DXF-21*) определяет
   строку-маркер для идентификации файла как двоичного dxf-файла.
   Строка-маркер не содержит нуль-терминатора.")

(defparameter *AutoCAD-Binary-DXF-22*
  (format nil "~A~C~C~C~C" *AutoCAD-Binary-DXF-18* #\CR #\LF #\SUB #\NUL)
  "@b(Описание:) параметр @b(*AutoCAD-Binary-DXF-21*) определяет
   строку-маркер для идентификации файла как двоичного dxf-файла.")

