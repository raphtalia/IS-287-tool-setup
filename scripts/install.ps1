$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://nodejs.org/dist/v18.1.0/node-v18.1.0-darwin-x64.tar.gz", "%USERPROFILE%/Documents/node-v18.1.0-darwin-x64.tar.gz")