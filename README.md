# GB28181 摄像头接入 · GitHub Pages 原型

Avant Hub 摄像头接入相关 HTML 原型，用于对外分享与评审预览。

## 在线访问

启用 GitHub Pages 后，入口为：

`https://<你的GitHub用户名>.github.io/<仓库名>/`

默认打开 [index.html](./index.html) 导航页。

## 本地预览

```powershell
cd github-pages
python -m http.server 8080
```

浏览器打开 [http://127.0.0.1:8080/](http://127.0.0.1:8080/)

## 发布到 GitHub（首次）

1. 在 [GitHub 新建 Public 仓库](https://github.com/new)（建议名：`gb28181-camera-prototypes`）
2. 在本目录执行：

```powershell
git init
git add .
git commit -m "Publish GB28181 camera HTML prototypes"
git branch -M main
git remote add origin https://github.com/<用户名>/gb28181-camera-prototypes.git
git push -u origin main
```

3. 仓库 **Settings → Pages → Build and deployment → Branch: `main` / `/ (root)`**
4. 等待 1～2 分钟，访问 `https://<用户名>.github.io/gb28181-camera-prototypes/`

## 更新发布

修改 `../prototypes/` 后，重新复制并推送：

```powershell
.\sync-from-prototypes.ps1
git add .
git commit -m "Update camera prototypes"
git push
```

## 页面清单

| 页面 | 文件 |
| --- | --- |
| 导航入口 | `index.html` |
| 全局首页 | `platform-home.html` |
| 平台设备池 | `platform-device-management.html` |
| 项目首页 | `project-home.html` |
| 摄像头列表/详情 | `camera-list.html` / `camera-detail.html` |
| 摄像头监控/回放 | `camera-monitor.html` / `camera-playback.html` |
| 摄像头告警 | `camera-alarm-list.html` |

> 原型依赖 Tailwind、Font Awesome 等 CDN，预览环境需能访问公网。
