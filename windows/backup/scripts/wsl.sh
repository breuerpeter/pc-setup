param ([string]$DISTRO")
$DATE = Get-Date -Format "yyyyMMdd"

Write-Host "$DISTRO backup in progress..."

wsl --export $DISTRO $HOME\OneDrive\Computer\Backup\WSL\$DATE_$DISTRO.tar

Write-Host "$DISTRO backup complete."
