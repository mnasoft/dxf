;;;; package.lisp

(defpackage #:dxf
  (:use #:cl #:mnas-string)
  (:export *section-names*)
  (:export dxf-in-t-fname
           split-entities
  ))

;;;; (declaim (optimize (compilation-speed 0) (debug 3) (safety 0) (space 0) (speed 0)))




