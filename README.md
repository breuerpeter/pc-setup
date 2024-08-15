# PC-Setup

## Windows

### Install software

1. Install software that is available in WinGet automatically.

    1. [Install WinGet](https://learn.microsoft.com/en-us/windows/package-manager/winget/).
    2. Install software:

        PowerShell:
        ```
        .\setup.ps1
        ```

        Note: the script installs
        - Windows Terminal
        - VS Code
        - VLC Media Player
        - Vivaldi
        - Slack
        - Discord
        - Zoom
        - Betaflight Configurator
        - Wireshark
        - MobaXTerm
        - OBS Studio

2. Install other software manually.

    - [Adobe Creative Cloud](https://apps.microsoft.com/store/detail/XPDLPKWG9SW2WD?ocid=pdpshare) (Acrobat, Lightroom Classic, Photoshop, Premiere Pro)
    - [TeX Live](https://tug.org/texlive/windows.html)
    - [QGroundControl](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)
    - [Microsoft 365 Family](https://apps.microsoft.com/detail/cfq7ttc0k5dm)
    - [Mendeley Reference Manager](https://www.mendeley.com/download-reference-manager/windows)
    - [Gyroflow](https://apps.microsoft.com/detail/9nzg7t0jcg9h)

3. Install optional software (I've used these but not quite enough)

    - Mathpix Snipping Tool
    - Ultimaker Cura
    - Anki
    - StarStax
    - CCleaner
    - Siemens NX 12
    - [Ipe](https://ipe.otfried.org)

Note: The following software is available on an external SSD:
- Paragon Migrate OS to SSD

### Manual configurations

#### General

- Set hostname to device model (capitalized), e.g., `ZENBOOK`
- Enable settings sync (Windows backup)
- Adjust screen scaling
- Disable lock screen
- Enable file extensions for known file types
- Dark mode
- Disable unnecessary apps on startup
- Enable *Ultimate performance* power plan
- Under *System Properties* (open with *View advanced system settings*) > *Performance Options* (under *Advanced* > *Performance* > *Settings*) choose *Adjust for best performance*
- Disable notifications
- Set language to English (US)
- Set regional format (for date and time) to English (Europe)
- Set correct keyboard layout
- Uninstall unwanted optional features
- Most commonly used apps in task bar
- Show all apps in start window

#### VS Code

- Turn on settings sync (link with GitHub).

## WSL

### Installation

PowerShell:
```
wsl --install
wsl --install -d DISTRO_NAME
```

### Configuration

#### Setup script

WSL terminal:
```
sudo bash setup.sh
```

#### Default user

PowerShell:
```
DISTRO_NAME config --default-user USER_NAME
```

#### Windows Terminal

1. Install a [Nerd Font](https://www.nerdfonts.com/font-downloads), e.g., *FiraCode*.

    Note: Download the archive, unzip, select all, right click and install.
2. Set the WSL distro profile as the default profile on startup (*Settings* > *Startup*).
3. Make sure Windows Terminal uses the Windows theme (*Settings* > *Appearance*).
4. Customize the default profile settings (*Settings* > *Profiles* > *Defaults*)
    - *Appearance*
        - Color scheme: *One Half Dark* 
        - Font face: *FiraCode*
        - Font size: 10
        - Background opacity: 80%
