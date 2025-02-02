Write-Host "Setup in progress..."

$general = @(
"WezTerm",
"Vivaldi"
)

$software = @(
"Microsoft Visual Studio Code",
"Cursor",
"MobaXterm"
)

$hardware = @(
"Ultimaker Cura"
)

$research = @(
"Mendeley Reference Manager",
"Ipe extensible drawing editor",
"Mathpix Snipping Tool"
)

$creative = @(
"VLC media player",
"OBS Studio",
"Inkscape",
"Gyroflow"

)

$learning = @(
"Anki"
)

$drones = @(
"Betaflight Configurator",
"Wireshark"
)

$social = @(
"Slack",
"Discord",
"Zoom Workplace"
)

$lists = @{
"general" = $general
"software" = $software
"hardware" = $hardware
"research" = $research
"creative" = $creative
"learning" = $learning
"drones" = $drones
"social" = $social
}

$programs = @()

if ($args.Count -eq 0) {
        $programs = $general
} else {
        foreach ($arg in $args) {
                if ($lists.ContainsKey($arg)) {
                        $programs += $lists[$arg]
                } else {
                        Write-Host "Unknown list: $arg"
                }
        }
}

$programs = $programs | Select-Object -Unique

# Install WinGet
# See https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget-on-windows-sandbox
# Update the URI using https://github.com/microsoft/winget-cli/releases

$WINGET_FILE = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
$VCLIBS_FILE = "Microsoft.VCLibs.x64.14.00.Desktop.appx"
$XAML_FILE = "Microsoft.UI.Xaml.2.8.x64.appx"

$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile $WINGET_FILE
Invoke-WebRequest -Uri https://aka.ms/$VCLIBS_FILE -OutFile $VCLIBS_FILE 
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/$XAML_FILE -OutFile $XAML_FILE
Add-AppxPackage $VCLIBS_FILE
Add-AppxPackage $XAML_FILE
Add-AppxPackage $WINGET_FILE

# Cleanup downloaded files
$filesToRemove = @(
    $WINGET_FILE,
    $VCLIBS_FILE,
    $XAML_FILE
)

foreach ($file in $filesToRemove) {
    if (Test-Path $file) {
        Remove-Item $file -Force
        Write-Information "Removed $file."
    } else {
        Write-Information "$file does not exist, skipping removal."
    }
}

Write-Host "The following programs will be installed:"
foreach ($program in $programs) {
        Write-Host "- $program"
}

$confirmation = Read-Host "Do you want to proceed with the installations? (y/n)"
if ($confirmation -ne 'y') {
        Write-Host "Installation cancelled."
        exit
}

if (Get-Command winget -ErrorAction SilentlyContinue) {
    foreach ($program in $programs) {
        winget install -e --name $program
    }
} else {
    Write-Output "Winget is not installed. Please install Winget to proceed."
}

Write-Host "Setup complete."
