# PC-Setup

## Manual configuration

### General

- Language: *English (US)*
- Keyboard layout: *English (US)*
- Formats (date/time): *Deutschland* or *English (Europe)*
- Set hostname to device model (capitalized), e.g., `ZENBOOK`
- Uninstall bloatware and unwanted optional features
- Disable unnecessary startup-apps
- Dark mode
- Black background

### Windows

- Enable settings sync (Windows backup)
- Adjust screen scaling
- Disable lock screen
- Enable file extensions for known file types
- Enable *Ultimate performance* power plan
- Disable notifications
- Most commonly used apps in task bar
- Show all apps in start window

## Ubuntu

1. Clone [PC-Setup repo](https://github.com/breuerpeter/PC-Setup): `cd ~ && git clone https://github.com/breuerpeter/PC-Setup.git`
2. Setup script: `sudo chmod +x PC-Config/ubuntu PC-Config/ubuntu/scripts && PC-Setup/ubuntu/setup.sh`
3. Optional software:

	- Plotjuggler: `sudo snap install -y plotjuggler`
	- Inkscape: `sudo apt update && sudo apt install -y --no-install-recommends inkscape`

## Windows

1. Install WSL (in PowerShell):

        ```
        wsl --install
        wsl --install -d DISTRO_NAME
        DISTRO_NAME config --default-user USER_NAME
        ```
2. Steps 1-2
1. [Install WinGet](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
2. Install software that is available in WinGet using the script in PowerShell: `.\setup.ps1`
3. Install WSL (in PowerShell)

        ```
        wsl --install
        wsl --install -d DISTRO_NAME
        DISTRO_NAME config --default-user USER_NAME
	```

3. Install other software manually:

    - [Adobe Creative Cloud](https://apps.microsoft.com/store/detail/XPDLPKWG9SW2WD?ocid=pdpshare) (Acrobat, Lightroom Classic, Photoshop, Premiere Pro)
    - [TeX Live](https://tug.org/texlive/windows.html)
    - [QGroundControl](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)
    - [Microsoft 365 Family](https://apps.microsoft.com/detail/cfq7ttc0k5dm)
    - [Mendeley Reference Manager](https://www.mendeley.com/download-reference-manager/windows)
    - [Gyroflow](https://apps.microsoft.com/detail/9nzg7t0jcg9h)


5. Steps 1-4 of Ubuntu setup in the WSL terminal
6. Docker Engine config script: `chmod +x ~/PC-Config/ubuntu/configure_wsl_docker.sh && ~/PC-Setup/ubuntu_configure_wsl_docker.sh`

6. Install optional software (I've used these but not quite enough)

    - Mathpix Snipping Tool
    - Ultimaker Cura
    - Anki
    - StarStax
    - CCleaner
    - Siemens NX 12
    - [Ipe](https://ipe.otfried.org)

Note: The following software is available on an external SSD:
- Paragon Migrate OS to SSD

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
