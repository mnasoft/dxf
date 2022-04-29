#include <AutoItConstants.au3>

MouseClick($MOUSE_CLICK_LEFT, 800, 165, 20)
;;MouseClick($MOUSE_CLICK_LEFT, 0, 500, 20)
Send ( "^a" )
Send ( "^v" )
Send ("{ENTER}")
MouseClick($MOUSE_CLICK_LEFT, 100, 285, 20)
MouseClick($MOUSE_CLICK_LEFT, 500, 60, 20)
Send ("^a")
Send ("^c")
MouseClick($MOUSE_CLICK_LEFT, 1100, 500,   2)
;
;Send ("^x")
;Send ("o")
;
Send ("^x")
Send ("^k")
Send ("^k")

;;; GetCellAlignment Method (ActiveX)
