# Usage examples:
#   build.ps1 32 Release dinput8
#   build.ps1 64 Release version

Set-Location (Get-Item $PSScriptRoot)

. ./KoalaBox/build.ps1 @args

$proxy = $args[2]
if ($proxy -eq '') {
    throw "Proxy DLL cannot be empty."
} else {
    $Env:PROXY_DLL = $proxy
}

$Env:BUILD_DIR = "build\$arch\$proxy"

Build-Project
