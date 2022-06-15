git pull origin master
npm i
npm run build
$dir = Get-Location
Start-Process powershell -ArgumentList "-File $dir\RunServer.ps1"
Start-Sleep 3
Start http://localhost:3000
