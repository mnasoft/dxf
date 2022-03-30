;;;; ./src/dxf.lisp

(defpackage #:dxf
  (:use #:cl #:mnas-string)
  (:export dxf-out-text
	   dxf-in-text
           )
  (:export dxf-out-binary
           dxf-in-binary
           )
  (:export split-header
           split-entities
           )
  (:export *line-weight-enum*
           *dxf-header*
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
           <acad-entity>
           <acad-line>
           <acad-point>
           <acad-ray>
           <acad-xline>
           <acad-circle>
           <acad-arc>
           <acad-text>
           <acad-ellipse>
           <acad-layer>
           <acad-layers>
           <acad-documents>
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
           <db-object>
           <db-symbol-tr>
           <db-regapp-tr>
           <db-block-tr>
           <db-dimstyle-tr>
           <db-textstyle-tr>
           <db-ucs-tr>
           <db-view-tr>
           <db-vport-tr>
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
   *section-names*
   *table-names*))

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; line-weights.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; http://help.autodesk.com/view/ACD/2017/RUS/

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

(defparameter *dxf-header*
  (format nil "AutoCAD Binary DXF~C~%~C~C"
                 (code-char 13)
                 (code-char 26)
                 (code-char 0)))

(defun dxf-out-t-header (stream) stream)

(defun dxf-out-b-header (stream)
  (write-sequence (babel:string-to-octets *dxf-header*)
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

http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A85E8E67-27CD-4C59-BE61-4DC9FADBE74A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A85E8E67-27CD-4C59-BE61-4DC9FADBE74A
")))

(defmethod dxf-out-text :before ((x <db-header>) stream)
  (dxf/out:txt-string 0 dxf/sec:*section* stream)
  (dxf/out:txt-string 2 dxf/sec:*section-header* stream))

(defmethod dxf-out-text ((x <db-header>) stream)
  (mapc #'(lambda (el)
	    (when (third el)
	      (dxf/out:txt-string 9 (concatenate 'string "$" (first el)) stream)
	      (dxf/out:txt (second el) (third el) stream)))
	(header-vars x)))

(defmethod dxf-out-text :after ((x <db-header>) stream)
    (dxf/out:txt-string 0 dxf/sec:*endsec* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; db-classes.lisp

(defun make-slot (el)
  "Вспмогательная функция для формирования слотов"
  (list  el
	 :accessor el
	 :initarg (read-from-string (concatenate 'string ":"(symbol-name el)))
	 :initform nil
	 :documentation (symbol-name el)))

(defparameter *radian-to-degree* (/ 180 pi))

(defparameter *degree-to-radian* (/ pi 180))

(defclass <ge-point-3d> ()
    ((point-3d :accessor point-3d :initarg :point-3d :initform (vector 0 0 0))))

(defmethod write-dxf-binary (code (point-3d <ge-point-3d>) stream)
  (dxf/out:bin-double (+ 00 code) (svref (point-3d point-3d) 0) stream)
  (dxf/out:bin-double (+ 10 code) (svref (point-3d point-3d) 1) stream)
  (dxf/out:bin-double (+ 20 code) (svref (point-3d point-3d) 2) stream))
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

(defparameter *acad-object-properties* '(Application Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(mapcar #'make-slot (set-difference *acad-object-properties* *object-properties*))

(defgeneric dxf-out-text (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в текстовом формате."))

(defmethod dxf-out-text ((x <Acad-Object>) stream)
  (dxf/out:txt-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-text :after ((x <Acad-Object>) stream)
  (let (
	(hdl (handle x))
	(own (owner-id x)))
    (when hdl (dxf/out:txt-hex   5 hdl stream))
    (when own (dxf/out:txt-hex 330 own stream))))

;;;;

(defgeneric dxf-out-binary (object stream)
  (:documentation
   "@b(Описание:) обобщенная функция @b(dxf-out-text) выводит содержимое 
объекта @b(object) в поток @b(stream) в двоичном формате."))

(defmethod dxf-out-binary ((x <Acad-Object>) stream)
  (dxf/out:txt-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x <Acad-Object>) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf/out:txt-hex 330 own stream))
    (when hdl (dxf/out:txt-hex   5 hdl stream))))

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
   (entity-transparency)
   (line-type
    :accessor line-type
    :initarg :line-type  :initform "BYLAYER"
    :documentation
    "Код 6. Linetype name (present if not BYLAYER). The special name
    BYBLOCK indicates a floating linetype (optional) | BYLAYER |" )
   (hyperlinks)
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
   (material)
   (PlotStyleName)
   (true-color
    :accessor true-color
    :initarg :true-color :initform dxf/color:*bylayer*
    :documentation
    "Код   62 и 420" )
   (visible
    :accessor visible
    :initarg :visible :initform t
    :documentation
    " 60 | Object visibility (optional): 0 = Visible 1 = Invisible | 0"))
  #+nil (plotstylename :accessor plotstylename :initarg :plotstylename :initform nil :documentation "plotstylename")
  #+nil (material :accessor material :initarg :material :initform nil :documentation "material")

  (:documentation "См. ./dbmain.h:class ADESK_NO_VTABLE AcDbEntity: public AcDbObject

"))

(defparameter *acad-entity-properties* '(Application Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-entity-properties* *acad-object-properties*)))

;;;;

(defmethod dxf-out-text ((x <acad-entity>) stream)
  (dxf/out:txt-string 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-entity>) stream)
  (dxf/out:txt-string 100 *acad-entity-subclass-marker* stream)
  (let ((la  (Layer  x))
	(cl  (make-instance 'dxf/color:<color> :entity-color (true-color x)))
	(lt  (line-type  x))
	(vi  (visible   x))
	(lts (line-type-scale x))
	(lw  (line-weight x))
	)
    (dxf/out:txt-string 8 la stream)
    (unless (string= "BYLAYER" lt ) (dxf/out:txt 6 lt stream))
    (cond
      ((= dxf/color:+ac-Color-Method-ByLayer+ (dxf/color:color-method cl)))
      ((= dxf/color:+ac-color-method-byblock+ (dxf/color:color-method cl))
       (dxf/out:txt 62 (dxf/color:color-index cl) stream))
      ((= dxf/color:+ac-color-method-byaci+ (dxf/color:color-method cl))
       (dxf/out:txt-int16 62 (dxf/color:color-index cl) stream))
      ((= dxf/color:+ac-color-method-byrgb+ (dxf/color:color-method cl))
       (dxf/out:txt-int16 62  (dxf/color:color-index cl) stream)
       (dxf/out:txt-int32 420 (dxf/color:rgb->true (dxf/color:rgb cl)) stream)))
    (unless (= lts 1.d0) (dxf/out:txt 48 lts stream))
    (unless (= lw -1) (dxf/out:txt-int16  370 lw stream))
    (unless vi  (dxf/out:txt 60 1 stream))))

;;;;

(defmethod dxf-out-binary ((x <acad-entity>) stream)
  (dxf/out:bin-string 0 *acad-entity-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-entity>) stream)
  (dxf/out:bin-string 100 *acad-entity-subclass-marker* stream)
  (let ((hdl (Handle x))
	(la (Layer x))
	(cl (true-color x)))
    (when hdl (dxf/out:bin-hex 5 hdl stream))
    (dxf/out:bin-string 8 la stream)
    (unless (= 256 cl) (dxf/out:bin-int16 62  cl stream))))

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

  (:documentation "См. ./dbents.h:class AcDbLine: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-FCEF5726-53AE-4C43-B4EA-C84EB8686A66

LINE (DXF)
К объектам линии применяются следующие групповые коды.
Групповые коды линии
|---------------+---------------------------------------------------------------------------|
| Групповой код | Описание                                                                  |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLine)                                               |
|---------------+---------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Начальная точка (в МСК)                                                   |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начальной точки (в МСК)                      |
|---------------+---------------------------------------------------------------------------|
|            11 | Конечная точка (в МСК)                                                    |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z конечной точки (в МСК)                           |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|---------------+---------------------------------------------------------------------------|

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
"))

(defmethod dxf-out-text ((x <Acad-Line>) stream)
  (dxf/out:txt-string 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-text :after ((x <Acad-Line>) stream)
  (dxf/out:txt-string 100 *Acad-Line-subclass-marker* stream)
  (let ((th  (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out:txt-double 39 th stream))
    (dxf/out:txt-point-3d 10 p-s stream)
    (dxf/out:txt-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf/out:txt-point-3d nrm 210 stream))))

;;;;

(defmethod dxf-out-binary ((x <Acad-Line>) stream)
  (dxf/out:bin-string 0 *Acad-Line-class-marker* stream))

(defmethod dxf-out-binary :after ((x <Acad-Line>) stream)
  (dxf/out:bin-string 100 *Acad-Line-subclass-marker* stream)
  (let ((th (thickness x))
        (p-s (StartPoint x))
	(p-e (EndPoint x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out:bin-double 39 th stream))
    (dxf/out:bin-point-3d 10 p-s stream)
    (dxf/out:bin-point-3d 11 p-e stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1))
      (dxf/out:bin-point-3d nrm 210 stream))))

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

  (:documentation "См. ./dbents.h:class AcDbPoint: public AcDbEntity
		  http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317
		  http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-9C6AD32D-769D-4213-85A4-CA9CCB5C5317

POINT (DXF)
К точечным объектам применяются следующие групповые коды.
Групповые коды точки 
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbPoint)                                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            10 | Местоположение точки (в МСК)                                                                                                              |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для местоположения точки (в МСК)                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                                                                                        |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                                                                 |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Угол оси X для ПСК, используемый при построении точки (необязательно, по умолчанию = 0); используется, если параметр PDMODE не равен нулю |
|---------------+-------------------------------------------------------------------------------------------------------------------------------------------|
"))

(defparameter *acad-point-properties* '(Application Coordinates Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Thickness TrueColor Visible))

(mapcar #'make-slot (set-difference *acad-point-properties* *acad-entity-properties*))

(defmethod dxf-out-text ((x <acad-point>) stream)
    (dxf/out:txt-string 0 *acad-point-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-point>) stream)
  (dxf/out:txt-string 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th  0) (dxf/out:txt-double  39 th stream))
    (dxf/out:txt-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:txt-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf/out:txt-double 50 ecs stream))))

;;;;

(defmethod dxf-out-binary ((x <acad-point>) stream)
  (dxf/out:bin-string 0 *acad-point-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-point>) stream)
  (dxf/out:bin-string 100 *acad-point-subclass-marker* stream)
  (let ((th  (thickness x))
        (pos (coordinates x))
	(ecs (ecs-angle x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out:bin-double 39 th stream))
    (dxf/out:bin-point-3d 10 pos stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:bin-point-3d 210 nrm stream))
    (unless (= ecs 0) (dxf/out:bin-double 50 ecs stream))))

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
  (:documentation "См. ./dbray.h:class AcDbRay: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-638B9F01-5D86-408E-A2DE-FA5D6ADBD415

RAY (DXF)
К объектам луча применяются следующие групповые коды.
Групповые коды луча 
|---------------+--------------------------------------------------------------|
| Групповой код | Описание                                                     |
|---------------+--------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbRay)                                   |
|---------------+--------------------------------------------------------------|
|            10 | Начальная точка (в МСК)                                      |
|               | Файл DXF: значение X; приложение: 3D-точка                   |
|---------------+--------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начальной точки (в МСК)         |
|---------------+--------------------------------------------------------------|
|            11 | Вектор единичного направления (в МСК)                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                  |
|---------------+--------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z вектора направления единицы (в МСК) |
|---------------+--------------------------------------------------------------|
"))

(defparameter *acad-ray-properties* '(Application BasePoint DirectionVector Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName SecondPoint TrueColor Visible))

(mapcar #'make-slot (set-difference *acad-ray-properties* *acad-entity-properties*))

;;;;

(defmethod dxf-out-text ((x <acad-ray>) stream)
  (dxf/out:txt-string 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-text  :after ((x <acad-ray>) stream)
  (dxf/out:txt-string 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out:txt-point-3d 10 b-p stream)
    (dxf/out:txt-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x <acad-ray>) stream)
  (dxf/out:bin-string 0 *acad-ray-class-marker* stream))

(defmethod dxf-out-binary  :after ((x <acad-ray>) stream)
  (dxf/out:bin-string 100 *acad-ray-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out:bin-point-3d 10 b-p stream)
    (dxf/out:bin-point-3d 11 u-d stream)))

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
  (:documentation "См. ./dbxline.h:class AcDbXline: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-55080553-34B6-40AA-9EE2-3F3A3A2A5C0A

XLINE (DXF)
К объектам XLINE применяются следующие групповые коды.
Групповые коды XLINE
|---------------+--------------------------------------------------------------|
| Групповой код | Описание                                                     |
|---------------+--------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbXline)                                 |
|---------------+--------------------------------------------------------------|
|            10 | Первая точка (в МСК)                                         |
|               | Файл DXF: значение X; приложение: 3D-точка                   |
|---------------+--------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z первой точки (в МСК)                |
|---------------+--------------------------------------------------------------|
|            11 | Вектор единичного направления (в МСК)                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                  |
|---------------+--------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z вектора направления единицы (в МСК) |
|---------------+--------------------------------------------------------------|
"))


(defparameter *acad-xline-properties* '(Application BasePoint DirectionVector Document EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material ObjectID ObjectName OwnerID PlotStyleName SecondPoint TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-xline-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x <acad-xline>) stream)
  (dxf/out:txt-string 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-text  :after ((x <acad-xline>) stream)
  (dxf/out:txt-string 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out:txt-point-3d 10 b-p stream)
    (dxf/out:txt-point-3d 11 u-d stream)))

(defmethod dxf-out-binary ((x <acad-xline>) stream)
  (dxf/out:bin-string 0 *acad-xline-class-marker* stream))

(defmethod dxf-out-binary  :after ((x <acad-xline>) stream)
  (dxf/out:bin-string 100 *acad-xline-subclass-marker* stream)
  (let ((b-p (base-point x))
	(u-d (direction-vector x)))
    (dxf/out:bin-point-3d 10 b-p stream)
    (dxf/out:bin-point-3d 11 u-d stream)))

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
   "См. ./dbents.h:class AcDbCircle: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8663262B-222C-414D-B133-4A8506A27C18

CIRCLE (DXF)
К объектам CIRCLE применяются следующие групповые коды.
Групповые коды CIRCLE 
| Групповой код | Описание                                                                  |
|           100 | Маркер подкласса (AcDbCircle)                                             |
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Центральная точка (в ОСК)                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в ОСК)                    |
|            40 | Радиус                                                                    |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|               | Понятия, связанные с данным                                               |
|---------------+---------------------------------------------------------------------------|
"))

(defmethod dxf-out-text ((x <Acad-Circle>) stream)
  (dxf/out:txt-string 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-text  :after ((x <Acad-Circle>) stream)
  (dxf/out:txt-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out:txt-double 39 th stream))
    (dxf/out:txt-point-3d 10 p-c stream)
    (dxf/out:txt-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:txt-point-3d 210 nrm stream))))

;;;;

(defmethod dxf-out-binary ((x <Acad-Circle>) stream)
  (dxf/out:bin-string 0 *Acad-Circle-class-marker*  stream))

(defmethod dxf-out-binary :after ((x <Acad-Circle>) stream)
  (dxf/out:bin-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
        (p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2)))
    (unless (= th 0) (dxf/out:bin-double 39 th stream))
    (dxf/out:bin-point-3d 10 p-c stream)
    (dxf/out:bin-double 40 rad stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:bin-point-3d 210 nrm stream))))

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

  (:documentation "./dbents.h:class AcDbArc: public AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-0B14D8F1-0EBA-44BF-9108-57D8CE614BC8

ARC (DXF)
К объектам дуги применяются следующие групповые коды.
Групповые коды дуги 
|---------------+---------------------------------------------------------------------------|
| Групповой код | Описание                                                                  |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbCircle)                                             |
|---------------+---------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                        |
|---------------+---------------------------------------------------------------------------|
|            10 | Центральная точка (в ОСК)                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                |
|---------------+---------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в ОСК)                    |
|---------------+---------------------------------------------------------------------------|
|            40 | Радиус                                                                    |
|---------------+---------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbArc)                                                |
|---------------+---------------------------------------------------------------------------|
|            50 | Начальный угол                                                            |
|---------------+---------------------------------------------------------------------------|
|            51 | Конечный угол                                                             |
|---------------+---------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1) |
|               | Файл DXF: значение X; приложение: 3D-вектор                               |
|---------------+---------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)     |
|---------------+---------------------------------------------------------------------------|

"))

(defparameter *acad-arc-properties* '(Application ArcLength Area Center Document EndAngle EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName OwnerID PlotStyleName Radius StartAngle StartPoint Thickness TotalAngle TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-arc-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x <acad-arc>) stream)
  (dxf/out:txt-string 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-arc>) stream)
  (dxf/out:txt-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf/out:txt-double 39 th stream))
    (dxf/out:txt-point-3d 10 p-c stream)
    (dxf/out:txt-double 40 rad stream)
    (dxf/out:txt-string 100 *acad-arc-subclass-marker* stream)
    (dxf/out:txt-double 50 s-a stream)
    (dxf/out:txt-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:txt-point-3d 210 nrm stream))))

(dxf/out:txt-point-3d 210 (vector 1 2 3)t)
;;;;

(defmethod dxf-out-binary ((x <acad-arc>) stream)
  (dxf/out:bin-string 0 *acad-arc-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-arc>) stream)
  (dxf/out:bin-string 100 *Acad-Circle-subclass-marker* stream)
  (let ((th (thickness x))
	(p-c (center x))
	(rad (radius x))
	(nrm (normal x))
	(x-n (svref (normal x) 0))
	(y-n (svref (normal x) 1))
	(z-n (svref (normal x) 2))
	(s-a (* *radian-to-degree* (start-angle x)))
	(e-a (* *radian-to-degree* (end-angle x))))
    (unless (= th 0) (dxf/out:bin-double 39 th stream))
    (dxf/out:bin-point-3d 10 p-c stream)
    (dxf/out:bin-double 40 rad stream)
    (dxf/out:bin-string 100 *acad-arc-subclass-marker* stream)
    (dxf/out:bin-double 50 s-a stream)
    (dxf/out:bin-double 51 e-a stream)
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:bin-point-3d 210 nrm stream))))

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

  (:documentation "См. ./dbents.h:class AcDbText: public AcDbEntity
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-62E5383D-8A14-47B4-BFC4-35824CAE8363

TEXT (DXF)
К объектам текста применяются следующие групповые коды.
Групповые коды текста
| Групповой код | Описание                                                                                                                                          |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbText)                                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            39 | Толщина (необязательно; значение по умолчанию = 0)                                                                                                |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            10 | Первая точка выравнивания (в ОСК)                                                                                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z первой точки выравнивания (в ОСК)                                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            40 | Высота текста                                                                                                                                     |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|             1 | Значение по умолчанию (сама строка)                                                                                                               |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Поворот текста (необязательно; значение по умолчанию = 0)                                                                                         |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            41 | Относительный масштабный коэффициент по оси X: ширина (необязательно; значение по умолчанию = 1)                                                  |
|               | Это значение также корректируется при использовании вписываемого текста                                                                           |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            51 | Угол наклона (необязательно; значение по умолчанию = 0)                                                                                           |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|             7 | Имя стиля текста (необязательно, значение по умолчанию = STANDARD)                                                                                |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            71 | Флаги создания текста (необязательно, значение по умолчанию = 0):                                                                                 |
|               | 2 = текст в обратном направлении (зеркально отражен по X)                                                                                         |
|               | 4 = текст перевернут (зеркально отражен по Y)                                                                                                     |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            72 | Тип выравнивания текста по горизонтали (необязательно, значение по умолчанию = 0); целочисленные коды (не битовые):                               |
|               | 0 = слева                                                                                                                                         |
|               | 1 = по центру                                                                                                                                     |
|               | 2 = справа                                                                                                                                        |
|               | 3 = параллельно (если выравнивание по вертикали = 0)                                                                                              |
|               | 4 = посередине (если выравнивание по вертикали = 0)                                                                                               |
|               | 5 = вписать (если выравнивание по вертикали = 0)                                                                                                  |
|               | Подробности см. в таблице целочисленных групповых кодов 72 и 73                                                                                   |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            11 | Вторая точка выравнивания (в ОСК) (необязательно)                                                                                                 |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                                                        |
|               | Это значение имеет смысл, только если значение групп 72 или 73 не равно нулю (если выравнивание не является выравниванием по базовой линии/слева) |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z второй точки выравнивания (в ОСК) (необязательно)                                                                        |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                                                                         |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                                                                             |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbText)                                                                                                                       |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|
|            73 | Тип выравнивания текста по вертикали (необязательно, значение по умолчанию = 0); целочисленные коды (не битовые):                                 |
|               | 0 = по базовой линии                                                                                                                              |
|               | 1 = снизу                                                                                                                                         |
|               | 2 = посередине                                                                                                                                    |
|               | 3 = сверху                                                                                                                                        |
|               | Подробности см. в таблице целочисленных групповых кодов 72 и 73                                                                                   |
|---------------+---------------------------------------------------------------------------------------------------------------------------------------------------|

В следующей таблице подробно описываются групповые коды 72 (выравнивание по горизонтали) и 73 (выравнивание по вертикали). 
Целочисленные групповые коды 72 и 73 
|----------------------+----------+----------+----------+--------------+----------+-----------|
| Группа с кодом 73    | Группа с | Группа с | Группа с | Группа с     | Группа с | Группа с  |
|                      | кодом 72 | кодом 72 | кодом 72 | кодом 72     | кодом 72 | кодом 72  |
|                      | 0        | 1        | 2        | 3            | 4        | 5         |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 3 (сверху)           | ВЛ       | ВЦ       | ВП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 2 (посередине)       | СЛ       | СЦ       | СП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 1 (снизу)            | НЛ       | НЦ       | НП       |              |          |           |
|----------------------+----------+----------+----------+--------------+----------+-----------|
| 0 (по базовой линии) | Левая    | Центр    | Справа   | Параллельный | Середина | По ширине |
|----------------------+----------+----------+----------+--------------+----------+-----------|
Если значения групп с кодом 72 и (или) 73 не равны нулю, то значения первой точки выравнивания игнорируются, 
и приложением AutoCAD рассчитываются новые значения на основе второй точки выравнивания и длины и высоты 
самой текстовой строки (после применения стиля текста). Если значения групп с кодами 72 и 73 равны нулю или 
отсутствуют, то вторая точка выравнивания является нерелевантной. 

"))

(defparameter *acad-text-properties* '(Alignment Application Backward Document EntityTransparency Handle HasExtensionDictionary Height Hyperlinks InsertionPoint Layer Linetype LinetypeScale Lineweight Material Normal ObjectID ObjectName ObliqueAngle OwnerID PlotStyleName Rotation ScaleFactor StyleName TextAlignmentPoint TextGenerationFlag TextString Thickness TrueColor UpsideDown Visible))

(mapcar #'make-slot (set-difference *acad-text-properties* *acad-entity-properties*))


(defmethod dxf-out-text ((x <acad-text>) stream)
    (dxf/out:txt-string 0 *acad-text-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-text>) stream)
  (dxf/out:txt-string 100 *acad-text-subclass-marker* stream)
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
    (unless (= th 0) (dxf/out:txt-double 39 th stream))
    (dxf/out:txt-point-3d 10 p-p stream)
    (dxf/out:txt-double 40 h stream)
    (dxf/out:txt-string 1 t-s stream)
    (dxf/out:txt-double 50 (* *radian-to-degree* rot) stream)
    (dxf/out:txt-double 41 w-f stream)
    (dxf/out:txt-double 51 (* *radian-to-degree* ob) stream)
    (dxf/out:txt-string 7 st stream)
    (unless (= mir 0) (dxf/out:txt-int16 71 mir stream))
    (unless (= h-j 0) (dxf/out:txt-int16 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf/out:txt-point-3d 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:txt-point-3d 210 nrm stream))
    (dxf/out:txt-string 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf/out:txt-int16 73 v-j stream))))

;;;;

(defmethod dxf-out-binary ((x <acad-text>) stream)
  (dxf/out:bin-string 0 *acad-text-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-text>) stream)
  (dxf/out:bin-string 100 *acad-text-subclass-marker* stream)
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
    (unless (= th 0) (dxf/out:bin-double 39 th stream))
    (dxf/out:bin-point-3d 10 p-p stream)
    (dxf/out:bin-double 40 h stream)
    (dxf/out:bin-string 1 t-s stream)
    (dxf/out:bin-double 50 (* *radian-to-degree* rot) stream)
    (dxf/out:bin-double 41 w-f stream)
    (dxf/out:bin-double 51 (* *radian-to-degree* ob) stream)
    (dxf/out:bin-string 7 st stream)
    (unless (= mir 0) (dxf/out:bin-int16 71 mir stream))
    (unless (= h-j 0) (dxf/out:bin-int16 72 h-j stream))
    (when   (or (/= h-j 0) (/= v-j 0)) (dxf/out:bin-point-3d 11 a-p stream))
    (unless (and (= x-n 0) (= y-n 0) (= z-n 1)) (dxf/out:bin-point-3d 210 nrm stream))
    (dxf/out:bin-string 100 *acad-text-subclass-marker* stream)
    (unless (= v-j 0) (dxf/out:bin-int16 73 v-j stream))))

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
  (:documentation "См. ./dbelipse.h:class AcDbEllipse: public  AcDbCurve
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-107CB04F-AD4D-4D2F-8EC9-AC90888063AB

ELLIPSE (DXF)
К объектам эллипса применяются следующие групповые коды.
Групповые коды эллипса
|---------------+------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                       |
|---------------+------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbEllipse)                                                                 |
|---------------+------------------------------------------------------------------------------------------------|
|            10 | Центральная точка (в МСК)                                                                      |
|               | Файл DXF: значение X; приложение: 3D-точка                                                     |
|---------------+------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для центральной точки (в МСК)                                         |
|---------------+------------------------------------------------------------------------------------------------|
|            11 | Конечная точка главной оси относительно центральной точки (в МСК)                              |
|               | Файл DXF: значение X; приложение: 3D-точка                                                     |
|---------------+------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z для конечной точки главной оси относительно центральной точки (в МСК) |
|---------------+------------------------------------------------------------------------------------------------|
|           210 | Направление выдавливания (необязательно; значение по умолчанию = 0, 0, 1)                      |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                    |
|---------------+------------------------------------------------------------------------------------------------|
|      220, 230 | Файл DXF: значения Y и Z для направления выдавливания (необязательно)                          |
|---------------+------------------------------------------------------------------------------------------------|
|            40 | Соотношение малой и главной осей                                                               |
|---------------+------------------------------------------------------------------------------------------------|
|            41 | Начальный параметр (значение для полного эллипса — 0,0)                                        |
|---------------+------------------------------------------------------------------------------------------------|
|            42 | Конечный параметр (значение для полного эллипса — 2 пи)                                        |
|---------------+------------------------------------------------------------------------------------------------|

"))


(defparameter *acad-acad-ellipse-properties* '(Application Area Center Document EndAngle EndParameter EndPoint EntityTransparency Handle HasExtensionDictionary Hyperlinks Layer Linetype LinetypeScale Lineweight MajorAxis MajorRadius Material MinorAxis MinorRadius Normal ObjectID ObjectName OwnerID PlotStyleName RadiusRatio StartAngle StartParameter StartPoint TrueColor Visible))

(reverse (mapcar #'make-slot (set-difference *acad-acad-ellipse-properties* *acad-entity-properties*)))

(defmethod dxf-out-text ((x <acad-ellipse>) stream)
  (dxf/out:txt-string 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-ellipse>) stream)
  (dxf/out:txt-string 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf/out:txt-point-3d 10 p-c stream)
    (dxf/out:txt-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf/out:txt-point-3d 210 u-n stream))
    (dxf/out:txt-double 40 r-r stream)
    (dxf/out:txt-double 41 s-p stream)
    (dxf/out:txt-double 42 e-p stream)))

;;;;

(defmethod dxf-out-binary ((x <acad-ellipse>) stream)
  (dxf/out:bin-string 0 *acad-ellipse-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-ellipse>) stream)
  (dxf/out:bin-string 100 *acad-ellipse-subclass-marker* stream)
  (let ((p-c   (center x))
	(p-ma  (map 'vector #'+ (center x) (major-axis x)))
	(u-n   (normal x))
	(u-n-x (svref (normal x) 0))
	(u-n-y (svref (normal x) 1))
	(u-n-z (svref (normal x) 2))
	(r-r (radius-ratio x))
	(s-p (start-parameter x))
	(e-p (end-parameter   x)))
    (dxf/out:bin-point-3d 10 p-c stream)
    (dxf/out:bin-point-3d 11 p-ma stream)
    (unless (and (= u-n-x 0) (= u-n-y 0) (= u-n-z 1)) (dxf/out:bin-point-3d 210 u-n stream))
    (dxf/out:bin-double 40 r-r stream)
    (dxf/out:bin-double 41 s-p stream)
    (dxf/out:bin-double 42 e-p stream)))

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
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
====================================================================================================
" ))

(defparameter *acad-layer-properties* '(Application Description Document Freeze Handle HasExtensionDictionary LayerOn Linetype Lineweight Lock Material Name ObjectID ObjectName OwnerID PlotStyleName Plottable TrueColor Used  ViewportDefault ))

(reverse (mapcar #'make-slot (set-difference *acad-layer-properties* *acad-object-properties*)))

;;;;

(defmethod dxf-out-text ((x <acad-layer>) stream)
  (dxf/out:txt-string 0 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-layer>) stream)
  (dxf/out:txt-string 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf/out:txt-string 100 *acad-layer-subclass-marker* stream)
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
    (dxf/out:txt-string  2 name   stream)
    (dxf/out:txt-int16  70 c-70   stream)
    (cond
      ((= 0   (first cl)) (dxf/out:txt 62 (first cl) stream))
      ((and (< 0 (first cl) 256) (null (second cl)))
       (dxf/out:txt-int16 62 (* (first cl) layeron) stream))
      ((and (< 0 (first cl) 256) (second cl))
       (dxf/out:txt-int16 62  (* (first cl) layeron) stream)
       (dxf/out:txt-int32 420 (dxf/color:rgb->true (second cl)) stream)))
    (dxf/out:txt         6 l-ltype   stream)
    (dxf/out:txt       290 plottable stream)
    (dxf/out:txt       370 l-lweight stream)
    (dxf/out:txt       390 l-pstyle  stream)
    (dxf/out:txt       347 l-mat     stream)
;;; (dxf/out:txt       348 l-vstyle  stream)
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
"))

(defparameter *acad-layers-properties* '(Application A-Count Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(reverse (mapcar #'make-slot (set-difference *acad-layers-properties* *acad-object-properties*)))

(defmethod dxf-out-text ((x <acad-layers>) stream)
  (dxf/out:txt-string 2 *acad-layer-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-layers>) stream)
  (dxf/out:txt-string 100 *acad-symboltable-subclass-marker* stream)
  (let ((a-count (a-count x))
	(items   (items   x)))
    (dxf/out:txt-int16  70 a-count   stream)
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
  (:documentation "The collection of all AutoCAD drawings that are open in the current session."))

(defclass <acad-database> (<object>)
  ((blocks                   :accessor blocks                   :initarg :blocks                   :initform nil :documentation "blocks")
   (dictionaries             :accessor dictionaries             :initarg :dictionaries             :initform nil :documentation "dictionaries")
   (dim-styles               :accessor dim-styles               :initarg :dim-styles               :initform nil :documentation "dim-styles")
   (elevation-model-space    :accessor elevation-model-space    :initarg :elevation-model-space    :initform nil :documentation "elevation-model-space")
   (elevation-paper-space    :accessor elevation-paper-space    :initarg :elevation-paper-space    :initform nil :documentation "elevation-paper-space")
   (groups                   :accessor groups                   :initarg :groups                   :initform nil :documentation "groups")
   (layers
    :accessor layers
    :initarg :layers
    :initform (make-instance '<acad-layers>)
    :documentation "layers")
   (layouts                  :accessor layouts                  :initarg :layouts                  :initform nil :documentation "layouts")
   (limits                   :accessor limits                   :initarg :limits                   :initform nil :documentation "limits")
   (linetypes
    :accessor linetypes
    :initarg :linetypes
    :initform (make-instance '<acad-linetypes>)
    :documentation "linetypes")
   (material                 :accessor material                 :initarg :material                 :initform nil :documentation "material")
   (model-space              :accessor model-space              :initarg :model-space              :initform nil :documentation "model-space")
   (paper-space              :accessor paper-space              :initarg :paper-space              :initform nil :documentation "paper-space")
   (plot-configurations      :accessor plot-configurations      :initarg :plot-configurations      :initform nil :documentation "plot-configurations")
   (preferences              :accessor preferences              :initarg :preferences              :initform nil :documentation "preferences")
   (registered-applications  :accessor registered-applications  :initarg :registered-applications  :initform nil :documentation "registered-applications")
   (section-manager          :accessor section-manager          :initarg :section-manager          :initform nil :documentation "section-manager")
   (summary-info             :accessor summary-info             :initarg :summary-info             :initform nil :documentation "summary-info")
   (text-styles              :accessor text-styles              :initarg :text-styles              :initform nil :documentation "text-styles")
   (user-coordinate-systems  :accessor user-coordinate-systems  :initarg :user-coordinate-systems  :initform nil :documentation "user-coordinate-systems")
   (viewports                :accessor viewports                :initarg :viewports                :initform nil :documentation "viewports")
   (views                    :accessor views                    :initarg :views                    :initform nil :documentation "views"))
  (:documentation "The contents of an XRef block."))

;;;;;;;;

(defparameter *acad-database-properties* '(Blocks Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace Groups Layers Layouts Limits Linetypes Material ModelSpace PaperSpace PlotConfigurations Preferences RegisteredApplications SectionManager SummaryInfo TextStyles UserCoordinateSystems Viewports Views))

(mapcar #'make-slot (set-difference *acad-database-properties* nil))

(defclass <acad-document> (<acad-database>)
  ((active                :accessor active                :initarg :active                :initform nil :documentation "active")
   (activedimstyle        :accessor activedimstyle        :initarg :activedimstyle        :initform nil :documentation "activedimstyle")
   (activelayer           :accessor activelayer           :initarg :activelayer           :initform nil :documentation "activelayer")
   (activelayout          :accessor activelayout          :initarg :activelayout          :initform nil :documentation "activelayout")
   (activelinetype        :accessor activelinetype        :initarg :activelinetype        :initform nil :documentation "activelinetype")
   (activematerial        :accessor activematerial        :initarg :activematerial        :initform nil :documentation "activematerial")
   (activepviewport       :accessor activepviewport       :initarg :activepviewport       :initform nil :documentation "activepviewport")
   (activeselectionset    :accessor activeselectionset    :initarg :activeselectionset    :initform nil :documentation "activeselectionset")
   (activespace           :accessor activespace           :initarg :activespace           :initform nil :documentation "activespace")
   (activetextstyle       :accessor activetextstyle       :initarg :activetextstyle       :initform nil :documentation "activetextstyle")
   (activeucs             :accessor activeucs             :initarg :activeucs             :initform nil :documentation "activeucs")
   (activeviewport        :accessor activeviewport        :initarg :activeviewport        :initform nil :documentation "activeviewport")
   (application           :accessor application           :initarg :application           :initform nil :documentation "application")
   (database              :accessor database              :initarg :database              :initform nil :documentation "database")
   (fullname              :accessor fullname              :initarg :fullname              :initform nil :documentation "fullname")
   (height                :accessor height                :initarg :height                :initform nil :documentation "height")
   (hwnd                  :accessor hwnd                  :initarg :hwnd                  :initform nil :documentation "hwnd")
   (materials             :accessor materials             :initarg :materials             :initform nil :documentation "materials")
   (mspace                :accessor mspace                :initarg :mspace                :initform nil :documentation "mspace")
   (name                  :accessor name                  :initarg :name                  :initform nil :documentation "name")
   (objectsnapmode        :accessor objectsnapmode        :initarg :objectsnapmode        :initform nil :documentation "objectsnapmode")
   (path                  :accessor path                  :initarg :path                  :initform nil :documentation "path")
   (pickfirstselectionset :accessor pickfirstselectionset :initarg :pickfirstselectionset :initform nil :documentation "pickfirstselectionset")
   (plot                  :accessor plot                  :initarg :plot                  :initform nil :documentation "plot")
   (readonly              :accessor readonly              :initarg :readonly              :initform nil :documentation "readonly")
   (saved                 :accessor saved                 :initarg :saved                 :initform nil :documentation "saved")
   (selectionsets         :accessor selectionsets         :initarg :selectionsets         :initform nil :documentation "selectionsets")
   (utility               :accessor utility               :initarg :utility               :initform nil :documentation "utility")
   (width                 :accessor width                 :initarg :width                 :initform nil :documentation "width")
   (windowstate           :accessor windowstate           :initarg :windowstate           :initform nil :documentation "windowstate")
   (windowtitle           :accessor windowtitle           :initarg :windowtitle           :initform nil :documentation "windowtitle")
;;;;;;;;
   (sec-header            :accessor sec-header            :initarg :sec-header            :initform nil :documentation "header      - Представление секции HEADER")
   (sec-classes           :accessor sec-classes           :initarg :sec-classes           :initform nil :documentation "classes     - Представление секции CLASSES")
   (sec-table-appid       :accessor sec-table-appid       :initarg :sec-table-appid       :initform nil :documentation "table-appid - Представление секции TABLE-APPID")

   )
  (:documentation "
 "))

(defparameter *acad-document-properties* '( Active ActiveDimStyle ActiveLayer ActiveLayout ActiveLinetype ActiveMaterial ActivePViewport ActiveSelectionSet ActiveSpace ActiveTextStyle ActiveUCS ActiveViewport Application Blocks Database Dictionaries DimStyles ElevationModelSpace ElevationPaperSpace FullName Groups Height HWND Layers Layouts Limits Linetypes Materials ModelSpace MSpace Name ObjectSnapMode PaperSpace Path PickfirstSelectionSet Plot PlotConfigurations Preferences ReadOnly RegisteredApplications Saved SectionManager SelectionSets SummaryInfo TextStyles UserCoordinateSystems Utility Viewports Views Width WindowState WindowTitle))

(reverse (mapcar #'make-slot (set-difference *acad-document-properties* *acad-database-properties*)) )


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
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "HEADER"  stream)
    (mapc #'(lambda (header)
	      (mapc #'(lambda (el) (dxf/out:txt (first el) (second el) stream)) header))
	  (sec-header x))
    (dxf/out:txt 0 "ENDSEC" stream))
  (block section-classes
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "CLASSES" stream)
    (mapc #'(lambda (class)
	      (mapc #'(lambda (el) (dxf/out:txt (first el) (second el) stream)) class))
	  (sec-classes x))
    (dxf/out:txt 0 "ENDSEC" stream))
  (block section-tables
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "TABLES" stream)
;;;
    (dxf/out:txt 0 "ENDSEC" stream)
    )
  (block section-blocks
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "BLOCKS" stream)
;;;
    (dxf/out:txt 0 "ENDSEC" stream)
    )
  (block section-entities
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "ENTITIES" stream)
;;;
    (dxf/out:txt 0 "ENDSEC" stream)
    )
  (block section-objects
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "OBJECTS" stream)
;;;
    (dxf/out:txt 0 "ENDSEC" stream)
    )
    (block section-objects
    (dxf/out:txt 0 "SECTION" stream)
    (dxf/out:txt 2 "ACDSDATA" stream)
;;;
    (dxf/out:txt 0 "ENDSEC" stream)
    )
    
    (dxf/out:txt 0 "EOF" stream)
  )

;;;;;;;;

(defparameter *acad-linetype-class-marker* "LTYPE")

(defparameter *acad-linetype-subclass-marker* "AcDbLinetypeTableRecord")

(defclass <acad-linetype>  (<acad-object>)
  ((name        :accessor name        :initarg :name        :initform "CONTINUOUS" :documentation "name")
   (description :accessor description :initarg :description :initform ""           :documentation "description"))
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================

"))

(defparameter *acad-linetype-properties* '(Application Description Document Handle HasExtensionDictionary Name ObjectID ObjectName OwnerID))

(mapcar #'make-slot (set-difference *acad-linetype-properties* *acad-object-properties*))

(defmethod dxf-out-text ((x <acad-linetype>) stream)
  (dxf/out:txt-string 0 *acad-linetype-class-marker* stream))

(defmethod dxf-out-text :after ((x <acad-linetype>) stream)
  (dxf/out:txt-string 100 *acad-symboltablerecord-subclass-marker* stream)
  (dxf/out:txt-string 100 *acad-linetype-subclass-marker* stream)
  (let ((name            (name            x))
	(description     (description     x))
	(pairs           (pairs           x)))
    (dxf/out:txt-string  2 name   stream)
    (dxf/out:txt-int16  70 (cadr (assoc 70 pairs))   stream)
    (dxf/out:txt-string  3 description stream)
    (mapcar
     #'(lambda (el)
	 (dxf/out:txt (car el) (cadr el) t))
     (member (assoc 72 pairs) pairs))))

;;;;

(defmethod dxf-out-binary ((x <acad-linetype>) stream)
  (dxf/out:txt-string 0 *Acad-Object-class-marker* stream))

(defmethod dxf-out-binary :after ((x <acad-linetype>) stream)
  (let ((own (Owner-ID  x))
	(hdl (Handle x)))
    (when own (dxf/out:txt-hex 330 own stream))
    (when hdl (dxf/out:txt-hex   5 hdl stream))))

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
  ((a-count  :accessor a-count :initarg :a-count :initform 0   :documentation "70 a-count -> a-count переимновано из-за ошибки")
   (items  :accessor items                   :initform nil :documentation "Коллекция слоев. Это свойство отсутствует в перечне свойств Object Model (ActiveX)"))
  (:documentation "
"))

(defparameter *acad-linetypes-properties* '(Application A-Count Document Handle HasExtensionDictionary ObjectID ObjectName OwnerID))

(reverse (mapcar #'make-slot (set-difference *acad-linetypes-properties* *acad-object-properties*)))

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
   (A-Count            :accessor symbol-tbl-flag   :initarg :A-Count            :initform 0              :documentation "Код  70. Стандартные флаги")
   (symbol-tbl-items :accessor symbol-tbl-items  :initarg :symbol-tbl-items :initform nil :documentation "Записи таблицы."))
  (:documentation "См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295

Group codes that apply to all symbol tables
| Group code | Description                                                                                                                                                          |   |
|------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+---|
|         -1 | APP: entity name (changes each time a drawing is opened)                                                                                                             |   |
|          0 | Object type (TABLE)                                                                                                                                                  |   |
|          2 | Table name                                                                                                                                                           |   |
|          5 | Handle                                                                                                                                                               |   |
|        102 | “{ACAD_XDICTIONARY” indicates the start of an extension dictionary group. This group exists only if persistent reactors have been attached to this object (optional) |   |
|        360 | Hard owner ID/handle to owner dictionary (optional)                                                                                                                  |   |
|        102 | End of group, “}” (optional)                                                                                                                                         |   |
|        330 | Soft-pointer ID/handle to owner object                                                                                                                               |   |
|        100 | Subclass marker (AcDbSymbolTable)                                                                                                                                    |   |
|         70 | Maximum number of entries in table                                                                                                                                   |   |

Пример DXF-кода:
  (0 \"TABLE\") (2 \"BLOCK_RECORD\") (5 1) (330 0) (100 \"AcDbSymbolTable\") (70 1)
    ...
   (0 \"ENDTAB\")
"))

(defclass <acad-blocks> ()
    ((Object-Name ))
  (:documentation "
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

"))

(defmethod dxf-out-text ((x <db-symbol-tbl>) stream)
  (dxf/out:txt-string 0 *symbol-tbl-class-marker* stream)
    (let ((st-name (Object-Name x)))
    (dxf/out:txt-string 2 st-name stream)))

(defmethod dxf-out-text :after ((x <db-symbol-tbl>) stream)
  (dxf/out:txt-string 100 *db-symbol-tr-subclass-marker* stream)
  (let ((st-flag  (symbol-tbl-flag x))
	(st-items (reverse (symbol-tbl-items x))))
    (dxf/out:txt-int16 70 st-flag stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) st-items)
    (dxf/out:txt-string 0 *end-tab* stream)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <db-block-rec> (<db-symbol-tbl>)
  ((block-tbl-name  :accessor block-tbl-name    :initarg :block-tbl-name :initform "SYMBOL-TABLE" :documentation "Код   2. Имя таблицы")
   )
  (:documentation "
| Group code | Description                                                                                                                                                                                                                                                                                                                                                                                               |
|------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        100 | Subclass marker (AcDbBlockTableRecord)                                                                                                                                                                                                                                                                                                                                                                    |
|          2 | Block name                                                                                                                                                                                                                                                                                                                                                                                                |
|        340 | Hard-pointer ID/handle to associated LAYOUT object                                                                                                                                                                                                                                                                                                                                                        |
|         70 | Block insertion units.                                                                                                                                                                                                                                                                                                                                                                                    |
|        280 | Block explodability                                                                                                                                                                                                                                                                                                                                                                                       |
|        281 | Block scalability                                                                                                                                                                                                                                                                                                                                                                                         |
|        310 | DXF: Binary data for bitmap preview (optional)                                                                                                                                                                                                                                                                                                                                                            |
|       1001 | Xdata application name “ACAD” (optional)                                                                                                                                                                                                                                                                                                                                                                  |
|       1000 | Xdata string data “DesignCenter Data” (optional)                                                                                                                                                                                                                                                                                                                                                          |
|       1002 | Begin xdata “{“ (optional)                                                                                                                                                                                                                                                                                                                                                                                |
|       1070 | Autodesk Design Center version number                                                                                                                                                                                                                                                                                                                                                                     |
|       1070 | Insert units: 0 = Unitless 1 = Inches 2 = Feet 3 = Miles 4 = Millimeters 5 = Centimeters 6 = Meters 7 = Kilometers 8 = Microinches 9 = Mils 10 = Yards 11 = Angstroms 12 = Nanometers 13 = Microns 14 = Decimeters 15 = Decameters 16 = Hectometers 17 = Gigameters 18 = Astronomical units 19 = Light years 20 = Parsecs 21 = US Survey Feet 22 = US Survey Inch 23 = US Survey Yard 24 = US Survey Mile |
|       1002 | End xdata “}“                                                                                                                                                                                                                                                                                                                                                                                             |

Пример DXF-кода
 (0 \"TABLE\") (2 \"BLOCK_RECORD\") (5 1) (330 0) (100 \"AcDbSymbolTable\") (70 1)
  (0 \"BLOCK_RECORD\") (5 112) (330 1) (100 \"AcDbSymbolTableRecord\") (100 \"AcDbBlockTableRecord\") (2 \"*Model_Space\") (340 115) (70 0) (280 1) (281 0) 
  (0 \"BLOCK_RECORD\") (5 108) (330 1) (100 \"AcDbSymbolTableRecord\") (100 \"AcDbBlockTableRecord\") (2 \"*Paper_Space\") (340 111) (70 0) (280 1) (281 0) 
  (0 \"BLOCK_RECORD\") (5 116) (330 1) (100 \"AcDbSymbolTableRecord\") (100 \"AcDbBlockTableRecord\") (2 \"*Paper_Space0\") (340 119) (70 0) (280 1) (281 0) 
 (0 \"ENDTAB\")


| Methods    | Add         | GetExtensionDictionary | GetXData | Item   | SetXData               |          |            |         |

| Properties | Application | A-Count                  | Document | Handle | HasExtensionDictionary | ObjectID | ObjectName | OwnerID |

| Events     | None        |                        |          |        |                        |          |            |         |




"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-symbol-tr-class-marker* "SYMBOL")

(defparameter *db-symbol-tr-subclass-marker* "AcDbSymbolTableRecord")

(defclass <db-object> () ())

(defclass <db-symbol-tr> (<db-object>)
  ((symbol-tr-name :accessor symbol-tr-name  :initarg :symbol-tr-name :initform "Undefined"    :documentation "Код   2. Имя таблицы")
   (symbol-tr-flag :accessor symbol-tr-flag  :initarg :symbol-tr-flag :initform 0              :documentation "Код  70. Стандартные флаги"))
  (:documentation "См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-5926A569-3E40-4ED2-AE06-6ACCE0EFC813
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-5926A569-3E40-4ED2-AE06-6ACCE0EFC813

Общие групповые коды записей таблицы обозначений (DXF)

В следующей таблице приведены групповые коды, которые применяются ко всем записям таблицы обозначений в файлах DXF. 
Обращаясь к таблице групповых кодов для объектов определенных типов, необходимо помнить, 
что указанные здесь коды также могут присутствовать.

Групповые коды, которые применяются ко всем записям таблицы обозначений
|---------------+----------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                           |
|---------------+----------------------------------------------------------------------------------------------------|
|            -1 | Приложение: имя объекта (изменяется при каждом открытии чертежа)                                   |
|---------------+----------------------------------------------------------------------------------------------------|
|             0 | Тип объекта (имя таблицы)                                                                          |
|---------------+----------------------------------------------------------------------------------------------------|
|             5 | Дескриптор (все, кроме DIMSTYLE)                                                                   |
|---------------+----------------------------------------------------------------------------------------------------|
|           105 | Дескриптор (только таблица DIMSTYLE)                                                               |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Начало определенной приложением группы \"{имя_приложения\". Например, \"{ACAD_REACTORS\"           |
|               | обозначает начало группы постоянных реакторов AutoCAD (необязательно)                              |
|---------------+----------------------------------------------------------------------------------------------------|
|         коды, | Коды и значения в пределах групп с кодом 102 определяются приложением (необязательно)              |
|  определенные |                                                                                                    |
|   приложением |                                                                                                    |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Конец группы, \"}\" (необязательно)                                                                |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | \"{ACAD_REACTORS\" обозначает начало группы постоянных реакторов AutoCAD. Эта группа присутствует, |
|               | только если постоянные реакторы были присоединены к данному объекту (необязательно)                |
|---------------+----------------------------------------------------------------------------------------------------|
|           330 | Идентификатор/дескриптор символьного указателя на словарь владельца (необязательно)                |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Конец группы, \"}\" (необязательно)                                                                |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | \"{ACAD_XDICTIONARY\" обозначает начало группы словаря расширений. Эта группа присутствует,        |
|               | только если к данному объекту были присоединены постоянные реакторы (необязательно)                |
|---------------+----------------------------------------------------------------------------------------------------|
|           360 | Идентификатор/дескриптор жесткой ссылки-владельца для владельца словаря (необязательно)            |
|---------------+----------------------------------------------------------------------------------------------------|
|           102 | Конец группы, \"}\" (необязательно)                                                                |
|---------------+----------------------------------------------------------------------------------------------------|
|           330 | Идентификатор/дескриптор символьного указателя на объект владельца                                 |
|---------------+----------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbSymbolTableRecord)                                                           |
|---------------+----------------------------------------------------------------------------------------------------|

"))

(defmethod dxf-out-text ((x <db-symbol-tr>) stream)
  (dxf/out:txt-string 0 *db-symbol-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x <db-symbol-tr>) stream)
  (dxf/out:txt-string 100 *db-symbol-tr-subclass-marker* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass <db-regapp-tr> (<db-symbol-tr>)
  ()
  (:documentation "./dbsymtb.h:class AcDbRegAppTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-6E3140E9-E560-4C77-904E-480382F0553E
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-6E3140E9-E560-4C77-904E-480382F0553E
==================================================
APPID (DXF)
К записям таблицы обозначений APPID применяются следующие групповые коды.
Групповые коды APPID 
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbRegAppTableRecord)                                                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
|             2 | Имя приложения, созданное пользователем или приложением (для расширенных данных).                                             |
|               | В этих записях таблицы содержится набор имен всех зарегистрированных приложений                                               |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                                       |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                                               |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается                                    |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                                  |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.                               |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF) |
|---------------+-------------------------------------------------------------------------------------------------------------------------------|
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
  (:documentation "find . -name \"*.h\" | xargs grep \"class AcDbBlockTableRecord\"
/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/dbsymtb.h:class AcDbBlockTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
====================================================================================================
BLOCK_RECORD (DXF)
К записям таблицы обозначений BLOCK_RECORD применяются следующие групповые коды.
Групповые коды BLOCK_RECORD
|---------------+---------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                    |
|---------------+---------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbBlockTableRecord)                                                     |
|---------------+---------------------------------------------------------------------------------------------|
|             2 | Имя блока                                                                                   |
|---------------+---------------------------------------------------------------------------------------------|
|           340 | Идентификатор/дескриптор жесткого указателя на связанный объект LAYOUT                      |
|---------------+---------------------------------------------------------------------------------------------|
|            70 | Единицы вставки блока.                                                                      |
|---------------+---------------------------------------------------------------------------------------------|
|           280 | Расчленяемость блока                                                                        |
|---------------+---------------------------------------------------------------------------------------------|
|           281 | Масштабируемость блока                                                                      |
|---------------+---------------------------------------------------------------------------------------------|
|           310 | Файл DXF: двоичные данные предварительного просмотра растрового изображения (необязательно) |
|---------------+---------------------------------------------------------------------------------------------|
|          1001 | Имя приложения расширенных данных, \"ACAD\" (необязательно)                                 |
|---------------+---------------------------------------------------------------------------------------------|
|          1000 | Данные строк расширенных данных, \"DesignCenter Data\" (необязательно)                      |
|---------------+---------------------------------------------------------------------------------------------|
|          1002 | Начало расширенных данных, \"{\" (необязательно)                                            |
|---------------+---------------------------------------------------------------------------------------------|
|          1070 | Номер версии Центра управления Autodesk                                                     |
|---------------+---------------------------------------------------------------------------------------------|
|          1070 | Единицы вставки:                                                                            |
|               | 0 = безразмерн.                                                                             |
|               | 1 = дюймы                                                                                   |
|               | 2 = футы                                                                                    |
|               | 3 = мили                                                                                    |
|               | 4 = миллиметры                                                                              |
|               | 5 = сантиметры                                                                              |
|               | 6 = метры                                                                                   |
|               | 7 = километры                                                                               |
|               | 8 = микродюймы                                                                              |
|               | 9 = милы                                                                                    |
|               | 10 = ярды                                                                                   |
|               | 11 = ангстремы                                                                              |
|               | 12 = нанометры                                                                              |
|               | 13 = микроны                                                                                |
|               | 14 = дециметры                                                                              |
|               | 15 = декаметры                                                                              |
|               | 16 = гектометры                                                                             |
|               | 17 = гигаметры                                                                              |
|               | 18 = астрономические единицы                                                                |
|               | 19 = световые годы                                                                          |
|               | 20 = парсеки                                                                                |
|               | 21 = футы США                                                                               |
|               | 22 = дюймы США                                                                              |
|               | 23 = ярды США                                                                               |
|               | 24 = мили США                                                                               |
|---------------+---------------------------------------------------------------------------------------------|
|          1002 | Конец расширенных данных, \"}\"                                                             |
|---------------+---------------------------------------------------------------------------------------------|
"))

(defmethod dxf-out-text ((x <db-block-tr>) stream)
  (dxf/out:txt-string 0 *db-block-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x <db-block-tr>) stream)
  (dxf/out:txt-string 100 *db-block-tr-subclass-marker* stream)
  (let ((st-name (symbol-tr-name x))
	(st-flag (symbol-tr-flag x))
	(lay (block-tr-layout x))
	(e-ty (block-tr-explodability x))
	(s-ty (block-tr-scalability x))
	(b-p  (block-tr-bitmap x)))
    (dxf/out:txt-string 2 st-name stream)
    (when lay (dxf/out:txt-hex 340 lay stream))
    (dxf/out:txt-int16 70 st-flag stream)
    (dxf/out:txt-int16 280 e-ty stream)
    (dxf/out:txt-int16 281 s-ty stream)
    (when b-p (dxf/out:txt-hex 310 b-p stream))))

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
  (:documentation "find . -name \"*.h\" | xargs grep \"class AcDbBlockTableRecord\"
/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/dbsymtb.h:class AcDbBlockTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A1FD1934-7EF5-4D35-A4B0-F8AE54A9A20A
====================================================================================================  
DIMSTYLE (DXF)
К записям таблицы обозначений DIMSTYLE применяются следующие групповые коды.
Групповые коды DIMSTYLE
|---------------+-------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbDimStyleTableRecord)                                                            |
|---------------+-------------------------------------------------------------------------------------------------------|
|             2 | Имя размерного стиля                                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                               |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки;                      |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается;           |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,          |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.       |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, |
|               | записывающих файлы DXF)                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             3 | DIMPOST                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             4 | DIMAPOST                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|             5 | DIMBLK (устарело, теперь это идентификатор объекта)                                                   |
|---------------+-------------------------------------------------------------------------------------------------------|
|             6 | DIMBLK1 (устарело, теперь это идентификатор объекта)                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
|             7 | DIMBLK2 (устарело, теперь это идентификатор объекта)                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
|            40 | DIMSCALE                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|            41 | DIMASZ                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            42 | DIMEXO                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            43 | DIMDLI                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            44 | DIMEXE                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            45 | DIMRND                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            46 | DIMDLE                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            47 | DIMTP                                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------|
|            48 | DIMTM                                                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------|
|           140 | DIMTXT                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           141 | DIMCEN                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           142 | DIMTSZ                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           143 | DIMALTF                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           144 | DIMLFAC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           145 | DIMTVP                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           146 | DIMTFAC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           147 | DIMGAP                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           148 | DIMALTRND                                                                                             |
|---------------+-------------------------------------------------------------------------------------------------------|
|            71 | DIMTOL                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            72 | DIMLIM                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            73 | DIMTIH                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            74 | DIMTOH                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            75 | DIMSE1                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            76 | DIMSE2                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            77 | DIMTAD                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            78 | DIMZIN                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|            79 | DIMAZIN                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           170 | DIMALT                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           171 | DIMALTD                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           172 | DIMTOFL                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           173 | DIMSAH                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           174 | DIMTIX                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           175 | DIMSOXD                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           176 | DIMCLRD                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           177 | DIMCLRE                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           178 | DIMCLRT                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           179 | DIMADEC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           270 | DIMUNIT (устарело, теперь используется DIMLUNIT и DIMFRAC)                                            |
|---------------+-------------------------------------------------------------------------------------------------------|
|           271 | DIMDEC                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           272 | DIMTDEC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           273 | DIMALTU                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           274 | DIMALTTD                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           275 | DIMAUNIT                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           276 | DIMFRAC                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           277 | DIMLUNIT                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           278 | DIMDSEP                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           279 | DIMTMOVE                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           280 | DIMJUST                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           281 | DIMSD1                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           282 | DIMSD2                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           283 | DIMTOLJ                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           284 | DIMTZIN                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           285 | DIMALTZ                                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|           286 | DIMALTTZ                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           287 | DIMFIT (устарело, теперь используется DIMATFIT и DIMTMOVE)                                            |
|---------------+-------------------------------------------------------------------------------------------------------|
|           288 | DIMUPT                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------|
|           289 | DIMATFIT                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           340 | DIMTXSTY (дескриптор связанного элемента STYLE)                                                       |
|---------------+-------------------------------------------------------------------------------------------------------|
|           341 | DIMLDRBLK (дескриптор связанного элемента BLOCK)                                                      |
|---------------+-------------------------------------------------------------------------------------------------------|
|           342 | DIMBLK (дескриптор связанного элемента BLOCK)                                                         |
|---------------+-------------------------------------------------------------------------------------------------------|
|           343 | DIMBLK1 (дескриптор связанного элемента BLOCK)                                                        |
|---------------+-------------------------------------------------------------------------------------------------------|
|           344 | DIMBLK2 (дескриптор связанного элемента BLOCK)                                                        |
|---------------+-------------------------------------------------------------------------------------------------------|
|           371 | DIMLWD (значение перечисления веса линий)                                                             |
|---------------+-------------------------------------------------------------------------------------------------------|
|           372 | DIMLWE (значение перечня веса линий)                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------|
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
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================
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
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
==================================================================================================== 
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
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord

==================================================================================================== 
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
  (:documentation "./dbents.h:class AcDbViewport: public AcDbEntity
====================================================================================================
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

(defun split-blocks (sections)
  "Пример использования:
  (split-blocks *Drawing-sty*)
"
  "split-blocks - not yet defined")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-entities (sections)
  "@b(Описание:) функция @b(split-entities) выделяет
из посекционного представления dxf - файла секцию ENTITIES
и преобразует ее в список с dxf - представлениями объектов.

 @b(Пример использования:)
@begin[lang=lisp](code)
  (split-entities *Drawing-sty*)
@end(code)
"
  (let ((pairs-list (reverse (cdr (assoc '(2 "ENTITIES") sections :test #'equal))))
	(entities nil)
	(entity   nil))
    (dolist (i pairs-list (nreverse entities))
      (push i entity)
      (when (= (car i) 0)
	(push entity entities)
	(setf entity nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-objects (sections)
"Пример использования
 (split-objects *Drawing-sty*)
"
"split-objects - not yet defined"
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun split-acdsdata (sections)
"Пример использования
 (split-acdsdata *Drawing-sty*)
"
"split-acdsdata - not yet defined"
)
