;;;; ./src/utils/utils.lisp

(defpackage #:dxf/utils
  (:use #:cl)
  (:export make-slot
           )
  (:export make-path-relative-to-system
           )
  (:export dxf-txt-has-same-pairs
           copy-dxf-txt-by-sections
           copy-dxf-bin-by-sections
           )
  (:export split-from->to)
  (:export make-class-name
           make-proprety-name
           make-method-name
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; for dxf/tests
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(defun copy-dxf-bin-by-sections (fname-dxf-from fname-dxf-to)
  "@b(Описание:) функция @b(copy-dxf-txt-by-sections) выполняет
  посекционное копирование dxf-файла с именем fname-dxf-from в
  текстовом формате в файл с имеем fname-dxf-to."
  (let ((sections (dxf/in/bin:read-file fname-dxf-from)))
    (with-open-file (dxf fname-dxf-to :direction :output :if-exists :supersede :element-type 'unsigned-byte )
      (dxf/out/bin:sections sections dxf))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-from->to (string &key
                                (separator "-")
                                (from #'(lambda (ch) (lower-case-p ch)))
                                (to   #'(lambda (ch) (or (upper-case-p ch)
                                                         (digit-char-p ch)))))
  "@b(Описание:) функция @b(split-by-upper-case-start) возвращает
  строку, основанную на строке @b(string), выполняя разделение строки
  сепараторами @b(separator). Разделение на подстроки происходит по
  месту контакта символов для которых предикат:

@begin(list)
 @item(@b(from) возвращает t (слева);)
 @item(@b(to) возвращает t (справа).)
@end(list).

 @b(Пример использования:)
@begin[lang=lisp](code)
 (split-from->to \"AcadMInsertBlock\") -> \"Acad-MInsert-Block\"
@end(code)
"
  (let ((rez-str "")
        (sub-str "")
        (ch      nil)
        (may-cut nil))
    (loop :for i :from 0 :below (length string) :do
      (progn
        (setf ch (char string i))
        (cond
          ((and may-cut
                (funcall to ch))
           (setf may-cut nil)
           (setf rez-str (concatenate 'string rez-str sub-str separator))
           (setf sub-str ""))
          ((funcall from ch)
           (setf may-cut t)))
        (setf sub-str (concatenate 'string sub-str `(,ch)))))
    (concatenate 'string rez-str sub-str)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun make-class-name (string)
  "
 @b(Пример использования:)
@begin[lang=lisp](code)
 (make-class-name \"AcadSummaryInfo\") -> \"<acad-summary-info>\"
@end(code)
"
  (string-downcase
   (concatenate
    'string "<"
    (dxf/utils:split-from->to string)
    ">")))

(defun make-proprety-name (string)
  (string-downcase
   (concatenate
    'string "pr-"
    (dxf/utils:split-from->to string))))

(defun make-method-name (string)
  (string-downcase
   (concatenate
    'string "md-"
    (dxf/utils:split-from->to string))))
