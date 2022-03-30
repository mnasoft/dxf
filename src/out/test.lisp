

(in-package :dxf/out)

(let ((data
        (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* "2018.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "txt-sections.dxf")
                       :direction :output :if-exists :supersede)
    (txt-sections data dxf)))

(let ((data
        (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* "310_2018.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "310_txt-sections.dxf")
                       :direction :output :if-exists :supersede)
    (txt-sections data dxf)))

(let ((data
        (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* "101_2018.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "101_txt-sections.dxf")
                       :direction :output :if-exists :supersede)
    (txt-sections data dxf)))

(let ((data
        (dxf/in/txt:dxf-in-t-fname 
           (concatenate 'string dxf::*dxf-path* "Line_01.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "_Line_01.dxf")
                       :direction :output :if-exists :supersede)
    (txt-sections data dxf)))
