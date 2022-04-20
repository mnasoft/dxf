;;;; ./src/utils/utils.lisp

(defpackage #:dxf/utils
  (:use #:cl)
  (:export make-slot))

(in-package :dxf/utils)

(defun make-slot (el)
  "Вспмогательная функция для формирования слотов"
  (list  el
	 :accessor el
	 :initarg (read-from-string (concatenate 'string ":"(symbol-name el)))
	 :initform nil
	 :documentation (symbol-name el)))
