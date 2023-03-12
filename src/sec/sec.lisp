;;;; ./src/sec/sec.lisp

(defpackage :dxf/sec
  (:use #:cl)
  (:export *eof*
           )
  (:export *section*
           *endsec*
           )
  (:export *classes*
           *header*
           *tables*
           *blocks*
           *entities*
           *objects*
           *acdsdata*
           *end-tab*
           )
  (:export *section-names*
           ))

(in-package :dxf/sec)

(defparameter *eof*              "EOF"
  "@b(Описание:) параметр @b(*eof*) определяет конец dxf-файла.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *section*          "SECTION")

(defparameter *endsec*           "ENDSEC")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *header*   "HEADER")

(defparameter *classes*  "CLASSES")

(defparameter *tables*   "TABLES")

(defparameter *blocks*   "BLOCKS")

(defparameter *entities* "ENTITIES")

(defparameter *objects*  "OBJECTS")

(defparameter *acdsdata* "ACDSDATA")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *table*            "TABLE")
(defparameter *end-tab*          "ENDTAB")

(defparameter *section-names*
  `(,*header*
    ,*classes*
    ,*tables*
    ,*blocks*
    ,*entities*
    ,*objects*
    ,*acdsdata*)
  "Наименования секций dxf-файла.
@begin(list)
 @item(HEADER   - системные переменные.)
 @item(CLASSES  - классы;) 
 @item(TABLES   - таблицы;) 
 @item(BLOCKS   - блоки;) 
 @item(ENTITIES - графические примитивы;) 
 @item(OBJECTS  - объекты (неграфические);)
 @item(ACDSDATA - какая то бинарнная хрень.)
@end(list)" )
