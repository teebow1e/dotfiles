function Get-OnlineFile {
    param (
        [string]$url,
        [string]$destination = [System.IO.Path]::Combine([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::MyDocuments), "Downloads\")
    )

    try {
        $webClient = New-Object System.Net.WebClient
        $fileName = [System.IO.Path]::GetFileName($url)
        $fullDestination = [System.IO.Path]::Combine($destination, $fileName)
        $webClient.DownloadFile($url, $fullDestination)
        Write-Host "Download complete: $($fullDestination)"
    } catch {
        Write-Host "Error downloading file: $_.Exception.Message"
    }
}

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Core
choco install onedrive
choco install 7zip
choco install winrar
choco install everything
choco install flameshot
Get-OnlineFile -url "https://www.savardsoftware.com/downloads/ttsetup.exe"

## VPN
Get-OnlineFile -url "https://downloads.nordcdn.com/apps/windows/NordVPN/latest/NordVPNSetup.exe"
choco install warp
Write-Output "FortiClient VPN is not installed. Install manually at https://www.fortinet.com/support/product-downloads#vpn"

# Browser
choco install microsoft-edge
choco install firefox
choco install googlechrome
choco install tor-browser

# Communication
Get-OnlineFile -url "https://download.cdn.viber.com/desktop/windows/ViberSetup.exe"
Get-OnlineFile -url "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
Get-OnlineFile -url "https://discord.com/api/download/ptb?platform=win"
choco install telegram
choco install microsoft-teams

## Remote Desktop
choco install anydesk
choco install ultraviewer.install
choco install bitvise-ssh-client
choco install mobaxterm

## Coding
choco install microsoft-windows-terminal
choco install vscode
choco install python
choco install golang
choco install github-desktop
choco install notepadplusplus
choco install git
choco install nodejs-lts
choco install javaruntime

# Cybersec
choco install nmap
choco install sqlitebrowser
choco install hxd

# Entertainment
choco install vlc
choco install qbittorrent
choco install obs-studio

# Productivity
choco install sumatrapdf
Write-Output "Make sure to install Microsoft Office by hand."
choco install notion

Write-Output "The following are not installed: GoLand, Java-related, BurpSuite, Adobe Acrobat, VisualStudio, 3uTools, DockerDesktop"
Write-Output "WSL is not installed."