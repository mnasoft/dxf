;;;; ./src/sec/sec.lisp

(defpackage #:dxf/sec
  (:use #:cl #:mnas-string)
  (:export *section*
           *endsec*
           *eof*
           *section-classes*
           *section-header*

           *section-tables*
           *section-blocks*
           *section-entities*
           *section-objects*
           *section-acdsdata*
           *end-tab*
           )
  (:export *section-names*
           ))

(in-package :dxf/sec)

(defparameter *section*          "SECTION")

(defparameter *endsec*           "ENDSEC")

(defparameter *eof*              "EOF")

(defparameter *section-classes*  "CLASSES")

(defparameter *section-header*   "HEADER")

(defparameter *section-tables*   "TABLES")

(defparameter *section-blocks*   "BLOCKS")

(defparameter *section-entities* "ENTITIES")

(defparameter *section-objects*  "OBJECTS")

(defparameter *section-acdsdata* "ACDSDATA")

(defparameter *end-tab*          "ENDTAB")

(defparameter *section-names*
  '("HEADER" "CLASSES" "TABLES" "BLOCKS" "ENTITIES" "OBJECTS" "ACDSDATA")
  "Наименования секций dxf-файла.
@begin(list)
 @item(HEADER   - системные переменные.)
 @item(CLASSES  - классы;) 
 @item(TABLES   - таблицы;) 
 @item(BLOCKS   - блоки;) 
 @item(ENTITIES - графические примитивы;) 
 @item(OBJECTS  - объекты (неграфические);)
 @item(ACDSDATA - )
@end(list)" )
