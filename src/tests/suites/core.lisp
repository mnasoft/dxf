;;;; ./src/tests/suites/core.lisp

(in-package :dxf/tests)

(def-suite core
  :description "Мастер-набор всех тестов системы dxf/core."
  :in all)

(in-suite core)

(defun dxf-txt-has-same-pairs (file-name-dxf-txt-1 file-name-dxf-txt-2)
  "@b(Описание:) функция @b(dxf-txt-has-same-pairs) возвращает T,
 если при считывании текстовые файлы @b(file-name-dxf-txt-1)
 @b(file-name-dxf-txt-2) в формате dxf имеют одинаковые
 пары (код-значение).
"
  (with-open-file (fl-1 file-name-dxf-txt-1)
    (with-open-file (fl-2 file-name-dxf-txt-2)
      (do ((p-1 (dxf/in/txt:read-pair fl-1) (dxf/in/txt:read-pair fl-1))
           (p-2 (dxf/in/txt:read-pair fl-2) (dxf/in/txt:read-pair fl-2))
           (rez nil))
          ((or (equal p-1 `(0 ,dxf/sec:*eof*)) (equal p-2 `(0 ,dxf/sec:*eof*)))
           (if (null rez) t rez))
        (unless (equal p-1 p-2)
          (push (list p-1 p-2) rez))))))

(defun copy-dxf-txt-by-sections (fname-dxf-from fname-dxf-to)
  "@b(Описание:) функция @b(copy-dxf-txt-by-sections) выполняет
  посекционное копирование dxf-файла с именем fname-dxf-from в
  текстовом формате в файл с имеем fname-dxf-to."
  (let ((sections (dxf/in/txt:read-file fname-dxf-from)))
    (with-open-file (dxf fname-dxf-to :direction :output :if-exists :supersede)
      (dxf/out/txt:sections sections dxf))))

(def-test section-read-write-in-txt-mode ()
  "@b(Описание:) тест @b(test-1) проверка корректности посекционного
  копирования dxf-файлов в текстовом режиме. Для каждого тестируемого
  исходного файла с именем @b(dxf-fn-from) выполняется:
@begin(list)
 @item(копирование его в файл c именем @b(dxf-fn-to);)
 @item(проверка количества строк файлов @b(dxf-fn-to) и @b(dxf-fn-from);)
 @item(проверка пар ключ-значение для файлов @b(dxf-fn-to) и @b(dxf-fn-from).)
@end(list)
"
  (labels
      ((txt (from)
         (let ((dxf-fn-from (dxf/utils:make-path-relative-to-system :dxf from))
               (dxf-fn-to   (dxf/utils:make-path-relative-to-system :dxf "dxf/tests/txt.dxf")))
           (copy-dxf-txt-by-sections dxf-fn-from dxf-fn-to)
           (is-true (= (length (uiop:read-file-lines dxf-fn-from))
                       (length (uiop:read-file-lines dxf-fn-to  ))))
           (is-true (equalp t (dxf-txt-has-same-pairs dxf-fn-from dxf-fn-to))))))
    (loop :for i :in '("dxf/txt/2018.dxf"
                       "dxf/txt/Line_01.dxf"
                       "dxf/metric/AutoCAD-2000-LT-2000-metric.dxf"
                       "dxf/metric/AutoCAD-2004-LT-2004-metric.dxf"
                       "dxf/metric/AutoCAD-2007-LT-2007-metric.dxf"
                       "dxf/metric/AutoCAD-2010-LT-2010-metric.dxf"
                       "dxf/metric/AutoCAD-2013-LT-2013-metric.dxf"
                       "dxf/metric/AutoCAD-2018-metric.dxf"
                       "dxf/metric/AutoCAD-R12-LT-2-metric.dxf")
          :do
             (txt i))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun copy-dxf-bin-by-sections (fname-dxf-from fname-dxf-to)
  "@b(Описание:) функция @b(copy-dxf-txt-by-sections) выполняет
  посекционное копирование dxf-файла с именем fname-dxf-from в
  текстовом формате в файл с имеем fname-dxf-to."
  (let ((sections (dxf/in/bin:read-file fname-dxf-from)))
    (with-open-file (dxf fname-dxf-to :direction :output :if-exists :supersede :element-type 'unsigned-byte )
      (dxf/out/bin:sections sections dxf))))

(def-test section-read-write-in-bin-mode ()
  "@b(Описание:) тест @b(section-read-write-in-bin-mode) проверка
  корректности посекционного копирования dxf-файлов в бинарном
  режиме. Для каждого тестируемого исходного файла с именем
  @b(dxf-fn-from) выполняется:

@begin(list)
 @item(копирование его в файл c именем @b(dxf-fn-to);)
 @item(проверка пар ключ-значение для файлов @b(dxf-fn-to) и @b(dxf-fn-from).)
@end(list)
"
  (labels
      ((txt (from)
         (let ((dxf-fn-from (dxf/utils:make-path-relative-to-system :dxf from))
               (dxf-fn-to   (dxf/utils:make-path-relative-to-system :dxf "dxf/tests/bin.dxf")))
           (copy-dxf-bin-by-sections dxf-fn-from dxf-fn-to)
           (is-true (equalp (dxf/in/bin:read-file dxf-fn-from)
                            (dxf/in/bin:read-file dxf-fn-to))))))
    (loop :for i :in '("dxf/bin/2018.dxf"
                       "dxf/bin/Line_01.dxf")
          :do
             (txt i))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Проверка
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#+nil
(progn
  (defparameter rez-or nil)
  (defparameter rez-cp nil)
  (defparameter bin-or
    (open (dxf/utils:make-path-relative-to-system :dxf "dxf/bin/2018.dxf")
          :element-type 'unsigned-byte))
  (defparameter bin-cp
    (open (dxf/utils:make-path-relative-to-system :dxf "dxf/tests/bin.dxf")
          :element-type 'unsigned-byte))
  (dxf/in/bin:read-head bin-or)
  (dxf/in/bin:read-head bin-cp)
  (loop :for i :from 0 :below 13210/2
        :do
           (progn
             (push (dxf/in/bin:read-pair bin-or) rez-or)
             (push (dxf/in/bin:read-pair bin-cp) rez-cp)))

  (progn (close bin-or) (close bin-cp))
  (equalp rez-or rez-cp))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#+nil(
      (defparameter *sections*
        (dxf/in/bin:read-file
         (dxf/utils:make-path-relative-to-system :dxf "dxf/bin/2018.dxf")))

      (defparameter *sections-1*
        (dxf/in/bin:read-file-pairs
         (dxf/utils:make-path-relative-to-system :dxf "dxf/bin/2018.dxf")))

      (equal (dxf/split:between *sections-1*) *sections*)

      (read-pairs stream)

      (dxf:split-entities *sections*)

      (dxf::split-blocks *sections*)
      )

(last (dxf/in/bin:read-file-pairs
      (dxf/utils:make-path-relative-to-system :dxf "dxf/bin/2018.dxf")))
