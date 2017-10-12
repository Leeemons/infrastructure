param([String]$branchName, [String]$repoUrl)

function GitCheckout() {
	git checkout $branchName
	git -c http.sslVerify=false pull $repoUrl $branchName
}

GitCheckout;
