$ErrorActionPreference = 'Stop'

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Start-Process powershell -Verb RunAs -Wait -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

$mods = 'HKLM:\SOFTWARE\Windhawk\Engine\Mods'
$now = [int][double]::Parse((Get-Date -UFormat %s))
foreach ($mod in 'windows-11-taskbar-styler', 'windows-11-start-menu-styler', 'windows-11-notification-center-styler') {
    if (Test-Path "$mods\$mod") {
        if (Test-Path "$mods\$mod\Settings") { Remove-Item "$mods\$mod\Settings" -Recurse -Force }
        New-Item "$mods\$mod\Settings" -Force | Out-Null
        New-ItemProperty "$mods\$mod\Settings" -Name 'theme' -Value '' -PropertyType String | Out-Null
        Set-ItemProperty "$mods\$mod" -Name 'SettingsChangeTime' -Value $now -Type DWord
        Write-Host "Reset $mod"
    }
}

Write-Host 'Windhawk styler mods reset to default. Uninstall Open-Shell from Settings > Apps to get the Windows 11 Start menu back.' -ForegroundColor Green
Read-Host 'Press Enter to exit'
