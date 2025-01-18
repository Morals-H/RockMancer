#Requires AutoHotkey v2.0

/* 
    This script is designed for the game Days Gone. When you're trying to aim, it equips a rock and throws it.
    You have the ability to use a passthrough with a side mouse button if you so desire
*/

aiming := false
firing := false
passthrough := false

;kill program
^Escape::ExitApp

;aiming enabled
;KBM
RButton::
{
    MouseClick("Right", , , , , "D")
    global aiming := true
}
;Controller
Joy7::
{
    global firing := true
}

;aiming disabled
;KBM
RButton up::
{
    MouseClick("Right", , , , , "U")
    global aiming := false
}
;Controller
Joy7 up::
{
    global aiming := false
}



;Enabled Firing
;KBM
LButton::
{
    MouseClick("Left", , , , , "D")
    global firing := true
}
;Controller
Joy8::
{
    global firing := true
}



;Disabled Firing
;KBM
LButton up:: 
{
    MouseClick("Left", , , , , "U")
    global firing := false
}
;Controller
Joy8 up::
{
    global firing := false
}



;Controller doesn't get a passthrough
;passthrough enabled
XButton1::
{
    global passthrough := true
}

;passthrough disabled
XButton1 up::
{
    global passthrough := false
}

/*
Script functions
*/

Loop
{
    ;make player equip a rock before every shot
    if (firing && aiming && !passthrough)
    {
        Send "6"
        Sleep 25
        MouseClick("Left", , , , , "D")
        Sleep 25 ; required Days Gone needs a delay
        MouseClick("Left", , , , , "U")
        Sleep 25
    }
    ;let player use normal weapons
    else if (firing && aiming && passthrough)
    {
        MouseClick("Left", , , , , "D")
        Sleep 25 ; required Days Gone needs a delay
        MouseClick("Left", , , , , "U")
    }
}