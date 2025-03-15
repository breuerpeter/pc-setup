# pc-setup

## General setup

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

## Instructions

1. If applicable, install WSL

    (PowerShell)
    ```
    wsl --install -d DISTRO_NAME
    ```

2. Get the code

    Linux:
    ```
    mkdir -p ~/code && mkdir -p ~/code/personal && cd ~/code/personal
    git clone https://github.com/breuerpeter/pc-setup.git
    cd ./pc-setup
    ```

    WSL:
    ```
    mkdir -p ~/code && mkdir -p ~/code/personal
    cd /mnt/c/Users/peter
    git clone https://github.com/breuerpeter/pc-setup.git .config
    cd .config
    ln -s /mnt/c/Users/peter/.config ~/code/personal/pc-setup
    ```

3. If applicable, run Windows software installation script

    (PowerShell)
    ```
    cd $HOME\.config\windows
    .\setup.ps1
    ```

    Not available through *WinGet* yet (install manually):
    - [QGroundControl](https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html)
    - [Microsoft 365 Family](https://apps.microsoft.com/detail/cfq7ttc0k5dm)

4. Run setup scripts

    ```
    sudo chmod +x ./ubuntu ./ubuntu/scripts && ./ubuntu/run_scripts.sh
    ```

### Manual configuration for Windows

- Enable settings sync (Windows backup)
- Adjust screen scaling
- Disable lock screen
- Enable file extensions for known file types
- Enable *Ultimate performance* power plan
- Disable notifications
- Most commonly used apps in task bar
- Show all apps in start window
