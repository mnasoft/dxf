;;;; ./src/b-arr/b-arr.lisp

(defpackage :dxf/b-arr
  (:use #:cl)
  (:export *byte-aray-2*
           *byte-aray-4*
           *byte-aray-8*
           *byte-aray-16*
           )
  (:export put-u2
           put-u4
           put-u8
           put-u16)
  (:documentation 
   "@b(Описание:) пакет @b(dxf/b-arr) определяет низкоуровневые
   функции чтения записи dxf - файла AutoCAD."))

(in-package :dxf/b-arr)
  
(defparameter *byte-aray-2* (make-array 2 :element-type 'unsigned-byte))

(defparameter *byte-aray-4* (make-array 4 :element-type 'unsigned-byte))

(defparameter *byte-aray-8* (make-array 8 :element-type 'unsigned-byte))

(defparameter *byte-aray-16* (make-array 16 :element-type 'unsigned-byte))

(defun put-u2 (int)
  (setf (aref *byte-aray-2* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-2* #x1) (ldb (byte 8 #x08) int)))
 
(defun put-u4 (int)
  (setf (aref *byte-aray-4* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-4* #x1) (ldb (byte 8 #x08) int))
  (setf (aref *byte-aray-4* #x2) (ldb (byte 8 #x10) int))
  (setf (aref *byte-aray-4* #x3) (ldb (byte 8 #x18) int)))

(defun put-u8 (int)
  (setf (aref *byte-aray-8* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-8* #x1) (ldb (byte 8 #x08) int))
  (setf (aref *byte-aray-8* #x2) (ldb (byte 8 #x10) int))
  (setf (aref *byte-aray-8* #x3) (ldb (byte 8 #x18) int))
  (setf (aref *byte-aray-8* #x4) (ldb (byte 8 #x20) int))
  (setf (aref *byte-aray-8* #x5) (ldb (byte 8 #x28) int))
  (setf (aref *byte-aray-8* #x6) (ldb (byte 8 #x30) int))
  (setf (aref *byte-aray-8* #x7) (ldb (byte 8 #x38) int)))

(defun put-u16 (int)
  (setf (aref *byte-aray-16* #x0) (ldb (byte 8 #x00) int))
  (setf (aref *byte-aray-16* #x1) (ldb (byte 8 #x08) int))
  (setf (aref *byte-aray-16* #x2) (ldb (byte 8 #x10) int))
  (setf (aref *byte-aray-16* #x3) (ldb (byte 8 #x18) int))
  (setf (aref *byte-aray-16* #x4) (ldb (byte 8 #x20) int))
  (setf (aref *byte-aray-16* #x5) (ldb (byte 8 #x28) int))
  (setf (aref *byte-aray-16* #x6) (ldb (byte 8 #x30) int))
  (setf (aref *byte-aray-16* #x7) (ldb (byte 8 #x38) int))
  (setf (aref *byte-aray-16* #x8) (ldb (byte 8 #x40) int))
  (setf (aref *byte-aray-16* #x9) (ldb (byte 8 #x48) int))
  (setf (aref *byte-aray-16* #xa) (ldb (byte 8 #x50) int))
  (setf (aref *byte-aray-16* #xb) (ldb (byte 8 #x58) int))
  (setf (aref *byte-aray-16* #xc) (ldb (byte 8 #x60) int))
  (setf (aref *byte-aray-16* #xd) (ldb (byte 8 #x68) int))
  (setf (aref *byte-aray-16* #xe) (ldb (byte 8 #x70) int))
  (setf (aref *byte-aray-16* #xf) (ldb (byte 8 #x78) int)))

;;; "dxf" goes here. Hacks and glory await!
