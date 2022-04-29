#include <AutoItConstants.au3>

;; C:\Program Files (x86)\AutoIt3

Func _Test()
    ;;;Дерево Emacs
    MouseClick($MOUSE_CLICK_LEFT, 1100, 565, 20) ;; MouseClick($MOUSE_CLICK_LEFT, 850, 565, 20)
    ;
    ;;;methods.lisp
    Send ("^x")
    Send ("o")
    ;;
    ;;;;Запуск скрипта Emacs для копирования строки поиска
    Send ("!x")
    Send ("foo")
    Send ("{ENTER}")
    ;;
    ;;;;Acad help search
    MouseClick($MOUSE_CLICK_LEFT, 800, 165, 20) ;; MouseClick($MOUSE_CLICK_LEFT, 700, 165, 20) 
    Send ( "^a" )
    Send ( "^v" )
    ;
    ;; Send ( " Method")
    ;; Send ( " Property")
    Send ( " Event")
    ;
    Send ( " (ActiveX)")
    Send ("{ENTER}")
    ;
    ;;;;Acad help search rez click
    MouseClick($MOUSE_CLICK_LEFT, 100, 285, 20)
    ;
    ;;;Acad help address
    MouseClick($MOUSE_CLICK_LEFT, 600, 65, 20)
    Send ("^a")
    Send ("^c")
    ;
    ;;;Дерево Emacs
    MouseClick($MOUSE_CLICK_LEFT, 1100, 565, 20) ;; MouseClick($MOUSE_CLICK_LEFT, 850, 565, 20)
    ;
    ;;;methods.lisp
    Send ("^x")
    Send ("o")
    ;
    Send ("!x")
    Send ("bar")
    Send ("{ENTER}")
    ;
    ;Send ("^y")
    ;Send ("{DOWN}")
    ;;;
    
    ;;; GetCellAlignment Method (ActiveX)
EndFunc

For $i = 1 To 44 Step 1
    Call(_Test)
Next
