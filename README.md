# PC-Setup

## General

### Config

- Hostname: device model (capitalized)
- Username: *peter*
- Language: *English (US)*
- Keyboard layout: *English (US)*

### Performance

- Uninstall bloatware and unwanted optional features
- Disable unnecessary startup-apps

### Appearance

- Dark mode
- Black background

## Ubuntu

```
mkdir -p ~/Code && mkdir -p ~/Code/Personal && cd ~/Code/Personal && git clone https://github.com/breuerpeter/PC-Setup.git && cd ./PC-Setup
sudo chmod +x ./ubuntu ./ubuntu/scripts && ./ubuntu/setup.sh
```

### Optional software

#### Plotjuggler
`sudo snap install -y plotjuggler`

#### Inkscape
`sudo apt update && sudo apt install -y --no-install-recommends inkscape`

## Windows

(PowerShell)
```
wsl --install
wsl --install -d DISTRO_NAME
DISTRO_NAME config --default-user USER_NAME
```

(WSL)
```
cd /mnt/c/Users/peter && git clone https://github.com/breuerpeter/PC-Setup.git ./.config && cd ./.config
sudo chmod +x ./ubuntu ./ubuntu/scripts && ./ubuntu/setup.sh --wsl
```

(PowerShell)
```
cd $HOME\.config\windows
.\setup.ps1
```

Not available through *WinGet* yet:

- [TeX Live](https://tug.org/texlive/windows.html)
- [QGroundControl](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)
- [Microsoft 365 Family](https://apps.microsoft.com/detail/cfq7ttc0k5dm)


### Manual configuration

- Enable settings sync (Windows backup)
- Adjust screen scaling
- Disable lock screen
- Enable file extensions for known file types
- Enable *Ultimate performance* power plan
- Disable notifications
- Most commonly used apps in task bar
- Show all apps in start window

## Update repo origin URL
After the setup is completed, run `git remote set-url origin git@github-personal:breuerpeter/PC-Setup.git`

# TODO:
- Figure out a way to handle zshrc edits by other scripts
