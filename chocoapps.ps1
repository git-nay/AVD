# Set the execution policy to bypass for the current session
Set-ExecutionPolicy Bypass -Scope Process -Force

# Ensure TLS 1.2 is used for secure connections
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Terraform
choco install terraform -y

# Install Visual Studio Code
choco install vscode -y

# Install Azure CLI
choco install azure-cli -y

# Install Chrome
choco install googlechrome -y
