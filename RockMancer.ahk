#Requires AutoHotkey v2.0
/* This script is designed for the game Days Gone. When you're trying to aim, it equips a rock and throws it. */

aiming := false
firing := false

^Escape::ExitApp

RButton::
{
    MouseClick("Right", , , , , "D")
    global aiming := true
    return
}

RButton up::
{
    MouseClick("Right", , , , , "U")
    global aiming := false
    return
}

LButton::
{
    MouseClick("Left", , , , , "D")
    global firing := true
    return
}

LButton up:: 
{
    MouseClick("Left", , , , , "U")
    global firing := false
    return
}

Loop
{
    if (firing && aiming)
    {
        Send "6"
        Sleep 25
        MouseClick("Left", , , , , "D")
        Sleep 25
        MouseClick("Left", , , , , "U")
        Sleep 25
    }
}
