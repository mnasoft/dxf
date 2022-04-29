(in-package :dxf)

(defun class-files ()
  (uiop:directory-files
   (asdf:system-relative-pathname :dxf "src/template/classes/")
   "*.lisp"))

(defparameter *classes-db* 
  (loop :for file :in (class-files)
        :collect
        (with-open-file (stream file)
          (read stream)
          (read stream))))

(defparameter *g*
 (mnas-graph:make-graph
  (set-difference
   (loop :for i :in *classes-db*
         :collect
         (list (cadr (assoc :parents i))
               (cadr (assoc :defclass i))
               ))
   '((""))
   :key #'first :test  #'equal)))

(mnas-graph/view:view-graph *g*)
      
(ql:quickload :mnas-graph)

(mnas-graph:connected-nodes 
 (mnas-graph:find-node *g* "AcadObject"))
