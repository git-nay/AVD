# Define custom download sources
$customApps = @(
    @{ Name = "WinRAR"; Url = "https://www.rarlab.com/rar/winrar-x64-623.exe"; InstallerType = "exe"; SilentArgs = "/S" }
    @{ Name = "Adobe Reader"; Url = "https://www.rarlab.com/rar/winrar-x64-623.exe"; InstallerType = "exe"; SilentArgs = "/S" }
    @{ Name = "Firefox"; Url = "https://www.mozilla.org/en-GB/firefox/all/desktop-release/win64/en-GB/"; InstallerType = "exe"; SilentArgs = "/S" }
)

# Function to install custom downloaded applications
function Install-CustomApp {
    param ($app)
    $downloadPath = "$env:TEMP\$($app.Name).$($app.InstallerType)"
    
    Write-Host "Downloading $($app.Name) from $($app.Url)..."
    Invoke-WebRequest -Uri $app.Url -OutFile $downloadPath

    Write-Host "Installing $($app.Name)..."
    Start-Process -FilePath $downloadPath -ArgumentList $app.SilentArgs -Wait -NoNewWindow
    
    Write-Host "$($app.Name) installation completed."
}

# Install custom applications
foreach ($app in $customApps) {
    Install-CustomApp -app $app
}

Write-Host "All applications installed successfully!"
