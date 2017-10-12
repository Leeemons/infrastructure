param([String]$branchName, [String]$repoUrl)

$scriptRoot = Split-Path $MyInvocation.MyCommand.Path
. "$scriptRoot\Invoke-Git.ps1"

invoke-git checkout $branchName
invoke-git -c http.sslVerify=false pull $repoUrl $branchName
