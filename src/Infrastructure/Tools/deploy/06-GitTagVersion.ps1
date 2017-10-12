param([String]$version, [String]$branchName, [String]$repoUrl)

### Helper Functions

function Invoke-Git {
<#
.Synopsis
Wrapper function that deals with Powershell's peculiar error output when Git uses the error stream.

.Example
Invoke-Git ThrowError
$LASTEXITCODE

#>
    [CmdletBinding()]
    param(
        [parameter(ValueFromRemainingArguments=$true)]
        [string[]]$Arguments
    )

    & {
        [CmdletBinding()]
        param(
            [parameter(ValueFromRemainingArguments=$true)]
            [string[]]$InnerArgs
        )
        git.exe $InnerArgs 2>&1
    } -ErrorAction SilentlyContinue -ErrorVariable fail @Arguments

    if ($fail) {
        $fail.Exception
    }
}

function GitTagVersion() {
	invoke-git tag "v$($version)" HEAD
    invoke-git commit -am "NuGet package version $version"
	invoke-git rebase HEAD $branchName
    invoke-git push --follow-tags $repoUrl $branchName
}

GitTagVersion;
