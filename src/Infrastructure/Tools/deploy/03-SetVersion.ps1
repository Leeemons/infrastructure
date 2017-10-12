param([String]$version)


function CleanOldGeneratedPackages() {
    If (Test-Path "./.nupkgs"){
	    Remove-Item "./.nupkgs"
    }
}

function SetVersion() {
  	foreach ($package in $packages) {
        $filePath = ".\$($package.Directory)\$($package.Directory).csproj"
        $file = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
		$file = [System.Text.RegularExpressions.Regex]::Replace($file, "\<VersionPrefix\>([^<]+)\</VersionPrefix\>", "<VersionPrefix>" + $version + "</VersionPrefix>")
		$file = [System.Text.RegularExpressions.Regex]::Replace($file, "\<PackageVersion\>([^<]+)\</PackageVersion\>", "<PackageVersion>" + $version + "</PackageVersion>")
		[System.IO.File]::WriteAllText($filePath, $file, [System.Text.Encoding]::UTF8)
	}  
}

$packages = @(
	[pscustomobject]@{ Package = "Riganti.Utils.Infrastructure.Empty"; Directory = "Riganti.Utils.Infrastructure.Empty" },
)

SetVersion;
