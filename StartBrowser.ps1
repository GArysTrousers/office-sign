$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$url = "http://localhost:3000"

Start-Sleep 3

if (Test-Path $edge) {
  Start-Process $edge -ArgumentList  "--kiosk", $url, "--edge-kiosk-type=fullscreen"
}
else {
  Start-Process $url
}