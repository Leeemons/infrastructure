param([String]$version, [String]$branchName, [String]$repoUrl)

git tag "v$($version)" HEAD
git commit -am "NuGet package version $version"
git rebase HEAD $branchName
git push --follow-tags $repoUrl $branchName
