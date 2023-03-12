;;;; tests/package.lisp

(defpackage :dxf/tests
  (:use #:cl #:fiveam)
  (:export #:run!
	   #:all-tests
	   #:tests))

(in-package :dxf/tests)
