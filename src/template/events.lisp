(in-package :dxf)

(ql:quickload :mnas-graph)

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
      
(mnas-graph:connected-nodes 
 (mnas-graph:find-node *g* "AcadObject"))

(dxf/utils:make-class-name "AcadObjectID")
(dxf/utils:make-method-name "AcadObjectID")
(dxf/utils:make-proprety-name "AcadObjectID")
(dxf/utils:make-e-name "AcadObjectID")

((:DEFCLASS "Acad3DFace") (:PARENTS "AcadEntity")
  (:DOCUMENTATION
   "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DAB32FC-8C8A-4116-BD3A-CF733740DF8F\"](3DFace Object (ActiveX))")
  (:METHODS "ArrayPolar ArrayRectangular Copy Delete GetBoundingBox
   GetExtensionDictionary GetInvisibleEdge GetXData Highlight
   IntersectWith Mirror Mirror3D Move Rotate Rotate3D ScaleEntity
   SetInvisibleEdge SetXData TransformBy Update")
  (:PROPERTIES "Application Coordinate Coordinates Document EntityTransparency
   Handle HasExtensionDictionary Hyperlinks Layer Linetype
   LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
   PlotStyleName TrueColor VisibilityEdge1 VisibilityEdge2
   VisibilityEdge3 VisibilityEdge4 Visible")
  (:EVENTS "Modified"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *e*
  '(
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "AppActivate AppDeactivate ArxLoaded ArxUnloaded BeginCommand
   BeginFileDrop BeginLisp BeginModal BeginOpen BeginPlot BeginQuit
   BeginSave EndCommand EndLisp EndModal EndOpen EndPlot EndSave
   LispCancelled NewDrawing SysVarChanged WindowChanged
   WindowMovedOrResized")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Activate BeginClose BeginCommand BeginDocClose BeginDoubleClick
   BeginLisp BeginPlot BeginRightClick BeginSave
   BeginShortcutMenuCommand BeginShortcutMenuDefault
   BeginShortcutMenuEdit BeginShortcutMenuGrip BeginShortcutMenuOSnap
   Deactivate EndCommand EndLisp EndPlot EndSave EndShortcutMenu
   LayoutSwitched LispCancelled ObjectAdded ObjectErased
   ObjectModified SelectionChanged WindowChanged
   WindowMovedOrResized")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modifed")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "")
    (:events     "None")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "Modified")
    (:events
     "")
    ))

(defparameter *e-renameing*
  '("LISP" "Lisp"))

(format t "~{~S~%~}"
        (sort
         (set-difference 
          (remove-duplicates 
           (apply
            #'append
            (loop :for (i j) :in *e*
                  :collect
                  (mnas-string:split
                   (coerce 
                    (list #\Space #\Return #\NewLine) 'string)
                   j)))
           :test #'string=)
          '("None")  :test #'string=)
         #'string<))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *e-h* 
 '(
   ("ArxLoaded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-726449E4-E027-4260-BD6F-1C0D4E27D065")
   ("ArxUnloaded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B30E5068-B18A-4179-B253-23FD4CC01894")
   ("Activate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-65F892D6-C81F-4CD3-A6F3-A77E65B62309")
   ("AppActivate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FA52F3C0-FE4E-4F35-A6AE-C2BAA1912031")
   ("AppDeactivate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EC60EA71-090D-4D96-B951-9465D877F97F")
   ("BeginClose" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B1114C2-35FD-4689-B031-62D489FF8A7E")
   ("BeginCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2A816E4A-E74C-46B7-9DBA-7E09ACE31D9E")
   ("BeginDocClose" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EE0D8F0D-1132-4BCE-A68F-7125B97E737F")
   ("BeginDoubleClick" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0BBE54CD-0C3C-49E3-8F43-02C8D3219ED4")
   ("BeginFileDrop" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D14A002C-60EF-493A-A8FA-696B12F05D3D")
   ("BeginLisp" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CF0D87BB-1E41-4F82-B007-409F794EC8EB")
   ("BeginModal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1A32712E-B2AB-4159-95F3-8C95BC22AB7F")
   ("BeginOpen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BD420830-798B-4023-BD33-E1442D71D800")
   ("BeginPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-286CEEB9-3F3B-40AC-B148-E02335B74270")
   ("BeginQuit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5315845E-EC1F-4D03-AAAB-D9E08EB0873D")
   ("BeginRightClick" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6AF4DAD7-96EF-4CFB-9FC5-43F0F017F5CA")
   ("BeginSave" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E34B6863-298A-40A3-AA8F-327F5C5DACF0")
   ("BeginShortcutMenuCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B125BE98-E80D-41EE-A281-E2E8DFC4968E")
   ("BeginShortcutMenuDefault" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5DF17EEA-9276-4E14-8FF3-96F738F7ED8D")
   ("BeginShortcutMenuEdit" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D993E595-B28A-4486-956C-3B1B7583F6DB")
   ("BeginShortcutMenuGrip" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6E178381-061D-48FB-95C9-3D077AB1A1EF")
   ("BeginShortcutMenuOSnap" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A244B425-3107-4F3B-97C6-229FCA1286EA")
   ("Deactivate" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-22750180-C69B-42BB-9895-F865797D753C")
   ("EndCommand" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-54741B8A-2A8F-46CC-B62C-1DAA182E7174")
   ("EndLisp" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A6EA78E5-C0FC-4E71-9223-24E30C32E217")
   ("EndModal" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B834BF42-B242-40EC-9093-2D830C62F71F")
   ("EndOpen" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1AEC7F00-981A-4517-A830-37CA653D336A")
   ("EndPlot" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BC920EE5-A616-449B-A8E4-9CAF0E588306")
   ("EndSave" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D72C232D-82D9-4C63-9808-9E8CFE514B36")
   ("EndShortcutMenu" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8F40A4D3-75DF-4DC6-BC63-8E927A049641")
   ("LispCancelled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-419542A9-A9EA-4786-AF23-A3C49667E822")
   ("LayoutSwitched" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-32909BB0-81E6-4E41-816D-8B0C1EAB608F")
   ("LispCancelled" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-419542A9-A9EA-4786-AF23-A3C49667E822")
   ("Modified" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5EF65D7D-F5B4-48FE-A9F6-CD5F7CF3C54B")
   ("NewDrawing" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2204099A-0E75-4FA9-93B9-2FC997916682")
   ("ObjectAdded" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-689D8C57-6EB5-446B-8E2D-4C55C35908E9")
   ("ObjectErased" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7A8EB01B-B793-46CC-A369-FD9B4DD98022")
   ("ObjectModified" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-554BCA2C-19B5-4445-95E4-5624FE7F290A")
   ("SelectionChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2C0AED20-1D9A-41F9-B62A-467C6E16E6C7")
   ("SysVarChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-275C46E6-15AA-4086-84F9-D4836E96C049")
   ("WindowChanged" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EADD41ED-CEB1-4D2D-A7F2-710863289795")
   ("WindowMovedOrResized" "https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-24A4303B-C20E-49DB-A552-DC345FAF6B65") 
   )
 )
