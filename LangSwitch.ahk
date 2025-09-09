#Requires AutoHotkey v2.0
#SingleInstance Force

; EN-US 00000409, DE 00000407, RU 00000419, UK 00000422

switchLayout(hexId) {
    hkl := DllCall("LoadKeyboardLayout", "Str", hexId, "UInt", 1, "UPtr")

    hwnd := WinGetID("A")
    if (hwnd) {
        try {
            PostMessage(0x50, 0, hkl, , "ahk_id " hwnd) ; WM_INPUTLANGCHANGEREQUEST
            return
        } catch as e {
            if InStr(e.Message, "Access is denied") {
                ; no-op, continue to fallbacks
            } else {
                throw e
            }
        }
    }

    ; Fallback 1: try shell tray
    try {
        tray := WinGetID("ahk_class Shell_TrayWnd")
        if (tray)
            PostMessage(0x50, 0, hkl, , "ahk_id " tray)
    } catch Any {
        ; ignore
    }

    ; Fallback 2: default for new threads
    DllCall("SystemParametersInfo", "UInt", 0x005A, "UInt", 0, "UPtr", hkl, "UInt", 2) ; SPI_SETDEFAULTINPUTLANG
}

!+w::switchLayout("00000409") ; English (US)
!+e::switchLayout("00000407") ; German
!+s::switchLayout("00000419") ; Russian
!+d::switchLayout("00000422") ; Ukrainian
