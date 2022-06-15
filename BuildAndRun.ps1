git pull origin master
npm i
npm run build
$dir = Get-Location
Start-Process powershell -ArgumentList "-File StartBrowser.ps1"
node .\build