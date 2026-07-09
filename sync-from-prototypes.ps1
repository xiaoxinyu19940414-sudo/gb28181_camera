# 从 prototypes 同步 HTML 到 github-pages 发布包
$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$proto = Join-Path (Split-Path -Parent $here) "prototypes"

Copy-Item -Path (Join-Path $proto "*.html") -Destination $here -Force

# 首页 = 全局驾驶舱
Copy-Item -Path (Join-Path $here "platform-home.html") -Destination (Join-Path $here "index.html") -Force

# 外链修正：无人机告警 Tab 使用本包内对照页
$alarmList = Join-Path $here "camera-alarm-list.html"
$projectHome = Join-Path $here "project-home.html"
(Get-Content $alarmList -Raw -Encoding UTF8) -replace "location\.href='[^']*alert-list\.html'", "location.href='drone-alarm-list.html'" | Set-Content $alarmList -Encoding UTF8 -NoNewline
(Get-Content $projectHome -Raw -Encoding UTF8) -replace 'href="[^"]*alert-list\.html"', 'href="drone-alarm-list.html"' | Set-Content $projectHome -Encoding UTF8 -NoNewline

Write-Host "Synced from prototypes to github-pages."
