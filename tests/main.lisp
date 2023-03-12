;;;; tests/main.lisp

(in-package :dxf/tests)

(def-suite all-tests
  :description "Мастер-набор всех тестов проекта math.")

(in-suite all-tests)

(defun tests ()
  (run! 'all-tests))
