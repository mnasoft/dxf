
(progn
  (defparameter fn-bin (concatenate 'string dxf::*dxf-path* "bin-sections.dxf"))
  (defparameter fn-txt (concatenate 'string dxf::*dxf-path* "txt-sections-01.dxf"))

  (with-open-file (dxf-bin fn-bin :element-type 'unsigned-byte)
    (with-open-file (dxf-txt fn-txt :direction :output :if-exists :supersede)
      (dxf/in/bin:read-head dxf-bin)
      (loop :for i :from 0 :to 5642
            :do (let* ((pair (dxf/in/bin:read-pair dxf-bin))
                       (code (first  pair))
                       (value  (second pair)))
                  (dxf/out:txt code value dxf-txt))))))


879
5642

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (defparameter fn-bin (concatenate 'string dxf::*dxf-path* "bin-sections.dxf"))
  (defparameter fn-txt (concatenate 'string dxf::*dxf-path* "txt-sections-01.dxf"))

  (defparameter dxf-bin (open fn-bin :element-type 'unsigned-byte))
  (defparameter dxf-txt (open fn-txt :direction :output :if-exists :supersede))
  (dxf/in/bin:read-head dxf-bin)
  (loop :for i :from 0 :to 879
        :do (let* ((pair (dxf/in/bin:read-pair dxf-bin))
                   (code (first  pair))
                   (value  (second pair)))
              (dxf/out:txt code value dxf-txt))))

(dxf/in/bin:read-pair dxf-bin)

(dxf/in/txt:dxf-in-t-fname (concatenate 'string dxf::*dxf-path* "txt-sections.dxf"))
