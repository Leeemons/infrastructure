param([String]$apiKey, [String]$server)

dotnet nuget push ".\.nupkgs\*.nupkg" --source $server --api-key $apiKey | Out-Host 
