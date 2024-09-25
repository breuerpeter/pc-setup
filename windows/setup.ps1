Write-Host "Setup in progress..."

$general = @(
"WezTerm",
"Vivaldi"
)

$software = @(
"Microsoft Visual Studio Code",
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
# "Adobe Creative Cloud"
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
"research" = $resarch
"creative" = $creative
"learning" = "learning"
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

$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

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
        winget install -e --id $program
    }
} else {
    Write-Output "Winget is not installed. Please install Winget to proceed."
}

Write-Host "Setup complete."
