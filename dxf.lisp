;;;; dxf.lisp

(in-package #:dxf)

(defparameter *dxf-header* (format nil "AutoCAD Binary DXF~% "))

(defparameter *section* "SECTION")

(defparameter *endsec* "ENDSEC")

(defparameter *eof* "EOF")

(defparameter *entities* "ENTITIES")

(defparameter *line* "LINE")

(defun dxf-out-b-header (stream)
  (write-sequence (babel:string-to-octets *dxf-header*) stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dxf-out-b-point-3d (code point-3d stream)
  (dxf-out-b-double (+ 0 code) (svref point-3d 0) stream)
  (dxf-out-b-double (+ 10 code) (svref point-3d 1) stream)
  (dxf-out-b-double (+ 20 code) (svref point-3d 2) stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *dxf-code-overal-length* 3 "Минмальная длина строки для кода dxf")

(defun dxf-code (code &optional (overal-length *dxf-code-overal-length*))
  "Пример использования
;;;;(dxf-code 4)"
  (string-add-prefix (format nil "~A" code) :overal-length overal-length))

