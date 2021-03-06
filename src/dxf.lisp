;;;; dxf.lisp

(in-package #:dxf)

(defparameter *dxf-header* (format nil "AutoCAD Binary DXF~% "))

(defun dxf-out-t-header (stream) stream)

(defun dxf-out-b-header (stream)
  (write-sequence (babel:string-to-octets *dxf-header*) stream))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *dxf-code-overal-length* 3 "Минмальная длина строки для кода dxf")

(defun dxf-code (code &optional (overal-length *dxf-code-overal-length*))
  "Пример использования
;;;;(dxf-code 4)"
  (string-add-prefix (format nil "~A" code) :overal-length overal-length))

