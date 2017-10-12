param([String]$branchName, [String]$repoUrl)

git checkout $branchName
git -c http.sslVerify=false pull $repoUrl $branchName
