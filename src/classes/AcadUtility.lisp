!!!(in-package :dxf/classes)

(!defclass <acad-utility> (<object>)
  (
  )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DE118C17-4567-48CF-8EFA-CABB52A27275\"](Utility Object (ActiveX))"))

(defparameter *acad-utility-properties* !'())

(mapcar #'dxf/utils:make-slot (set-difference *acad-utility-properties* *object-properties*))
