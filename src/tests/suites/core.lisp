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
          ((or (equal p-1 '(0 "EOF")) (equal p-2 '(0 "EOF")))
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

(defun make-path-relative-to-system (system namestring)
  "@b(Описание:) функция @b(make-path-relative-to-system) возвращает
  строку представляющую из себя относительный путь @b(namestring) в
  пути исходников системы @b(system).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (make-path-relative-to-system :dxf \"dxf/txt/2018.dxf\")
 => \"D:/PRG/msys64/home/namatv/quicklisp/local-projects/acad/dxf/dxf/txt/2018.dxf\"
@end(code)"
  (concatenate 'string
               (namestring (asdf:system-source-directory system))
               namestring))

(def-test test-1 ()
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
         (let ((dxf-fn-from (make-path-relative-to-system :dxf from))
               (dxf-fn-to   (make-path-relative-to-system :dxf "dxf/tests/txt.dxf")))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;#+nil
(progn 
  (defparameter bin
    (open (make-path-relative-to-system :dxf "dxf/bin/2018.dxf")
          :element-type 'unsigned-byte))
  (defparameter txt
    (open (make-path-relative-to-system :dxf "dxf/txt/2018.dxf")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
  (dxf/in/bin:read-head bin)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defparameter o-bin
    (open (make-path-relative-to-system :dxf "dxf/bin-2018.txt")
          :direction :output :if-exists :supersede))
  (defparameter o-txt
    (open (make-path-relative-to-system :dxf "dxf/txt-2018.txt")
          :direction :output :if-exists :supersede))
  (loop :for i :from 0 :below 13210/2
        :do
           (format o-bin "~S~%" (dxf/in/bin:read-pair bin))
           (format o-txt "~S~%" (dxf/in/txt:read-pair txt)))
  (progn (close bin)   (close txt)
       (close o-bin) (close o-txt)
       nil))

;;;;

(progn
  (defparameter bin-in
    (open (make-path-relative-to-system :dxf "dxf/bin/2018.dxf")
          :element-type 'unsigned-byte))
  (defparameter bin-out
    (open (make-path-relative-to-system :dxf "dxf/tests/bin.dxf")
          :direction :output :if-exists :supersede :element-type 'unsigned-byte))
  (loop :for i :from 0 :below 13210/2
        :do
           (let ((pair (dxf/in/bin:read-pair bin-in)))
             (dxf/out/bin:pair (first pair) (second pair) bin-out))))

(progn (close bin-in) (close bin-out))
