#! /usr/bin/env bash
#!/run/current-system/sw/bin/bash
#!/bin/bash

# 定义你的壁纸文件夹路径
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# 获取所有连接的显示器列表
# 这里假设你的显示器名称类似 "DP-1", "HDMI-A-1"
# 你可以通过命令 `hyprctl monitors` 查看准确的名称
MONITORS=($(hyprctl monitors | grep -oP '^Monitor \K[^ ]+' | tr '\n' ' '))

# 清空或创建配置文件
echo "# Hyprpaper 配置文件 - 由随机脚本生成" > "$CONFIG_FILE"

# 为每个显示器预加载并设置一张随机壁纸
for monitor in "${MONITORS[@]}"; do
# 为当前显示器随机选择一张壁纸
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
  
 if [ -n "$WALLPAPER" ]; then
    # 将壁纸添加到 preload 行（hyprpaper 会自动去重）
    echo "preload = $WALLPAPER" >> "$CONFIG_FILE"
    
    # 为该显示器设置壁纸
    echo "wallpaper = $monitor,$WALLPAPER" >> "$CONFIG_FILE"
    echo "为显示器 $monitor 设置了壁纸: $(basename "$WALLPAPER")"
  else
    echo "错误：无法为显示器 $monitor 找到壁纸。"
  fi
done

# 重新加载 hyprpaper
hyprctl reload hyprpaper, "$WALLPAPER"
echo "所有显示器壁纸已随机更换并重新加载！"

pkill hyprpaper
hyprpaper &
