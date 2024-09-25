$programs = @(
    "wez.wezterm",
    "Microsoft.VisualStudioCode",
    "VideoLAN.VLC",
    "VivaldiTechnologies.Vivaldi",
    "SlackTechnologies.Slack",
    "Discord.Discord",
    "Zoom.Zoom",
    "Betaflight.Betaflight-Configurator",
    "WiresharkFoundation.Wireshark",
    "Mobatek.MobaXterm"
    "OBSProject.OBSStudio",
    # "DigitalScholar.Zotero",
    # "TGRMNSoftware.BulkRenameUtility",
    # "Inkscape.Inkscape"
)

# Ensure Winget is available
if (Get-Command winget -ErrorAction SilentlyContinue) {
    foreach ($program in $programs) {
        winget install -e --id $program
    }
} else {
    Write-Output "Winget is not installed. Please install Winget to proceed."
}
