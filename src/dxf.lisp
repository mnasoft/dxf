;;;; ./src/dxf.lisp

(defpackage :dxf
  (:use #:cl #:mnas-string)
  (:export dxf-out-text
	   dxf-in-text
           )
  (:export dxf-out-binary
           dxf-in-binary
           )
  (:export split-header
           )
  (:export *line-weight-enum*
           )
  (:export *h-vars-list-min*
           *h-vars-list*
           *h-vars*
           *hdr*
           *hdr-min*
           )
  (:export <db-header>
           )
  (:export *radian-to-degree*
           *degree-to-radian*
           *object-properties*
           )
  (:export <acad-object>
           )
  (:export <acad-entity>
           <acad-line>
           <acad-point>
           <acad-ray>
           <acad-xline>
           <acad-circle>
           <acad-arc>
           <acad-text>
           <acad-ellipse>
           )
  (:export <acad-documents>
           <acad-database>
           <acad-document>
           <acad-linetype>
           <acad-linetypes>

           <db-header>
           <ge-point-3d>
           <rx-object>
           <dxf-pairs>
           <object>
           <db-curve>
           <db-symbol-tbl>
           <acad-blocks>
           <db-block-rec>
           <db-object>)
  (:export <db-symbol-tr>
           <acad-layer>
           <acad-layers>

           <db-regapp-tr>
           <db-block-tr>
           <db-dimstyle-tr>
           <db-textstyle-tr>
           <db-ucs-tr>
           <db-view-tr>
           <db-vport-tr>
           )
;;;; accessors
  (:export ac-variables
           ac-model-space
           )
;;;; methods
  (:export ac-add-line
           ac-open
           ac-save-as
           )
  (:export 
   *Acad-Object-class-marker*
   *Acad-Object-subclass-marker*
   *acad-object-properties*
   *acad-entity-class-marker*
   *acad-entity-subclass-marker*
   *acad-entity-properties*
   *db-curve-class-marker*
   *db-curve-subclass-marker*
   *acad-line-class-marker*
   *acad-line-subclass-marker*
   *acad-point-class-marker*
   *acad-point-subclass-marker*
   *acad-point-properties*
   *acad-ray-class-marker*
   *acad-ray-subclass-marker*
   *acad-ray-properties*
   *acad-xline-class-marker*
   *acad-xline-subclass-marker*
   *acad-xline-properties*
   *Acad-Circle-class-marker*
   *Acad-Circle-subclass-marker*
   *acad-arc-class-marker*
   *acad-arc-subclass-marker*
   *acad-arc-properties*
   *acad-text-class-marker*
   *acad-text-subclass-marker*
   *acad-text-properties*
   *acad-ellipse-class-marker*
   *acad-ellipse-subclass-marker*
   *acad-acad-ellipse-properties*
   *acad-symboltablerecord-subclass-marker*
   *acad-layer-class-marker*
   *acad-layer-subclass-marker*
   *acad-layer-properties*
   *acad-symboltable-subclass-marker*
   *acad-layers-properties*
   *acad-database-properties*
   *acad-document-properties*
   *acad-linetype-class-marker*
   *acad-linetype-subclass-marker*
   *acad-linetype-properties*
   *acad-linetypes-properties*
   *symbol-tbl-class-marker*
   *symbol-tbl-subclass-marker*
   *db-symbol-tr-class-marker*
   *db-symbol-tr-subclass-marker*
   *db-block-tr-class-marker*
   *db-block-tr-subclass-marker*
   *table-names*)
  (:documentation "

 @b(Описание:) пакет @b(dxf) определяет классы и методы, которые
 позволяют манипулировать содержимым файлов в формате DXF (см.
 @link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-235B22E0-A567-4CF6-92D3-38A2306D73F3\"](Формат
 DXF (DXF))) при помощи методов аналогичных интерфейсу ActiveX (см.
 @link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BA470FE7-6488-4BC9-8FC8-ED93C32D86AA\"](About
 Using ActiveX with AutoLISP (AutoLISP/ActiveX))).

 Порядок преобразования имен объектов, свойств, методов, событий VBA в
 имена соответствующих им классов, слотов, аксессоров, методов,
 обработчиков Common Lisp заключается в следующем:

 @begin(enum)
   @item(Имя VBA разделяется символами \"-\" на слова по встреченным
         в нем заглавным буквам;)
   @item(К имени добавляется префикс \"ac-\";)
   @item(Имена классов дополнительно заключаются в угловые скобки.)
 @end(enum)
 "))


(in-package :dxf)

"@begin(enum)
  @item(
    @link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A809CD71-4655-44E2-B674-1FE200B9FE30\"](Object Model (ActiveX)))
  @item(
    @link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7D07C886-FD1D-4A0C-A7AB-B4D21F18E484\"](Раздел ENTITIES файла DXF)
    @begin(list)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3610039E-27D1-4E23-B6D3-7E60B22BB5BD\"](Общие групповые коды объектов (DXF)))
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-747865D5-51F0-45F2-BEFE-9572DBC5B151\"](3DFACE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-19AB1C40-0BE0-4F32-BCAB-04B37044A0D3\"](3DSOLID (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-89A690F9-E859-4D57-89EA-750F3FB76C6B\"](ACAD_PROXY_ENTITY (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8\"](ARC (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F0EA099B-6F88-4BCC-BEC7-247BA64838A4\"](ATTDEF (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7DD8B495-C3F8-48CD-A766-14F9D7D0DD9B\"](ATTRIB (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7FB91514-56FF-4487-850E-CF1047999E77\"](BODY (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18\"](CIRCLE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-239A1BDD-7459-4BB9-8DD7-08EC79BF1EB0\"](DIMENSION (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB\"](ELLIPSE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C6C71CED-CE0F-4184-82A5-07AD6241F15B\"](HATCH (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-76DB3ABF-3C8C-47D1-8AFB-72942D9AE1FF\"](HELIX (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3A2FF847-BE14-4AC5-9BD4-BD3DCAEF2281\"](IMAGE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-28FA4CFB-9D5E-4880-9F11-36C97578252F\"](INSERT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-396B2369-F89F-47D7-8223-8B7FB794F9F3\"](LEADER (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1A23DB42-6A92-48E9-9EB2-A7856A479930\"](LIGHT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66\"](LINE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-748FC305-F3F2-4F74-825A-61F04D757A50\"](LWPOLYLINE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4B9ADA67-87C8-4673-A579-6E4C76FF7025\"](MESH (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-590E8AE3-C6D9-4641-8485-D7B3693E432C\"](MLINE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0E489B69-17A4-4439-8505-9DCE032100B4\"](MLEADERSTYLE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-72D20B8C-0F5E-4993-BEB7-0FCF94F32BE0\"](MLEADER (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5E5DB93B-F8D3-4433-ADF7-E92E250D2BAB\"](MTEXT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4A10EF68-35A3-4961-8B15-1222ECE5E8C6\"](OLEFRAME (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-77747CE6-82C6-4452-97ED-4CEEB38BE960\"](OLE2FRAME (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317\"](POINT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ABF6B778-BE20-4B49-9B58-A94E64CEFFF3\"](POLYLINE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415\"](RAY (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-644BF0F0-FD79-4C5E-AD5A-0053FCC5A5A4\"](REGION (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8B60CBAB-B226-4A5F-ABB1-46FD8AABB928\"](SECTION (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FD4FAA74-1F6D-45F6-B132-BF0C4BE6CC3B\"](SEQEND (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0988D755-9AAB-4D6C-8E26-EC636F507F2C\"](SHAPE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E0C5F04E-D0C5-48F5-AC09-32733E8848F2\"](SOLID (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1F884F8-AA90-4864-A215-3182D47A9C74\"](SPLINE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BB191D89-9302-45E4-9904-108AB418FAE1\"](SUN (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BB62483A-89C3-47C4-80E5-EA3F08979863\"](SURFACE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D8CCD2F0-18A3-42BB-A64D-539114A07DA0\"](TABLE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363\"](TEXT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-ADFCED35-B312-4996-B4C1-61C53757B3FD\"](TOLERANCE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EA6FBCA8-1AD6-4FB2-B149-770313E93511\"](TRACE (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3EC8FBCC-A85A-4B0B-93CD-C6C785959077\"](UNDERLAY (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0741E831-599E-4CBF-91E1-8ADBCFD6556D\"](VERTEX (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2602B0FB-02E4-4B9A-B03C-B1D904753D34\"](VIEWPORT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-2229F9C4-3C80-4C67-9EDA-45ED684808DC\"](WIPEOUT (DXF));)
      @item(@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A\"](XLINE (DXF));)
   @end(list))
@end(enum)"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; line-weights.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; https://help.autodesk.com/view/ACD/2022/RUS/

(defparameter *line-weight-enum*
  '(("kLnWt000" 0)
    ("kLnWt005" 5)
    ("kLnWt009" 9)
    ("kLnWt013" 13)
    ("kLnWt015" 15)
    ("kLnWt018" 18)
    ("kLnWt020" 20)
    ("kLnWt025" 25)
    ("kLnWt030" 30)
    ("kLnWt035" 35)
    ("kLnWt040" 40)
    ("kLnWt050" 50)
    ("kLnWt053" 53)
    ("kLnWt060" 60)
    ("kLnWt070" 70)
    ("kLnWt080" 80)
    ("kLnWt090" 90)
    ("kLnWt100" 100)
    ("kLnWt106" 106)
    ("kLnWt120" 120)
    ("kLnWt140" 140)
    ("kLnWt158" 158)
    ("kLnWt200" 200)
    ("kLnWt211" 211)
    ("kLnWtByLayer" -1)
    ("kLnWtByBlock" -2)
    ("kLnWtByLwDefault" -3)))

(defun line-weight-ByLayer ()
  (second (assoc "kLnWtByLayer" *line-weight-enum* :test #'string=)))

(defun line-weight-ByBlock ()
  (second (assoc "kLnWtByBlock" *line-weight-enum* :test #'string=)))

(defun line-weight-ByLwDefault ()
  (second (assoc "kLnWtByLwDefault" *line-weight-enum* :test #'string=)))

(defun line-weight-round (lw)
  "Пример использования:
;;;; (line-weight-round -3)
;;;; (line-weight-round 205)
;;;; (line-weight-round 250)
;;;; (line-weight-round \"ByLayer\")
;;;; (line-weight-round \"ByBlock\")
;;;; (line-weight-round \"Default\")"
  (cond
    ((and (stringp lw) (string= "ByLayer" lw))
     (line-weight-ByLayer))
    ((and (stringp lw) (string= "ByBlock" lw))
     (line-weight-ByBlock))
    ((and (stringp lw) (string= "Default" lw))
     (line-weight-ByLwDefault))
    ((and (integerp lw)
	  (second
	   (second
	    (first
	     (sort
	      (mapcar
	       #'(lambda (el)
		   (list (* (- lw (second el)) (- lw (second el))) el))
               *line-weight-enum*)
	      #'< :key #'first)))) ))
    (t (line-weight-ByLwDefault))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dxf.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dxf-out-t-header (stream) stream)

(defun dxf-out-b-header (stream)
  (write-sequence (babel:string-to-octets dxf/const:*autocad-binary-dxf-22*)
                  stream))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; header-section-group-codes-list.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *h-vars-list-min*
  '(("ACADVER"  1 "AC1027")
    ("HANDSEED" 5 97))
  "@b(Описание:) переменная @b(*h-vars-list-min*) содержит список с
именами системных переменных для минимальной секции заголовка.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *h-vars-list*
  '(("ACADVER"               1   "AC1027")
    ("ACADMAINTVER"         70   20)
    ("DWGCODEPAGE"           3   "ANSI_1251")
    ("LASTSAVEDBY"           1   "namatv")
    ("REQUIREDVERSIONS"    160   0)
    ("INSBASE"              10   #(0.0 0.0 0.0))
    ("EXTMIN"               10   #(1.E+20 1.E+20 1.E+20))
    ("EXTMAX"               10   #(-1.E+20 -1.E+20 -1.E+20))
    ("LIMMIN"               10   #(0.0 0.0))
    ("LIMMAX"               10   #(420.0 297.0))
    ("ORTHOMODE"            70   0)
    ("REGENMODE"            70   1)
    ("FILLMODE"             70   1)
    ("QTEXTMODE"            70   0)
    ("MIRRTEXT"             70   0)
    ("LTSCALE"              40   1.0)
    ("ATTMODE"              70   1)
    ("TEXTSIZE"             40   2.5)
    ("TRACEWID"             40   1.0)
    ("TEXTSTYLE"             7   "Standard")
    ("CLAYER"                8   "0")
    ("CELTYPE"               6   "ByLayer")
    ("CECOLOR"              62   256)
    ("CELTSCALE"            40   1.0)
    ("DISPSILH"             70   0)
    ("DIMSCALE"             40   1.0)
    ("DIMASZ"               40   2.5)
    ("DIMEXO"               40   0.625)
    ("DIMDLI"               40   3.75)
    ("DIMRND"               40   0.0)
    ("DIMDLE"               40   0.0)
    ("DIMEXE"               40   1.25)
    ("DIMTP"                40   0.0)
    ("DIMTM"                40   0.0)
    ("DIMTXT"               40   2.5)
    ("DIMCEN"               40   2.5)
    ("DIMTSZ"               40   0.0)
    ("DIMTOL"               70   0)
    ("DIMLIM"               70   0)
    ("DIMTIH"               70   0)
    ("DIMTOH"               70   0)
    ("DIMSE1"               70   0)
    ("DIMSE2"               70   0)
    ("DIMTAD"               70   1)
    ("DIMZIN"               70   8)
    ("DIMBLK"                1   "")
    ("DIMASO"               70   1)
    ("DIMSHO"               70   1)
    ("DIMPOST"               1   "")
    ("DIMAPOST"              1   "")
    ("DIMALT"               70   0)
    ("DIMALTD"              70   3)
    ("DIMALTF"              40   0.03937007874016)
    ("DIMLFAC"              40   1.0)
    ("DIMTOFL"              70   1)
    ("DIMTVP"               40   0.0)
    ("DIMTIX"               70   0)
    ("DIMSOXD"              70   0)
    ("DIMSAH"               70   0)
    ("DIMBLK1"               1   "")
    ("DIMBLK2"               1   "")
    ("DIMSTYLE"              2   "ISO-25")
    ("DIMCLRD"              70   0)
    ("DIMCLRE"              70   0)
    ("DIMCLRT"              70   0)
    ("DIMTFAC"              40   1.0)
    ("DIMGAP"               40   0.625)
    ("DIMJUST"              70   0)
    ("DIMSD1"               70   0)
    ("DIMSD2"               70   0)
    ("DIMTOLJ"              70   0)
    ("DIMTZIN"              70   8)
    ("DIMALTZ"              70   0)
    ("DIMALTTZ"             70   0)
    ("DIMUPT"               70   0)
    ("DIMDEC"               70   2)
    ("DIMTDEC"              70   2)
    ("DIMALTU"              70   2)
    ("DIMALTTD"             70   3)
    ("DIMTXSTY"              7   "Standard")
    ("DIMAUNIT"             70   0)
    ("DIMADEC"              70   0)
    ("DIMALTRND"            40   0.0)
    ("DIMAZIN"              70   0)
    ("DIMDSEP"              70   44)
    ("DIMATFIT"             70   3)
    ("DIMFRAC"              70   0)
    ("DIMLDRBLK"             1   "")
    ("DIMLUNIT"             70   2)
    ("DIMLWD"               70   -2)
    ("DIMLWE"               70   -2)
    ("DIMTMOVE"             70   0)
    ("DIMFXL"               40   1.0)
    ("DIMFXLON"             70   0)
    ("DIMJOGANG"            40   0.7853981633974483)
    ("DIMTFILL"             70   0)
    ("DIMTFILLCLR"          70   0)
    ("DIMARCSYM"            70   0)
    ("DIMLTYPE"              6   "")
    ("DIMLTEX1"              6   "")
    ("DIMLTEX2"              6   "")
    ("DIMTXTDIRECTION"      70   0)
    ("LUNITS"               70   2)
    ("LUPREC"               70   4)
    ("SKETCHINC"            40   1.0)
    ("FILLETRAD"            40   0.0)
    ("AUNITS"               70   0)
    ("AUPREC"               70   0)
    ("MENU"                  1   ".")
    ("ELEVATION"            40   0.0)
    ("PELEVATION"           40   0.0)
    ("THICKNESS"            40   0.0)
    ("LIMCHECK"             70   0)
    ("CHAMFERA"             40   0.0)
    ("CHAMFERB"             40   0.0)
    ("CHAMFERC"             40   0.0)
    ("CHAMFERD"             40   0.0)
    ("SKPOLY"               70   0)
    ("TDCREATE"             40   2457804.467045579)
    ("TDUCREATE"            40   2457804.383712245)
    ("TDUPDATE"             40   2457804.467436215)
    ("TDUUPDATE"            40   2457804.384102882)
    ("TDINDWG"              40   0.0003909491)
    ("TDUSRTIMER"           40   0.0003908681)
    ("USRTIMER"             70   1)
    ("ANGBASE"              50   0.0)
    ("ANGDIR"               70   0)
    ("PDMODE"               70   0)
    ("PDSIZE"               40   0.0)
    ("PLINEWID"             40   0.0)
    ("SPLFRAME"             70   0)
    ("SPLINETYPE"           70   6)
    ("SPLINESEGS"           70   8)
    ("HANDSEED"              5   560) 
    ("SURFTAB1"             70   6)
    ("SURFTAB2"             70   6)
    ("SURFTYPE"             70   6)
    ("SURFU"                70   6)
    ("SURFV"                70   6)
    ("UCSBASE"               2   "")
    ("UCSNAME"               2   "")
    ("UCSORG"               10   #(0.0 0.0 0.0))
    ("UCSXDIR"              10   #(1.0 0.0 0.0))
    ("UCSYDIR"              10   #(0.0 1.0 0.0))
    ("UCSORTHOREF"           2   "")
    ("UCSORTHOVIEW"         70   0)
    ("UCSORGTOP"            10   #(0.0 0.0 0.0))
    ("UCSORGBOTTOM"         10   #(0.0 0.0 0.0))
    ("UCSORGLEFT"           10   #(0.0 0.0 0.0))
    ("UCSORGRIGHT"          10   #(0.0 0.0 0.0))
    ("UCSORGFRONT"          10   #(0.0 0.0 0.0))
    ("UCSORGBACK"           10   #(0.0 0.0 0.0))
    ("PUCSBASE"              2   "")
    ("PUCSNAME"              2   "")
    ("PUCSORG"              10   #(0.0 0.0 0.0))
    ("PUCSXDIR"             10   #(1.0 0.0 0.0))
    ("PUCSYDIR"             10   #(0.0 1.0 0.0))
    ("PUCSORTHOREF"          2   "")
    ("PUCSORTHOVIEW"        70   0)
    ("PUCSORGTOP"           10   #(0.0 0.0 0.0))
    ("PUCSORGBOTTOM"        10   #(0.0 0.0 0.0))
    ("PUCSORGLEFT"          10   #(0.0 0.0 0.0))
    ("PUCSORGRIGHT"         10   #(0.0 0.0 0.0))
    ("PUCSORGFRONT"         10   #(0.0 0.0 0.0))
    ("PUCSORGBACK"          10   #(0.0 0.0 0.0))
    ("USERI1"               70   0)
    ("USERI2"               70   0)
    ("USERI3"               70   0)
    ("USERI4"               70   0)
    ("USERI5"               70   0)
    ("USERR1"               40   0.0)
    ("USERR2"               40   0.0)
    ("USERR3"               40   0.0)
    ("USERR4"               40   0.0)
    ("USERR5"               40   0.0)
    ("WORLDVIEW"            70   1)
    ("SHADEDGE"             70   3)
    ("SHADEDIF"             70   70)
    ("TILEMODE"             70   1)
    ("MAXACTVP"             70   64)
    ("PINSBASE"             10   #(0.0 0.0 0.0))
    ("PLIMCHECK"            70   0)
    ("PEXTMIN"              10   #(0.0 0.0 0.0))
    ("PEXTMAX"              10   #(0.0 0.0 0.0))
    ("PLIMMIN"              10   #(0.0 0.0))
    ("PLIMMAX"              10   #(12.0 9.0))
    ("UNITMODE"             70   0)
    ("VISRETAIN"            70   1)
    ("PLINEGEN"             70   0)
    ("PSLTSCALE"            70   1)
    ("TREEDEPTH"            70   3020)
    ("CMLSTYLE"              2   "Standard")
    ("CMLJUST"              70   0)
    ("CMLSCALE"             40   20.0)
    ("PROXYGRAPHICS"        70   1)
    ("MEASUREMENT"          70   1)
    ("CELWEIGHT"           370   -1)
    ("ENDCAPS"             280   0)
    ("JOINSTYLE"           280   0)
    ("LWDISPLAY"           290   0)
    ("INSUNITS"             70   4)
    ("HYPERLINKBASE"         1   "")
    ("STYLESHEET"            1   "")
    ("XEDIT"               290   1)
    ("CEPSNTYPE"           380   0)
    ("PSTYLEMODE"          290   1)
    ("FINGERPRINTGUID"       2   "{A066C69A-91DF-4F34-A204-AF3BEC30AA17}")
    ("VERSIONGUID"           2   "{02B655AA-2030-4262-89BC-BE4F196822EC}")
    ("EXTNAMES"            290   1)
    ("PSVPSCALE"            40   0.0)
    ("OLESTARTUP"          290   0)
    ("SORTENTS"            280   127)
    ("INDEXCTL"            280   0)
    ("HIDETEXT"            280   1)
    ("XCLIPFRAME"          280   2)
    ("HALOGAP"             280   0)
    ("OBSCOLOR"             70   257)
    ("OBSLTYPE"            280   0)
    ("INTERSECTIONDISPLAY" 280   0)
    ("INTERSECTIONCOLOR"    70   257)
    ("DIMASSOC"            280   2)
    ("PROJECTNAME"           1   "")
    ("CAMERADISPLAY"       290   0)
    ("LENSLENGTH"           40   50.0)
    ("CAMERAHEIGHT"         40   0.0)
    ("STEPSPERSEC"          40   2.0)
    ("STEPSIZE"             40   6.0)
    ("3DDWFPREC"            40   2.0)
    ("PSOLWIDTH"            40   5.0)
    ("PSOLHEIGHT"           40   80.0)
    ("LOFTANG1"             40   1.570796326794896)
    ("LOFTANG2"             40   1.570796326794896)
    ("LOFTMAG1"             40   0.0)
    ("LOFTMAG2"             40   0.0)
    ("LOFTPARAM"            70   7)
    ("LOFTNORMALS"         280   1)
    ("LATITUDE"             40   37.795)
    ("LONGITUDE"            40   -122.394)
    ("NORTHDIRECTION"       40   0.0)
    ("TIMEZONE"             70   -8000)
    ("LIGHTGLYPHDISPLAY"   280   1)
    ("TILEMODELIGHTSYNCH"  280   1)
    ("CMATERIAL"           347   236) 
    ("SOLIDHIST"           280   0)
    ("SHOWHIST"            280   1)
    ("DWFFRAME"            280   2)
    ("DGNFRAME"            280   0)
    ("REALWORLDSCALE"      290   1)
    ("INTERFERECOLOR"       62   1)
    ("INTERFEREOBJVS"      345   249)
    ("INTERFEREVPVS"       346   246)
    ("CSHADOW"             280   0)
    ("SHADOWPLANELOCATION"  40   0.0))
  "@b(Описание:) переменная @b(*h-vars-list*) содержит список с
именами системных переменных для полной секции заголовка.")

(defparameter *h-vars* (make-hash-table :test 'equal)
  "@b(Описание:) хешированная таблица @b(*h-vars*) содержит имена
  системных переменных и соответствующие им список, состояший из кода
  dxf и значения системной переменной.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (gethash \"DIMSE1\" *h-vars* )
@end(code)
")

(mapc #'(lambda (el)
          (setf
           (gethash (first el) *h-vars*)
           (list (second el) (third el))))
      *h-vars-list*)

;;;;

(defclass <db-header> ()
  ((header-vars :accessor header-vars :initarg :header-vars :initform *h-vars-list*
		:documentation "
@b(Описание:) класс @b(<db-header>) 

https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A85E8E67-27CD-4C59-BE61-4DC9FADBE74A

")))

(defmethod dxf-out-text :before ((x <db-header>) stream)
  (dxf/out/txt:pair 0 dxf/sec:*section* stream)
  (dxf/out/txt:pair 2 dxf/sec:*header* stream))

(defmethod dxf-out-text ((x <db-header>) stream)
  (mapc #'(lambda (el)
	    (when (third el)
	      (dxf/out/txt:pair 9 (concatenate 'string "$" (first el)) stream)
	      (dxf/out/txt:pair (second el) (third el) stream)))
	(header-vars x)))

(defmethod dxf-out-text :after ((x <db-header>) stream)
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; db-classes.lisp

(defparameter *radian-to-degree* (/ 180 pi))

(defparameter *degree-to-radian* (/ pi 180))

(defclass <ge-point-3d> ()
    ((point-3d :accessor point-3d :initarg :point-3d :initform (vector 0 0 0))))

(defmethod write-dxf-binary (code (point-3d <ge-point-3d>) stream)
  (dxf/out/bin:pair (+ 00 code) (svref (point-3d point-3d) 0) stream)
  (dxf/out/bin:pair (+ 10 code) (svref (point-3d point-3d) 1) stream)
  (dxf/out/bin:pair (+ 20 code) (svref (point-3d point-3d) 2) stream))
;;;;

(defclass <rx-object> ()
  ((name :accessor name :initarg :name :initform "")))

;;;;

(defclass <dxf-pairs> ()
  ((pairs :accessor pairs        :initarg :pairs        :initform nil :documentation "pairs"))
  (:documentation
   "Содержит dxf-представление объекта"))

;;;;

(defgeneric dxf-in-text (object pairs)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-in-text) считывает данные из
@b(pairs) в @b(object).
")
  )

(defmethod  dxf-in-text ((object <dxf-pairs>) (pairs cons))
;;; (break "dxf-in-text ((object <dxf-pairs>) (pairs cons))")
  object)

(defmethod  dxf-in-text :after ((object <dxf-pairs>) (pairs cons))
;;; (break "dxf-in-text :after ((object <dxf-pairs>) (pairs cons))")
  (setf (pairs object) (copy-list pairs)))

;;;;

(defclass <object> () ())

(defparameter *object-properties* '())

;;;;

(defparameter *Acad-Object-class-marker* "OBJECT")

(defparameter *Acad-Object-subclass-marker* "AcDbObject")

(defclass <acad-object> (<object>)
  ((application              :accessor application              :initarg :application              :initform nil :documentation "application")
   (document                 :accessor document                 :initarg :document                 :initform nil :documentation "document")
   (handle                   :accessor handle                   :initarg :handle                   :initform nil :documentation "Код   5. Дескриптор handle  -> Handle") 
   (has-extension-dictionary :accessor has-extension-dictionary :initarg :has-extension-dictionary :initform nil :documentation "has-extension-dictionary")
   (object-id                :accessor object-id                :initarg :object-id                :initform nil :documentation "object-id")
   (object-name              :accessor object-name              :initarg :object-name              :initform nil :documentation "object-name")
   (owner-id                 :accessor owner-id                 :initarg :owner-id                 :initform nil :documentation "Код 330. owner-id -> Owner-ID")
;;;;
   (next-handle      :accessor next-handle   :initarg :next-handle   :initform 1   :allocation :class))
  (:documentation "The standard interface for a basic AutoCAD object."))

(defparameter *acad-object-properties*
  '(Application Document Handle HasExtensionDictionary ObjectID
    ObjectName OwnerID))

(mapcar #'dxf/utils:make-slot (set-difference *acad-object-properties* *object-properties*))

(defgeneric dxf-out-text (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в текстовом формате."))

(defmethod dxf-out-text ((x <Acad-Object>) stream)
  (dxf/out/txt:pair 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-text :after ((x <Acad-Object>) stream)
  (let (
	(hdl (handle x))
	(own (owner-id x)))
    (when hdl (dxf/out/txt:pair   5 hdl stream))
    (when own (dxf/out/txt:pair 330 own stream))))

;;;;

(defgeneric dxf-out-binary (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в двоичном формате."))

(defmethod dxf-out-binary ((x <Acad-Object>) stream)
  (dxf/out/txt:pair 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x <Acad-Object>) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf/out/txt:pair 330 own stream))
    (when hdl (dxf/out/txt:pair   5 hdl stream))))

;;;;

(defmethod  dxf-in-text ((object <acad-object>) (pairs cons))
;;; (break "dxf-in-text ((object <acad-object>) (pairs cons))")
    )

(defmethod  dxf-in-text :after ((object <acad-object>) (pairs cons))
;;; (break "dxf-in-text :after ((object <acad-object>) (pairs cons))")

  (let ((c-5   (cadr (assoc   5 pairs :test #'equal)))
	(c-330 (cadr (assoc 330 pairs :test #'equal))))
    ;;    (break "~A ~A"  c-5 c-330)
    (when c-5   (setf (Handle   object) c-5))
    (when c-330 (setf (Owner-ID object) c-330))))

;;;; <acad-entity>

(defparameter *acad-entity-class-marker* "ENTITY")

(defparameter *acad-entity-subclass-marker* "AcDbEntity")

(defclass <acad-entity> (<acad-object>)
  ((layer
    :accessor layer
    :initarg :layer
    :initform "0"
    :documentation
    "Код   8. Имя слоя  entity-layer -> Layer" )
   (entity-transparency :documentation "entity-transparency")
   (line-type
    :accessor line-type
    :initarg :line-type  :initform "BYLAYER"
    :documentation
    "Код 6. Linetype name (present if not BYLAYER). The special name
    BYBLOCK indicates a floating linetype (optional) | BYLAYER |" )
   (hyperlinks :documentation "hyperlinks")
   (line-type-scale
    :accessor line-type-scale
    :initarg :line-type-scale
    :initform 1.0d0
    :documentation "Код 48")
   (line-weight
    :accessor line-weight
    :initarg :line-weight
    :initform -1
    :documentation
    "| 370 | Lineweight enum value. Stored and moved around as a 16-bit integer. | not omitted |")
   (material :documentation "material")
   (PlotStyleName :documentation "PlotStyleName")
   (true-color
    :accessor true-color
    :initarg :true-color :initform dxf/color:*bylayer*
    :documentation "Код 62 и 420" )
   (visible
    :accessor visible
    :initarg :visible :initform t
    :documentation
    " 60 | Object visibility (optional): 0 = Visible 1 = Invisible | 0"))
  #+nil (plotstylename :accessor plotstylename :initarg :plotstylename :initform nil :documentation "plotstylename")
  #+nil (material :accessor material :initarg :material :initform nil :documentation "material")

  (:documentation "
@begin[lang=txt](code)
См. ./dbmain.h:class ADESK_NO_VTABLE AcDbEntity: public AcDbObject
@end(code)


"))

(defparameter *acad-entity-properties*
  '(Application Document EntityTransparency Handle
    HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
    Lineweight Material ObjectID ObjectName OwnerID PlotStyleName
    TrueColor Visible))

(reverse (mapcar #'dxf/utils:make-slot (set-difference *acad-entity-properties* *acad-object-properties*)))

;;;;

(defmethod dxf-out-text ((x <acad-entity>) stream)
  (dxf/out/txt:pair 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-entity>) stream)
  (dxf/out/txt:pair 100 *acad-entity-subclass-marker* stream)
  (let ((la  (Layer  x))
	(cl  (make-instance 'dxf/color:<color> :entity-color (true-color x)))
	(lt  (line-type  x))
	(vi  (visible   x))
	(lts (line-type-scale x))
	(lw  (line-weight x))
	)
    (dxf/out/txt:pair 8 la stream)
    (unless (string= "BYLAYER" lt ) (dxf/out/txt:pair 6 lt stream))
    (cond
      ((= dxf/color:+ac-Color-Method-ByLayer+ (dxf/color:color-method cl)))
      ((= dxf/color:+ac-color-method-byblock+ (dxf/color:color-method cl))
       (dxf/out/txt:pair 62 (dxf/color:color-index cl) stream))
      ((= dxf/color:+ac-color-method-byaci+ (dxf/color:color-method cl))
       (dxf/out/txt:pair 62 (dxf/color:color-index cl) stream))
      ((= dxf/color:+ac-color-method-byrgb+ (dxf/color:color-method cl))
       (dxf/out/txt:pair 62  (dxf/color:color-index cl) stream)
       (dxf/out/txt:pair 420 (dxf/color:rgb->true (dxf/color:rgb cl)) stream)))
    (unless (= lts 1.d0) (dxf/out/txt:pair 48 lts stream))
    (unless (= lw -1) (dxf/out/txt:pair  370 lw stream))
    (unless vi  (dxf/out/txt:pair 60 1 stream))))

;;;;

(defmethod dxf-out-binary ((x <acad-entity>) stream)
  (dxf/out/bin:pair 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-entity>) stream)
  (dxf/out/bin:pair 100 *acad-entity-subclass-marker* stream)
  (let ((hdl (Handle x))
	(la (Layer x))
	(cl (true-color x)))
    (when hdl (dxf/out/bin:pair 5 hdl stream))
    (dxf/out/bin:pair 8 la stream)
    (unless (= 256 cl) (dxf/out/bin:pair 62  cl stream))))

;;;;

(defmethod  dxf-in-text :after ((object <acad-entity>) (pairs cons))
  (let ((c-8   (cadr (assoc   8 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal)))
	(c-60  (cadr (assoc  60 pairs :test #'equal)))
	(c-48  (cadr (assoc  48 pairs :test #'equal)))
	(c-370 (cadr (assoc 370 pairs :test #'equal)))
	)
    (when c-8   (setf (layer     object) c-8))
    (when c-6   (setf (line-type  object) c-6))
    (cond
      ((and c-62 c-420)
       (setf (true-color object)
	     (list c-62 (dxf/color:true->rgb   c-420))))
      (c-62
       (setf (true-color object)
	     (list c-62 nil)))
      (t
       (setf (true-color object) (list 256 nil))))
    (cond
      ((numberp c-48) (setf (line-type-scale  object) c-48))
      ((null    c-48) (setf (line-type-scale  object) 1.d0))
      (t (error "dxf-in-text :after ((object <acad-entity>) (pairs cons)): wrong c-48 value ~A" c-48)))
    (cond
      ((null    c-370) (setf (line-weight object) -1))
      ((numberp c-370) (setf (line-weight object) c-370))
      (t (error "dxf-in-text :after ((object <acad-entity>) (pairs cons)): wrong c-370 value ~A" c-370)))
    (cond
      ((null c-60)           (setf (visible object) t))
      ((and c-60 (= c-60 0)) (setf (visible object) t))
      ((and c-60 (= c-60 1)) (setf (visible object) nil))
      (t (error "dxf-in-text :after ((object <acad-entity>) (pairs cons)): wrong c-60 value ~A" c-60)))))

;;;; <db-curve>

(defparameter *db-curve-class-marker* "CURVE")

(defparameter *db-curve-subclass-marker* "AcDbCurve")

(defclass <db-curve> (<acad-entity>) ())

;;;;

(defparameter *acad-line-class-marker* "LINE")

(defparameter *acad-line-subclass-marker* "AcDbLine")

(defclass <acad-line> (<acad-entity>)
  ((StartPoint :accessor StartPoint  :initarg :StartPoint  :initform (vector 0d0 0d0 0d0 ) :documentation "Код 10. Начальная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (EndPoint   :accessor EndPoint    :initarg :EndPoint    :initform (vector 0d0 0d0 0d0 ) :documentation "Код 11. Конечная точка (в МСК) Файл DXF: значение X; приложение: 3D-точка")
   (Thickness  :accessor Thickness   :initarg :thickness   :initform 0d0                   :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (Normal     :accessor Normal      :initarg :Normal      :initform (vector 0d0 0d0 1d0)  :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   ;;;; (Angle) (Delta) (Length)
   )

  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66\"](LINE (DXF))
@begin[lang=txt](code)
См. ./dbents.h:class AcDbLine: public AcDbCurve
@end(code)
@begin[lang=txt](code)
;   Angle (RO) = 2.54047
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff77d4470f8>
;   Delta (RO) = (-1.58936 1.08997 0.0)
;   Document (RO) = #<VLA-OBJECT IAcadDocument 00000142daa47188>
;   EndPoint = (-1.58936 1.09759 0.0)
;   EntityTransparency = \"ByLayer\"
;   Handle (RO) = \"162\"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 00000142eeeb8188>
;   Layer = \"0\"
;   Length (RO) = 1.9272
;   Linetype = \"ByLayer\"
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = \"ByBlock\"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 42
;   ObjectName (RO) = \"AcDbLine\"
;   OwnerID (RO) = 43
;   PlotStyleName = \"ByLayer\"
;   StartPoint = (0.0 0.00762657 0.0)
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 00000142eeebf020>
;   Visible = -1
@end(code)
"))

(defmethod dxf-out-text ((x <Acad-Line>) stream)
  (dxf/out/txt:pair 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-text :after ((x <Acad-Line>) stream)
  (dxf/out/txt:pair 100 *Acad-Line-subclass-marker* stream)
  (let ((th  (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out/txt:pair 39 th stream))
    (dxf/out/txt:3d-point 10 p-s stream)
    (dxf/out/txt:3d-point 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf/out/txt:3d-point nrm 210 stream))))

;;;;

(defmethod dxf-out-binary ((x <Acad-Line>) stream)
  (dxf/out/bin:pair 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-binary :after ((x <Acad-Line>) stream)
  (dxf/out/bin:pair 100 *Acad-Line-subclass-marker* stream)
  (let ((th (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out/bin:pair 39 th stream))
    (dxf/out/bin:3d-point 10 p-s stream)
    (dxf/out/bin:3d-point 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf/out/bin:3d-point nrm 210 stream))))

;;;;

(defmethod  dxf-in-text  ((object <acad-line>) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-line-class-marker*)))

(defmethod  dxf-in-text :after ((object <Acad-Line>) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	(c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (StartPoint object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (StartPoint object) (vector c-10 c-20 0d0)))
      (t                           (setf  (StartPoint object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (EndPoint   object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (EndPoint   object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (EndPoint   object) (vector 0.d0 0.d0 0.d0))))
    (cond
      (c-39     (setf  (thickness   object) c-39))
      (t        (setf  (thickness   object) 0.0d0)))
    (cond
      ((and c-210 c-220 c-230)     (setf  (normal   object) (vector c-210 c-220 c-230)))
      (t                           (setf  (normal   object) (vector 0.0d0 0.0d0 1.0d0))))))


;;;; <acad-point>

(defparameter *acad-point-class-marker* "POINT")

(defparameter *acad-point-subclass-marker* "AcDbPoint")

(defclass <acad-point> (<acad-entity>)
  ((coordinates :accessor coordinates :initarg :coordinates    :initform (vector 0.0d0 0.0d0 0.0d0) :documentation "Код  10. Положение точки")
   (thickness   :accessor thickness   :initarg :thickness      :initform 0.0d0                      :documentation "Код  39. Высота выдавливания")
   (normal      :accessor normal      :initarg :normal         :initform (vector 0.0d0 0.0d0 1.0d0) :documentation "Код 210. Направление выдавливания")
   (ecs-angle   :accessor ecs-angle   :initarg :ecs-angle      :initform 0.0d0                      :documentation "Код  50. Поворот системы координат объекта"))

  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317\"](POINT (DXF))
@begin[lang=txt](code)
См. ./dbents.h:class AcDbPoint: public AcDbEntity
@end(code)
"))

(defparameter *acad-point-properties*
  '(Application Coordinates Document EntityTransparency Handle
    HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
    Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName
    Thickness TrueColor Visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-point-properties* *acad-entity-properties*))

(defmethod dxf-out-text ((x <acad-point>) stream)
    (dxf/out/txt:pair 0 *acad-point-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-point>) stream)
  (dxf/out/txt:pair 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th  0) (dxf/out/txt:pair  39 th stream))
    (dxf/out/txt:3d-point 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/txt:3d-point 210 nrm stream))
    (unless (= ecs 0) (dxf/out/txt:pair 50 ecs stream))))

;;;;

(defmethod dxf-out-binary ((x <acad-point>) stream)
  (dxf/out/bin:pair 0 *acad-point-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-point>) stream)
  (dxf/out/bin:pair 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out/bin:pair 39 th stream))
    (dxf/out/bin:3d-point 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/bin:3d-point 210 nrm stream))
    (unless (= ecs 0) (dxf/out/bin:pair 50 ecs stream))))

;;;;

(defmethod  dxf-in-text  ((object <acad-point>) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-point-class-marker*)))

(defmethod  dxf-in-text :after ((object <acad-point>) (pairs cons))
  (let ((c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal)))
	(c-50  (cadr (assoc  50 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (coordinates object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (coordinates object) (vector c-10 c-20 0.d0)))
      (t                           (setf  (coordinates object) (vector 0.d0 0.d0 0.d0))))
    (cond
      (c-39 (setf  (thickness   object) c-39))
      (t    (setf  (thickness   object) 0.0d0)))
    (cond
      ((and c-210 c-220 c-230) (setf  (normal   object) (vector c-210 c-220 c-230)))
      (t                       (setf  (normal   object) (vector 0.0d0 0.0d0 1.0d0))))
    (cond
      (c-50 (setf  (ecs-angle   object) c-50))
      (t    (setf  (ecs-angle   object) 0.0d0)))))

;;;; <acad-ray>

(defparameter *acad-ray-class-marker* "RAY")

(defparameter *acad-ray-subclass-marker* "AcDbRay")

(defclass <acad-ray> (<acad-entity>)
  ((base-point       :accessor base-point       :initarg :base-point       :initform (vector 0.0d0 0.0d0 0.0d0) :documentation "Код 10. Базовая точка")
   (direction-vector :accessor direction-vector :initarg :direction-vector :initform (vector 1.0d0 0.0d0 0.0d0) :documentation "Код 11. Едининчный вектор в МСК, задающий направление")
;;;; (second-point :accessor second-point :initarg :second-point :initform nil :documentation "second-point")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415\"](RAY (DXF))
@begin[lang=txt](code)
См. ./dbray.h:class AcDbRay: public AcDbCurve
@end(code)
"))

(defparameter *acad-ray-properties*
  '(Application BasePoint DirectionVector Document EntityTransparency
    Handle HasExtensionDictionary Hyperlinks Layer Linetype
    LinetypeScale Lineweight Material ObjectID ObjectName OwnerID
    PlotStyleName SecondPoint TrueColor Visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-ray-properties* *acad-entity-properties*))

;;;;

(defmethod dxf-out-text ((x <acad-ray>) stream)
  (dxf/out/txt:pair 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-text  :after ((x <acad-ray>) stream)
  (dxf/out/txt:pair 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out/txt:3d-point 10 b-p stream)
    (dxf/out/txt:3d-point 11 u-d stream)))

(defmethod dxf-out-binary ((x <acad-ray>) stream)
  (dxf/out/bin:pair 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-binary  :after ((x <acad-ray>) stream)
  (dxf/out/bin:pair 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out/bin:3d-point 10 b-p stream)
    (dxf/out/bin:3d-point 11 u-d stream)))

;;;;

(defmethod  dxf-in-text  ((object <acad-ray>) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-ray-class-marker*)))

(defmethod  dxf-in-text :after ((object <acad-ray>) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (base-point object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (base-point object) (vector c-10 c-20 0d0)))
      (t                           (setf  (base-point object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (direction-vector object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (direction-vector object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (direction-vector object) (vector 1.d0 0.d0 0.d0))))))


;;;;;;;;

(defparameter *acad-xline-class-marker* "XLINE")

(defparameter *acad-xline-subclass-marker* "AcDbXline")

(defclass <acad-xline> (<acad-entity>)
  ((base-point :accessor base-point :initarg :base-point :initform (vector 0 0 0) :documentation "Код 10. Первая точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (direction-vector   :accessor direction-vector   :initarg :direction-vector   :initform (vector 1 0 0) :documentation "Код 40. Вектор единичного направления (в МСК). Файл DXF: значение X; приложение: 3D-вектор")
;;; (secondpoint :accessor secondpoint :initarg :secondpoint :initform nil :documentation "secondpoint")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A\"](XLINE (DXF))
@begin[lang=txt](code)
См. ./dbxline.h:class AcDbXline: public AcDbCurve
@end(code)
"))

(defparameter *acad-xline-properties* '(Application BasePoint
                                        DirectionVector Document EntityTransparency Handle
                                        HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
                                        Lineweight Material ObjectID ObjectName OwnerID PlotStyleName
                                        SecondPoint TrueColor Visible))

(reverse (mapcar #'dxf/utils:make-slot (set-difference
                                        *acad-xline-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x <acad-xline>) stream)
  (dxf/out/txt:pair 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-text  :after ((x <acad-xline>) stream)
  (dxf/out/txt:pair 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out/txt:3d-point 10 b-p stream)
    (dxf/out/txt:3d-point 11 u-d stream)))

(defmethod dxf-out-binary ((x <acad-xline>) stream)
  (dxf/out/bin:pair 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-binary  :after ((x <acad-xline>) stream)
  (dxf/out/bin:pair 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out/bin:3d-point 10 b-p stream)
    (dxf/out/bin:3d-point 11 u-d stream)))

;;;;

(defmethod  dxf-in-text  ((object <acad-xline>) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-xline-class-marker*)))

(defmethod  dxf-in-text :after ((object <acad-xline>) (pairs cons))
  (let (
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	)
    (cond
      ((and c-10 c-20 c-30)        (setf  (base-point object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30)) (setf  (base-point object) (vector c-10 c-20 0d0)))
      (t                           (setf  (base-point object) (vector 0d0 0d0 0d0))))
    (cond
      ((and c-11 c-21 c-31)        (setf  (direction-vector object) (vector c-11 c-21 c-31)))
      ((and c-11 c-21 (null c-31)) (setf  (direction-vector object) (vector c-11 c-21 0.d0)))
      (t                           (setf  (direction-vector object) (vector 1.d0 0.d0 0.d0))))))

;;;;;;;;

(defparameter *Acad-Circle-class-marker* "CIRCLE")

(defparameter *Acad-Circle-subclass-marker* "AcDbCircle")

(defclass  <acad-circle> (<acad-entity>) 
  ((center    :accessor center     :initarg :center    :initform (vector 0 0 0)
              :documentation
              "Код 10. Центральная точка (в ОСК). Файл DXF: значение
              X; приложение: 3D-точка")
   (radius    :accessor radius     :initarg :radius    :initform 1
              :documentation "Код 40. Радиус")
   (thickness :accessor thickness  :initarg :thickness :initform 0
              :documentation
              "Код 39. Толщина (необязательно; значение по умолчанию =
              0)")
   (normal    :accessor normal     :initarg :normal    :initform (vector 0 0 1)
              :documentation
              "Код 210. Направление выдавливания (необязательно;
   значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение:
   3D-вектор")
   ;;;; (area)  (circumference)  (diameter)
   )
  (:documentation
   "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18\"](CIRCLE (DXF) RUS)

@link[uri=\"https://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18\"](CIRCLE (DXF) ENU)

@begin[lang=txt](code)
См. ./dbents.h:class AcDbCircle: public AcDbCurve
@end(code)
"))

(defmethod dxf-out-text ((x <Acad-Circle>) stream)
  (dxf/out/txt:pair 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-text  :after ((x <Acad-Circle>) stream)
  (dxf/out/txt:pair 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out/txt:pair 39 th stream))
    (dxf/out/txt:3d-point 10 p-c stream)
    (dxf/out/txt:pair 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/txt:3d-point 210 nrm stream))))

;;;;

(defmethod dxf-out-binary ((x <Acad-Circle>) stream)
  (dxf/out/bin:pair 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-binary :after ((x <Acad-Circle>) stream)
  (dxf/out/bin:pair 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out/bin:pair 39 th stream))
    (dxf/out/bin:3d-point 10 p-c stream)
    (dxf/out/bin:pair 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/bin:3d-point 210 nrm stream))))

;;;;

(defmethod  dxf-in-text  ((object <Acad-Circle>) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *Acad-Circle-class-marker*))))

(defmethod  dxf-in-text :after ((object <Acad-Circle>) (pairs cons))
  (let ((c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (if  c-39 (setf  (thickness object) c-39)
	 (setf  (thickness object) 0.0d0))
    (if  c-40 (setf  (radius object) c-40)
	 (setf  (radius object) 1.0d0))
    (if (and c-10 c-20 c-30)
	(setf  (center object) (vector c-10 c-20 c-30))
	(setf  (center object) (vector 0.0d0 0.0d0 0.0d0)))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))
    ))

;;;;;;;;

(defparameter *acad-arc-class-marker* "ARC")

(defparameter *acad-arc-subclass-marker* "AcDbArc")

(defclass <acad-arc> (<acad-entity>)
  ((center      :accessor center      :initarg :center      :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в ОСК). Файл DXF: значение X; приложение: 3D-точка")
   (radius      :accessor radius      :initarg :radius      :initform 1              :documentation "Код 40. Радиус")
   (thickness   :accessor thickness   :initarg :thickness   :initform 0              :documentation "Код 39. Толщина (необязательно; значение по умолчанию = 0)")
   (normal      :accessor normal      :initarg :normal      :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-angle :accessor start-angle :initarg :start-angle :initform 0              :documentation "Код 50. Начальный угол")
   (end-angle   :accessor end-angle   :initarg :end-angle   :initform (* -1 pi)      :documentation "Код 51. Конечный угол")
;(totalangle :accessor totalangle :initarg :totalangle :initform nil :documentation "totalangle")
;(startpoint :accessor startpoint :initarg :startpoint :initform nil :documentation "startpoint")
;(endpoint :accessor endpoint :initarg :endpoint :initform nil :documentation "endpoint")
;(area :accessor area :initarg :area :initform nil :documentation "area")
;(arclength :accessor arclength :initarg :arclength :initform nil :documentation "arclength")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8\"](ARC (DXF))
@begin[lang=txt](code)
./dbents.h:class AcDbArc: public AcDbCurve
@end(code)
"))

(defparameter *acad-arc-properties*
  '(Application ArcLength Area Center Document EndAngle EndPoint
    EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer
    Linetype LinetypeScale Lineweight Material Normal ObjectID
    ObjectName OwnerID PlotStyleName Radius StartAngle StartPoint
    Thickness TotalAngle TrueColor Visible))

(reverse (mapcar #'dxf/utils:make-slot
                 (set-difference *acad-arc-properties*
                                 *acad-entity-properties*)))

(defmethod dxf-out-text ((x <acad-arc>) stream)
  (dxf/out/txt:pair 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-arc>) stream)
  (dxf/out/txt:pair 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf/out/txt:pair 39 th stream))
    (dxf/out/txt:3d-point 10 p-c stream)
    (dxf/out/txt:pair 40 rad stream)
    (dxf/out/txt:pair 100 *acad-arc-subclass-marker* stream)
    (dxf/out/txt:pair 50 s-a stream)
    (dxf/out/txt:pair 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/txt:3d-point 210 nrm stream))))

(dxf/out/txt:3d-point 210 (vector 1 2 3)t)
;;;;

(defmethod dxf-out-binary ((x <acad-arc>) stream)
  (dxf/out/bin:pair 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-arc>) stream)
  (dxf/out/bin:pair 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf/out/bin:pair 39 th stream))
    (dxf/out/bin:3d-point 10 p-c stream)
    (dxf/out/bin:pair 40 rad stream)
    (dxf/out/bin:pair 100 *acad-arc-subclass-marker* stream)
    (dxf/out/bin:pair 50 s-a stream)
    (dxf/out/bin:pair 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/bin:3d-point 210 nrm stream))))

;;;;

(defmethod  dxf-in-text  ((object <acad-arc>) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-arc-class-marker*))))

(defmethod  dxf-in-text :after ((object <acad-arc>) (pairs cons))
  (let (
	(c-39  (cadr (assoc  39 pairs :test #'equal)))
	(c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-50  (cadr (assoc  50 pairs :test #'equal)))
	(c-51  (cadr (assoc  51 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (if  c-39 (setf  (thickness object) c-39)
	 (setf  (thickness object) 0.0d0))
    (cond
      ((and c-10 c-20 c-30)
       (setf  (center object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30))
       (setf  (center object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object <acad-arc>) (pairs cons)): wrong values c-10 c-20 c-30 ~A ~A ~A" c-10 c-20 c-30)))
    (if  c-40 (setf  (radius object) c-40)
	 (setf  (radius object) 1.0d0))
    (if  c-50 (setf  (start-angle object) c-50)
	 (error "dxf-in-text :after ((object <acad-arc>) (pairs cons)) c-50 not defined"))
    (if  c-51 (setf  (end-angle object) c-51)
	 (error "dxf-in-text :after ((object <acad-arc>) (pairs cons)) c-51 not defined"))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))))
;;;;;;;;

(defparameter *acad-text-class-marker* "TEXT")

(defparameter *acad-text-subclass-marker* "AcDbText")

(defclass <acad-text> (<acad-entity>)
  ((thickness            :accessor thickness            :initarg :thickness            :initform 0              :documentation "Код  39. Thickness (optional; default = 0)")
   (insertion-point      :accessor insertion-point      :initarg :insertion-point      :initform (vector 0 0 0) :documentation "Код  10. First alignment point (in OCS) DXF: X value; APP: 3D point")
   (height               :accessor height               :initarg :height               :initform 3.5            :documentation "Код  40. Text height")
   (text-string          :accessor text-string          :initarg :text-string          :initform ""             :documentation "Код   1. Default value (the string itself)")
   (rotation             :accessor rotation             :initarg :rotation             :initform 0              :documentation "Код  50. Text rotation (optional; default = 0)")
   (scale-factor         :accessor scale-factor         :initarg :scale-factor         :initform 1              :documentation "Код  41. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (oblique-angle        :accessor oblique-angle        :initarg :oblique-angle        :initform 0              :documentation "Код  51. Relative X scale factor-width (optional; default = 1) This value is also adjusted when fit-type text is used")
   (style-name           :accessor style-name           :initarg :style-name           :initform "STANDARD"     :documentation "Код   7. Text style name (optional, default = STANDARD)")
   (mirror-in-xy         :accessor mirror-in-xy         :initarg :mirror-in-xy         :initform 0              :documentation "Код  71. Text generation flags (optional, default = 0): 2 = Text is backward (mirrored in X) ; 4 = Text is upside down (mirrored in Y)")
;;;(backward :accessor backward :initarg :backward :initform nil :documentation "backward")  
;;;(upsidedown :accessor upsidedown :initarg :upsidedown :initform nil :documentation "upsidedown")
   (text-alignment-point :accessor text-alignment-point :initarg :text-alignment-point :initform (vector 0 0 0) :documentation "Код  11. Second alignment point (in OCS) (optional). DXF: X value; APP: 3D point. This value is meaningful only if the value of a 72 or 73 group is nonzero (if the justification is anything other than baseline/left)")
   (normal               :accessor normal               :initarg :normal               :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (hor-justification    :accessor hor-justification    :initarg :hor-justification    :initform 0              :documentation "Код  72. Horizontal text justification type (optional, default = 0) integer codes (not bit-coded). 0 = Left; 1= Center; 2 = Right; 3 = Aligned (if vertical alignment = 0); 4 = Middle (if vertical alignment = 0); 5 = Fit (if vertical alignment = 0). See the Group 72 and 73 integer codes table for clarification")
   (ver-justification    :accessor ver-justification    :initarg :ver-justification    :initform 0              :documentation "Код  73. Vertical text justification type (optional, default = 0): integer codes (not bit-coded): 0 = Baseline; 1 = Bottom; 2 = Middle; 3 = Top. See the Group 72 and 73 integer codes table for clarification")
;;;;(alignment :accessor alignment :initarg :alignment :initform nil :documentation "alignment")
;;;;(textgenerationflag :accessor textgenerationflag :initarg :textgenerationflag :initform nil :documentation "textgenerationflag")   
   )

  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363\"](TEXT (DXF))
@begin[lang=txt](code)
См. ./dbents.h:class AcDbText: public AcDbEntity
@end(code)
"))

(defparameter *acad-text-properties*
  '(Alignment Application Backward Document EntityTransparency Handle
    HasExtensionDictionary Height Hyperlinks InsertionPoint Layer Linetype
    LinetypeScale Lineweight Material Normal ObjectID ObjectName
    ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor StyleName
    TextAlignmentPoint TextGenerationFlag TextString Thickness TrueColor
    UpsideDown Visible))

(mapcar #'dxf/utils:make-slot (set-difference *acad-text-properties* *acad-entity-properties*))


(defmethod dxf-out-text ((x <acad-text>) stream)
    (dxf/out/txt:pair 0 *acad-text-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-text>) stream)
  (dxf/out/txt:pair 100 *acad-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (insertion-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (scale-factor x))
	(ob  (oblique-angle x))
	(st  (style-name x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (text-alignment-point x))
	;;(a-p-x (svref (normal x) 0))
	;;(a-p-y (svref (normal x) 1))
	;;(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (dxf/out/txt:pair 39 th stream))
    (dxf/out/txt:3d-point 10 p-p stream)
    (dxf/out/txt:pair 40 h stream)
    (dxf/out/txt:pair 1 t-s stream)
    (dxf/out/txt:pair 50 (* *radian-to-degree* rot) stream)
    (dxf/out/txt:pair 41 w-f stream)
    (dxf/out/txt:pair 51 (* *radian-to-degree* ob) stream)
    (dxf/out/txt:pair 7 st stream)
    (unless (= mir 0) (dxf/out/txt:pair 71 mir stream))
    (unless (= h-j 0) (dxf/out/txt:pair 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf/out/txt:3d-point 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/txt:3d-point 210 nrm stream))
    (dxf/out/txt:pair 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf/out/txt:pair 73 v-j stream))))

;;;;

(defmethod dxf-out-binary ((x <acad-text>) stream)
  (dxf/out/bin:pair 0 *acad-text-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-text>) stream)
  (dxf/out/bin:pair 100 *acad-text-subclass-marker* stream)
  (let ((th (thickness x))
	(p-p (insertion-point x))
	(h   (height x))
	(t-s (text-string x))
	(rot (rotation x))
	(w-f (scale-factor x))
	(ob  (oblique-angle x))
	(st  (style-name x))
	(mir (mirror-in-xy x))
	(h-j  (hor-justification x))
	(a-p (text-alignment-point x))
	;(a-p-x (svref (normal x) 0))
	;(a-p-y (svref (normal x) 1))
	;(a-p-z (svref (normal x) 2))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(v-j (ver-justification x)))
    (unless (= th 0) (dxf/out/bin:pair 39 th stream))
    (dxf/out/bin:3d-point 10 p-p stream)
    (dxf/out/bin:pair 40 h stream)
    (dxf/out/bin:pair 1 t-s stream)
    (dxf/out/bin:pair 50 (* *radian-to-degree* rot) stream)
    (dxf/out/bin:pair 41 w-f stream)
    (dxf/out/bin:pair 51 (* *radian-to-degree* ob) stream)
    (dxf/out/bin:pair 7 st stream)
    (unless (= mir 0) (dxf/out/bin:pair 71 mir stream))
    (unless (= h-j 0) (dxf/out/bin:pair 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf/out/bin:3d-point 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out/bin:3d-point 210 nrm stream))
    (dxf/out/bin:pair 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf/out/bin:pair 73 v-j stream))))

;;;;;;;;

(defparameter *acad-ellipse-class-marker* "ELLIPSE")

(defparameter *acad-ellipse-subclass-marker* "AcDbEllipse")

(defclass <acad-ellipse> (<acad-entity>)
  (
;;;(area         :accessor area         :initarg :area         :initform nil            :documentation "area")
   (center       :accessor center       :initarg :center       :initform (vector 0 0 0) :documentation "Код 10. Центральная точка (в МСК). Файл DXF: значение X; приложение: 3D-точка")
   (major-axis   :accessor major-axis   :initarg :major-axis   :initform (vector 1 0 0) :documentation "Код 11. Конечная точка главной оси относительно центральной точки (в МСК) (mapcar #'+ center major-axis)")
;;;(majorradius :accessor majorradius :initarg :majorradius :initform nil :documentation "majorradius")
;;;(minoraxis :accessor minoraxis :initarg :minoraxis :initform nil :documentation "minoraxis")
;;;(minorradius :accessor minorradius :initarg :minorradius :initform nil :documentation "minorradius")

   (normal          :accessor normal          :initarg :normal          :initform (vector 0 0 1) :documentation "Код 210. Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1). Файл DXF: значение X; приложение: 3D-вектор")
   (start-parameter :accessor start-parameter :initarg :start-parameter :initform 0.0d0 :documentation "startparameter")
;;;(startangle :accessor startangle :initarg :startangle :initform nil :documentation "startangle")
;;;(startpoint :accessor startpoint :initarg :startpoint :initform nil :documentation "startpoint"))
   (end-parameter   :accessor end-parameter   :initarg :end-parameter    :initform (* 2.0d0 pi)       :documentation "Код 42. Конечный параметр")
;;;(endangle :accessor endangle :initarg :endangle :initform nil :documentation "endangle")
;;;(endpoint :accessor endpoint :initarg :endpoint :initform nil :documentation "endpoint")
   (radius-ratio :accessor radius-ratio :initarg :radius-ratio :initform 0.5d0          :documentation "Код 40. Соотношение малой и главной осей"))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB\"](ELLIPSE (DXF))
@begin[lang=txt](code)
См. ./dbelipse.h:class AcDbEllipse: public  AcDbCurve
@end(code)
"))

(defparameter *acad-acad-ellipse-properties*
  '(Application Area Center
    Document EndAngle EndParameter EndPoint EntityTransparency Handle
    HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale
    Lineweight MajorAxis MajorRadius Material MinorAxis MinorRadius Normal
    ObjectID ObjectName OwnerID PlotStyleName RadiusRatio StartAngle
    StartParameter StartPoint TrueColor Visible))

(reverse (mapcar #'dxf/utils:make-slot
                 (set-difference *acad-acad-ellipse-properties*
                                 *acad-entity-properties*)))

(defmethod dxf-out-text ((x <acad-ellipse>) stream)
  (dxf/out/txt:pair 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-ellipse>) stream)
  (dxf/out/txt:pair 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf/out/txt:3d-point 10 p-c stream)
    (dxf/out/txt:3d-point 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf/out/txt:3d-point 210 u-n stream))
    (dxf/out/txt:pair 40 r-r stream)
    (dxf/out/txt:pair 41 s-p stream)
    (dxf/out/txt:pair 42 e-p stream)))

;;;;

(defmethod dxf-out-binary ((x <acad-ellipse>) stream)
  (dxf/out/bin:pair 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-ellipse>) stream)
  (dxf/out/bin:pair 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf/out/bin:3d-point 10 p-c stream)
    (dxf/out/bin:3d-point 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf/out/bin:3d-point 210 u-n stream))
    (dxf/out/bin:pair 40 r-r stream)
    (dxf/out/bin:pair 41 s-p stream)
    (dxf/out/bin:pair 42 e-p stream)))

;;;;

(defmethod  dxf-in-text  ((object <acad-ellipse>) (pairs cons))
  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*))))

(defmethod  dxf-in-text :after ((object <acad-ellipse>) (pairs cons))
  (let ((c-10  (cadr (assoc  10 pairs :test #'equal)))
	(c-20  (cadr (assoc  20 pairs :test #'equal)))
	(c-30  (cadr (assoc  30 pairs :test #'equal)))
	(c-11  (cadr (assoc  11 pairs :test #'equal)))
	(c-21  (cadr (assoc  21 pairs :test #'equal)))
	(c-31  (cadr (assoc  31 pairs :test #'equal)))
	(c-40  (cadr (assoc  40 pairs :test #'equal)))
	(c-41  (cadr (assoc  41 pairs :test #'equal)))
	(c-42  (cadr (assoc  42 pairs :test #'equal)))
	(c-210 (cadr (assoc 210 pairs :test #'equal)))
	(c-220 (cadr (assoc 220 pairs :test #'equal)))
	(c-230 (cadr (assoc 230 pairs :test #'equal))))
    (cond
      ((and c-10 c-20 c-30)
       (setf  (center object) (vector c-10 c-20 c-30)))
      ((and c-10 c-20 (null c-30))
       (setf  (center object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object <acad-ellipse>) (pairs cons)): wrong values c-10 c-20 c-30 ~A ~A ~A" c-10 c-20 c-30)))
    (cond
      ((and c-11 c-21 c-31)
       (setf  (major-axis object) (vector c-10 c-20 c-30)))
      ((and c-11 c-21 (null c-31))
       (setf  (major-axis object) (vector c-10 c-20 0.d0)))
      (t (error "dxf-in-text :after ((object <acad-ellipse>) (pairs cons)): wrong values c-11 c-21 c-31 ~A ~A ~A" c-11 c-21 c-31)))
    (if  c-40
	 (setf  (radius-ratio object) c-40)
	 (error "dxf-in-text :after ((object <acad-ellipse>) (pairs cons)): c-40 not defined"))
    (if  c-41
	 (setf  (start-parameter object) c-41)
	 (error "dxf-in-text :after ((object <acad-ellipse>) (pairs cons)): c-41 not defined"))
    (if  c-42   (setf  (end-parameter object) c-42)
	 (error "dxf-in-text :after ((object <acad-ellipse>) (pairs cons)): c-42 not defined"))
    (if (and c-210 c-220 c-230)
	(setf  (normal object) (vector c-210 c-220 c-230))
	(setf  (normal object) (vector 0.0d0 0.0d0 1.0d0)))))

;;;;;;;;

(defparameter *acad-symboltablerecord-subclass-marker* "AcDbSymbolTableRecord")

;;;;;;;;

(defparameter *acad-layer-class-marker* "LAYER")

(defparameter *acad-layer-subclass-marker* "AcDbLayerTableRecord")

(defclass <acad-layer> (<acad-object>)
;;;;"AcDbLayerTableRecord"
  ((name             :accessor name            :initarg :name            :initform "LAYER1"       :documentation "name")
   (description      :accessor description     :initarg :description     :initform nil            :documentation "description")
   (true-color        :accessor true-color       :initarg :true-color       :initform '(7 nil)       :documentation "Код  62. Номер цвета (если значение отрицательное, слой отключен)")
   (line-type        :accessor line-type       :initarg :line-type       :initform "Continuous"   :documentation "Код   6. Имя типа линий")
   (plottable        :accessor plottable       :initarg :plottable       :initform t              :documentation "Код 290. Флаг печати. Если задано значение 0, этот слой не выводится на печать")
   (plotstylename    :accessor plotstylename   :initarg :plotstylename   :initform nil            :documentation "Код 390. Идентификатор/дескриптор жесткого указателя на объект PlotStyleName")
   (line-weight      :accessor line-weight     :initarg :line-weight     :initform -3             :documentation "Код 370. Значение из перечисления весов линии")
   (material         :accessor material        :initarg :material        :initform nil            :documentation "Код 347. Идентификатор/дескриптор жесткого указателя на объект материала")
   (freeze           :accessor freeze          :initarg :freeze          :initform nil            :documentation "freeze")
   (layeron          :accessor layeron         :initarg :layeron         :initform t              :documentation "layeron")
   (lock             :accessor lock            :initarg :lock            :initform nil            :documentation "lock")
   (used             :accessor used            :initarg :used            :initform nil            :documentation "used")
   (viewportdefault  :accessor viewportdefault :initarg :viewportdefault :initform nil            :documentation "viewportdefault")
;;;   (layer-tr-visual-style  :accessor layer-tr-visual-style :initarg :layer-tr-visual-style :initform nil            :documentation "Код 348? Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)?")
   )

  (:documentation "
@begin[lang=txt](code)

https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
https://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
====================================================================================================
@end(code)
" ))

(defparameter *acad-layer-properties*
  '(Application Description Document Freeze Handle
    HasExtensionDictionary LayerOn Linetype Lineweight Lock Material
    Name ObjectID ObjectName OwnerID PlotStyleName Plottable TrueColor
    Used ViewportDefault ))

(reverse (mapcar #'dxf/utils:make-slot (set-difference *acad-layer-properties* *acad-object-properties*)))

;;;;

(defmethod dxf-out-text ((x <acad-layer>) stream)
  (dxf/out/txt:pair 0 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-layer>) stream)
  (dxf/out/txt:pair 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf/out/txt:pair 100 *acad-layer-subclass-marker* stream)
  (let ((name            (name            x))
	(freeze          (freeze          x))
	(viewportdefault (viewportdefault x))
	(lock            (lock x))
	(used            (used            x))
	(layeron         (if (layeron x) 1 -1))
	(plottable       (if (null (plottable x)) 0 1))
	(cl              (true-color x))
        (l-ltype         (line-type x))
	(l-lweight       (line-weight x))
	(l-pstyle        (plotstylename x))
	(l-mat           (material x))
;;;	(l-vstyle        (layer-tr-visual-style x))
	(c-70            0))
    (block c-70
      (when freeze          (setf c-70 (dpb 1 (byte 1 0) c-70)))
      (when viewportdefault (setf c-70 (dpb 1 (byte 1 1) c-70)))
      (when lock            (setf c-70 (dpb 1 (byte 1 2) c-70)))
;;; (when lock            (setf c-70 (dpb 1 (byte 1 3) c-70)))
;;; (when lock            (setf c-70 (dpb 1 (byte 1 4) c-70)))
      (when used            (setf c-70 (dpb 1 (byte 1 5) c-70))))
    (dxf/out/txt:pair  2 name   stream)
    (dxf/out/txt:pair  70 c-70   stream)
    (cond
      ((= 0   (first cl)) (dxf/out/txt:pair 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf/out/txt:pair 62 (* (first cl) layeron) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf/out/txt:pair  62 (* (first cl) layeron) stream)
       (dxf/out/txt:pair 420 (dxf/color:rgb->true (second cl)) stream)))
    (dxf/out/txt:pair         6 l-ltype   stream)
    (dxf/out/txt:pair       290 plottable stream)
    (dxf/out/txt:pair       370 l-lweight stream)
    (dxf/out/txt:pair       390 l-pstyle  stream)
    (dxf/out/txt:pair       347 l-mat     stream)
;;; (dxf/out/txt:pair       348 l-vstyle  stream)
    ))

;;;;

(defmethod  dxf-in-text  ((object <acad-layer>) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-layer-class-marker*))
;;; (break "dxf-in-text  ((object <acad-layer>) (pairs cons))")
  )

(defmethod  dxf-in-text :after ((object <acad-layer>) (pairs cons))
;;; (break "dxf-in-text :after ((object <acad-layer>) (pairs cons))")
  (let ((c-2   (cadr (assoc   2 pairs :test #'equal)))
	(c-70  (cadr (assoc  70 pairs :test #'equal)))
	(c-62  (cadr (assoc  62 pairs :test #'equal)))
	(c-420 (cadr (assoc 420 pairs :test #'equal)))
	(c-6   (cadr (assoc   6 pairs :test #'equal)))
	(c-290 (cadr (assoc 290 pairs :test #'equal)))
	(c-370 (cadr (assoc 370 pairs :test #'equal)))
	(c-390 (cadr (assoc 390 pairs :test #'equal)))
	(c-347 (cadr (assoc 347 pairs :test #'equal)))
	;; (c-348 (cadr (assoc 348 pairs :test #'equal)))
	)
    (cond
      (c-2 (setf  (name object) c-2))
      ((error "dxf-in-text :after ((object <acad-layer>) (pairs cons)): c-2 not exist.")))
    (cond
      (c-390 (setf  (plotstylename object) c-390))
      ((error "dxf-in-text :after ((object <acad-layer>) (pairs cons)): c-390 not exist.")))
    (cond
      (c-347 (setf  (material object) c-347))
      ((error "dxf-in-text :after ((object <acad-layer>) (pairs cons)): c-347 not exist.")))
    (when c-70
      (setf  (freeze          object) (= 1 (ldb (byte 1 0) c-70)))
      (setf  (viewportdefault object) (= 1 (ldb (byte 1 1) c-70)))
      (setf  (lock            object) (= 1 (ldb (byte 1 2) c-70)))
;;;; (setf  (lock            object) (= 1 (ldb (byte 1 3) c-70)))
;;;; (setf  (lock            object) (= 1 (ldb (byte 1 4) c-70)))
      (setf  (used            object) (= 1 (ldb (byte 1 5) c-70))))
    (cond
      ((and c-62 c-420)
       (setf (true-color object)
	     (list (abs c-62) (dxf/color:true->rgb   c-420))))
      (c-62
       (setf (true-color object)
	     (list (abs c-62) nil)))
      (t
       (setf (true-color object) (list 256 nil))))
    (when c-62  (setf (layeron    object) (not (minusp c-62))))
    (when c-6   (setf (line-type  object) c-6))
    (when c-290 (setf (plottable  object) (if (/= 0 c-290) t nil)))
    (cond
      ((null    c-370) (setf (line-weight object) -3))
      ((numberp c-370) (setf (line-weight object) c-370))
      (t (error "dxf-in-text :after ((object <acad-entity>) (pairs cons)): wrong c-370 value ~A" c-370)))
    ))

;;;;;;;;

(defparameter *acad-symboltable-subclass-marker* "AcDbSymbolTable")

(defclass <acad-layers> (<acad-object>)
  ((a-count  :accessor a-count :initarg :a-count :initform 0   :documentation "70 a-count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)")
   )
  (:documentation "
@begin[lang=txt](code)
@end(code)
"))

(defparameter *acad-layers-properties*
  '(Application A-Count Document Handle HasExtensionDictionary
    ObjectID ObjectName OwnerID))

(reverse (mapcar #'dxf/utils:make-slot (set-difference *acad-layers-properties* *acad-object-properties*)))

(defmethod dxf-out-text ((x <acad-layers>) stream)
  (dxf/out/txt:pair 2 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-layers>) stream)
  (dxf/out/txt:pair 100 *acad-symboltable-subclass-marker* stream)
  (let ((a-count (a-count x))
	(items   (items   x)))
    (dxf/out/txt:pair  70 a-count   stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) items)))

;;;;

(defmethod dxf-in-text  ((object <acad-layers>) (tables cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object)

(defmethod dxf-in-text :after ((object <acad-layers>) (tables cons))
  (multiple-value-bind (items-data list-item-data) (table-and-items *acad-layer-class-marker* tables)
    (setf (items object)
	  (mapcar
	   #'(lambda (item-data)
	       (let ((it (make-instance '<acad-layer>)))
		 (dxf-in-text it item-data)
		 it))
	   list-item-data)
	  (a-count  object ) (length (items object)))))
 
;;;;;;;;

(defclass <acad-documents> (<acad-object>)
  ((application              :accessor application              :initarg :application              :initform nil :documentation "application")
   (a-count                    :accessor a-count                    :initarg :a-count                    :initform nil :documentation "a-count"))
  (:documentation "
@begin[lang=txt](code)
The collection of all AutoCAD drawings that are open in the current session.
@end(code)"))

(defclass <acad-database> (<object>)
  ((ac-variables :accessor ac-variables :initarg :ac-variables :initform nil :documentation "ac-variables")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
   (blocks
    :accessor blocks                   :initarg :blocks                   :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4E432456-907D-467E-A060-3F5AFCCBCCDD\"](Blocks Property (ActiveX))")
   (dictionaries
    :accessor dictionaries             :initarg :dictionaries             :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5E577FF6-F939-4798-9700-3A3278EA84F4\"]()")
   (dimstyles
    :accessor dimstyles               :initarg :dimstyles               :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9CEE2A14-EF1C-484C-A930-3B8040981FAA\"](DimStyles Property (ActiveX))")
   (elevationmodelspace
    :accessor elevationmodelspace    :initarg :elevationmodelspace    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-0CD217EF-B8A0-4338-965C-FDD4DF51F505\"](ElevationModelSpace Property (ActiveX))")
   (elevationpaperspace
    :accessor elevationpaperspace    :initarg :elevationpaperspace    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-58391345-3F39-43E4-90F5-A0F3ADF51F6E\"](ElevationPaperSpace Property (ActiveX))")
   (groups
    :accessor groups                   :initarg :groups                   :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-61422D1A-B391-4528-968A-04A7B7A590F2\"](Groups Property (ActiveX))")
   (layers
    :accessor layers
    :initarg :layers
    :initform (make-instance '<acad-layers>)
    :documentation "layers")
   (layouts
    :accessor layouts                  :initarg :layouts                  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4D435BCF-BD83-46D6-9940-8CA519F29272\"](Layouts Property (ActiveX))")
   (limits
    :accessor limits                   :initarg :limits                   :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-30E059A2-A0C0-4F1A-B021-0478AF950D6E\"](Limits Property (ActiveX))")
   (linetypes
    :accessor linetypes :initarg :linetypes :initform (make-instance '<acad-linetypes>)
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-BADF9960-D671-46DC-B887-334D72A4B295\"](Linetypes Property (ActiveX))")
   (material
    :accessor material                 :initarg :material                 :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-291D29B4-D327-424B-B9F5-DB46E99D0F27\"](Material Property (ActiveX))")
   (ac-model-space
    :accessor ac-model-space           :initarg :ac-model-space           :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5A488EA7-C843-4994-8D66-03B7745EC80D\"](ModelSpace Property (ActiveX))")
   (paperspace
    :accessor paperspace              :initarg :paperspace              :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-740E6C3D-4EA9-4202-96D0-F8ACF0C92DC8\"](PaperSpace Property (ActiveX))")
   (plotconfigurations
    :accessor plotconfigurations      :initarg :plotconfigurations      :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CCF26567-0714-40F4-9895-856A1722C891\"](PlotConfigurations Property (ActiveX))")
   (preferences
    :accessor preferences              :initarg :preferences              :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CEA64734-E3BE-441F-A586-2F954AA8403E\"](Preferences Property (ActiveX))")
   (registeredapplications
    :accessor registeredapplications  :initarg :registeredapplications  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31073EC8-7827-4617-A3D2-7ED1760EFC59\"](RegisteredApplications Property (ActiveX))")
   (sectionmanager
    :accessor sectionmanager          :initarg :sectionmanager          :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-877A384A-4B16-4651-9DDA-939F70476DED\"](SectionManager Property (ActiveX))")
   (summaryinfo
    :accessor summaryinfo             :initarg :summaryinfo             :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-B1AB773D-8EA7-4DA6-95BB-38DAF1F34DEC\"](SummaryInfo Property (ActiveX))")
   (textstyles
    :accessor textstyles              :initarg :textstyles              :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-37275969-EA77-4358-A559-FB804EA5179F\"](TextStyles Property (ActiveX))")
   (usercoordinatesystems
    :accessor usercoordinatesystems  :initarg :usercoordinatesystems  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1121D09A-27D8-4289-8D8C-03A3339D95BA\"](UserCoordinateSystems Property (ActiveX))")
   (viewports
    :accessor viewports                :initarg :viewports                :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DA1A71A-DEA1-4136-B057-A6EE915EF001\"](Viewports Property (ActiveX))")
   (views
    :accessor views                    :initarg :views                    :initform nil
    :documentation"@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-DD4ED21D-EF6A-4FAD-99C5-3A08BEF12101\"](Views Property (ActiveX))"))
  (:documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-31D8D654-572D-4D2B-A138-4D8793ECE135\"](Database Object (ActiveX))"))

;;;;;;;;

(defparameter *acad-database-properties*
  '(Blocks Dictionaries DimStyles ElevationModelSpace
    ElevationPaperSpace Groups Layers Layouts Limits Linetypes Material
    ModelSpace PaperSpace PlotConfigurations Preferences
    RegisteredApplications SectionManager SummaryInfo TextStyles
    UserCoordinateSystems Viewports Views))

(mapcar #'dxf/utils:make-slot (set-difference *acad-database-properties* nil))

(defclass <acad-document> (<acad-database>)
  ((active
    :accessor active                :initarg :active                :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-C56733CC-704D-4F9D-9C78-7EA9DFC40799\"](Active Property (ActiveX))")
   (activedimstyle
    :accessor activedimstyle        :initarg :activedimstyle        :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-06023FAF-A279-443F-88D5-04735E557D95\"](ActiveDimStyle Property (ActiveX)) ")
   (activelayer
    :accessor activelayer           :initarg :activelayer           :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1ECB5739-A11D-4B19-9F2B-994A680D94BF\"](ActiveLayer Property (ActiveX))")
   (activelayout
    :accessor activelayout          :initarg :activelayout          :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-362525D2-1F6D-40BB-97FD-B83D668D7851\"](ActiveLayout Property (ActiveX))")
   (activelinetype
    :accessor activelinetype        :initarg :activelinetype        :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E93FD0AE-F63F-4655-B5A6-AAB30288D663\"](ActiveLinetype Property (ActiveX))")
   (activematerial
    :accessor activematerial        :initarg :activematerial        :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5478BDCD-0B51-46AE-A51A-0DB42D1925FD\"](ActiveMaterial Property (ActiveX))")
   (activepviewport
    :accessor activepviewport       :initarg :activepviewport       :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-4ABA8345-CB2B-4F56-A4FF-4B221DB51B27\"](ActivePViewport Property (ActiveX))")
   (activeselectionset
    :accessor activeselectionset    :initarg :activeselectionset    :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-3F917B84-B086-4995-9577-E2C73051BF2C\"](ActiveSelectionSet Property (ActiveX))")
   (activespace
    :accessor activespace           :initarg :activespace           :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7CDD9455-21E1-42BB-ADA4-D39ABF2FB4A3\"](ActiveSpace Property (ActiveX))")
   (activetextstyle
    :accessor activetextstyle       :initarg :activetextstyle       :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1D9D9A7D-7429-402D-90B8-387903FD5D08\"](ActiveTextStyle Property (ActiveX))")
   (activeucs
    :accessor activeucs             :initarg :activeucs             :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F806BFBE-6291-44B9-AE48-CD960B7CB8D1\"](ActiveUCS Property (ActiveX))")
   (activeviewport
    :accessor activeviewport        :initarg :activeviewport        :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8EA574F1-AEB1-4940-BB9F-02AFE5B6C630\"](ActiveViewport Property (ActiveX))")
   (application
    :accessor application           :initarg :application           :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-41478919-F833-4273-9EBC-B57C5FF792D4\"](Application Property (ActiveX))")
   (database
    :accessor database              :initarg :database              :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6FC179C1-EBE2-4F13-91B3-760B6D2AB7A5\"](Database Property (ActiveX))")
   (fullname
    :accessor fullname              :initarg :fullname              :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1738D847-ACED-491B-9B5C-CDC781A89BEB\"](FullName Property (ActiveX))")
   (height
    :accessor height                :initarg :height                :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EB797768-80BE-4A07-95A3-34F3CD61D5A3\"](Height Property (ActiveX))")
   (hwnd
    :accessor hwnd                  :initarg :hwnd                  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-79FF9339-5361-4E73-A8F9-0F72C5E03DC1\"](HWND Property (ActiveX))")
   (materials
    :accessor materials             :initarg :materials             :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CC0B448B-532C-48F8-A93C-9FE435C5BCFD\"](Materials Property (ActiveX))")
   (mspace
    :accessor mspace                :initarg :mspace                :initform nil
    :documentation
    "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-FC5EE356-D978-47B8-A8B2-CDDFA4CA3415\"] (MSpace Property (ActiveX))")
   (name
    :accessor name                  :initarg :name                  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5656E0DF-64F4-4117-BA31-64E6C2C55877\"](Name Property (ActiveX))")
   (objectsnapmode
    :accessor objectsnapmode        :initarg :objectsnapmode        :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E7E097DE-098F-48C9-A4C2-69AEBD56F30A\"](ObjectSnapMode Property (ActiveX))")
   (path
    :accessor path                  :initarg :path                  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-252F6CDA-B400-4EF5-A3F6-FD0E54A4CA40\"](Path Property (ActiveX))")
   (pickfirstselectionset
    :accessor pickfirstselectionset :initarg :pickfirstselectionset :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-D48A1C37-4223-4AAA-B1DC-A746604C49B3\"](PickfirstSelectionSet Property (ActiveX))")
   (plot
    :accessor plot                  :initarg :plot                  :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-7C66D011-6130-4463-935F-26D92D6C83F3\"](Plot Property (ActiveX))")
   (readonly
    :accessor readonly              :initarg :readonly              :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F907311B-2BFC-4498-BD1D-560D537F7FE8\"](ReadOnly Property (ActiveX))")
   (saved
    :accessor saved                 :initarg :saved                 :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-5CC922B2-DFB3-45B6-88BB-CB59ED62934E\"](Saved Property (ActiveX))")
   (selectionsets
    :accessor selectionsets         :initarg :selectionsets         :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-671644CD-D776-4743-88D4-C0F759EC5D89\"](SelectionSets Property (ActiveX))")
   (utility
    :accessor utility               :initarg :utility               :initform nil
    :documentation "@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-E1B12A7D-2BCA-4743-AE01-F9106ED4D982\"](Utility Property (ActiveX))")
   (width                 :accessor width                 :initarg :width                 :initform nil :documentation "width")
   (windowstate           :accessor windowstate           :initarg :windowstate           :initform nil :documentation "windowstate")
   (windowtitle           :accessor windowtitle           :initarg :windowtitle           :initform nil :documentation "windowtitle")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   #+nil (sec-header :accessor sec-header :initarg :sec-header :initform nil
                     :documentation
                     "header      - Представление секции HEADER")
   (sec-classes :accessor sec-classes :initform nil
                :documentation "classes     - Представление секции CLASSES")
   (sec-tables
    :accessor sec-tables :initform nil
    :documentation "tables     - Представление секции TABLES")
   (sec-blocks
    :accessor sec-blocks :initform nil
    :documentation
    "blocks     - Представление секции BLOCKS")
   (sec-entities
    :accessor sec-entities :initform nil
    :documentation
    "entities     - Представление секции ENTITIES")
   (sec-objects
    :accessor sec-objects :initform nil
    :documentation
    "objects     - Представление секции OBJECTS")
   (sec-acdsdata
    :accessor sec-acdsdata :initform nil
    :documentation
    "acdsdata     - Представление секции ACDSDATA")
   (sec-table-appid
    :accessor sec-table-appid :initform nil
    :documentation
    "table-appid - Представление секции TABLE-APPID"))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-9216BFCD-D358-4FC6-B631-B52E6693D242\"](Document Object (ActiveX))
 Methods 
 ac-Activate ac-Audit-Info ac-Close ac-Copy-Objects ac-End-Undo-Mark ac-Export ac-Get-Variable
 ac-Handle-To-Object ac-Import ac-Load-Shape-File ac-New ac-Object-ID-To-Object ac-Open
 ac-Post-Command ac-Purge-All ac-Regen ac-Save ac-Save-As ac-Send-Command ac-Set-Variable
 ac-Start-Undo-Mark ac-W-Block
"))

(defparameter *acad-document-properties*
  '(Active ActiveDimStyle ActiveLayer ActiveLayout ActiveLinetype
    ActiveMaterial ActivePViewport ActiveSelectionSet ActiveSpace
    ActiveTextStyle ActiveUCS ActiveViewport Application Blocks Database
    Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace
    FullName Groups Height HWND Layers Layouts Limits Linetypes
    Materials ModelSpace MSpace Name ObjectSnapMode PaperSpace Path
    PickfirstSelectionSet Plot PlotConfigurations Preferences ReadOnly
    RegisteredApplications Saved SectionManager SelectionSets
    SummaryInfo TextStyles UserCoordinateSystems Utility Viewports Views
    Width WindowState WindowTitle))

(reverse (mapcar #'dxf/utils:make-slot (set-difference *acad-document-properties* *acad-database-properties*)) )


(defmethod  dxf-in-text  ((object <acad-document>) (sections cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object
  )

(defmethod  dxf-in-text :after ((object <acad-document>) (sections cons))
  (let ((header  (split-header   sections))
	(classes (split-classes  sections))
	(tables  (split-tables   sections))
	)
    (setf (activedimstyle  object) (get-acad-variable-as-list "DIMSTYLE"   header))
    (setf (activelayer     object) (get-acad-variable-as-list "CLAYER"     header))

    (setf (activelinetype  object) (get-acad-variable-as-list "CELTYPE"    header))
    (setf (activematerial  object) (get-acad-variable-as-list "CMATERIAL"  header))
    (setf (activespace     object) (get-acad-variable-as-list "TILEMODE"   header))
    (setf (activetextstyle object) (get-acad-variable-as-list "TEXTSTYLE"  header))
;;;;
;;;    (setf (activelayout       object) (get-acad-variable-as-list "CLAYOUT"  header))    
;;;    (setf (activeviewport     object) (get-acad-variable-as-list "CLAYOUT"  header))
;;;    (setf (activepviewport    object) (get-acad-variable-as-list "CLAYOUT"  header))    
;;;    (setf (activeselectionset object) (get-acad-variable-as-list "CLAYOUT"  header))
;;;;	      
    (setf  (layers      object) (dxf-in-text (layers    object) tables))
    (setf  (linetypes   object) (dxf-in-text (linetypes object) tables))
;;;;	      
    (setf  (sec-header  object) header)
    (setf  (sec-classes object) classes)
    ))

(defmethod dxf-out-text ((x <acad-document>) stream))

(defmethod dxf-out-text :after ((x <acad-document>) stream)
  (block section-header
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "HEADER"  stream)
    (mapc #'(lambda (header)
	      (mapc #'(lambda (el) (dxf/out/txt:pair (first el) (second el) stream)) header))
	  (sec-header x))
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream))
  (block section-classes
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "CLASSES" stream)
    (mapc #'(lambda (class)
	      (mapc #'(lambda (el) (dxf/out/txt:pair (first el) (second el) stream)) class))
	  (sec-classes x))
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream))
  (block section-tables
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "TABLES" stream)
;;;
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream)
    )
  (block section-blocks
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "BLOCKS" stream)
;;;
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream)
    )
  (block section-entities
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "ENTITIES" stream)
;;;
    (dxf/out/txt:pair 0 "ENDSEC" stream)
    )
  (block section-objects
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "OBJECTS" stream)
;;;
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream)
    )
    (block section-objects
    (dxf/out/txt:pair 0 "SECTION" stream)
    (dxf/out/txt:pair 2 "ACDSDATA" stream)
;;;
    (dxf/out/txt:pair 0 dxf/sec:*endsec* stream)
    )
    
    (dxf/out/txt:pair 0 dxf/sec:*eof* stream)
  )

;;;;;;;;

(defparameter *acad-linetype-class-marker* "LTYPE")

(defparameter *acad-linetype-subclass-marker* "AcDbLinetypeTableRecord")

(defclass <acad-linetype>  (<acad-object>)
  ((name        :accessor name        :initarg :name        :initform "CONTINUOUS" :documentation "name")
   (description :accessor description :initarg :description :initform ""           :documentation "description"))
  (:documentation "
@begin[lang=txt](code)
./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================
@end(code)
"))

(defparameter *acad-linetype-properties*
  '(Application Description Document Handle HasExtensionDictionary
    Name ObjectID ObjectName OwnerID))

(mapcar #'dxf/utils:make-slot (set-difference *acad-linetype-properties* *acad-object-properties*))

(defmethod dxf-out-text ((x <acad-linetype>) stream)
  (dxf/out/txt:pair 0 *acad-linetype-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-linetype>) stream)
  (dxf/out/txt:pair 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf/out/txt:pair 100 *acad-linetype-subclass-marker* stream)
  (let ((name            (name            x))
	(description     (description     x))
	(pairs           (pairs           x)))
    (dxf/out/txt:pair  2 name   stream)
    (dxf/out/txt:pair  70 (cadr (assoc 70 pairs))   stream)
    (dxf/out/txt:pair  3 description stream)
    (mapcar
     #'(lambda (el)
	 (dxf/out/txt:pair (car el) (cadr el) t))
     (member (assoc 72 pairs) pairs))))

;;;;

(defmethod dxf-out-binary ((x <acad-linetype>) stream)
  (dxf/out/txt:pair 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-linetype>) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf/out/txt:pair 330 own stream))
    (when hdl (dxf/out/txt:pair   5 hdl stream))))

;;;;

(defmethod  dxf-in-text  ((object <acad-linetype>) (pairs cons))
  (assert (string= (second (assoc 0 pairs :test #'equal)) *acad-linetype-class-marker*)))

(defmethod  dxf-in-text :after ((object <acad-linetype>) (pairs cons))
  (setf (pairs object) (copy-list pairs))
  (let ((c-2   (cadr (assoc   2 pairs :test #'equal)))
	(c-3   (cadr (assoc   3 pairs :test #'equal))))
    (when c-2   (setf (name        object) c-2))
    (when c-3   (setf (description object) c-3))))

;;;;;;;;

(defclass <acad-linetypes> (<acad-object>)
  ((a-count  :accessor a-count :initarg :a-count :initform 0   :documentation "70 count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)"))
  (:documentation "
@begin[lang=txt](code)
@end(code)
"))

(defparameter *acad-linetypes-properties*
  '(Application A-Count Document Handle HasExtensionDictionary
    ObjectID ObjectName OwnerID))

(reverse (mapcar #'dxf/utils:make-slot (set-difference *acad-linetypes-properties* *acad-object-properties*)))

(defmethod dxf-in-text  ((object <acad-linetypes>) (tables cons))
;;;  (assert (equal (assoc 0 pairs :test #'equal) (list 0 *acad-ellipse-class-marker*)))
  object)

(defmethod dxf-in-text :after ((object <acad-linetypes>) (tables cons))
      (multiple-value-bind (items-data list-item-data) (table-and-items *acad-linetype-class-marker* tables)
      (setf (items object)
	    (mapcar
	     #'(lambda (item-data)
		 (let ((it (make-instance '<acad-linetype>)))
		   (dxf-in-text it item-data)
		   it))
	     list-item-data)
	    (a-count  object ) (length (items object)))))

(defmethod dxf-in-text :after ((object <acad-linetypes>) (pairs cons))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; db-symbol-table-record-classes.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/

(defparameter *symbol-tbl-class-marker* "TABLE")

(defparameter *symbol-tbl-subclass-marker* "AcDbSymbolTable")

(defclass <db-symbol-tbl> (<acad-object>)
  ((Object-Name      :accessor Object-Name       :initarg :Object-Name      :initform "SYMBOL-TABLE" :documentation "Код   2. Имя таблицы")
   (A-Count          :accessor symbol-tbl-flag   :initarg :A-Count          :initform 0              :documentation "Код  70. Стандартные флаги")
   (symbol-tbl-items :accessor symbol-tbl-items  :initarg :symbol-tbl-items :initform nil :documentation "Записи таблицы."))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A9FD9590-C97B-4E41-9F26-BD82C34A4F9F\"](Раздел TABLES файла DXF (DXF))
@begin[lang=txt](code)
См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
@end(code)
"))


(defclass <acad-blocks> ()
    ((Object-Name :accessor Object-Name       :initarg :Object-Name      :initform "ACAD-BLOCKS" :documentation "To-Do ACAD-BLOCKS"))
  (:documentation "
@begin[lang=txt](code)

* Methods
Add
GetExtensionDictionary
GetXData
Item
SetXData
* Properties
Application
A-Count
Document
Handle
HasExtensionDictionary
ObjectID
ObjectName
OwnerID
* Events
None
* END
@end(code)
"))

(defmethod dxf-out-text ((x <db-symbol-tbl>) stream)
  (dxf/out/txt:pair 0 *symbol-tbl-class-marker* stream)
    (let ((st-name (Object-Name x)))
    (dxf/out/txt:pair 2 st-name stream)))

(defmethod dxf-out-text :after ((x <db-symbol-tbl>) stream)
  (dxf/out/txt:pair 100 *db-symbol-tr-subclass-marker* stream)
  (let ((st-flag  (symbol-tbl-flag x))
	(st-items (reverse (symbol-tbl-items x))))
    (dxf/out/txt:pair 70 st-flag stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) st-items)
    (dxf/out/txt:pair 0 dxf/sec:*end-tab* stream)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <db-block-rec> (<db-symbol-tbl>)
  ((block-tbl-name  :accessor block-tbl-name    :initarg :block-tbl-name :initform "SYMBOL-TABLE" :documentation "Код   2. Имя таблицы")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A\"](BLOCK_RECORD (DXF))

@begin[lang=txt](code)
| Methods    | Add         | GetExtensionDictionary | GetXData | Item   | SetXData               |          |            |         |
| Properties | Application | A-Count                | Document | Handle | HasExtensionDictionary | ObjectID | ObjectName | OwnerID |
| Events     | None        |                        |          |        |                        |          |            |         |
@end(code)
"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-symbol-tr-class-marker* "SYMBOL")

(defparameter *db-symbol-tr-subclass-marker* "AcDbSymbolTableRecord")

(defclass <db-object> () ())

(defclass <db-symbol-tr> (<db-object>)
  ((symbol-tr-name :accessor symbol-tr-name  :initarg :symbol-tr-name :initform "Undefined"    :documentation "Код   2. Имя таблицы")
   (symbol-tr-flag :accessor symbol-tr-flag  :initarg :symbol-tr-flag :initform 0              :documentation "Код  70. Стандартные флаги"))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295\"](Общие групповые коды записей таблицы обозначений (DXF))
"))

(defmethod dxf-out-text ((x <db-symbol-tr>) stream)
  (dxf/out/txt:pair 0 *db-symbol-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x <db-symbol-tr>) stream)
  (dxf/out/txt:pair 100 *db-symbol-tr-subclass-marker* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <db-regapp-tr> (<db-symbol-tr>)
  ()
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-6E3140E9-E560-4C77-904E-480382F0553E\"](APPID (DXF))
@begin[lang=txt](code)
./dbsymtb.h:class AcDbRegAppTableRecord: public AcDbSymbolTableRecord
@end(code)
"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-block-tr-class-marker* "BLOCK_RECORD")

(defparameter *db-block-tr-subclass-marker* "AcDbBlockTableRecord")

(defclass <db-block-tr> (<db-symbol-tr>)
  ((block-tr-layout            :accessor block-tr-layout              :initarg :block-tr-layout            :initform nil                 :documentation "Код  340. Идентификатор/дескриптор жесткого указателя на связанный объект LAYOUT")
   (block-tr-explodability     :accessor block-tr-explodability       :initarg :block-tr-explodability     :initform 0                   :documentation "Код  280. Расчленяемость блока")
   (block-tr-scalability       :accessor block-tr-scalability         :initarg :block-tr-scalability       :initform 1                   :documentation "Код  281. Масштабируемость блока")
   (block-tr-bitmap            :accessor block-tr-bitmap              :initarg :block-tr-bitmap            :initform nil                 :documentation "Код  310. Файл DXF: двоичные данные предварительного просмотра растрового изображения (необязательно)")
   (block-tr-xdata-app-name    :accessor block-tr-xdata-app-name      :initarg :block-tr-xdata-app-name    :initform nil                 :documentation "Код 1001. Имя приложения расширенных данных, \"ACAD\" (необязательно)")
   (block-tr-xdata-string-data :accessor block-tr-xdata-string-data   :initarg :block-tr-xdata-string-data :initform nil                 :documentation "Код 1000. Данные строк расширенных данных, \"DesignCenter Data\" (необязательно)")
   (block-tr-xdata-begin       :accessor block-tr-xdata-begin         :initarg :block-tr-xdata-begin       :initform nil                 :documentation "Код 1002. Начало расширенных данных, \"{\" (необязательно)")
   (block-tr-dc-version        :accessor block-tr-dc-version          :initarg :block-tr-dc-version        :initform nil                 :documentation "Код 1070. Номер версии Центра управления Adesk")
   (block-tr-insert-units      :accessor block-tr-insert-units        :initarg :block-tr-insert-units      :initform nil                 :documentation "Код 1070. Номер версии Центра управления Adesk")
   (block-tr-xdata-end         :accessor block-tr-xdata-end           :initarg :block-tr-xdata-end         :initform nil                 :documentation "Код 1002. Конец расширенных данных, \"}\""))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A\"](BLOCK_RECORD (DXF))

@begin[lang=txt](code)
find . -name \"*.h\" | xargs grep \"class AcDbBlockTableRecord\"
@end(code)
"))

(defmethod dxf-out-text ((x <db-block-tr>) stream)
  (dxf/out/txt:pair 0 *db-block-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x <db-block-tr>) stream)
  (dxf/out/txt:pair 100 *db-block-tr-subclass-marker* stream)
  (let ((st-name (symbol-tr-name x))
	(st-flag (symbol-tr-flag x))
	(lay (block-tr-layout x))
	(e-ty (block-tr-explodability x))
	(s-ty (block-tr-scalability x))
	(b-p  (block-tr-bitmap x)))
    (dxf/out/txt:pair 2 st-name stream)
    (when lay (dxf/out/txt:pair 340 lay stream))
    (dxf/out/txt:pair 70 st-flag stream)
    (dxf/out/txt:pair 280 e-ty stream)
    (dxf/out/txt:pair 281 s-ty stream)
    (when b-p (dxf/out/txt:pair 310 b-p stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <db-dimstyle-tr> (<db-symbol-tr>)
  ((dimstyle-tr-dimpost   :accessor dimstyle-tr-dimpost   :initarg :dimstyle-tr-dimpost   :initform nil :documentation "Код  3. DIMPOST")
   (dimstyle-tr-dimapost  :accessor dimstyle-tr-dimapost  :initarg :dimstyle-tr-dimapost  :initform nil :documentation "Код  4. DIMAPOST")
;   (dimstyle-tr-dimblk    :accessor dimstyle-tr-dimblk    :initarg :dimstyle-tr-dimblk    :initform nil :documentation "Код  5. DIMBLK (устарело, теперь это идентификатор объекта)")
;   (dimstyle-tr-dimblk1   :accessor dimstyle-tr-dimblk1   :initarg :dimstyle-tr-dimblk1   :initform nil :documentation "Код  6. DIMBLK1 (устарело, теперь это идентификатор объекта)")   
;   (dimstyle-tr-dimblk2   :accessor dimstyle-tr-dimblk2   :initarg :dimstyle-tr-dimblk2   :initform nil :documentation "Код  7. DIMBLK2 (устарело, теперь это идентификатор объекта)")
   (dimstyle-tr-dimscale  :accessor dimstyle-tr-dimscale  :initarg :dimstyle-tr-dimscale  :initform nil :documentation "Код  40. DIMSCALE")
   (dimstyle-tr-dimasz    :accessor dimstyle-tr-dimasz    :initarg :dimstyle-tr-dimasz    :initform nil :documentation "Код  41. DIMASZ")
   (dimstyle-tr-dimexo    :accessor dimstyle-tr-dimexo    :initarg :dimstyle-tr-dimexo    :initform nil :documentation "Код  42. DIMEXO")
   (dimstyle-tr-dimdli    :accessor dimstyle-tr-dimdli    :initarg :dimstyle-tr-dimdli    :initform nil :documentation "Код  43. DIMDLI")
   (dimstyle-tr-dimexe    :accessor dimstyle-tr-dimexe    :initarg :dimstyle-tr-dimexe    :initform nil :documentation "Код  44. DIMEXE")
   (dimstyle-tr-dimrnd    :accessor dimstyle-tr-dimrnd    :initarg :dimstyle-tr-dimrnd    :initform nil :documentation "Код  45. DIMRND")
   (dimstyle-tr-dimdle    :accessor dimstyle-tr-dimdle    :initarg :dimstyle-tr-dimdle    :initform nil :documentation "Код  46. DIMDLE")
   (dimstyle-tr-dimtp     :accessor dimstyle-tr-dimtp     :initarg :dimstyle-tr-dimtp     :initform nil :documentation "Код  47. DIMTP")
   (dimstyle-tr-dimtm     :accessor dimstyle-tr-dimtm     :initarg :dimstyle-tr-dimtm     :initform nil :documentation "Код  48. DIMTM")
   (dimstyle-tr-dimtxt    :accessor dimstyle-tr-dimtxt    :initarg :dimstyle-tr-dimtxt    :initform nil :documentation "Код  140. DIMTXT")
   (dimstyle-tr-dimcen    :accessor dimstyle-tr-dimcen    :initarg :dimstyle-tr-dimcen    :initform nil :documentation "Код  141. DIMCEN")
   (dimstyle-tr-dimtsz    :accessor dimstyle-tr-dimtsz    :initarg :dimstyle-tr-dimtsz    :initform nil :documentation "Код  142. DIMTSZ")
   (dimstyle-tr-dimaltf   :accessor dimstyle-tr-dimaltf   :initarg :dimstyle-tr-dimaltf   :initform nil :documentation "Код  143. DIMALTF")
   (dimstyle-tr-dimlfac   :accessor dimstyle-tr-dimlfac   :initarg :dimstyle-tr-dimlfac   :initform nil :documentation "Код  144. DIMLFAC")
   (dimstyle-tr-dimtvp    :accessor dimstyle-tr-dimtvp    :initarg :dimstyle-tr-dimtvp    :initform nil :documentation "Код  145. DIMTVP")
   (dimstyle-tr-dimtfac   :accessor dimstyle-tr-dimtfac   :initarg :dimstyle-tr-dimtfac   :initform nil :documentation "Код  146. DIMTFAC")
   (dimstyle-tr-dimgap    :accessor dimstyle-tr-dimgap    :initarg :dimstyle-tr-dimgap    :initform nil :documentation "Код  147. DIMGAP")
   (dimstyle-tr-dimaltrnd :accessor dimstyle-tr-dimaltrnd :initarg :dimstyle-tr-dimaltrnd :initform nil :documentation "Код  148. DIMALTRND")
   (dimstyle-tr-dimtol    :accessor dimstyle-tr-dimtol    :initarg :dimstyle-tr-dimtol    :initform nil :documentation "Код  71. DIMTOL")
   (dimstyle-tr-dimlim    :accessor dimstyle-tr-dimlim    :initarg :dimstyle-tr-dimlim    :initform nil :documentation "Код  72. DIMLIM")
   (dimstyle-tr-dimtih    :accessor dimstyle-tr-dimtih    :initarg :dimstyle-tr-dimtih    :initform nil :documentation "Код  73. DIMTIH")
   (dimstyle-tr-dimtoh    :accessor dimstyle-tr-dimtoh    :initarg :dimstyle-tr-dimtoh    :initform nil :documentation "Код  74. DIMTOH")
   (dimstyle-tr-dimse1    :accessor dimstyle-tr-dimse1    :initarg :dimstyle-tr-dimse1    :initform nil :documentation "Код  75. DIMSE1")
   (dimstyle-tr-dimse2    :accessor dimstyle-tr-dimse2    :initarg :dimstyle-tr-dimse2    :initform nil :documentation "Код  76. DIMSE2")
   (dimstyle-tr-dimtad    :accessor dimstyle-tr-dimtad    :initarg :dimstyle-tr-dimtad    :initform nil :documentation "Код  77. DIMTAD")
   (dimstyle-tr-dimzin    :accessor dimstyle-tr-dimzin    :initarg :dimstyle-tr-dimzin    :initform nil :documentation "Код  78. DIMZIN")
   (dimstyle-tr-dimazin   :accessor dimstyle-tr-dimazin   :initarg :dimstyle-tr-dimazin   :initform nil :documentation "Код  79. DIMAZIN")
   (dimstyle-tr-dimalt    :accessor dimstyle-tr-dimalt    :initarg :dimstyle-tr-dimalt    :initform nil :documentation "Код  170. DIMALT")
   (dimstyle-tr-dimaltd   :accessor dimstyle-tr-dimaltd   :initarg :dimstyle-tr-dimaltd   :initform nil :documentation "Код  171. DIMALTD")
   (dimstyle-tr-dimtofl   :accessor dimstyle-tr-dimtofl   :initarg :dimstyle-tr-dimtofl   :initform nil :documentation "Код  172. DIMTOFL")
   (dimstyle-tr-dimsah    :accessor dimstyle-tr-dimsah    :initarg :dimstyle-tr-dimsah    :initform nil :documentation "Код  173. DIMSAH")
   (dimstyle-tr-dimtix    :accessor dimstyle-tr-dimtix    :initarg :dimstyle-tr-dimtix    :initform nil :documentation "Код  174. DIMTIX")
   (dimstyle-tr-dimsoxd   :accessor dimstyle-tr-dimsoxd   :initarg :dimstyle-tr-dimsoxd   :initform nil :documentation "Код  175. DIMSOXD")
   (dimstyle-tr-dimclrd   :accessor dimstyle-tr-dimclrd   :initarg :dimstyle-tr-dimclrd   :initform nil :documentation "Код  176. DIMCLRD")
   (dimstyle-tr-dimclre   :accessor dimstyle-tr-dimclre   :initarg :dimstyle-tr-dimclre   :initform nil :documentation "Код  177. DIMCLRE")
   (dimstyle-tr-dimclrt   :accessor dimstyle-tr-dimclrt   :initarg :dimstyle-tr-dimclrt   :initform nil :documentation "Код  178. DIMCLRT")
   (dimstyle-tr-dimadec   :accessor dimstyle-tr-dimadec   :initarg :dimstyle-tr-dimadec   :initform nil :documentation "Код  179. DIMADEC")
;  (dimstyle-tr-dimunit   :accessor dimstyle-tr-dimunit   :initarg :dimstyle-tr-dimunit   :initform nil :documentation "Код  270. DIMUNIT (устарело, теперь используется DIMLUNIT и DIMFRAC)")
   (dimstyle-tr-dimdec    :accessor dimstyle-tr-dimdec    :initarg :dimstyle-tr-dimdec    :initform nil :documentation "Код  271. DIMDEC")
   (dimstyle-tr-dimtdec   :accessor dimstyle-tr-dimtdec   :initarg :dimstyle-tr-dimtdec   :initform nil :documentation "Код  272. DIMTDEC")
   (dimstyle-tr-dimaltu   :accessor dimstyle-tr-dimaltu   :initarg :dimstyle-tr-dimaltu   :initform nil :documentation "Код  273. DIMALTU")
   (dimstyle-tr-dimalttd  :accessor dimstyle-tr-dimalttd  :initarg :dimstyle-tr-dimalttd  :initform nil :documentation "Код  274. DIMALTTD")
   (dimstyle-tr-dimaunit  :accessor dimstyle-tr-dimaunit  :initarg :dimstyle-tr-dimaunit  :initform nil :documentation "Код  275. DIMAUNIT")
   (dimstyle-tr-dimfrac   :accessor dimstyle-tr-dimfrac   :initarg :dimstyle-tr-dimfrac   :initform nil :documentation "Код  276. DIMFRAC")
   (dimstyle-tr-dimlunit  :accessor dimstyle-tr-dimlunit  :initarg :dimstyle-tr-dimlunit  :initform nil :documentation "Код  277. DIMLUNIT")
   (dimstyle-tr-dimdsep   :accessor dimstyle-tr-dimdsep   :initarg :dimstyle-tr-dimdsep   :initform nil :documentation "Код  278. DIMDSEP")
   (dimstyle-tr-dimtmove  :accessor dimstyle-tr-dimtmove  :initarg :dimstyle-tr-dimtmove  :initform nil :documentation "Код  279. DIMTMOVE")
   (dimstyle-tr-dimjust   :accessor dimstyle-tr-dimjust   :initarg :dimstyle-tr-dimjust   :initform nil :documentation "Код  280. DIMJUST")
   (dimstyle-tr-dimsd1    :accessor dimstyle-tr-dimsd1    :initarg :dimstyle-tr-dimsd1    :initform nil :documentation "Код  281. DIMSD1")
   (dimstyle-tr-dimsd2    :accessor dimstyle-tr-dimsd2    :initarg :dimstyle-tr-dimsd2    :initform nil :documentation "Код  282. DIMSD2")
   (dimstyle-tr-dimtolj   :accessor dimstyle-tr-dimtolj   :initarg :dimstyle-tr-dimtolj   :initform nil :documentation "Код  283. DIMTOLJ")
   (dimstyle-tr-dimtzin   :accessor dimstyle-tr-dimtzin   :initarg :dimstyle-tr-dimtzin   :initform nil :documentation "Код  284. DIMTZIN")
   (dimstyle-tr-dimaltz   :accessor dimstyle-tr-dimaltz   :initarg :dimstyle-tr-dimaltz   :initform nil :documentation "Код  285. DIMALTZ")
   (dimstyle-tr-dimalttz  :accessor dimstyle-tr-dimalttz  :initarg :dimstyle-tr-dimalttz  :initform nil :documentation "Код  286. DIMALTTZ")
;  (dimstyle-tr-dimfit    :accessor dimstyle-tr-dimfit    :initarg :dimstyle-tr-dimfit    :initform nil :documentation "Код  287. DIMFIT (устарело, теперь используется DIMATFIT и DIMTMOVE)")
   (dimstyle-tr-dimupt    :accessor dimstyle-tr-dimupt    :initarg :dimstyle-tr-dimupt    :initform nil :documentation "Код  288. DIMUPT")
   (dimstyle-tr-dimatfit  :accessor dimstyle-tr-dimatfit  :initarg :dimstyle-tr-dimatfit  :initform nil :documentation "Код  289. DIMATFIT")
   (dimstyle-tr-dimtxsty  :accessor dimstyle-tr-dimtxsty  :initarg :dimstyle-tr-dimtxsty  :initform nil :documentation "Код  340. DIMTXSTY (дескриптор связанного элемента STYLE)")
   (dimstyle-tr-dimldrblk :accessor dimstyle-tr-dimldrblk :initarg :dimstyle-tr-dimldrblk :initform nil :documentation "Код  341. DIMLDRBLK (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimblk    :accessor dimstyle-tr-dimblk    :initarg :dimstyle-tr-dimblk    :initform nil :documentation "Код  342. DIMBLK (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimblk1   :accessor dimstyle-tr-dimblk1   :initarg :dimstyle-tr-dimblk1   :initform nil :documentation "Код  343. DIMBLK1 (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimblk2   :accessor dimstyle-tr-dimblk2   :initarg :dimstyle-tr-dimblk2   :initform nil :documentation "Код  344. DIMBLK2 (дескриптор связанного элемента BLOCK)")
   (dimstyle-tr-dimlwd    :accessor dimstyle-tr-dimlwd    :initarg :dimstyle-tr-dimlwd    :initform nil :documentation "Код  371. DIMLWD (значение перечисления веса линий)")
   (dimstyle-tr-dimlwe    :accessor dimstyle-tr-dimlwe    :initarg :dimstyle-tr-dimlwe    :initform nil :documentation "Код  372. DIMLWE (значение перечня веса линий)"))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-F2FAD36F-0CE3-4943-9DAD-A9BCD2AE81DA\"](DIMSTYLE (DXF))

@begin[lang=txt](code)
find . -name \"*.h\" | xargs grep \"class AcDbBlockTableRecord\"
/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/dbsymtb.h:class AcDbBlockTableRecord: public  AcDbSymbolTableRecord
@end(code)
"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <db-textstyle-tr> (<db-symbol-tr>)
  (
   (textstyle-tr-text-height      :accessor textstyle-tr-text-height       :initarg :textstyle-tr-text-height       :initform 0     :documentation "Код   40. Фиксированная высота текста; значение 0, если нефиксированная")
   (textstyle-tr-width-factor     :accessor textstyle-tr-width-factor      :initarg :textstyle-tr-width-factor      :initform 0     :documentation "Код   41. Коэффициент сжатия")
   (textstyle-tr-oblique-angle    :accessor textstyle-tr-oblique-angle     :initarg :textstyle-tr-oblique-angle     :initform 0     :documentation "Код   50. Угол наклона")
   (textstyle-tr-text-gen-flags   :accessor textstyle-tr-text-gen-flags    :initarg :textstyle-tr-text-gen-flags    :initform 0     :documentation "Код   71. Флаги создания текста: 2 = текст в обратном направлении (зеркально отражен по X); 4 = текст перевернут (зеркально отражен по Y)")
   (textstyle-tr-last-used-height :accessor textstyle-tr-last-used-height  :initarg :textstyle-tr-last-used-height  :initform 0     :documentation "Код   42. Последняя использованная высота")
   (textstyle-tr-pri-font-fname   :accessor textstyle-tr-pri-font-fname    :initarg :textstyle-tr-pri-font-fname    :initform 0     :documentation "Код    3. Имя файла основного шрифта ")
   (textstyle-tr-big-font-fname   :accessor textstyle-tr-big-font-fname    :initarg :textstyle-tr-big-font-fname    :initform 0     :documentation "Код    4. Имя файла большого шрифта; значение пусто, если файл отсутствует")
   (textstyle-tr-font-family      :accessor textstyle-tr-font-family       :initarg :textstyle-tr-font-family       :initform 0     :documentation "Код 1071. Длинное значение, содержащее шаг и семейство шрифта TrueType, набор символов и флаги полужирного шрифта и курсива")   
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-EF68AF7C-13EF-45A1-8175-ED6CE66C8FC9\"](STYLE (DXF))
"))

(defclass <db-ucs-tr> (<db-symbol-tr>)
  ((ucs-tr-origin           :accessor ucs-tr-origin           :initarg :ucs-tr-origin           :initform (vector 0 0 0) :documentation "Код   10. Начало координат (в МСК)")
   (ucs-tr-x-axis-direction :accessor ucs-tr-x-axis-direction :initarg :ucs-tr-x-axis-direction :initform (vector 1 0 0) :documentation "Код   11. Направление оси X (в МСК)")
   (ucs-tr-y-axis-direction :accessor ucs-tr-y-axis-direction :initarg :ucs-tr-y-axis-direction :initform (vector 0 1 0) :documentation "Код   12. Направление оси Y (в МСК)")
   (ucs-tr-always-flag      :accessor ucs-tr-always-flag      :initarg :ucs-tr-always-flag      :initform (vector 0 1 0) :documentation "Код   79. Всегда равно 0")
   (ucs-tr-elevation        :accessor ucs-tr-elevation        :initarg :ucs-tr-elevation        :initform 0.0            :documentation "Код  146. Уровень")
   (ucs-tr-base             :accessor ucs-tr-base             :initarg :ucs-tr-base             :initform nil            :documentation "Код  346. Идентификатор/дескриптор базовой ПСК при работе с ортогональным изображением. Этот код отсутствует, если код 79 равен 0. Если этот код отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК")
   (ucs-tr-ortho-type       :accessor ucs-tr-ortho-type       :initarg :ucs-tr-ortho-type       :initform nil            :documentation "Код   71. Тип ортогонального изображения (необязательно; всегда отображается в паре с кодами 13, 23, 33): 1 = сверху; 2 = снизу; 3 = спереди; 4 = сзади; 5 = слева; 6 = справа")
   (ucs-tr-ortho-origin     :accessor ucs-tr-ortho-origin     :initarg :ucs-tr-ortho-origin     :initform nil            :documentation "Код   13. Начало координат данного типа ортогонального изображения относительно данной ПСК"))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1906E8A7-3393-4BF9-BD27-F9AE4352FB8B\"](UCS (DXF))
"))

(defclass <db-view-tr> (<db-symbol-tr>)
  ((view-tr-height          :accessor view-tr-height         :initarg :view-tr-height         :initform 0              :documentation "Код  40. Высота вида (в РСК)")
   (view-tr-center-point    :accessor view-tr-center-point   :initarg :view-tr-center-point   :initform (vector 0 0)   :documentation "Код  10. Центральная точка вида (в РСК).  2D-точка")
   (view-tr-width           :accessor view-tr-width          :initarg :view-tr-width          :initform 420.0          :documentation "Код  41. Ширина вида (в РСК)")
   (view-tr-direction       :accessor view-tr-direction      :initarg :view-tr-direction      :initform (vector 0 0 1) :documentation "Код  11. Направление взгляда из целевой точки (в МСК). 3D-вектор")
   (view-tr-target-point    :accessor view-tr-target-point   :initarg :view-tr-target-point   :initform (vector 0 0 0) :documentation "Код  12. Целевая точка (в МСК)")
   (view-tr-lens-length     :accessor view-tr-lens-length    :initarg :view-tr-lens-length    :initform 0              :documentation "Код  42. Фокусное расстояние")
   (view-tr-fcp-offset      :accessor view-tr-fcp-offset     :initarg :view-tr-fcp-offset     :initform 100.0          :documentation "Код  43. Передняя плоскость подрезки (смещение от целевой точки)")
   (view-tr-bcp-offset      :accessor view-tr-bcp-offset     :initarg :view-tr-bcp-offset     :initform 100.0          :documentation "Код  44. Задняя плоскость подрезки (смещение от целевой точки)") 
   (view-tr-twist-angle     :accessor view-tr-twist-angle    :initarg :view-tr-twist-angle    :initform 100.0          :documentation "Код  50. Угол закручивания") 
   (view-tr-view-mode       :accessor view-tr-view-mode      :initarg :view-tr-view-mode      :initform 0              :documentation "Код  71. Режим просмотра (см. системную переменную VIEWMODE)")
   (view-tr-render-mode     :accessor view-tr-render-mode    :initarg :view-tr-render-mode    :initform 0              :documentation "Код 281. Режим визуализации: 0 = оптимизированное 2D (классическое 2D); 1 = каркас; 2 = скрытие линий; 3 = плоское; 4 = по Гуро; 5 = плоское с каркасом; 6 = по Гуро с каркасом; Все режимы визуализации кроме \"Оптимизированное 2D\" задействуют новую систему 3D-графики; Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode")
   (view-tr-ucs-associated  :accessor view-tr-ucs-associated :initarg :view-tr-ucs-associated :initform 0              :documentation "Код  72. 1, если имеется ПСК, связанная с этим видом; 0 в противном случае")
   (view-tr-plottable       :accessor view-tr-plottable      :initarg :view-tr-plottable      :initform 0              :documentation "Код  73. 1, если данные с камеры выводятся на печать")
   (view-tr-background      :accessor view-tr-background     :initarg :view-tr-background     :initform nil            :documentation "Код 332. Идентификатор/дескриптор символьного указателя на объект фона (необязательно)")
   (view-tr-live-section    :accessor view-tr-live-section   :initarg :view-tr-live-section   :initform nil            :documentation "Код 334. Идентификатор/дескриптор символьного указателя на объект псевдоразреза (необязательно)")
   (view-tr-visual-style    :accessor view-tr-visual-style   :initarg :view-tr-visual-style   :initform nil            :documentation "Код 348. Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)")
   (view-tr-sun             :accessor view-tr-sun            :initarg :view-tr-sun            :initform 0              :documentation "Код 361. Идентификатор солнца с жестким правом владения. Следующие коды отображаются только в том случае, если для кода 72 установлено значение 1. С их помощью определяется ПСК, связанная с этим видом. Эта ПСК становится текущей ПСК каждый раз при восстановлении этого вида (если значение кода 72 равно 0, ПСК не изменяется)."))
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-CF3094AB-ECA9-43C1-8075-7791AC84F97C\"](VIEW (DXF))
"))

(defclass <db-vport-tr> (<db-symbol-tr>) 
  (
;  (vport-name  :accessor vport-name  :initarg :vport-name  :initform "*Active" :documentation "Код 2. Имя видового экрана")
;  (vport-flags :accessor vport-flags :initarg :vport-flags :initform 0		:documentation "Код 70. Стандартные значения флагов (кодовые битовые значения): 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки; 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается; 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз, на запись таблицы ссылался хотя бы один объект на чертеже. Этот флаг нужен для команд AutoCAD. Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF")
   (vport-tr-lower-left-corner    :accessor vport-tr-lower-left-corner    :initarg :vport-tr-lower-left-corner    :initform (vector 0.0 0.0)        :documentation "Код  10. Левый нижний угол видового экрана. Файл DXF: значение X; приложение: 2D-точка ")
   (vport-tr-upper-right-corner   :accessor vport-tr-upper-right-corner   :initarg :vport-tr-upper-right-corner   :initform (vector 1.0 1.0)        :documentation "Код  11. Правый верхний угол видового экрана. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-tr-view-center-point    :accessor vport-tr-view-center-point    :initarg :vport-tr-view-center-point    :initform (vector 420.0 297.0)    :documentation "Код  12. Центральная точка вида (в РСК). Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-tr-snap-base-point      :accessor vport-tr-snap-base-point      :initarg :vport-tr-snap-base-point      :initform (vector 0.0 0.0)        :documentation "Код  13. Базовая точка привязки (в РСК). Файл DXF: значение X; приложение: 2D-точка") 
   (vport-tr-snap-spacing         :accessor vport-tr-snap-spacing         :initarg :vport-tr-snap-spacing         :initform (vector 10.0 10.0)      :documentation "Код  14. Шаг привязки по оси X и Y. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-tr-grid-spacing         :accessor vport-tr-grid-spacing         :initarg :vport-tr-grid-spacing         :initform (vector 10.0 10.0)      :documentation "Код  15. Шаг сетки по осям X и Y. Файл DXF: значение X; приложение: 2D-точка") 
   (vport-tr-view-direction       :accessor vport-tr-view-direction       :initarg :vport-tr-view-direction       :initform (vector 0.0 0.0 1.0)    :documentation "Код  16. Направление взгляда из целевой точки (в МСК). Файл DXF: значение X; приложение: 3D-точка") 
   (vport-tr-view-target-point    :accessor vport-tr-view-target-point    :initarg :vport-tr-view-target-point    :initform (vector 0.0 0.0 0.0)    :documentation "Код  17. Целевая точка вида (в МСК). Файл DXF: значение X; приложение: 3D-точка ") 
   (vport-tr-lens-length          :accessor vport-tr-lens-length          :initarg :vport-tr-lens-length          :initform 50.0                    :documentation "Код  42. Фокусное расстояние") 
   (vport-tr-front-clipping-plane :accessor vport-tr-front-clipping-plane :initarg :vport-tr-front-clipping-plane :initform 0.0                     :documentation "Код  43. Передняя плоскость подрезки (смещение от целевой точки)") 
   (vport-tr-back-clipping-plane  :accessor vport-tr-back-clipping-plane  :initarg :vport-tr-back-clipping-plane  :initform 0.0                     :documentation "Код  44. Задняя плоскость подрезки (смещение от целевой точки)") 
   (vport-tr-view-height          :accessor vport-tr-view-height          :initarg :vport-tr-view-height          :initform 594.0                   :documentation "Код  45. Высота вида") 
   (vport-tr-snap-rotation-angle  :accessor vport-tr-snap-rotation-angle  :initarg :vport-tr-snap-rotation-angle  :initform 0.0                     :documentation "Код  50. Угол поворота привязки") 
   (vport-tr-view-twist-angle     :accessor vport-tr-view-twist-angle     :initarg :vport-tr-view-twist-angle     :initform 0.0                     :documentation "Код  51. Угол закручивания вида") 
   (vport-tr-circle-sides         :accessor vport-tr-circle-sides         :initarg :vport-tr-circle-sides         :initform 0.0                     :documentation "Код  72. Стороны круга")
   (vport-tr-frozen-layer-id      :accessor vport-tr-frozen-layer-id      :initarg :vport-tr-frozen-layer-id      :initform nil                     :documentation "Код 331 или 441. Идентификатор/дескриптор символьного или жесткого указателя на объекты замороженного слоя; повторяется для каждого замороженного слоя")
   (vport-tr-bit-flags            :accessor vport-tr-bit-flags            :initarg :vport-tr-bit-flags            :initform 0.0                     :documentation "Код  70. Флаги битов и режим перспективной проекции") 
   (vport-tr-plot-style-sheet     :accessor vport-tr-plot-style-sheet     :initarg :vport-tr-plot-style-sheet     :initform 0.0                     :documentation "Код   1. Таблица стилей печати")
   (vport-tr-render-mode          :accessor vport-tr-render-mode          :initarg :vport-tr-render-mode          :initform 0                       :documentation "Код 281. Режим визуализации: 0 = оптимизированное 2D (классическое 2D); 1 = каркас; 2 = скрытие линий; 3 = плоское; 4 = по Гуро; 5 = плоское с каркасом; 6 = по Гуро с каркасом. Все режимы визуализации, кроме 'Оптимизированное 2D',задействуют новую систему 3D-графики. Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode") 
   (vport-tr-view-mode            :accessor vport-tr-view-mode            :initarg :vport-tr-view-mode            :initform 0                       :documentation "Код  71. Режим просмотра (см. системную переменную VIEWMODE)") 
   (vport-tr-ucsicon-setting      :accessor vport-tr-ucsicon-setting      :initarg :vport-tr-ucsicon-setting      :initform 3                       :documentation "Код  74. Параметр ЗНАКПСК")
   (vport-tr-ucs-origin           :accessor vport-tr-ucs-origin           :initarg :vport-tr-ucs-origin           :initform (vector 0.0 0.0 0.0)    :documentation "Код 110. Начало координат ПСК. Файл DXF: значение X; приложение: 3D-точка")
   (vport-tr-ucs-x-axis           :accessor vport-tr-ucs-origin           :initarg :vport-tr-ucs-origin           :initform (vector 1.0 0.0 0.0)    :documentation "Код 111. Ось X ПСК. Файл DXF: значение X; приложение: 3D-вектор") 
   (vport-tr-ucs-y-axis           :accessor vport-tr-ucs-origin           :initarg :vport-tr-ucs-origin           :initform (vector 0.0 1.0 0.0)    :documentation "Код 112. Ось Y ПСК. Файл DXF: значение X; приложение: 3D-вектор") 
   (vport-tr-ucs-id-name          :accessor vport-tr-ucs-id-name          :initarg :vport-tr-ucs-id-name          :initform nil                     :documentation "Код 345. Идентификатор/дескриптор AcDbUCSTableRecord, если ПСК является именованной ПСК. Если значение отсутствует, то ПСК является неименованной") 
   (vport-tr-ucs-id-base          :accessor vport-tr-ucs-id-base          :initarg :vport-tr-ucs-id-base          :initform nil                     :documentation "Код 346. Идентификатор/дескриптор AcDbUCSTableRecord базовой ПСК, если ПСК является ортогональной (код 79 не равен нулю). Если значение отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК") 
   (vport-tr-ucs-ortho-type       :accessor vport-tr-ucs-ortho-type       :initarg :vport-tr-ucs-ortho-type       :initform 0                       :documentation "Код  79. Ортогональный тип ПСК: 0 = ПСК не ортогональна; 1 = сверху; 2 = снизу; 3 = спереди; 4 = сзади; 5 = слева; 6 = справа") 
   (vport-tr-elevation            :accessor vport-tr-elevation            :initarg :vport-tr-elevation            :initform 0.0                     :documentation "Код 146. Уровень") 
   (vport-tr-shade-plot-setting   :accessor vport-tr-shade-plot-setting   :initarg :vport-tr-shade-plot-setting   :initform nil                     :documentation "Код 170. Тонирование печати")
   (vport-tr-major-grid-lines     :accessor vport-tr-major-grid-lines     :initarg :vport-tr-major-grid-lines     :initform 5                       :documentation "Код  61. Основные линии сетки")
   (vport-tr-background-id        :accessor vport-tr-background-id        :initarg :vport-tr-background-id        :initform nil                     :documentation "Код 332. Идентификатор/дескриптор символьного указателя на объект фона (необязательно)")
   (vport-tr-shade-plot-id        :accessor vport-tr-shade-plot-id        :initarg :vport-tr-shade-plot-id        :initform nil                     :documentation "Код 333. Идентификатор/дескриптор символьного указателя на объект режима печати оттенков (необязательно)")
   (vport-tr-visual-style-id      :accessor vport-tr-visual-style-id      :initarg :vport-tr-visual-style-id      :initform "2A"                    :documentation "Код 348. Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)")
   (vport-tr-lighting-on-flag     :accessor vport-tr-lighting-on-flag     :initarg :vport-tr-lighting-on-flag     :initform 1                       :documentation "Код 292. Флаг включения освещения по умолчанию")
   (vport-tr-lighting-type        :accessor vport-tr-lighting-type        :initarg :vport-tr-lighting-type        :initform 1                       :documentation "Код 282. Тип освещения по умолчанию: 0 = один удаленный источник света; 1 = два удаленных источника света")
   (vport-tr-brightness           :accessor vport-tr-brightness           :initarg :vport-tr-brightness           :initform 0.0                     :documentation "Код 141. Яркость")
   (vport-tr-contrast             :accessor vport-tr-contrast             :initarg :vport-tr-contrast             :initform 0.0                     :documentation "Код 142. Контрастность")
   (vport-tr-ambient-color        :accessor vport-tr-contrast             :initarg :vport-tr-contrast             :initform (vector 250 3355443 0)  :documentation "Код 63, 421, 431. Рассеиваемый цвет (выводится, только если цвет не черный)")
   )
  (:documentation "
@link[uri=\"https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-8CE7CC87-27BD-4490-89DA-C21F516415A9\"](VPORT (DXF))
@begin[lang=txt](code)
./dbents.h:class AcDbViewport: public AcDbEntity
@end(code)
"
 )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dxf-in-t-sections.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun incf-handseed (sections)
  (1- (incf (cadadr (member '(9 "$HANDSEED")
			    (assoc '(2 "HEADER") sections :test #'equal)
			    :test #'equal)))))

(defun handseed (sections)
  (cadadr (member '(9 "$HANDSEED")
		  (assoc '(2 "HEADER") sections :test #'equal)
		  :test #'equal)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-header (sections)
  "Пример использования:
 (split-CLASSES *Drawing-sty*)
"
  (do ((hdr-rec (reverse (cdr (assoc (list 2 "HEADER") sections :test #'equal)))
		(cdr hdr-rec))
       (header-item nil)
       (header-rez nil))
      ((null hdr-rec) header-rez)
    (push (first hdr-rec) header-item)
    (when (= 9 (first (first header-item)))
      (push header-item header-rez)
      (setf header-item nil))))

(defun get-acad-variable-as-list (variable-name splited-header-section)
  "Возвращает значение системной переменной variable-name.

Значение возвращается в виде списка.

Пример использования:
 (get-acad-variable-as-list \"ELEVATION\" (split-HEADER *Drawing-sty*)) => ((9 \"$ELEVATION\") (40 10.55d0))
"
  (assoc (concatenate 'string "$" (string-upcase variable-name))
	 splited-header-section :key #'second :test #'string=))

(defun get-acad-variable-names (splited-header-section)
  "Возвращает список

Пример использования:

 (get-acad-variable-names (split-HEADER *Drawing-sty*)) => (\"ACADVER\" ... \"SHADOWPLANELOCATION\")

 (length (get-acad-variable-names (split-HEADER *Drawing-sty*))) => 253
"
  (mapcar
   #'(lambda (el) (string-left-trim "$" (second (first el))))
   splited-header-section))

(defun get-acad-variable-name-codes (splited-header-section)
  "
Пример использования:

 (get-acad-variable-name-codes  (split-HEADER *Drawing-sty*))
"
  (mapcar
   #'(lambda (el) (list (string-left-trim "$" (second (first el))) (first (second el))))
   splited-header-section))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun split-classes (sections)
  "Пример использования
 (split-classes *Drawing-sty*)
"
  (let ((pairs-list (reverse (cdr (assoc '(2 "CLASSES") sections :test #'equal))))
	(classes nil)
	(class   nil))
    (dolist (i pairs-list (nreverse classes))
      (push i class)
      (when (equal i '(0 "CLASS"))
	(push class classes)
	(setf class nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun split-tables (sections)
  "Пример использования:
 (split-TABLES *Drawing-sty*)
"
  (let ((pairs-list (cdr (assoc '(2 "TABLES") sections :test #'equal)))
	(tables nil)
	(table  nil))
    (dolist (i pairs-list (nreverse tables))
      (push i table)
      (when (equal i '(0 "ENDTAB"))
	(push (cdr (nreverse (cdr table))) tables)
	(setf table nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *table-names*
  '("VPORT" "LTYPE" "LAYER" "STYLE" "VIEW" "UCS" "APPID" "DIMSTYLE" "BLOCK_RECORD"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun table-and-items (tbl-name tables-pairs )
  "Пример использования:
 (table-and-items \"BLOCK_RECORD\" *s-tbl*)
"
  (assert (member tbl-name *table-names* :test #'string=  ))
  #+nil (assert (consp tables-pairs))
  (let ((pairs-list  (assoc
			  (list 2 tbl-name)
			  tables-pairs
			  :test #'equal))
	(rez nil)
	(block-items nil)
	(blk nil))
    (setf rez 
	  (dolist (i pairs-list (nreverse (push (nreverse blk) block-items)))
	    (push i blk)
	    (when (= (car i) 0)
	      (push (nreverse  (cdr blk)) block-items)
	      (setf blk nil)
	      (push i blk))))
    (values (car rez) (cdr rez))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


