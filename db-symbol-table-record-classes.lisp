;;;; db-symbol-table-record-classes.lisp

(in-package #:dxf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass Db-Symbol-Table-Record ()
  ((table-name        :accessor table-name        :initarg :table-name          :initform "Undefined"    :documentation "Имя таблицы")
   (is-dependent      :accessor is-dependent      :initarg :is-dependent        :initform nil            :documentation "Является-ли имя таблицы зависимым")
   (is-resolved       :accessor is-resolved       :initarg :is-resolved         :initform t              :documentation "Вычислено-ли имя таблицы")
   (is-renamable      :accessor is-renamable      :initarg :is-renamable        :initform t              :documentation "Допускается-ли переименовывать таблицу"))
  (:documentation "См. ./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord"))

(defclass Db-Layer-TableRecord (Db-Symbol-Table-Record)
;;;;"AcDbLayerTableRecord"
  ((is-frozen         :accessor is-frozen         :initarg :is-frozen           :initform nil            :documentation "Код  70. 1 = Layer is frozen; otherwise layer is thawed")
   (is-vp-frozen      :accessor is-vp-frozen      :initarg :is-vp-frozen        :initform nil            :documentation "Код  70. 2 = Layer is frozen by default in new viewports")
   (is-locked         :accessor is-locked         :initarg :is-locked           :initform nil            :documentation "Код  70. 4 = Layer is locked")
   (is-hidden         :accessor is-hidden         :initarg :is-hidden           :initform nil            :documentation "Код  70. 4 = Layer is locked")   
   (color             :accessor color             :initarg :color               :initform ""             :documentation "Код  62. Номер цвета (если значение отрицательное, слой отключен)")
   (line-type-id      :accessor line-type-id      :initarg :line-type-id        :initform nil            :documentation "Код   6. Имя типа линий")
   (is-plottable      :accessor is-plottable      :initarg :is-plottable        :initform t              :documentation "Код 290. Флаг печати. Если задано значение 0, этот слой не выводится на печать")
   (line-weight       :accessor line-weight       :initarg :line-weight         :initform 0.25           :documentation "Код 370. Значение из перечисления весов линии")
   (plot-style-name   :accessor plot-style-name   :initarg :plot-style-name     :initform 0.25           :documentation "Код 390. Hard-pointer ID/handle of PlotStyleName object")
   (material-id       :accessor material-id       :initarg :plot-style-name     :initform nil            :documentation "Код 347. Идентификатор/дескриптор жесткого указателя на объект материала"))
  (:documentation "./dbsymtb.h:class AcDbLayerTableRecord: public  AcDbSymbolTableRecord
LAYER (DXF)

К записям таблицы обозначений LAYER применяются следующие групповые коды.

Групповые коды LAYER
|---------------+-------------------------------------------------------------------------------------------------------|
| Групповой код | Описание                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|           100 | Маркер подкласса (AcDbLayerTableRecord)                                                               |
|---------------+-------------------------------------------------------------------------------------------------------|
|             2 | Имя слоя                                                                                              |
|---------------+-------------------------------------------------------------------------------------------------------|
|            70 | Стандартные флаги (битовые кодовые значения):                                                         |
|               | 1 = слой заморожен; в противном случае слой разморожен                                                |
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

