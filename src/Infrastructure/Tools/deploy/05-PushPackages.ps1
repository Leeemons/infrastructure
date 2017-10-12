param([String]$apiKey, [String]$server)

function PushPackages() {
    dotnet nuget push ".\.nupkgs\*.nupkg" --source $server --api-key $apiKey | Out-Host 
}

PushPackages;
