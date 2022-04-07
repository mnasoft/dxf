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
  (let ((sections (dxf/in/txt:read-file fname-dxf-from)))
    (with-open-file (dxf fname-dxf-to :direction :output :if-exists :supersede)
      (dxf/out:txt-sections sections dxf))))

(defun make-path-relative-to-system (system namestring)
  "@b(Описание:) функция @b(make-path-relative-to-system) возвращает
  строку представляющую из себя относительный путь @b(namestring) в
  пути исходников системы @b(system).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (make-path-relative-to-system :dxf \"dxf/2018.dxf\")
 => \"D:/PRG/msys64/home/namatv/quicklisp/local-projects/acad/dxf/dxf/2018.dxf\"
@end(code)"
  (concatenate 'string
               (namestring (asdf:system-source-directory system))
               namestring))

(def-test test-1 ()
  (is-true
   (equalp t
           (let ((dxf-fn-from (make-path-relative-to-system :dxf "dxf/2018.dxf"))
                 (dxf-fn-to   (make-path-relative-to-system :dxf "dxf/txt.dxf")))
             (copy-dxf-txt-by-sections dxf-fn-from dxf-fn-to)
             (dxf-txt-has-same-pairs dxf-fn-from dxf-fn-to))))
  (is-true
   (equalp t
           (let ((dxf-fn-from (make-path-relative-to-system :dxf "/dxf/Line_01.dxf"))
                 (dxf-fn-to   (make-path-relative-to-system :dxf "dxf/txt.dxf")))
             (copy-dxf-txt-by-sections dxf-fn-from dxf-fn-to)
             (dxf-txt-has-same-pairs dxf-fn-from dxf-fn-to)))))

