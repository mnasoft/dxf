;;;; ./src/methods/acad-document.lisp

(in-package :dxf)

(defgeneric ac-save-as (object file-name  &optional file-type security-params)
  (:documentation
   "Saves the document to a specified file; no longer supported for menu groups.

@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED0D0B02-25FC-4ED2-9DEE-2B0C9AA9416A\"](SaveAs Method (ActiveX)) "))

(defmethod ac-save-as ((acad-document dxf:<acad-document>) (name string) &optional File-Type Security-Params)
  "Saves the document to a specified file; no longer supported for menu groups.

@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ED0D0B02-25FC-4ED2-9DEE-2B0C9AA9416A\"](SaveAs Method (ActiveX))
"
  (with-open-file (dxf-bin name :direction :output :if-exists :supersede :element-type 'unsigned-byte)
    (dxf/out/bin:sections
     `(,(cons `(2 ,dxf/sec:*header*)   (apply #'append (dxf:ac-variables  acad-document)))
       ,(cons `(2 ,dxf/sec:*classes*)  (sec-classes  acad-document))
       ,(cons `(2 ,dxf/sec:*tables*)   (sec-tables   acad-document))
       ,(cons `(2 ,dxf/sec:*blocks*)   (sec-blocks   acad-document))
       ,(cons `(2 ,dxf/sec:*entities*) (sec-entities acad-document))
       ,(cons `(2 ,dxf/sec:*objects*)  (sec-objects  acad-document))
       ,(cons `(2 ,dxf/sec:*acdsdata*) (sec-acdsdata acad-document)))
     dxf-bin)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric ac-add-line (object Start-Point  End-Point)
    (:documentation
     "Creates a line passing through two points.

@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-26C95029-14BB-40B9-9987-49EFC980CB9D\"](AddLine Method (ActiveX))
"))

