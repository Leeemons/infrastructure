param([String]$apiKey, [String]$server, [string]$enabled)

if (-Not $enabled.ToLower() -eq "true") {
    Write-Host "Publishing to $server is disabled."
    return
}

dotnet nuget push ".\.nupkgs\*.nupkg" --source $server --api-key $apiKey | Out-Host 
