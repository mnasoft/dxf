;;;; ./src/methods/acad-document.lisp

(in-package :dxf)

(defgeneric ac-add-line (object Start-Point  End-Point)
  (:documentation
   "Creates a line passing through two points.

@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-26C95029-14BB-40B9-9987-49EFC980CB9D\"](AddLine Method (ActiveX))
"))

