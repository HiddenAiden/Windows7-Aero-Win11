$ErrorActionPreference = 'Stop'
$root = 'HKLM:\SOFTWARE\Windhawk\Engine\Mods'

$aeroConstants = @(
    'aeroColor={ThemeResource SystemAccentColor}',
    'aeroOpacity=0.3',
    'aeroBlur=6',
    'radius=6',
    'glassEdge=#80FFFFFF',
    'aero=<WindhawkBlur BlurAmount="$aeroBlur" TintOpacity="$aeroOpacity" TintColor="$aeroColor" />',
    'gloss=<LinearGradientBrush StartPoint="0,0" EndPoint="1,1"><GradientStop Color="#40FFFFFF" Offset="0"/><GradientStop Color="#10FFFFFF" Offset="0.3"/><GradientStop Color="#00FFFFFF" Offset="0.42"/><GradientStop Color="#1CFFFFFF" Offset="0.48"/><GradientStop Color="#00FFFFFF" Offset="0.6"/><GradientStop Color="#0CFFFFFF" Offset="0.8"/><GradientStop Color="#00FFFFFF" Offset="1"/></LinearGradientBrush>',
    'hover=<LinearGradientBrush StartPoint="0,0" EndPoint="0,1"><GradientStop Color="#55FFFFFF" Offset="0"/><GradientStop Color="#22FFFFFF" Offset="0.5"/><GradientStop Color="#33FFFFFF" Offset="1"/></LinearGradientBrush>',
    'pressed=<LinearGradientBrush StartPoint="0,0" EndPoint="0,1"><GradientStop Color="#33FFFFFF" Offset="0"/><GradientStop Color="#66FFFFFF" Offset="1"/></LinearGradientBrush>',
    'transparent=<SolidColorBrush Color="Transparent"/>',
    'searchBlue=#FF2B6CC4',
    'searchGlass=<WindhawkBlur BlurAmount="$aeroBlur" TintOpacity="0.55" TintColor="$searchBlue" />'
)

$startStyles = [ordered]@{
    'Border#AcrylicBorder' = @(
        'Background:=$aero',
        'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>',
        'BorderThickness=1',
        'CornerRadius=$radius'
    )
    'Border#AcrylicOverlay' = @(
        'Visibility=Visible',
        'Background:=$gloss',
        'CornerRadius=$radius',
        'IsHitTestVisible=False'
    )
    'Border#LayerBorder' = @('Visibility=Collapsed')
    'Border#dropshadow' = @('CornerRadius=$radius')
    'Border#StartDropShadow' = @('CornerRadius=$radius')
    'Border#BorderElement' = @(
        'Background:=<SolidColorBrush Color="#30FFFFFF"/>',
        'BorderBrush:=<SolidColorBrush Color="#99FFFFFF"/>',
        'BorderThickness=1',
        'CornerRadius=3'
    )
    'Border#TaskbarSearchBackground' = @(
        'Background:=$searchGlass',
        'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>',
        'BorderThickness=1',
        'CornerRadius=$radius'
    )
    'MenuFlyoutPresenter > Border' = @(
        'Background:=$aero',
        'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>',
        'BorderThickness=1',
        'CornerRadius=$radius'
    )
    'ToolTip > ContentPresenter#LayoutRoot' = @(
        'Background:=$aero',
        'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>',
        'CornerRadius=3'
    )
    'StartMenu.FolderModal > Grid > Border' = @(
        'Background:=$aero',
        'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>',
        'BorderThickness=1',
        'CornerRadius=$radius'
    )
    'ListViewItem > Grid#ContentBorder@CommonStates' = @(
        'Background:=$transparent',
        'Background@PointerOver:=$hover',
        'Background@Pressed:=$pressed',
        'BorderBrush:=$transparent',
        'BorderBrush@PointerOver:=<SolidColorBrush Color="#AAFFFFFF"/>',
        'BorderBrush@Pressed:=<SolidColorBrush Color="#CCFFFFFF"/>',
        'BorderThickness=1',
        'CornerRadius=3'
    )
    'StartDocked.AppListViewItem > Grid@CommonStates > Border' = @(
        'Background@PointerOver:=$hover',
        'Background@Pressed:=$pressed',
        'BorderBrush@PointerOver:=<SolidColorBrush Color="#AAFFFFFF"/>',
        'BorderThickness=1',
        'CornerRadius=3'
    )
    'StartDocked.NavigationPaneButton > Grid@CommonStates > Border' = @(
        'Background@PointerOver:=$hover',
        'Background@Pressed:=$pressed',
        'BorderBrush@PointerOver:=<SolidColorBrush Color="#AAFFFFFF"/>',
        'BorderThickness=1',
        'CornerRadius=3'
    )
    'Button#ShowAllAppsButton > ContentPresenter@CommonStates' = @(
        'Background:=<SolidColorBrush Color="#22FFFFFF"/>',
        'Background@PointerOver:=$hover',
        'BorderBrush:=<SolidColorBrush Color="#88FFFFFF"/>',
        'BorderThickness=1',
        'CornerRadius=3'
    )
    'TextBlock#Text' = @('Foreground=White')
}

$notifStyles = [ordered]@{
    'Grid#NotificationCenterGrid' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius')
    'Grid#CalendarCenterGrid' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius')
    'Grid#ControlCenterRegion' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius')
    'Grid#MediaTransportControlsRegion' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius')
    'Border#ToastBackgroundBorder, Border#ToastBackgroundBorder2' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius')
    'Border#JumpListRestyledAcrylic' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius', 'Margin=-2,-2,-2,-2')
    'MenuFlyoutPresenter > Border' = @('Background:=$aero', 'BorderBrush:=<SolidColorBrush Color="$glassEdge"/>', 'BorderThickness=1', 'CornerRadius=$radius')
    'ScrollViewer#CalendarControlScrollViewer' = @('Background:=$transparent', 'BorderThickness=0')
    'Border#CalendarHeaderMinimizedOverlay' = @('Background:=$transparent', 'BorderThickness=0')
    'ActionCenter.FocusSessionControl#FocusSessionControl > Grid#FocusGrid' = @('Background:=$transparent', 'BorderThickness=0')
    'Grid#L1Grid > Border' = @('Background:=$transparent', 'BorderThickness=0')
    'Grid#MediaTransportControlsRoot' = @('Background:=$transparent')
    'ContentPresenter#PageContent' = @('Background:=$transparent')
    'ContentPresenter#PageContent > Grid > Border' = @('Background:=$transparent')
    'QuickActions.ControlCenter.AccessibleWindow#PageWindow > ContentPresenter > Grid#FullScreenPageRoot' = @('Background:=$transparent')
    'QuickActions.ControlCenter.AccessibleWindow#PageWindow > ContentPresenter > Grid#FullScreenPageRoot > ContentPresenter#PageHeader' = @('Background:=$transparent')
    'ScrollViewer#ListContent' = @('Background:=$transparent')
    'ActionCenter.FlexibleToastView#FlexibleNormalToastView' = @('Background:=$transparent')
    'ActionCenter.FlexibleItemView' = @('CornerRadius=$radius')
    'JumpViewUI.SystemItemListViewItem > Grid#LayoutRoot > Border#BackgroundBorder' = @('Background:=$transparent', 'CornerRadius=3')
    'JumpViewUI.JumpListListViewItem > Grid#LayoutRoot > Border#BackgroundBorder' = @('CornerRadius=3')
    'ContentControl#TogglesGroup > ContentPresenter > ControlCenter.PaginatedGridView > Grid' = @('BorderThickness=0')
    'Grid#FooterGrid' = @('Background:=$transparent', 'BorderThickness=0')
}

$searchStyles = [ordered]@{
    'html, body' = @('background: transparent !important')
    '#root' = @(
        'background: linear-gradient(135deg, rgba(255,255,255,0.25) 0%, rgba(255,255,255,0.06) 30%, rgba(255,255,255,0) 42%, rgba(255,255,255,0.11) 48%, rgba(255,255,255,0) 60%, rgba(255,255,255,0.05) 80%, rgba(255,255,255,0) 100%), linear-gradient(to bottom, rgba(120,175,235,0.65) 0%, rgba(60,125,210,0.50) 45%, rgba(30,85,170,0.60) 100%) !important',
        'box-shadow: inset 0 0 0 1px rgba(255,255,255,0.35) !important'
    )
    '#root div' = @('background-color: transparent !important')
    '#root *' = @(
        'color: #FFFFFF !important',
        'text-shadow: 0 0 6px rgba(0,0,0,0.45) !important'
    )
    'div, span, p, h1, h2, h3, h4, h5, input, button' = @('font-family: "Segoe UI", sans-serif !important')
    '.cortanaFontIcon, .iconContent' = @('font-family: "Segoe MDL2 Assets" !important')
    '#root .groupTitle, #root .groupHeader, #root .groupHeader *' = @(
        'color: #DCEBFF !important',
        'font-weight: 400 !important'
    )
    '#root input' = @(
        'background: #FFFFFF !important',
        'border: 1px solid #8FA9C9 !important',
        'border-radius: 2px !important',
        'color: #000000 !important',
        'text-shadow: none !important'
    )
    '#root .suggestion:hover, #root .suggestion[aria-selected="true"], #root .suggContainer:hover, #root .scope-tile:hover, #root .scope-tile--selected' = @(
        'background: linear-gradient(to bottom, rgba(255,255,255,0.40) 0%, rgba(255,255,255,0.18) 50%, rgba(255,255,255,0.28) 100%) !important',
        'border: 1px solid rgba(255,255,255,0.75) !important',
        'border-radius: 3px !important',
        'box-shadow: inset 0 0 0 1px rgba(255,255,255,0.25) !important'
    )
    '#root .suggestion, #root .suggContainer' = @(
        'border: 1px solid transparent !important',
        'border-radius: 3px !important'
    )
    '.leftPill, .leftPill::before' = @('display: none !important')
    '#root #qfPreviewPane' = @(
        'background-color: rgba(255,255,255,0.08) !important',
        'border-left: 1px solid rgba(255,255,255,0.35) !important'
    )
}

function Set-StylerSettings($modId, $styles, $extra, $webStyles) {
    $key = "$root\$modId\Settings"
    if (Test-Path $key) { Remove-Item $key -Recurse -Force }
    New-Item $key -Force | Out-Null
    New-ItemProperty $key -Name 'theme' -Value '' -PropertyType String | Out-Null
    foreach ($name in $extra.Keys) { New-ItemProperty $key -Name $name -Value $extra[$name] -PropertyType String | Out-Null }
    for ($i = 0; $i -lt $aeroConstants.Count; $i++) {
        New-ItemProperty $key -Name "styleConstants[$i]" -Value $aeroConstants[$i] -PropertyType String | Out-Null
    }
    $t = 0
    foreach ($target in $styles.Keys) {
        New-ItemProperty $key -Name "controlStyles[$t].target" -Value $target -PropertyType String | Out-Null
        $s = 0
        foreach ($style in $styles[$target]) {
            New-ItemProperty $key -Name "controlStyles[$t].styles[$s]" -Value $style -PropertyType String | Out-Null
            $s++
        }
        $t++
    }
    if ($webStyles) {
        $w = 0
        foreach ($target in $webStyles.Keys) {
            New-ItemProperty $key -Name "webContentStyles[$w].target" -Value $target -PropertyType String | Out-Null
            $s = 0
            foreach ($style in $webStyles[$target]) {
                New-ItemProperty $key -Name "webContentStyles[$w].styles[$s]" -Value $style -PropertyType String | Out-Null
                $s++
            }
            $w++
        }
    }
    New-ItemProperty $key -Name 'themeResourceVariables[0]' -Value '' -PropertyType String | Out-Null
    $now = [int][double]::Parse((Get-Date -UFormat %s))
    Set-ItemProperty "$root\$modId" -Name 'SettingsChangeTime' -Value $now -Type DWord
}

Set-StylerSettings 'windows-11-start-menu-styler' $startStyles ([ordered]@{
    'disableNewStartMenuLayout' = ''
    'webContentCustomJs' = ''
}) $searchStyles
Set-StylerSettings 'windows-11-notification-center-styler' $notifStyles ([ordered]@{})

Write-Host 'Windows 7 Aero styles applied.'
