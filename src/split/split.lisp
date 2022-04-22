;;;; ./src/split/split.lisp

(defpackage #:dxf/split
  (:use #:cl)
  (:export between
           after)
  (:export split-by-sections
           select-section
           split-section
           split-entities
           split-blocks
           split-objects
           split-acdsdata
           )
  (:documentation
   "@b(Описание:) пакет @b(dxf/split) содержит вспомогательные функции
  для разделения dxf-пар на группы, представляющие данные какого-то
  объекта.

 Определения, используемые в насроящем парете:
  @begin(deflist)

    @term(пара (pair))
    @def(список, состоящий из двух элементов: ключ и значенние. Где
    тип ключа - целое число; тип значения определятся по значению
    ключа;)

    @term(список пар (pairs))
    @def(список, состоящий из пар;)

    @term(секционное представление dxf (sections))

    @def(список, состоящий из списков пар, представляющий содержимое
    dxf. Каждый списк пар в котором представляет отдельную секцию из
    которой исключаюся пары, обозначающие начало и конец секции:
    соответственно - '(0 \"SECTION\") и '(0 \"ENDSEC\") .)

  @end(deflist)
"))

(in-package :dxf/split)

(defun between (start-pair end-pair pairs
                &key (inclusive nil)
                     (start-inclusive inclusive)
                     (end-inclusive   inclusive))
  "@b(Описание:) функция @b(between) возвращает сгруппированный список
   пар. Группировка списка пар @b(pairs) выполяется по группам пар
   находящимися между парами заданными аргументами @b(start-pair) и
   @b(end-pair). Начальная и конечная пара попадает в подгруппы если
   аргуметы @b(start-inclusive) и @b(end-inclusive) не равны NIL для
   соосветствующей пары.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (between `(0 ,dxf/sec:*section*) `(0  ,dxf/sec:*endsec*)
          (dxf/in/bin:read-file-pairs
           (dxf/utils:make-path-relative-to-system :dxf \"dxf/bin/2018.dxf\")))
  (between `(0 ,dxf/sec:*section*) `(0  ,dxf/sec:*endsec*)
           (dxf/in/bin:read-file-pairs
            (dxf/utils:make-path-relative-to-system :dxf \"dxf/bin/2018.dxf\"))
           :inclusive T)
@end(code)
"
  (let ((groups nil)
	(group  nil)
        (into   nil))
    (loop :for pair :in pairs :do
      (cond
        ((equal pair start-pair)
         (when start-inclusive (push pair group))
         (setf into t))
        ((equal pair end-pair)
         (when end-inclusive (push pair group))
         (setf into nil)
         (push (nreverse group) groups)
         (setf group nil))
        (into (push pair group))))
    (nreverse groups)))

(defun after (pairs
              &key
                (key  #'(lambda (el) (first el)))
                (test #'(lambda (el) (= 0 el)))
                (inclusive t))
  "@b(Описание:) функция @b(after) возвращает список списков пар,
   разделяя список пар @b(pairs) на группы. В качестве разделителей
   используется предикат @b(test).  В качестве ключа предикат @(key).

 @b(Пример использования:)
@begin[lang=lisp](code)
  (after
   (select-section
    \"ENTITIES\"
    (dxf/in/bin:read-file 
     (dxf/utils:make-path-relative-to-system
      :dxf
      \"dxf/bin/2018.dxf\"))))
@end(code)
"
  (let ((groups nil)
	(group  nil)
        (into   nil))
    (loop :for pair :in pairs :do
      (cond
        ((funcall test (funcall key pair))
         (when into (push (nreverse group) groups))
         (setf group nil)
         (setf into t)
         (when inclusive (push pair group)))
        (into
         (push pair group))))
    (push (nreverse group) groups)
    (nreverse groups)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-by-sections (pairs)
  "@b(Описание:) функция @b(split-by-sections) возвращает список секций,
 содержащихся в списке пар @b(pairs) - секционное представление.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (split-by-sections
  (dxf/in/bin:read-file-pairs
   (dxf/utils:make-path-relative-to-system :dxf \"dxf/bin/2018.dxf\")))
@end(code)
"
  (between `(0 ,dxf/sec:*section*) `(0 ,dxf/sec:*endsec*) pairs))

(defun select-section (name sections)
  "@b(Описание:) функция @b(select-section) возвращает содержимое секции
   с именем @b(name) на основании секционного представления dxf
   @b(sections). При этом из скеционного представления соответствующей
   секции исключается пара, содержащая имя секции, например: (2 \"HEADER\")
   (2 \"CLASSES\") или (2 \"TABLES\") и т.д.

 @b(Пример использования:)
@begin[lang=lisp](code)
  (select-section \"TABLES\"
                  (dxf/in/bin:read-file 
                   (dxf/utils:make-path-relative-to-system :dxf \"dxf/bin/2018.dxf\")))
@end(code)
"
  (assert (member name dxf/sec:*section-names* :test #'string=))
  (cdr
   (assoc name sections
          :key #'second :test #'string=)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defun split-section (name pairs)
  "@b(Описание:) функция @b(split-section) 
"
  (let ((pairs-list (reverse (select-section name pairs)))
	(objects nil)
	(object  nil))
    (dolist (i pairs-list (nreverse objects))
      (push i object)
      (when (= (car i) 0)
	(push object objects)
	(setf object nil)))))

(defun split-entities (sections)
  "@b(Описание:) функция @b(split-entities) выделяет
из посекционного представления dxf - файла секцию ENTITIES
и преобразует ее в список с dxf - представлениями объектов.

 @b(Пример использования:)
@begin[lang=lisp](code)
  (split-entities *Drawing-sty*)
@end(code)
"
  (split-section "ENTITIES" sections))

(defun split-blocks (sections)
  "Пример использования:
  (split-blocks *Drawing-sty*)
"
  (split-section "BLOCKS" sections))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-objects (sections)
"Пример использования
 (split-objects *Drawing-sty*)
"
"split-objects - not yet defined"
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun split-acdsdata (sections)
"Пример использования
 (split-acdsdata *Drawing-sty*)
"
"split-acdsdata - not yet defined"
)
