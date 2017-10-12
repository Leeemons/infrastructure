param([String]$apiKey, [String]$server, [bool]$enabled)

if (-Not $enabled) {
    Write-Host "Publishing to $server is disabled."
    return
}

dotnet nuget push ".\.nupkgs\*.nupkg" --source $server --api-key $apiKey | Out-Host 
