#include <AutoItConstants.au3>

Func Select_Emacs()
    MouseClick($MOUSE_CLICK_LEFT, 550, 8, 1, 5)
EndFunc

Func Select_Emacs_2()
    MouseClick($MOUSE_CLICK_LEFT, 450, 8, 1, 5)
EndFunc

Func Select_FireFox()
    MouseClick($MOUSE_CLICK_LEFT, 1250, 8, 1, 5)
EndFunc

Func Select_Emacs_Buffer($bufer)
    Send ("^x")
    Sleep (50)
    Send ("b")
    Sleep (50)
    Send ($bufer)
    Sleep (50)
    Send ("{ENTER}")
    Sleep (50)
EndFunc

Func Copy_HTTPS()
    Send ("^x")
    Send ("^k")
    Send ("^k")
EndFunc

Func Copy_FireFox()
    Send ("^l")
    Send ("^v")
    Send ("{ENTER}")
    Sleep (2500)
    Send ("^a")
    Send ("^c")
EndFunc

Func Yank_Emacs()
    Send ("^y")
    Send ("{END}")
    Send ("!^f")
    Send ("!^b")
EndFunc


Func Property_Signature()
    Select_Emacs()
    Select_Emacs_Buffer("properties.lisp")
    Copy_HTTPS()
    Select_FireFox()
    Copy_FireFox()
    Select_Emacs_2()
    Yank_Emacs()
EndFunc

Func Event_Signature()
    Select_Emacs()
    Select_Emacs_Buffer("events.lisp")
    Copy_HTTPS()
    Select_FireFox()
    Copy_FireFox()
    Select_Emacs_2()
    Yank_Emacs()
EndFunc


Func Property_Signature_Do($N)
    For $i = 1 To $N Step 1
        Property_Signature()

    Next
EndFunc

Func Event_Signature_Do($N)
    For $i = 1 To $N Step 1
        Event_Signature()
    Next
EndFunc



;;Property_Signature_Do(10)
Event_Signature_Do(2)