;;;; ./src/template/absend.lisp
(in-package :dxf/template)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun absend-properties ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-properties (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *table-properties-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

(defun absend-methods ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-methods (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *table-methods-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

(defun absend-events ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-events (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *table-events-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

(loop :for (met doc) :in *table-events-rought*
      :collect met)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(absend-methods)
(absend-properties) ; => ("Delta" "Angle")
(absend-events)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


