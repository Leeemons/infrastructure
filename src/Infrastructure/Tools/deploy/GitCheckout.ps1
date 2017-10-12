param([String]$branchName, [String]$repoUrl)

. ".\Invoke-Git.ps1"

invoke-git checkout $branchName
invoke-git -c http.sslVerify=false pull $repoUrl $branchName
