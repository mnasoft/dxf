;;;; db-symbol-table-record-classes.lisp

(in-package #:dxf)

;;;;/run/media/namatv/W_DATA/PRG/Autodesk_ObjectARX_2017_Win_64_and_32_Bit/inc/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *symbol-tbl-class-marker* "TABLE")

(defparameter *symbol-tbl-subclass-marker* "AcDbSymbolTable")

(defclass db-symbol-tbl ( db-object )
  ((symbol-tbl-name  :accessor symbol-tbl-name   :initarg :symbol-tbl-name  :initform "SYMBOL-TABLE" :documentation "Код   2. Имя таблицы")
   (symbol-tbl-flag  :accessor symbol-tbl-flag   :initarg :symbol-tbl-flag  :initform 0              :documentation "Код  70. Стандартные флаги")
   (symbol-tbl-items :accessor symbol-tbl-items  :initarg :symbol-tbl-items :initform nil            :documentation "Записи таблицы."))
  (:documentation "См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8427DD38-7B1F-4B7F-BF66-21ADD1F41295

"))

(defmethod dxf-out-text ((x db-symbol-tbl) stream)
  (dxf-out-t-string 0 *symbol-tbl-class-marker* stream)
    (let ((st-name (symbol-tbl-name x)))
    (dxf-out-t-string 2 st-name stream)))

(defmethod dxf-out-text :after ((x db-symbol-tbl) stream)
  (dxf-out-t-string 100 *db-symbol-tr-subclass-marker* stream)
  (let ((st-flag  (symbol-tbl-flag x))
	(st-items (reverse (symbol-tbl-items x))))
    (dxf-out-t-int16 70 st-flag stream)
    (mapc #'(lambda (el) (dxf-out-text el stream)) st-items)
    (dxf-out-t-string 0 *end-tab* stream)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *db-symbol-tr-class-marker* "SYMBOL")

(defparameter *db-symbol-tr-subclass-marker* "AcDbSymbolTableRecord")

(defclass db-symbol-tr ( db-object )
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

(defmethod dxf-out-text ((x db-symbol-tr) stream)
  (dxf-out-t-string 0 *db-symbol-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x db-symbol-tr) stream)
  (dxf-out-t-string 100 *db-symbol-tr-subclass-marker* stream))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-regapp-tr (db-symbol-tr)
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

(defclass db-block-tr (db-symbol-tr)
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

(defmethod dxf-out-text ((x db-block-tr) stream)
  (dxf-out-t-string 0 *db-block-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x db-block-tr) stream)
  (dxf-out-t-string 100 *db-block-tr-subclass-marker* stream)
  (let ((st-name (symbol-tr-name x))
	(st-flag (symbol-tr-flag x))
	(lay (block-tr-layout x))
	(e-ty (block-tr-explodability x))
	(s-ty (block-tr-scalability x))
	(b-p  (block-tr-bitmap x)))
    (dxf-out-t-string 2 st-name stream)
    (when lay (dxf-out-t-hex 340 lay stream))
    (dxf-out-t-int16 70 st-flag stream)
    (dxf-out-t-int16 280 e-ty stream)
    (dxf-out-t-int16 281 s-ty stream)
    (when b-p (dxf-out-t-hex 310 b-p stream))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-dimstyle-tr (db-symbol-tr)
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


(defparameter *db-layer-tr-class-marker* "LAYER")

(defparameter *db-layer-tr-subclass-marker* "AcDbLayerTableRecord")


(defclass db-layer-tr (db-symbol-tr)
;;;;"AcDbLayerTableRecord"
  ((layer-tr-color         :accessor layer-tr-color        :initarg :layer-tr-color        :initform 7              :documentation "Код  62. Номер цвета (если значение отрицательное, слой отключен)")
   (layer-tr-ltype         :accessor layer-tr-ltype        :initarg :layer-tr-ltype        :initform "Continuous"   :documentation "Код   6. Имя типа линий")
   (layer-tr-plottable     :accessor layer-tr-plottable    :initarg :layer-tr-plottable    :initform 1              :documentation "Код 290. Флаг печати. Если задано значение 0, этот слой не выводится на печать")
   (layer-tr-lweight       :accessor layer-tr-lweight      :initarg :layer-tr-lweight      :initform -3             :documentation "Код 370. Значение из перечисления весов линии")
   (layer-tr-plot-style    :accessor layer-tr-plot-style   :initarg :layer-tr-plot-style   :initform nil            :documentation "Код 390. Идентификатор/дескриптор жесткого указателя на объект PlotStyleName")
   (layer-tr-material      :accessor layer-tr-material     :initarg :layer-tr-material     :initform nil            :documentation "Код 347. Идентификатор/дескриптор жесткого указателя на объект материала")
   (layer-tr-visual-style  :accessor layer-tr-visual-style :initarg :layer-tr-visual-style :initform nil            :documentation "Код 348? Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)?")
   )
  (:documentation "
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-D94802B0-8BE8-4AC9-8054-17197688AFDB
./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
====================================================================================================
LAYER (DXF)
К записям таблицы обозначений LAYER применяются следующие групповые коды.
Групповые коды LAYER
|---------------+-------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                              |
|               |                                                                                                       |
|---------------+-------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLayerTableRecord)                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             2 | Имя слоя                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|            70 | Стандартные флаги (битовые кодовые значения):                                                         |
|               | 1 = слой заморожен ; в противном случае слой разморожен                                               |
|               | 2 = слой заморожен по умолчанию на новых видовых экранах                                              |
|               | 4 = слой заблокирован                                                                                 |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                       |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается            |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,          |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.       |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, |
|               | записывающих файлы DXF)                                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|            62 | Номер цвета (если значение отрицательное, слой отключен)                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|             6 | Имя типа линий                                                                                        |
|---------------+-------------------------------------------------------------------------------------------------------|
|           290 | Флаг печати. Если задано значение 0, этот слой не выводится на печать                                 |
|---------------+-------------------------------------------------------------------------------------------------------|
|           370 | Значение перечня веса линий                                                                           |
|---------------+-------------------------------------------------------------------------------------------------------|
|           390 | Идентификатор/дескриптор жесткого указателя на объект PlotStyleName                                   |
|---------------+-------------------------------------------------------------------------------------------------------|
|           347 | Идентификатор/дескриптор жесткого указателя на объект материала                                       |
|---------------+-------------------------------------------------------------------------------------------------------|
Слои, зависимые от внешних ссылок, выводятся при выполнении команды СОХРАНИТЬКАК. 
Для этих слоев соответствующее имя типа линий в файле DXF всегда — CONTINUOUS.
" ))

(defmethod dxf-out-text ((x db-layer-tr) stream)
  (dxf-out-t-string 0 *db-layer-tr-class-marker* stream))

(defmethod dxf-out-text :after ((x db-layer-tr) stream)
  (dxf-out-t-string 100 *db-layer-tr-subclass-marker* stream)
  (let ((st-name   (symbol-tr-name x))
	(st-flag   (symbol-tr-flag x))
	(l-color   (layer-tr-color x))
        (l-ltype   (layer-tr-ltype x))
	(l-lweight (layer-tr-lweight x))
	(l-pstyle  (layer-tr-plot-style x))
	(l-mat     (layer-tr-material x))
	(l-vstyle  (layer-tr-visual-style x)))
    (dxf-out-t-string  2 st-name   stream)
    (dxf-out-t-int16  70 st-flag   stream)
    (dxf-out-t        62 l-color   stream)
    (dxf-out-t         6 l-ltype   stream)
    (dxf-out-t       370 l-lweight stream)
    (dxf-out-t       390 l-pstyle  stream)
    (dxf-out-t       347 l-mat     stream)
    (dxf-out-t       348 l-vstyle  stream)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass db-linetype-tr (db-symbol-tr)
  ((ltype-tr-standard-flag     :accessor ltype-tr-standard-flag     :initarg :ltype-tr-standard-flag       :initform 0              :documentation "Код  70. Стандартные значения флагов (кодовые битовые значения): 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки ; 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается; 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз, на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD. Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF)")
   (ltype-tr-descriptive-text  :accessor ltype-tr-descriptive-text  :initarg :ltype-tr-descriptive-text    :initform ""             :documentation "Код   3. Описательный текст для типа линий")
   (ltype-tr-alignment-code    :accessor ltype-tr-alignment-code    :initarg :ltype-tr-alignment-code      :initform 65             :documentation "Код  72. Код выравнивания; всегда имеет значение 65, код ASCII для A")
   (ltype-tr-pattern-length    :accessor ltype-tr-pattern-length    :initarg :ltype-tr-pattern-length      :initform 0              :documentation "Код  40. Описательный текст для типа линий")
   (ltype-tr-pattern-dashes    :accessor ltype-tr-pattern-dashes    :initarg :ltype-tr-pattern-dashes      :initform nil            :documentation "Код  49. Длина штриха, точки или пробела (одна запись для каждого элемента)")
   (ltype-tr-element-type      :accessor ltype-tr-element-type      :initarg :ltype-tr-element-type        :initform 0              :documentation "Код  74. Тип элемента сложных типов линий (по одному для каждого элемента). Значением по умолчанию является 0 (без внедренной формы/текста); Можно использовать следующие значения разряда: 1 = если задано, код 50 устанавливает абсолютный угол поворота; если не задано, код 50 устанавливает относительный угол поворота; 2 = встроенным элементом является текстовая строка; 4 = встроенным элементом является форма")
   (ltype-tr-shape-number      :accessor ltype-tr-shape-number      :initarg :ltype-tr-shape-number        :initform nil            :documentation "Код  75. Номер формы (по одному для каждого элемента), если код 74 устанавливает внедренную форму. Если код 74 устанавливает внедренную текстовую строку, это значение равно 0. Если код 74 имеет значение 0, код 75 опускается")
   (ltype-tr-style             :accessor ltype-tr-style             :initarg :ltype-tr-style               :initform nil            :documentation "Код 340. Указатель на объект STYLE (по одному для каждого элемента, если код 74 > 0)")
   (ltype-tr-scale             :accessor ltype-tr-scale             :initarg :ltype-tr-scale               :initform nil            :documentation "Код  46. S = значение масштаба (необязательно); может существовать несколько записей")
   (ltype-tr-rotation          :accessor ltype-tr-rotation          :initarg :ltype-tr-rotation            :initform 0              :documentation "Код  50. Значение относительного (R) или абсолютного (А) угла поворота в радианах для внедренной формы или текста; одно для каждого элемента, если код 74 устанавливает внедренную форму или текстовую строку")
   (ltype-tr-x-offset          :accessor ltype-tr-x-offset          :initarg :ltype-tr-x-offset            :initform 0              :documentation "Код  44. X = значение смещения по X (необязательно); может существовать несколько записей")
   (ltype-tr-y-offset          :accessor ltype-tr-y-offset          :initarg :ltype-tr-y-offset            :initform 0              :documentation "Код  45. Y = значение смещения по Y (необязательно); может существовать несколько записей")
   (ltype-tr-text-string       :accessor ltype-tr-text-string       :initarg :ltype-tr-text-string         :initform ""             :documentation "Код   9. Строка текста (по одной для каждого элемента, если код 74 = 2)"))
  (:documentation "./dbsymtb.h:class AcDbLinetypeTableRecord: public  AcDbSymbolTableRecord
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-F57A316C-94A2-416C-8280-191E34B182AC
====================================================================================================
LTYPE (DXF)
К записям таблицы обозначений LTYPE применяются следующие групповые коды.
Групповые коды LTYPE
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                                           |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLinetypeTableRecord)                                                                                         |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|             2 | Имя типа линий                                                                                                                     |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                                            |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                                                    |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается                                         |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                                       |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.                                    |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF)      |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|             3 | Описательный текст для типа линий                                                                                                  |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            72 | Код выравнивания; всегда имеет значение 65, код ASCII для A                                                                        |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            73 | Количество элементов типов линий                                                                                                   |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            40 | Общая длина штриховки                                                                                                              |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            49 | Длина штриха, точки или пробела (одна запись для каждого элемента)                                                                 |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            74 | Тип элемента сложных типов линий (по одному для каждого элемента). Значением по умолчанию является 0 (без внедренной формы/текста) |
|               | Можно использовать следующие значения разряда:                                                                                     |
|               | 1 = если задано, код 50 устанавливает абсолютный угол поворота; если не задано, код 50 устанавливает относительный угол поворота   |
|               | 2 = встроенным элементом является текстовая строка                                                                                 |
|               | 4 = встроенным элементом является форма                                                                                            |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            75 | Номер формы (по одному для каждого элемента), если код 74 устанавливает внедренную форму                                           |
|               | Если код 74 устанавливает внедренную текстовую строку, это значение равно 0                                                        |
|               | Если код 74 имеет значение 0, код 75 опускается                                                                                    |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|           340 | Указатель на объект STYLE (по одному для каждого элемента, если код 74 > 0)                                                        |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            46 | S = значение масштаба (необязательно); может существовать несколько записей                                                        |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            50 | Значение относительного (R) или абсолютного (А) угла поворота в радианах для внедренной формы или текста;                          |
|               | одно для каждого элемента, если код 74 устанавливает внедренную форму или текстовую строку                                         |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            44 | X = значение смещения по X (необязательно); может существовать несколько записей                                                   |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|            45 | Y = значение смещения по Y (необязательно); может существовать несколько записей                                                   |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
|             9 | Строка текста (по одной для каждого элемента, если код 74 = 2)                                                                     |
|---------------+------------------------------------------------------------------------------------------------------------------------------------|
Групповые коды 74, 75, 340, 46, 50, 44, 45 и 9 не возвращаются посредством функций tblsearch или tblnext. 
Следует использовать tblobjname для извлечения этих значений из приложения.
"))

(defclass db-textstyle-tr (db-symbol-tr)
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
STYLE (DXF)
К записям таблицы обозначений STYLE применяются следующие коды групп.
Групповые коды STYLE
|---------------+-------------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                          |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbTextStyleTableRecord)                                                                       |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|             2 | Имя стиля                                                                                                         |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                           |
|               | 1 = если задано, эта запись описывает форму;                                                                      |
|               | 4 = вертикальный текст;                                                                                           |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки;                                  |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается;                       |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                      |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.                   |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать                           |
|               | в программах, записывающих файлы DXF)                                                                             |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|            40 | Фиксированная высота текста; значение 0, если нефиксированная                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|            41 | Коэффициент сжатия                                                                                                |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|            50 | Угол наклона                                                                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|            71 | Флаги создания текста:                                                                                            |
|               | 2 = текст в обратном направлении (зеркально отражен по X)                                                         |
|               | 4 = текст перевернут (зеркально отражен по Y)                                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|            42 | Последняя использованная высота                                                                                   |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|             3 | Имя файла основного шрифта                                                                                        |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|             4 | Имя файла большого шрифта; значение пусто, если файл отсутствует                                                  |
|---------------+-------------------------------------------------------------------------------------------------------------------|
|          1071 | Длинное значение, содержащее шаг и семейство шрифта TrueType, набор символов и флаги полужирного шрифта и курсива |
|---------------+-------------------------------------------------------------------------------------------------------------------|
"))

(defclass db-ucs-tr (db-symbol-tr)
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
UCS (DXF)
К записям таблицы обозначений ПСК применяются следующие групповые коды.
Групповые коды ПСК
|---------------+-------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                    |
|---------------+-------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbUCSTableRecord)                                                                       |
|---------------+-------------------------------------------------------------------------------------------------------------|
|             2 | Имя ПСК                                                                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                             |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается                  |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.             |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать                     |
|               | в программах, записывающих файлы DXF)                                                                       |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            10 | Начало координат (в МСК)                                                                                    |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | Файл DXF: значение X; приложение: 3D-точка                                                                  |
|---------------+-------------------------------------------------------------------------------------------------------------|
|        20, 30 | Файл DXF: значения Y и Z для начала координат (в МСК)                                                       |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            11 | Направление оси X (в МСК)                                                                                   |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z для направления оси X (в МСК)                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            12 | Направление оси Y (в МСК)                                                                                   |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                 |
|---------------+-------------------------------------------------------------------------------------------------------------|
|        22, 32 | Файл DXF: значения Y и Z для направления оси Y (в МСК)                                                      |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            79 | Всегда равно 0                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------------|
|           146 | Уровень                                                                                                     |
|---------------+-------------------------------------------------------------------------------------------------------------|
|           346 | Идентификатор/дескриптор базовой ПСК при работе с ортогональным изображением. Этот код отсутствует,         |
|               | если код 79 равен 0. Если этот код отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            71 | Тип ортогонального изображения (необязательно; всегда отображается в паре с кодами 13, 23, 33):             |
|               | 1 = сверху; 2 = снизу; 3 = спереди; 4 = сзади; 5 = слева; 6 = справа                                        |
|---------------+-------------------------------------------------------------------------------------------------------------|
|            13 | Начало координат данного типа ортогонального изображения относительно данной ПСК                            |
|---------------+-------------------------------------------------------------------------------------------------------------|
|               | Файл DXF: значение X для точки начала координат; приложение: 3D-точка                                       |
|---------------+-------------------------------------------------------------------------------------------------------------|
|        23, 33 | Файл DXF: значения Y и Z для точки начала координат                                                         |
|---------------+-------------------------------------------------------------------------------------------------------------|
Каждая пара 71/13,23,33 определяет начало координат ПСК для определенного 
типа ортогонального изображения относительно данной ПСК. Например, если 
присутствует следующая пара, то вызов команды ПСК/СЛЕВА при заданном 
параметре UCSBASE для данной ПСК вызовет создание начала координат 
новой ПСК в точке (1,2,3).
71: 5 13: 1.0 23: 2.0 33: 3.0
Если эта пара отсутствует, то вызов команды ПСК/СЛЕВА приведет к созданию
начала координат новой ПСК в точке начала координат данной ПКС."))

(defclass db-view-tr (db-symbol-tr)
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
VIEW (DXF)
К записям таблицы обозначений VIEW применяются следующие коды групп.
Групповые коды VIEW
|---------------+-----------------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                                        |
|               |                                                                                                                 |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbViewTableRecord)                                                                          |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|             2 | Имя вида                                                                                                        |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                         |
|               | 1 = если задано это значение, это вид пространства листа                                                        |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                                 |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается                      |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                    |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.                 |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать                         |
|               | в программах, записывающих файлы DXF)                                                                           |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            40 | Высота вида (в РСК)                                                                                             |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            10 | Центральная точка вида (в РСК)                                                                                  |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                      |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            20 | Файл DXF: значение Y центральной точки вида (в РСК)                                                             |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            41 | Ширина вида (в РСК)                                                                                             |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            11 | Направление взгляда из целевой точки (в МСК)                                                                    |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                     |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|        21, 31 | Файл DXF: значения Y и Z направления взгляда из целевой точки (в МСК)                                           |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            12 | Целевая точка (в МСК)                                                                                           |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                      |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|        22, 32 | Файл DXF: значения Y и Z для целевой точки (в МСК)                                                              |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            42 | Фокусное расстояние                                                                                             |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            43 | Передняя плоскость подрезки (смещение от целевой точки)                                                         |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            44 | Задняя плоскость подрезки (смещение от целевой точки)                                                           |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            50 | Угол закручивания                                                                                               |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            71 | Режим просмотра (см. системную переменную VIEWMODE)                                                             |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|           281 | Режим визуализации:                                                                                             |
|               | 0 = оптимизированное 2D (классическое 2D)                                                                       |
|               | 1 = каркас                                                                                                      |
|               | 2 = скрытие линий                                                                                               |
|               | 3 = плоское                                                                                                     |
|               | 4 = по Гуро                                                                                                     |
|               | 5 = плоское с каркасом                                                                                          |
|               | 6 = по Гуро с каркасом                                                                                          |
|               | Все режимы визуализации кроме \"Оптимизированное 2D\" задействуют новую систему 3D-графики.                     |
|               | Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            72 | 1, если имеется ПСК, связанная с этим видом; 0 в противном случае                                               |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|            73 | 1, если данные с камеры выводятся на печать                                                                     |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|           332 | Идентификатор/дескриптор символьного указателя на объект фона (необязательно)                                   |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|           334 | Идентификатор/дескриптор символьного указателя на объект псевдоразреза (необязательно)                          |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|           348 | Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)                         |
|---------------+-----------------------------------------------------------------------------------------------------------------|
|           361 | Идентификатор солнца с жестким правом владения                                                                  |
|               | Следующие коды отображаются только в том случае, если для кода 72 установлено значение 1.                       |
|               | С их помощью определяется ПСК, связанная с этим видом. Эта ПСК становится текущей ПСК                           |
|               | каждый раз при восстановлении этого вида (если значение кода 72 равно 0, ПСК не изменяется).                    |
|---------------+-----------------------------------------------------------------------------------------------------------------|
"))

(defclass db-vport-tr (db-symbol-tr) 
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
VPORT (DXF)
К записям таблицы обозначений VPORT применяются следующие групповые коды. Таблица VPORT является уникальной: она может содержать
несколько записей с одним и тем же именем (что указывает на конфигурацию с несколькими видовыми экранами). Все записи, связанные
с конфигурацией активного видового экрана, имеют имя *ACTIVE. В первой такой записи описывается текущий видовой экран.
Групповые коды VPORT
| Групповой код | Описание                                                                                                         |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbViewportTableRecord)                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|             2 | Имя видового экрана                                                                                              |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            70 | Стандартные значения флагов (кодовые битовые значения):                                                          |
|               | 16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки                                  |
|               | 32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается                       |
|               | 64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз,                     |
|               | на запись таблицы ссылался хотя бы один объект на чертеже. (Этот флаг нужен для команд AutoCAD.                  |
|               | Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать                          |
|               | в программах, записывающих файлы DXF)                                                                            |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            10 | Левый нижний угол видового экрана                                                                                |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            20 | Файл DXF: значение Y левого нижнего угла видового экрана                                                         |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            11 | Правый верхний угол видового экрана                                                                              |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            21 | Файл DXF: значение Y правого верхнего угла видового экрана                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            12 | Центральная точка вида (в РСК)                                                                                   |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            22 | Файл DXF: значение Y центральной точки вида (в РСК)                                                              |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            13 | Базовая точка привязки (в РСК)                                                                                   |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            23 | Файл DXF: значение Y базовой точки привязки (в РСК)                                                              |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            14 | Шаг привязки по оси X и Y                                                                                        |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            24 | Файл DXF: значение Y шага привязки по оси X и Y                                                                  |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            15 | Шаг сетки по осям X и Y                                                                                          |
|               | Файл DXF: значение X; приложение: 2D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            25 | Файл DXF: значение Y шага сетки по осям X и Y                                                                    |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            16 | Направление взгляда из целевой точки (в МСК)                                                                     |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|        26, 36 | Файл DXF: значения Y и Z направления взгляда из целевой точки                                                    |
|               | (в МСК)                                                                                                          |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            17 | Целевая точка вида (в МСК)                                                                                       |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|        27, 37 | Файл DXF: значения Y и Z для целевой точки вида (в МСК)                                                          |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            42 | Фокусное расстояние                                                                                              |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            43 | Передняя плоскость подрезки (смещение от целевой точки)                                                          |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            44 | Задняя плоскость подрезки (смещение от целевой точки)                                                            |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            45 | Высота вида                                                                                                      |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            50 | Угол поворота привязки                                                                                           |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            51 | Угол закручивания вида                                                                                           |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            72 | Стороны круга                                                                                                    |
|---------------+------------------------------------------------------------------------------------------------------------------|
|   331 или 441 | Идентификатор/дескриптор символьного или жесткого указателя на объекты замороженного слоя;                       |
|               | повторяется для каждого замороженного слоя                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            70 | Флаги битов и режим перспективной проекции                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|             1 | Таблица стилей печати                                                                                            |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           281 | Режим визуализации:                                                                                              |
|               | 0 = оптимизированное 2D (классическое 2D)                                                                        |
|               | 1 = каркас                                                                                                       |
|               | 2 = скрытие линий                                                                                                |
|               | 3 = плоское                                                                                                      |
|               | 4 = по Гуро                                                                                                      |
|               | 5 = плоское с каркасом                                                                                           |
|               | 6 = по Гуро с каркасом                                                                                           |
|               | Все режимы визуализации, кроме \"Оптимизированное 2D\", задействуют новую систему 3D-графики.                    |
|               | Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode  |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            71 | Режим просмотра (см. системную переменную VIEWMODE)                                                              |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            74 | Параметр ЗНАКПСК                                                                                                 |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           110 | Начало координат ПСК                                                                                             |
|               | Файл DXF: значение X; приложение: 3D-точка                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|      120, 130 | Файл DXF: значения Y и Z для начала координат ПСК                                                                |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           111 | Ось X ПСК                                                                                                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                      |
|---------------+------------------------------------------------------------------------------------------------------------------|
|      121, 131 | Файл DXF: значения Y и Z для оси X ПСК                                                                           |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           112 | Ось Y ПСК                                                                                                        |
|               | Файл DXF: значение X; приложение: 3D-вектор                                                                      |
|---------------+------------------------------------------------------------------------------------------------------------------|
|      122, 132 | Файл DXF: значения Y и Z для оси Y ПСК                                                                           |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           345 | Идентификатор/дескриптор AcDbUCSTableRecord, если ПСК является именованной ПСК.                                  |
|               | Если значение отсутствует, то ПСК является неименованной                                                         |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           346 | Идентификатор/дескриптор AcDbUCSTableRecord базовой ПСК, если ПСК является ортогональной (код 79 не равен нулю). |
|               | Если значение отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК                           |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            79 | Ортогональный тип ПСК                                                                                            |
|               | 0 = ПСК не ортогональна                                                                                          |
|               | 1 = сверху                                                                                                       |
|               | 2 = снизу                                                                                                        |
|               | 3 = спереди                                                                                                      |
|               | 4 = сзади                                                                                                        |
|               | 5 = слева                                                                                                        |
|               | 6 = справа                                                                                                       |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           146 | Уровень                                                                                                          |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           170 | Тонирование печати                                                                                               |
|---------------+------------------------------------------------------------------------------------------------------------------|
|            61 | Основные линии сетки                                                                                             |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           332 | Идентификатор/дескриптор символьного указателя на объект фона (необязательно)                                    |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           333 | Идентификатор/дескриптор символьного указателя на объект режима печати оттенков (необязательно)                  |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           348 | Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)                          |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           292 | Флаг включения освещения по умолчанию                                                                            |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           282 | Тип освещения по умолчанию                                                                                       |
|               | 0 = один удаленный источник света                                                                                |
|               | 1 = два удаленных источника света                                                                                |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           141 | Яркость                                                                                                          |
|---------------+------------------------------------------------------------------------------------------------------------------|
|           142 | Контрастность                                                                                                    |
|---------------+------------------------------------------------------------------------------------------------------------------|
|  63, 421, 431 | Рассеиваемый цвет (выводится, только если цвет не черный)                                                        |
|---------------+------------------------------------------------------------------------------------------------------------------|
"
 )
)
  
"
  0 SECTION
2 TABLES

  0 TABLE
  2 VPORT
  5 8
330 0
100 AcDbSymbolTable
 70 1
  0 VPORT
  5 EA
330 8
100 AcDbSymbolTableRecord
100 AcDbViewportTableRecord
  2 *Active
 70 0
 10 0.0
 20 0.0
 11 1.0
 21 1.0
 12 2685.447085661157
 22 1184.377785330838
 13 0.0
 23 0.0
 14 10.0
 24 10.0
 15 10.0
 25 10.0
 16 0.0
 26 0.0
 36 1.0
 17 0.0
 27 0.0
 37 0.0
 40 2141.132757422042
 41 2.21021377672209
 42 50.0
 43 0.0
 44 0.0
 50 0.0
 51 0.0
 71 0
 72 1000
 73 1
 74 3
 75 0
 76 1
 77 0
 78 0
281 0
 65 1
110 0.0
120 0.0
130 0.0
111 1.0
121 0.0
131 0.0
112 0.0
122 1.0
132 0.0
 79 0
146 0.0
348 F5
 60 3
 61 5
292 1
282 1
141 0.0
142 0.0
 63 250
421 3355443
1001 ACAD_NAV_VCDISPLAY
1070 3
0 ENDTAB

  0 TABLE
  2 LTYPE
  5 5
330 0
100 AcDbSymbolTable
 70 1
  0 LTYPE
  5 14
330 5
100 AcDbSymbolTableRecord
100 AcDbLinetypeTableRecord
  2 ByBlock
 70 0
  3 
 72 65
 73 0
 40 0.0
  0 LTYPE
  5 15
330 5
100 AcDbSymbolTableRecord
100 AcDbLinetypeTableRecord
  2 ByLayer
 70 0
  3 
 72 65
 73 0
 40 0.0
  0 LTYPE
  5 16
330 5
100 AcDbSymbolTableRecord
100 AcDbLinetypeTableRecord
  2 Continuous
 70 0
  3 Solid line
 72 65
 73 0
 40 0.0
0 ENDTAB

0 TABLE
  2 LAYER
  5 2
102 {ACAD_XDICTIONARY
360 1FF
102 }
330 0
100 AcDbSymbolTable
 70 1
  0 LAYER
  5 10
102 {ACAD_XDICTIONARY
360 13C
102 }
330 2
100 AcDbSymbolTableRecord
100 AcDbLayerTableRecord
  2 0
 70 0
 62 7
  6 Continuous
370 -3
390 F
347 EE
348 0
0 ENDTAB


  0 TABLE
  2 STYLE
  5 3
330 0
100 AcDbSymbolTable
 70 2
  0 STYLE
  5 11
330 3
100 AcDbSymbolTableRecord
100 AcDbTextStyleTableRecord
  2 Standard
 70 0
 40 0.0
 41 1.0
 50 0.0
 71 0
 42 2.5
  3 ARIAL.TTF
  4 
1001 ACAD
1000 Arial
1071 34
  0 STYLE
  5 132
330 3
100 AcDbSymbolTableRecord
100 AcDbTextStyleTableRecord
  2 Annotative
 70 0
 40 0.0
 41 1.0
 50 0.0
 71 0
 42 2.5
  3 ARIAL.TTF
  4 
1001 AcadAnnotative
1000 AnnotativeData
1002 {
1070 1
1070 1
1002 }
1001 ACAD
1000 Arial
1071 34
0 ENDTAB

  0 TABLE
  2 VIEW
  5 6
330 0
100 AcDbSymbolTable
 70 0
0 ENDTAB

  0 TABLE
  2 UCS
  5 7
330 0
100 AcDbSymbolTable
 70 0
0 ENDTAB

  0 TABLE
  2 APPID
  5 9
330 0
100 AcDbSymbolTable
 70 9
  0 APPID
  5 12
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 ACAD
 70 0
  0 APPID
  5 9E
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 ACAD_PSEXT
 70 0
  0 APPID
  5 133
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 AcadAnnoPO
 70 0
  0 APPID
  5 134
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 AcadAnnotative
 70 0
  0 APPID
  5 135
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 ACAD_DSTYLE_DIMJAG
 70 0
  0 APPID
  5 136
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 ACAD_DSTYLE_DIMTALN
 70 0
  0 APPID
  5 165
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 ACAD_MLEADERVER
 70 0
  0 APPID
  5 217
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 ACAD_NAV_VCDISPLAY
 70 0
  0 APPID
  5 22D
330 9
100 AcDbSymbolTableRecord
100 AcDbRegAppTableRecord
  2 SHCKALA
 70 0
0 ENDTAB

  0 TABLE
  2 DIMSTYLE
  5 A
330 0
100 AcDbSymbolTable
 70 3
100 AcDbDimStyleTable
 71 2
340 27
340 137
  0 DIMSTYLE
105 1B0
330 A
100 AcDbSymbolTableRecord
100 AcDbDimStyleTableRecord
  2 Standard
 70 0
340 11
  0 DIMSTYLE
105 137
330 A
100 AcDbSymbolTableRecord
100 AcDbDimStyleTableRecord
  2 Annotative
 70 0
 40 0.0
 41 2.5
 42 0.625
 43 3.75
 44 1.25
 73 0
 74 0
 77 1
 78 8
140 2.5
141 2.5
143 0.03937007874016
147 0.625
171 3
172 1
271 2
272 2
274 3
278 44
283 0
284 8
340 11
1001 AcadAnnotative
1000 AnnotativeData
1002 {
1070 1
1070 1
1002 }
1001 ACAD_DSTYLE_DIMJAG
1070 388
1040 1.5
1001 ACAD_DSTYLE_DIMTALN
1070 392
1070 0
  0 DIMSTYLE
105 27
330 A
100 AcDbSymbolTableRecord
100 AcDbDimStyleTableRecord
  2 ISO-25
 70 0
 41 2.5
 42 0.625
 43 3.75
 44 1.25
 73 0
 74 0
 77 1
 78 8
140 2.5
141 2.5
143 0.03937007874016
147 0.625
171 3
172 1
271 2
272 2
274 3
278 44
283 0
284 8
340 11
0 ENDTAB

----------------------------------------------------------------------------------------------------

  0 TABLE
  2 BLOCK_RECORD
  5 1
330 0
100 AcDbSymbolTable
 70 1

  0 BLOCK_RECORD
  5 1F
102 {ACAD_XDICTIONARY
360 1CE
102 }
330 1
100 AcDbSymbolTableRecord
100 AcDbBlockTableRecord
  2 *Model_Space
340 22
 70 0
280 1
281 0

  0 BLOCK_RECORD
  5 D2
330 1
100 AcDbSymbolTableRecord
100 AcDbBlockTableRecord
  2 *Paper_Space
340 D3
 70 0
280 1
281 0

  0 BLOCK_RECORD
  5 D6
330 1
100 AcDbSymbolTableRecord
100 AcDbBlockTableRecord
  2 *Paper_Space0
340 D7
 70 0
280 1
281 0

  0 ENDTAB
0 ENDSEC


==================================================================================================== 

  0 TABLE
  2 BLOCK_RECORD
  5 1
330 0
100 AcDbSymbolTableRecord
 70 1

  0 BLOCK_RECORD
  5 1F
330 1
100 AcDbSymbolTableRecord
100 AcDbBlockTableRecord
  2 *Model_Space
340 22
 70 0
280 1
281 0

  0 BLOCK_RECORD
  5 D6
330 1
100 AcDbSymbolTableRecord
100 AcDbBlockTableRecord
  2 *Paper_Space
340 D3
 70 0
280 1
281 0

  0 BLOCK_RECORD
  5 D2
330 1
100 AcDbSymbolTableRecord
100 AcDbBlockTableRecord
  2 *Paper_Space0
340 D7
 70 0
280 1
281 0

  0 ENDTAB

"
