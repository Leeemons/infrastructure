param([String]$apiKey, [String]$server, [string]$enabled)

if (-Not $enabled.ToLower() -eq "true") {
  Write-Host "Publishing to $server is disabled."
} else {
  dotnet nuget push ".\.nupkgs\*.nupkg" --source $server --api-key $apiKey | Out-Host
}
