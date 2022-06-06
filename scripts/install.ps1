$nodeVer = "v18.3.0"
$nodeVerName = "node-$nodeVer-win-x64"
if (!(Test-Path "~/Documents/$nodeVerName")) {
    cd ~/Downloads
    $WebClient = New-Object System.Net.WebClient
    Invoke-WebRequest -Uri "https://nodejs.org/dist/$nodeVer/$nodeVerName.zip" -OutFile "./$nodeVerName.zip"
    Expand-Archive -Path "$nodeVerName.zip" -DestinationPath "~/Documents/"
    rm "$nodeVerName.zip"
}

$pathContent = [Environment]::GetEnvironmentVariable('path', 'User')
$paths = "C:/Program Files/Java/jdk1.8.0_291/bin","~/Documents/$nodeVerName"
foreach ($path in $paths) {
    $path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)

    if ($pathContent -split ';'  -notcontains  $path) {
        $pathContent += ";$path"
        [Environment]::SetEnvironmentVariable("PATH", $pathContent, [EnvironmentVariableTarget]::User)
    }
}