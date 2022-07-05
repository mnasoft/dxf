;;;; ./src/template/absend.lisp

(in-package :dxf/template)

(defun load-data (system sub-pathname)
  (eval (apply #'append
               (loop :for file :in (uiop:directory-files
                                    (asdf:system-relative-pathname system sub-pathname)
                                    "*.lisp")
                     :collect
                     (with-open-file (stream file)
                       (read stream))))))

(defparameter *methods-db-rought*
  (load-data :dxf "src/template/methods/"))

(defparameter *properties-db-rought*
    (load-data :dxf "src/template/properties/"))

(defparameter *events-db-rought*
      (load-data :dxf "src/template/events/"))

(defun absend-properties ()
  (set-difference
   (remove-duplicates
    (apply #'append
           (loop :for i :in *classes-db-rought*
                 :collect
                 (find-rou-properties (second (assoc :DEFCLASS i)))))
    :test #'equal)
   *properties-db-rought*
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
   *methods-db-rought*
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
   *events-db-rought*
   :key #'(lambda (el)
            (cond
              ((stringp el) el)
              (t (first el))))
   :test #'equal))

(loop :for (met doc) :in *events-db-rought*
      :collect met)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(absend-methods)
(absend-properties) ; => ("Delta" "Angle")
(absend-events)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


