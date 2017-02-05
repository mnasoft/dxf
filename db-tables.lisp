;;;; db-tables.lisp

(in-package #:dxf)

(defclass db-table-header-vport ()
  ((header-vars :accessor header-vars :initarg :header-vars :initform *h-vars-list-min*
		:documentation "
./dbents.h:class AcDbViewport: public AcDbEntity
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-A66D0ACA-3F43-4B2E-A0C2-2B490C1E5268
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-A66D0ACA-3F43-4B2E-A0C2-2B490C1E5268
")))

(defclass db-table-vport ()
  ((vport-name  :accessor vport-name  :initarg :vport-name  :initform "*Active" :documentation "Код 2. Имя видового экрана")
   (vport-flags :accessor vport-flags :initarg :vport-flags :initform 0
		:documentation "Код 70. Стандартные значения флагов (кодовые битовые значения):
16 = если задано это значение, запись таблицы внешне зависима от внешней ссылки;
32 = если заданы и этот бит, и бит 16, внешне зависимая внешняя ссылка успешно разрешается;
64 = если задано это значение, то в тот момент, когда чертеж редактировался в последний раз, на запись таблицы ссылался хотя бы один объект на чертеже.
Этот флаг нужен для команд AutoCAD. Его можно игнорировать в большинстве программ для чтения файлов DXF и не нужно задавать в программах, записывающих файлы DXF")
   (vport-lower-left-corner    :accessor vport-lower-left-corner    :initarg :vport-lower-left-corner    :initform (vector 0.0 0.0)        :documentation "Код 10. Левый нижний угол видового экрана. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-upper-right-corner   :accessor vport-lower-left-corner    :initarg :vport-lower-left-corner    :initform (vector 1.0 1.0)        :documentation "Код 11. Правый верхний угол видового экрана. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-view-center-point    :accessor vport-view-center-point    :initarg :vport-view-center-point    :initform (vector 420.0 297.0)    :documentation "Код 12. Центральная точка вида (в РСК). Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-snap-base-point      :accessor vport-snap-base-point      :initarg :vport-snap-base-point      :initform (vector 0.0 0.0)        :documentation "Код 13. Базовая точка привязки (в РСК). Файл DXF: значение X; приложение: 2D-точка") 
   (vport-snap-spacing         :accessor vport-snap-spacing         :initarg :vport-snap-spacing         :initform (vector 10.0 10.0)      :documentation "Код 14. Шаг привязки по оси X и Y. Файл DXF: значение X; приложение: 2D-точка ") 
   (vport-grid-spacing         :accessor vport-grid-spacing         :initarg :vport-grid-spacing         :initform (vector 10.0 10.0)      :documentation "Код 15. Шаг сетки по осям X и Y. Файл DXF: значение X; приложение: 2D-точка") 
   (vport-view-direction       :accessor vport-view-direction       :initarg :vport-view-direction       :initform (vector 0.0 0.0 1.0)    :documentation "Код 16. Направление взгляда из целевой точки (в МСК). Файл DXF: значение X; приложение: 3D-точка") 
   (vport-view-target-point    :accessor vport-view-target-point    :initarg :vport-view-target-point    :initform (vector 0.0 0.0 0.0)    :documentation "Код 17. Целевая точка вида (в МСК). Файл DXF: значение X; приложение: 3D-точка ") 
   (vport-lens-length          :accessor vport-lens-length          :initarg :vport-lens-length          :initform 50.0                    :documentation "Код 42. Фокусное расстояние") 
   (vport-front-clipping-plane :accessor vport-front-clipping-plane :initarg :vport-front-clipping-plane :initform 0.0                     :documentation "Код 43. Передняя плоскость подрезки (смещение от целевой точки)") 
   (vport-back-clipping-plane  :accessor vport-back-clipping-plane  :initarg :vport-back-clipping-plane  :initform 0.0                     :documentation "Код 44. Задняя плоскость подрезки (смещение от целевой точки)") 
   (vport-view-height          :accessor vport-view-height          :initarg :vport-view-height          :initform 594.0                   :documentation "Код 45. Высота вида") 
   (vport-snap-rotation-angle  :accessor vport-snap-rotation-angle  :initarg :vport-snap-rotation-angle  :initform 0.0                     :documentation "Код 50. Угол поворота привязки") 
   (vport-view-twist-angle     :accessor vport-view-twist-angle     :initarg :vport-view-twist-angle     :initform 0.0                     :documentation "Код 51. Угол закручивания вида") 
   (vport-circle-sides         :accessor vport-circle-sides         :initarg :vport-circle-sides         :initform 0.0                     :documentation "Код 72. Стороны круга")
   (vport-frozen-layer-id      :accessor vport-frozen-layer-id      :initarg :vport-frozen-layer-id      :initform nil                     :documentation "Код 331 или 441. Идентификатор/дескриптор символьного или жесткого указателя на объекты замороженного слоя; повторяется для каждого замороженного слоя")
   (vport-bit-flags            :accessor vport-bit-flags            :initarg :vport-bit-flags            :initform 0.0                     :documentation "Код 70. Флаги битов и режим перспективной проекции") 
   (vport-plot-style-sheet     :accessor vport-plot-style-sheet     :initarg :vport-plot-style-sheet     :initform 0.0                     :documentation "Код 1. Таблица стилей печати")
   (vport-render-mode          :accessor vport-render-mode          :initarg :vport-render-mode          :initform 0                       :documentation "Код 281. Режим визуализации: 0 = оптимизированное 2D (классическое 2D); 1 = каркас; 2 = скрытие линий; 3 = плоское; 4 = по Гуро; 5 = плоское с каркасом; 6 = по Гуро с каркасом. Все режимы визуализации, кроме 'Оптимизированное 2D',задействуют новую систему 3D-графики. Эти значения непосредственно соответствуют команде РЕЖИМРАСКР и перечню AcDbAbstractViewTableRecord::RenderMode") 
   (vport-view-mode            :accessor vport-view-mode            :initarg :vport-view-mode            :initform 0                       :documentation "Код 71. Режим просмотра (см. системную переменную VIEWMODE)") 
   (vport-ucsicon-setting      :accessor vport-ucsicon-setting      :initarg :vport-ucsicon-setting      :initform 3                       :documentation "Код 74. Параметр ЗНАКПСК")
   (vport-ucs-origin           :accessor vport-ucs-origin           :initarg :vport-ucs-origin           :initform (vector 0.0 0.0 0.0)    :documentation "Код 110. Начало координат ПСК. Файл DXF: значение X; приложение: 3D-точка")
   (vport-ucs-x-axis           :accessor vport-ucs-origin           :initarg :vport-ucs-origin           :initform (vector 1.0 0.0 0.0)    :documentation "Код 111. Ось X ПСК. Файл DXF: значение X; приложение: 3D-вектор") 
   (vport-ucs-y-axis           :accessor vport-ucs-origin           :initarg :vport-ucs-origin           :initform (vector 0.0 1.0 0.0)    :documentation "Код 112. Ось Y ПСК. Файл DXF: значение X; приложение: 3D-вектор") 
   (vport-ucs-id-name          :accessor vport-ucs-id-name          :initarg :vport-ucs-id-name          :initform nil                     :documentation "Код 345. Идентификатор/дескриптор AcDbUCSTableRecord, если ПСК является именованной ПСК. Если значение отсутствует, то ПСК является неименованной") 
   (vport-ucs-id-base          :accessor vport-ucs-id-base          :initarg :vport-ucs-id-base          :initform nil                     :documentation "Код 346. Идентификатор/дескриптор AcDbUCSTableRecord базовой ПСК, если ПСК является ортогональной (код 79 не равен нулю). Если значение отсутствует, а код 79 не равен нулю, под базовой ПСК подразумевается МСК") 
   (vport-ucs-ortho-type       :accessor vport-ucs-ortho-type       :initarg :vport-ucs-ortho-type       :initform 0                       :documentation "Код 79. Ортогональный тип ПСК: 0 = ПСК не ортогональна; 1 = сверху; 2 = снизу; 3 = спереди; 4 = сзади; 5 = слева; 6 = справа") 
   (vport-elevation            :accessor vport-elevation            :initarg :vport-elevation            :initform 0.0                     :documentation "Код 146. Уровень") 
   (vport-shade-plot-setting   :accessor vport-shade-plot-setting   :initarg :vport-shade-plot-setting   :initform nil                     :documentation "Код 170. Тонирование печати")
   (vport-major-grid-lines     :accessor vport-major-grid-lines     :initarg :vport-major-grid-lines     :initform 5                       :documentation "Код 61. Основные линии сетки")
   (vport-background-id        :accessor vport-background-id        :initarg :vport-background-id        :initform nil                     :documentation "Код 332. Идентификатор/дескриптор символьного указателя на объект фона (необязательно)")
   (vport-shade-plot-id        :accessor vport-shade-plot-id        :initarg :vport-shade-plot-id        :initform nil                     :documentation "Код 333. Идентификатор/дескриптор символьного указателя на объект режима печати оттенков (необязательно)")
   (vport-visual-style-id      :accessor vport-visual-style-id      :initarg :vport-visual-style-id      :initform "2A"                    :documentation "Код 348. Идентификатор/дескриптор жесткого указателя на объект визуального стиля (необязательно)")
   (vport-lighting-on-flag     :accessor vport-lighting-on-flag     :initarg :vport-lighting-on-flag     :initform 1                       :documentation "Код 292. Флаг включения освещения по умолчанию")
   (vport-lighting-type        :accessor vport-lighting-type        :initarg :vport-lighting-type        :initform 1                       :documentation "Код 282. Тип освещения по умолчанию: 0 = один удаленный источник света; 1 = два удаленных источника света")
   (vport-brightness           :accessor vport-brightness           :initarg :vport-brightness           :initform 0.0                     :documentation "Код 141. Яркость")
   (vport-contrast             :accessor vport-contrast             :initarg :vport-contrast             :initform 0.0                     :documentation "Код 142. Контрастность")
   (vport-ambient-color        :accessor vport-contrast             :initarg :vport-contrast             :initform (vector 250 3355443 0)  :documentation "Код 63, 421, 431. Рассеиваемый цвет (выводится, только если цвет не черный)"))

  (:documentation "./dbtable.h
http://help.autodesk.com/view/ACD/2017/RUS/?guid=GUID-8CE7CC87-27BD-4490-89DA-C21F516415A9
http://help.autodesk.com/view/ACD/2017/ENU/?guid=GUID-8CE7CC87-27BD-4490-89DA-C21F516415A9
"))
