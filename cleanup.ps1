$user = (whoami).split('\')[1]

$DownloadPath = "C:\Users\$user\Downloads"

$cutoffDate = (Get-Date).AddDays(-7)

$oldFiles = Get-ChildItem $DownloadPath | Where-Object { $_.LastWriteTime -lt $cutoffDate}

foreach ($item in $oldFiles) {
    Remove-Item -path $item.FullName -recurse -force
}

Write-Host "Done!"