;;;; ./src/methods/acad-document.lisp

(in-package :dxf)

(defgeneric ac-open (acad-document file-name)
  (:documentation
   "Opens an existing drawing file (DWG) and makes it the active document.

@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9ED7A548-7978-4BFD-8462-E2FA747E8880\"](Open Method (ActiveX))
"))

(defmethod ac-open ((acad-document dxf:<acad-document>) (name string))
  "Opens an existing drawing file (DWG) and makes it the active document.

@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9ED7A548-7978-4BFD-8462-E2FA747E8880\"](Open Method (ActiveX))
"
  (let ((sections (dxf/in/bin:read-file name)))
    (block sec-header
      (setf (dxf:ac-variables acad-document)
            (dxf/split:after
             (dxf/split:select-section dxf/sec:*header* sections)
             :test #'(lambda (el) (= 9 el)))))
    (block sec-classes
      (setf (sec-classes acad-document)
            (dxf/split:select-section dxf/sec:*classes* sections))
      )
    (block sec-tables
      (setf (sec-tables acad-document)
            (dxf/split:select-section dxf/sec:*tables* sections))
      )
    (block sec-tables
      (setf (sec-tables acad-document)
            (dxf/split:select-section dxf/sec:*tables* sections))
      )
    (block sec-blocks
      (setf (sec-blocks acad-document)
            (dxf/split:select-section dxf/sec:*blocks* sections))
      )
    (block sec-entities
      (setf (sec-entities acad-document)
            (dxf/split:select-section dxf/sec:*entities* sections))
      )
    (block sec-objects
      (setf (sec-objects acad-document)
            (dxf/split:select-section dxf/sec:*objects* sections))
      )
    (block sec-acdsdata
      (setf (sec-acdsdata acad-document)
            (dxf/split:select-section dxf/sec:*acdsdata* sections))
      )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
