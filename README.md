<img width="2560" height="33" alt="2026-06-21-015230_hyprshot" src="https://github.com/user-attachments/assets/783af2e9-7baa-4a41-89a6-1576b2ae14fc" />

# ⚙️ Hyprland 配置清单

> 一份完整的 Arch Linux + Hyprland 常用软件包及配置说明

---

## 📦 软件包分类汇总

| 分类 | 软件包 | 说明 |
| :--- | :--- | :--- |
| **🗂️ 文件管理器** | `yazi` `nautilus` | 终端/图形化双方案 |
| **🏠 家目录管理** | `xdg-desktop-portal-hyprland` `xdg-user-dirs` | 门户支持 + 用户目录创建 |
| **🖼️ 图片查看** | `loupe` | GNOME 图片查看器 |
| **🎬 视频播放** | `mpv` | 轻量级视频播放器 |
| **📦 解压工具** | `file-roller` | GNOME 归档管理器 |
| **🪟 窗口管理器** | `hyprland` | 核心 WM |
| **🚀 启动器** | `wofi` | 应用启动菜单 |
| **📝 编辑器** | `micro` `gnome-text-editor` `helix` | 终端/GUI/现代化编辑器 |
| **📸 截图** | `grim` `slurp` `hyprshot` | 区域截图 + 便捷工具 |
| **📊 系统监控** | `btop` | 资源占用查看 |
| **🔌 代理客户端** | `hiddify` 或 `karing` | 二选一即可 |
| **⌨️ 输入法** | `fcitx5-im` `fcitx5-chinese-addons` | 中文输入支持 |
| **🌐 浏览器** | `firefox` | 默认浏览器 |
| **📌 任务栏** | `waybar` | 顶部状态栏 |
| **📋 剪贴板** | `wl-clipboard` `cliphist` `wl-clip-persist` | Wayland 剪贴板全套 |
| **🖥️ 终端** | `kitty` `alacritty` `less` | 两款终端 + 文档查看器 |
| **📶 蓝牙** | `bluez` `bluez-utils` `blueman` | 蓝牙驱动 + 图形化管理 |
| **🔊 声音** | `pipewire` `pipewire-pulse` `pavucontrol` `pamixer` `playerctl` | 音频服务 + 控制工具 |
| **🔤 字体** | `ttf-fira-code` `noto-fonts-emoji` | 代码字体 + Emoji 支持（Maple Mono 手动安装） |
| **🔔 通知** | `mako` | 轻量通知守护进程 |
| **🖼️ 壁纸** | `hyprpaper` | 官方支持（Waypaper 暂未收录，可用脚本替代） |
| **💾 挂载管理** | `udisks2` `ntfs-3g` `gvfs` `hyprpolkitagent` / `polkit-kde-agent` / `mate-polkit` | 自动挂载 + 认证代理 |
| **⏳ 进程守护** | `hypridle` `power-profiles-daemon` | 空闲管理 + 电源方案 |
| **🌍 网络管理** | `nm-connection-editor` `network-manager-applet` | NetworkManager 图形界面 |
| **☀️ 亮度控制** | `brightnessctl` | 屏幕亮度调节 |
| **🔒 锁屏** | `hyprlock` | Hyprland 原生锁屏 |
| **🎨 图形库** | `hyprgraphics` | Hyprland 图形依赖 |
| **🎭 图标主题** | `papirus-icon-theme` `oreo-teal-cursors` | 图标包（光标主题 `oreo-teal-cursors` 单独安装） |

---

## 📝 补充说明

### 1️⃣ 字体安装（Maple Mono）
```bash
# 手动下载字体文件到用户目录
cp MapleMono-*.ttf ~/.local/share/fonts/
fc-cache -fv   # 刷新字体缓存
