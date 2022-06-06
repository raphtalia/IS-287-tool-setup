$nodeVer = "v18.1.0"
$nodeVerName = "node-$nodeVer-darwin-x64"
if (!(Test-Path "~/Documents/$nodeVerName")) {
    # mkdir "~/Documents/$nodeVerName"
    cd ~/Downloads
    $WebClient = New-Object System.Net.WebClient
    Invoke-WebRequest -Uri "https://nodejs.org/dist/$nodeVer/$nodeVerName.tar.gz" -OutFile "./$nodeVerName.tar.gz"
    tar -xf "$nodeVerName.tar.gz"
    Start-Sleep -Milliseconds 500
    mv "./$nodeVerName/" "~/Documents/"
    rm "$nodeVerName.tar.gz"
}

$pathContent = [Environment]::GetEnvironmentVariable('path', 'User')
$paths = "C:/Program Files/Java/jdk1.8.0_291/bin","~/Documents/$nodeVerName/bin","~/Documents/$nodeVerName/lib/node_modules/npm/bin"
foreach ($path in $paths) {
    $path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)

    if ($pathContent -split ';'  -notcontains  $path) {
        $pathContent += ";$path"
        [Environment]::SetEnvironmentVariable("PATH", $pathContent, [EnvironmentVariableTarget]::User)
    }
}