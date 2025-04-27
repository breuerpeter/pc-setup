# pc-setup

## General setup

### Config

- Hostname: device model (capitalized)
- Username: *peter*
- Language: *English (US)*
- Keyboard layout: *English (US)*

### Performance

- Uninstall bloatware and unwanted optional features
- Disable unnecessary startup apps

### Appearance

- Dark mode
- Black background

## Instructions

### Windows

```powershell
winget install --id Git.Git -e --source
git clone https://github.com/breuerpeter/pc-setup.git
.\pc-setup\windows\setup.ps1
```

#### Manual configuration

- Enable settings sync (Windows backup)
- Adjust screen scaling
- Disable lock screen
- Enable file extensions for known file types
- Enable *Ultimate performance* power plan
- Disable notifications
- Most commonly used apps in task bar
- Show all apps in start window

### Linux

```bash
sudo apt install -y --no-install-recommends git
git clone https://github.com/breuerpeter/pc-setup.git
sudo chmod +x ./ubuntu && ./ubuntu/setup.sh
```