# Windows 7 Aero for Windows 11

A Windows 7 Aero look for Windows 11, built with [Windhawk](https://windhawk.net) styler mods and [Open-Shell](https://github.com/Open-Shell/Open-Shell-Menu).

| Part | Tool | Look |
|---|---|---|
| Taskbar | Windhawk: Windows 11 Taskbar Styler | Built-in `Windows7` theme (orb, glass, Win7 task buttons) |
| Start menu | Open-Shell | Windows 7 style, Windows Aero skin (white program list, glass links pane, Shut down button) |
| Search window | Windhawk: Windows 11 Start Menu Styler | Blue Aero glass gradient with diagonal shine, white text, Win7 hover highlight |
| Windows 11 Start menu (Shift+click) | Windhawk: Windows 11 Start Menu Styler | Accent-tinted Aero glass with shine |
| Notification center, quick settings, calendar, toasts | Windhawk: Windows 11 Notification Center Styler | Accent-tinted Aero glass, white edge |

## Requirements

- Windows 11
- Windhawk with these mods installed:
  - Windows 11 Taskbar Styler
  - Windows 11 Start Menu Styler
  - Windows 11 Notification Center Styler
- winget (used to install Open-Shell if missing)

## Install

1. Download or clone this repo.
2. Right-click `install.ps1` and choose **Run with PowerShell**, then approve the admin prompt.

To keep the Windows 11 Start menu instead of Open-Shell:

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1 -SkipOpenShell
```

The installer replaces the current settings of the three styler mods. Back them up from Windhawk first if you want to keep them.

## Uninstall

Run `uninstall.ps1` to reset the three styler mods to their defaults, then uninstall Open-Shell from **Settings > Apps** if you installed it.

## Customizing

In Windhawk, open a styler mod's **Settings** and edit **styleConstants**:

| Constant | What it does |
|---|---|
| `aeroColor` | Glass tint. Defaults to your Windows accent color. Use `#FF4A90D9` for classic Win7 Sky blue. |
| `aeroOpacity` | Tint strength (0 to 1). Raise for darker, more readable glass. |
| `aeroBlur` | Blur amount. |
| `radius` | Corner roundness. Win7 used about 6. |
| `searchBlue` | Tint of the search window glass. |
| `searchGlass` | Search window blur brush. Change `TintOpacity` to adjust transparency. |

The search window's blue gradient is in the `#root` entry of **webContentStyles** in Start Menu Styler.

Open-Shell options (skin, glass color, right-column links) are in its settings: right-click the Start button and choose **Settings**.

## Files

| File | Purpose |
|---|---|
| `install.ps1` | Applies everything |
| `uninstall.ps1` | Resets the Windhawk styler mods |
| `windhawk/apply-win7-aero.ps1` | Writes the Start Menu Styler, search, and Notification Center Styler styles |
| `open-shell/openshell-win7.reg` | Open-Shell Windows 7 style settings |

## Credits

- Windows7 taskbar theme from the [Windows 11 Taskbar Styling Guide](https://github.com/ramensoftware/windows-11-taskbar-styling-guide/tree/main/Themes/Windows7)
- [Windhawk](https://windhawk.net) by Ramen Software
- [Open-Shell](https://github.com/Open-Shell/Open-Shell-Menu)
