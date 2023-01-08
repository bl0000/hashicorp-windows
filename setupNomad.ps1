$basePath = "C:\nomad"
$exePath = "C:\nomad\nomad.exe"
$scriptPath = $MyInvocation.MyCommand.Path


$pathExists = Test-Path $basePath -PathType Container
$exeExists = Test-Path $basePath -PathType Leaf

if ($True -eq $pathExists) {
    Write-Host "$basePath found - continuing with setup..."
} else {
    Write-Host "$basePath not found - exiting"
    Exit
}

if ($False -eq $exeExists) {
    Write-Host "$exePath not found - exiting"
    Exit
}

$option1 = Read-Host "Server or Client?"

if (($option1 -eq "server") -or ($option1 -eq "client")) {
    Write-Host "Setting up NoMad as $option1"
    } else {
    Write-Host "Invalid option - stopping script"
    Exit 
}

New-Item -Path "C:\nomad\config" -ItemType directory
if ($option1 -eq "server") {
    Copy-Item "$scriptPath\configs\server.hcl" -Destination "$basePath\config\server.hcl"
    New-Service -Name "Nomad" -BinaryPathName "$exePath agent -config=$basePath\config\server.hcl" -StartupType Automatic
} elseif ($option1 -eq "client") {
    Copy-Item "$scriptPath\configs\client.hcl" -Destination "$basePath\config\client.hcl"
    New-Service -Name "Nomad" -BinaryPathName "$exePath agent -config=$basePath\config\client.hcl" -StartupType Automatic
}

Start-Service -Name "Nomad" -PassThru

# create logging via config (.hcl) files and create logs folder as part of installation
