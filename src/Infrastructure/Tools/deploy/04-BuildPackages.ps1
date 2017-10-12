param([String]$nugetRestoreAltSource = "")


function BuildPackages() {
	foreach ($package in $packages) {
		cd .\$($package.Directory)
		
		if ($nugetRestoreAltSource -eq "") {
			& dotnet restore | Out-Host
		}
		else {
			& dotnet restore --source $nugetRestoreAltSource --source https://nuget.org/api/v2/ | Out-Host
		}
		
		& dotnet pack --configuration Release --output "..\.nupkgs" | Out-Host
		cd ..
	}
}

$packages = @(
	[pscustomobject]@{ Package = "Riganti.Utils.Infrastructure.Empty"; Directory = "Riganti.Utils.Infrastructure.Empty" }
)

BuildPackages;