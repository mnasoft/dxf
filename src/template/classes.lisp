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
          (read stream)
          )))

(length *classes-db* )

