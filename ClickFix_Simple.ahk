#SingleInstance, force
#InstallMouseHook
SendMode, Input
threshold := 100
lastD := 0
lastU := 0
isUp := True
isProcessing := False

LButton::
Critical
if (isProcessing) {
    return
} Else {
    isProcessing = True
}
if (isUp && A_TickCount - lastU > threshold && A_TickCount - lastD > threshold) {    
    lastD := A_TickCount
    isUp := False
    Send {Blind}{LButton Down}
}
isProcessing := False
return

LButton up::
if (isProcessing) {
    return
} Else {
    isProcessing = True
}
if (!isUp && A_TickCount - lastU > threshold) {
    lastU := A_TickCount
    isUp := True
    Send {Blind}{LButton Up}
}
isProcessing := False
return