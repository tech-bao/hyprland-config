-- 导入示例
-- require("myColors")


--------------------
---- 显示器 ----
--------------------

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------------
---- 自定义软件 ----
---------------------------

local terminal    = "alacritty"
local fileManager = "nautilus"
local menu        = "wofi"


--------------------
---- 自启动 ----
--------------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
   -- hl.exec_cmd(kitty -e less ~/.config/hypr/keybinds.md)
   hl.exec_cmd("wl-paste --type text --watch cliphist store")
   hl.exec_cmd("wl-paste --type image --watch cliphist store")
   hl.exec_cmd("/usr/libexec/polkit-mate-authentication-agent-1")
   hl.exec_cmd("nm-applet --indicator & waybar & hypridle & wpaperd -d & fcitx5 --replace -d & blueman-applet")
 end)


------------------------
---- 环境变量 ----
------------------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "oreo_teal_cursors")
hl.env("HYPRCURSOR_THEME", "oreo_teal_cursors")	-- 主题文件夹复制到.locale/share/icons

hl.env("LANG", "zh_CN.UTF-8")
hl.env("LC_ALL", "zh_CN.UTF-8")
-------------------
----- 权限 -----
-------------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- 权限更改需要Hyprland重新启动

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------
---- 视觉 ----
-----------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,	-- 拖动窗口边框来调整大小

        -- 查阅后，再开启 https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = false,		-- 是否允许画面撕裂（性能相关）

        layout = "dwindle",			-- 布局引擎，dwindle master scrolling
    },

    decoration = {
        rounding       = 10,		-- 窗口圆角半径
        rounding_power = 2,			-- 圆角平滑度

        active_opacity   = 1.0,		-- 当前窗口整体透明度
        inactive_opacity = 0.95,	-- 其他窗口整体透明度

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,			-- 启用模糊
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },
})

-- 默认曲线和动画 https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- 默认弹簧物理参数
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- 工作区规则 https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true,		-- 保留分裂
    },
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,		-- 第一列窗口全屏
        follow_focus = true,					-- 切换窗口时，自动滚动以显示新窗口
        column_width = 0.5,						-- 默认列宽
        focus_fit_method = 1,					-- 聚焦列的滚动方式：0 = 居中, 1 = 适配屏幕
        follow_min_visible = 0.2,				-- 窗口至少有 20% 可见时，切换焦点才触发自动跟随
        direction = "right",					-- 滚动的方向
        wrap_focus = true,						-- 焦点到达首尾时是否循环
        wrap_swapcol = true,					-- 交换列时是否循环
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,	-- 强制随机使用3种默认壁纸中的任何一种。将此设置为0或1将禁用动画背景
        disable_hyprland_logo   = false,	-- true时，禁用随机标志
    },
})


-----------------
---- 输入 ----
-----------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,			-- -1.0 - 1.0, 灵敏度

        touchpad = {
            natural_scroll = false,		-- 滚动方向
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


--------------------
---- 快捷键 ----
--------------------

local mainMod = "SUPER" -- 设置主键
local altMod  = "ALT"

-- https://wiki.hypr.land/Configuring/Basics/Binds/

hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill wofi || wofi --show drun"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- 只作用 dwindle

-- hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/wallpaper.sh"))
hl.bind(mainMod .. " + Page_Up", hl.dsp.exec_cmd("wpaperctl previous"))
hl.bind(mainMod .. " + Page_Down", hl.dsp.exec_cmd("wpaperctl next"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("wpaperctl toggle-pause"))
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("kitty -e less ~/.config/hypr/keybinds.md"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind( " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))			-- 区域
hl.bind(" + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))		-- 窗口
hl.bind(" + CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))		-- 全屏
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("cliphist list | wofi -dmenu | cliphist decode | wl-copy"))		-- 查看剪切板
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd("systemctl poweroff"))

-- 选择窗口
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- 切换工作区[1-10]		移动窗口到指定工作区
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- 特殊工作区
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

-- 主键 + 鼠标滚动，切换工作区
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- 移动窗口
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right",  hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",  hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- 主键 + 鼠标左键拖动窗口
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })

-- 主键 + 鼠标右键调整窗口
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 调整窗口大小 (保持比例)
--hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({x=50, y=0}),   { repeating = true })

-- 音量与亮度
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- 播放控制，需要安装 playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


------------------------------
---- 窗口与工作区 ----
------------------------------

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- hyprctl clients | grep -A 10 xxx  查看窗口类名

local suppressMaximizeRule = hl.window_rule({
    -- 阻止窗口最大化
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- 修复xwayland窗口拖拽
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run 启动器定位
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- 自定义应用浮动弹框
hl.window_rule({
    name  = "float-windows",
    match = { class = "^(kitty|blueman-manager|nm-connection-editor|org.pulseaudio.pavucontrol|wechat|org.fcitx.)$" },
    float = true,
})


-- 指定工作区2使用 Scrolling 布局
hl.workspace_rule({
    workspace = "2",
    layout = "scrolling",
   
    layout_opts = {
        direction = "right"
    }
})
