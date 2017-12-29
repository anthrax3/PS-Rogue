# PowerShell Script: Download-File.ps1 - Version 0.1 - 29 DEC 2017
# Author: BlueSentinel
# Description: Download-File.ps1 is a simple file downloader written in PowerShell, simillar to command line tools like wget.
# Usage: PS C:\> .\Download-File.ps1 -Uri http://10.10.10.5:8000/file.txt -OutFile file.txt

# Accept command line arguments, URI and OutFile:
param(
    [string] $Uri,
    [string] $OutFile
)

# Assign $DefaultDestination the absolute path for the file download
$DownloadDestination = (Get-Item -Path ".\" -Verbose).FullName
$DownloadDestination += "\"
$DownloadDestination += $OutFile

# Download file
(New-Object System.Net.WebClient).DownloadFile($Uri,$DownloadDestination)

# Give status
Write-Host "Downloading: " $URI
Write-Host "Writing file to: " $DownloadDestination
