

(in-package :dxf/out)

(let ((data
        (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* "2018.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "txt-sections.dxf")
                       :direction :output :if-exists :supersede)
    (txt-sections data dxf)))
