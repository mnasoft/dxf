;;;; dxf.lisp

(in-package #:dxf)

(defparameter *dxf-header* (format nil "AutoCAD Binary DXF~% "))

(defun dxf-out-t-header (stream) stream)

(defun dxf-out-b-header (stream)
  (write-sequence (babel:string-to-octets *dxf-header*) stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *dxf-code-overal-length* 3
  "@b(Описание:) переменная @b(dxf-code-overal-length) задает
минримальую ширину поля для вывода dxf кода в текстовом режиме.")

(defun dxf-code (code &optional (overal-length *dxf-code-overal-length*))
  "@b(Описание:) функция @b(dxf-code) возвращает строку,
  представляющую @b(code) dxf. @b(Code) печатается смещенным вправо с
  пробельными заполнителяи. Параметр @b(overal-length) задает
  минимальную ширину поля вывода.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (dxf-code 4) -> \"  4\"
 (dxf-code 123456) -> \"123456\"
@end(code)"
  (format nil (format nil "~~~A,' d" overal-length) code))


