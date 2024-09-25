# PC-Setup

## General

- Language: *English (US)*
- Keyboard layout: *English (US)*
- Formats (date/time): *Deutschland* or *English (Europe)*
- Set hostname to device model (capitalized), e.g., `ZENBOOK`
- Uninstall bloatware and unwanted optional features
- Disable unnecessary startup-apps
- Dark mode
- Black background

## Ubuntu

1. Clone [this repo](https://github.com/breuerpeter/PC-Setup): `cd ~ && git clone https://github.com/breuerpeter/PC-Setup.git && cd ./PC-Setup`
2. Run setup script: `sudo chmod +x ./ubuntu ./ubuntu/scripts && ./ubuntu/setup.sh`
3. Optional software:

	- Plotjuggler: `sudo snap install -y plotjuggler`
	- Inkscape: `sudo apt update && sudo apt install -y --no-install-recommends inkscape`

## Windows

1. [Install WinGet](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
2. Install software that is available in WinGet using the script in PowerShell: `.\setup.ps1`
3. Install WSL (in PowerShell):

        ```
        wsl --install
        wsl --install -d DISTRO_NAME
        DISTRO_NAME config --default-user USER_NAME
        ```

4. Clone [this repo](https://github.com/breuerpeter/PC-Setup): `cd /mnt/c/Users/peter && git clone https://github.com/breuerpeter/PC-Setup.git ./.config && cd ./PC-Setup`
5. Run setup script (with the `--wsl` flag): `sudo chmod +x ./ubuntu ./ubuntu/scripts && ./ubuntu/setup.sh --wsl`
6. Install other software manually:

    - [Adobe Creative Cloud](https://apps.microsoft.com/store/detail/XPDLPKWG9SW2WD?ocid=pdpshare) (Acrobat, Lightroom Classic, Photoshop, Premiere Pro)
    - [TeX Live](https://tug.org/texlive/windows.html)
    - [QGroundControl](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)
    - [Microsoft 365 Family](https://apps.microsoft.com/detail/cfq7ttc0k5dm)
    - [Mendeley Reference Manager](https://www.mendeley.com/download-reference-manager/windows)
    - [Gyroflow](https://apps.microsoft.com/detail/9nzg7t0jcg9h)

7. Install optional software (I've used these but not quite enough)

    - Mathpix Snipping Tool
    - Ultimaker Cura
    - Anki
    - StarStax
    - CCleaner
    - Siemens NX 12
    - [Ipe](https://ipe.otfried.org)

Note: The following software is available on an external SSD:
- Paragon Migrate OS to SSD

### Manual configuration

- Enable settings sync (Windows backup)
- Adjust screen scaling
- Disable lock screen
- Enable file extensions for known file types
- Enable *Ultimate performance* power plan
- Disable notifications
- Most commonly used apps in task bar
- Show all apps in start window

### Windows Terminal

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
