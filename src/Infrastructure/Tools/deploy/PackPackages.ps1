param([String]$nugetRestoreAltSource = "")


$packages = @(
	[pscustomobject]@{ Package = "Riganti.Utils.Infrastructure.Empty"; Directory = "Riganti.Utils.Infrastructure.Empty" }
)

foreach ($package in $packages) {
	cd .\$($package.Directory)
		
	& dotnet pack --configuration Release --output "..\.nupkgs" | Out-Host
	cd ..
}
