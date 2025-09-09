# LangSwitch (AutoHotkey v2)

Direct, non-cycling keyboard layout switching on Windows using custom hotkeys:
- Shift+Alt+W → English (US)
- Shift+Alt+E → German (Germany)
- Shift+Alt+S → Russian (Russia)
- Shift+Alt+D → Ukrainian (Ukraine)

The script sends WM_INPUTLANGCHANGEREQUEST to the focused window and includes safe fallbacks for common edge cases.

## Requirements
- Windows 11/10
- AutoHotkey v2.0+
- The target input layouts!!! installed in Windows (EN-US, DE, RU, UKR)

## Installation
1) Install AutoHotkey v2.  
2) Clone/download this repo.  
3) Double-click `LangSwitch.ahk` to run.  
4) Optional: add to auto-start.

## Usage
- Press the hotkeys above to switch directly to the desired layout without cycling through others.
- To avoid conflicts, disable Windows’ default language hotkeys (Alt+Shift, Ctrl+Shift, Win+Space...) in:
  Settings → Time & language → Typing → Advanced keyboard settings → Input language hot keys.

## Notes
- For elevated/system windows, run the script “as Administrator” to avoid access restrictions.
- When no window has focus, Windows won’t switch the input for existing windows; the script sets the default input for new threads as a partial fallback.
- Close AutoHotkey before launching games with aggressive anti-cheat to avoid false positives.

## License
MIT
