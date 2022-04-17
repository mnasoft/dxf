;;;; ./src/const/const.lisp

(defpackage #:dxf/const
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
  (format nil "~A" "AutoCAD Binary DXF"))

(defparameter *AutoCAD-Binary-DXF-21*
  (format nil "~A~C~C~C" *AutoCAD-Binary-DXF-18* #\CR #\LF #\SUB))

(defparameter *AutoCAD-Binary-DXF-22*
  (format nil "~A~C~C~C~C" *AutoCAD-Binary-DXF-18* #\CR #\LF #\SUB #\NUL))

