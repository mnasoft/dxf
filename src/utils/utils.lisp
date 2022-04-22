;;;; ./src/utils/utils.lisp

(defpackage #:dxf/utils
  (:use #:cl)
  (:export make-slot
           )
  (:export make-path-relative-to-system
           ))

(in-package :dxf/utils)

(defun make-slot (el)
  "@b(Описание:) функция @b(make-slot) это вспомогательная функция для
формирования слотов."
  (list  el
	 :accessor el
	 :initarg (read-from-string (concatenate 'string ":"(symbol-name el)))
	 :initform nil
	 :documentation (symbol-name el)))

(defun make-path-relative-to-system (system namestring)
  "@b(Описание:) функция @b(make-path-relative-to-system) возвращает
строку представляющую из себя относительный путь @b(namestring) в пути
исходников системы @b(system).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (make-path-relative-to-system :dxf \"dxf/txt/2018.dxf\")
 => \"D:/PRG/msys64/home/namatv/quicklisp/local-projects/acad/dxf/dxf/txt/2018.dxf\"
@end(code)"
  (concatenate 'string
               (namestring (asdf:system-source-directory system))
               namestring))
