$wslDistro = "Ubuntu-22.04"

Write-Host "Setup in progress..."

# Move this repo to the code dir
New-Item -Path "$env:USERPROFILE\Desktop\code\personal" -ItemType Directory -Force
$repoPath = (Get-Location).Path + "\pc-setup"
Move-Item -Path $repoPath -Destination "$env:USERPROFILE\Desktop\code\personal\" -Force

Write-Host "Repo moved to $env:USERPROFILE\Desktop\code\personal\pc-setup"

# Create symlinks for dotfiles
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config\wezterm" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\wezterm\wezterm.lua" -Target "$env:USERPROFILE\Desktop\code\personal\pc-setup\wezterm\wezterm.lua"

# Clone and set up wiki
git clone https://github.com/breuerpeter/evergreen.git "$env:USERPROFILE\Desktop\code\personal\evergreen"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Desktop\notes" -Target "$env:USERPROFILE\Desktop\code\personal\evergreen\content"
Write-Host "Wiki repo cloned and linked to $env:USERPROFILE\Desktop\wiki"
Write-Host "Manual step required: set up Synology Drive Client to sync $env:USERPROFILE\Desktop\wiki"

# Install programs
$programs = @(
    "wez.wezterm",
    "Vivaldi.Vivaldi",
    "Microsoft.VisualStudioCode",
    "Anysphere.Cursor",
    "Axosoft.GitKraken",
    "Obsidian.Obsidian",
    "Tailscale.Tailscale",
    "Synology.DriveClient",
    "Docker.DockerDesktop",
    "VideoLAN.VLC",
    "OtfriedCheong.Ipe",
    "OBSProject.OBSStudio",
    "Gyroflow.Gyroflow",
    "Anki.Anki",
    "Betaflight.Betaflight-Configurator",
    "Discord.Discord",
    "WiresharkFoundation.Wireshark",
    "Elsevier.MendeleyReferenceManager",
    "Zoom.Zoom",
    # "SlackTechnologies.Slack",
    # "Mathpix.MathpixSnippingTool",
    # "Mobatek.MobaXterm",
    # "Ultimaker.Cura",
    # "Inkscape.Inkscape",
)

Write-Host "The following programs will be installed:"
foreach ($program in $programs) {
    Write-Host "- $program"
}

$confirmation = Read-Host "Do you want to proceed with the installations? (y/n)"
if ($confirmation -ne 'y') {
    Write-Host "Installation cancelled"
    exit
}

if (Get-Command winget -ErrorAction SilentlyContinue) {
    foreach ($program in $programs) {
        winget install -e --id $program
    }
} else {
    Write-Output "Winget is not installed; please install Winget to proceed"
}

Write-Host "Not available through *WinGet* yet (install manually):"
Write-Host "- [QGroundControl](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)"
Write-Host "- [Microsoft 365 Family](https://apps.microsoft.com/detail/cfq7ttc0k5dm)"

# Install WSL
wsl --install -d $wslDistro

# Run WSL setup scripts
wsl sudo chmod +x /mnt/c/Users/$env:USERNAME/Desktop/code/personal/pc-setup/ubuntu/run_scripts.sh
wsl /mnt/c/Users/$env:USERNAME/Desktop/code/personal/pc-setup/ubuntu/run_scripts.sh

# Move SSH keys and config from WSL to Windows
$windowsSshPath = "$env:USERPROFILE\.ssh"
New-Item -Path $windowsSshPath -ItemType Directory -Force
$wslSshPath = "/mnt/c" + $windowsSshPath.Substring(2).Replace("\", "/")
wsl -e mv -r ~/.ssh/* "$wslSshPath"

# Set appropriate permissions on the SSH directory and files
icacls $windowsSshPath /inheritance:r
icacls $windowsSshPath /grant:r "${env:USERNAME}:(OI)(CI)F"

# Set restrictive permissions on private keys
Get-ChildItem $windowsSshPath -File | Where-Object { $_.Extension -ne '.pub' } | ForEach-Object {
    icacls $_.FullName /inheritance:r
    icacls $_.FullName /grant:r "${env:USERNAME}:R"
}

# Import keys into the Windows SSH agent
# Get-Service ssh-agent | Set-Service -StartupType Automatic
# Start-Service ssh-agent
# Get-ChildItem $windowsSshPath -File | Where-Object { $_.Extension -ne '.pub' } | ForEach-Object {
#     ssh-add $_.FullName
# }

# Verify the keys have been added
# ssh-add -l

Write-Host "SSH keys and configuration successfully moved from WSL to Windows"

Write-Host "Setup complete"