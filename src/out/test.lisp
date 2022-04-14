;;;; ./src/out/test.lisp

(in-package :cl-user)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; txt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let ((data
        (dxf/in/txt:read-file 
           (concatenate 'string dxf::*dxf-path* "txt/Line_01.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "_Line_01.dxf")
                       :direction :output :if-exists :supersede)
    (dxf/out/txt:txt-sections data dxf)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; bin

(let ((data
        (dxf/in/txt:read-file 
         (concatenate 'string dxf::*dxf-path* "txt/2018.dxf"))))
  (with-open-file (dxf (concatenate 'string dxf::*dxf-path* "bin-sections.dxf")
                       :direction :output :if-exists :supersede
                       :element-type 'unsigned-byte)
    (write-sequence
     (babel:string-to-octets
      (format nil "~A~C~C~C~C" "AutoCAD Binary DXF" #\CR #\LF #\SUB #\NUL))
     dxf)
    (dxf/out/bin:sections data dxf)))
