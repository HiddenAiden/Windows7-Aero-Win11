param([switch]$SkipOpenShell)

$ErrorActionPreference = 'Stop'

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    $argList = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    if ($SkipOpenShell) { $argList += ' -SkipOpenShell' }
    Start-Process powershell -Verb RunAs -Wait -ArgumentList $argList
    exit
}

$mods = 'HKLM:\SOFTWARE\Windhawk\Engine\Mods'
$required = 'windows-11-taskbar-styler', 'windows-11-start-menu-styler', 'windows-11-notification-center-styler'
$missing = $required | Where-Object { -not (Test-Path "$mods\$_") }
if ($missing) {
    Write-Host "Install these Windhawk mods first: $($missing -join ', ')" -ForegroundColor Red
    Read-Host 'Press Enter to exit'
    exit 1
}

$taskbar = "$mods\windows-11-taskbar-styler"
if (-not (Test-Path "$taskbar\Settings")) { New-Item "$taskbar\Settings" -Force | Out-Null }
Set-ItemProperty "$taskbar\Settings" -Name 'theme' -Value 'Windows7' -Type String
Set-ItemProperty $taskbar -Name 'SettingsChangeTime' -Value ([int][double]::Parse((Get-Date -UFormat %s))) -Type DWord
Write-Host 'Taskbar Styler set to Windows7 theme.'

& "$PSScriptRoot\windhawk\apply-win7-aero.ps1"

if (-not $SkipOpenShell) {
    $exe = 'C:\Program Files\Open-Shell\StartMenu.exe'
    if (-not (Test-Path $exe)) {
        winget install --id Open-Shell.Open-Shell-Menu -e --accept-package-agreements --accept-source-agreements --silent
    }
    reg import "$PSScriptRoot\open-shell\openshell-win7.reg"
    if (Test-Path $exe) {
        & $exe -exit
        Start-Sleep -Milliseconds 1500
        Start-Process $exe -ArgumentList '-autorun'
    }
    Write-Host 'Open-Shell set to Windows 7 style with Windows Aero skin.'
}

Stop-Process -Name SearchHost -Force -ErrorAction SilentlyContinue
Write-Host 'Done. If something has not updated, toggle the mod off and on in Windhawk or sign out and back in.' -ForegroundColor Green
Read-Host 'Press Enter to exit'
