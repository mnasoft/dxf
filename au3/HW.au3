#include <AutoItConstants.au3>
;;;Дерево Emacs
MouseClick($MOUSE_CLICK_LEFT, 850, 565, 20)
;
;;;methods.lisp
Send ("^x")
Send ("o")
;
;;;Запуск скрипта Emacs для копирования строки поиска
Send ("^x")
Send ("^k")
Send ("^k")
;
;;;Acad help search
MouseClick($MOUSE_CLICK_LEFT, 700, 165, 20) ;; MouseClick($MOUSE_CLICK_LEFT, 800, 165, 20)
Send ( "^a" )
Send ( "^v" )
Send ( " Method (ActiveX)")
Send ("{ENTER}")
;;;Acad help search rez click
MouseClick($MOUSE_CLICK_LEFT, 100, 285, 20)

;MouseClick($MOUSE_CLICK_LEFT, 500, 60, 20)
;Send ("^a")
;Send ("^c")
;MouseClick($MOUSE_CLICK_LEFT, 1100, 500,   2)
;;;
;;Send ("^x")
;;Send ("o")
;;;

;;; GetCellAlignment Method (ActiveX)
