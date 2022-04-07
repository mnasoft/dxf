;;;; .src/tests/tests.lisp

(defpackage #:dxf/tests
  (:use #:cl #:fiveam)
  (:export #:run-tests))

(in-package :dxf/tests)

(defun run-tests () (run! 'all))

(def-suite all
  :description "Мастер-набор всех тестов проекта dxf.")

(in-suite all)

;;;;(run-tests)
