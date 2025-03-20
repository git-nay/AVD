# Define custom download sources
$customApps = @(
    @{ Name = "Visual Studio Code"; Url = "https://code.visualstudio.com/docs/?dv=win64user"; InstallerType = "exe"; SilentArgs = "/S" }
    @{ Name = "Install Azure CLI"; Url = "https://aka.ms/installazurecliwindowsx64"; InstallerType = "msi"; SilentArgs = "/S" }
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