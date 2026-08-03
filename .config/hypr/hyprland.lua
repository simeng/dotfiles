local terminal = "alacritty"
local browser = "firefox"
local fileManager = "dolphin"
local menu = "qs -p /etc/xdg/quickshell/noctalia-shell/shell.qml ipc call launcher toggle"
-- local menu = 'rofi -show combi -modes combi -combi-modes "window,drun,run,ssh" -modes "combi,filebrowser"'
-- local lock = "hyprlock"
local lock = "qs -p /etc/xdg/quickshell/noctalia-shell/shell.qml ipc call lockScreen lock"
local screenshot_select = "slurp | grim -g - - | satty --filename -"
local screenshot_5s_select =
	"hyprctl notify 1 5000 'rgb(0,255,0)' \"Screenshot in 5 seconds\" ; sleep 5 ; slurp | grim -g - - | satty --filename -"
local discord = "flatpak run com.discordapp.Discord"
local gmusic = "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=cinhimbnkkaeohfgghhklpknlkffjgod"

hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "2560x1440@144", position = "2560x0", scale = 1 })

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent.socket")

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("dunst")
	hl.exec_cmd(terminal, { workspace = "1" })
	hl.exec_cmd(browser, { workspace = "1" })
	hl.exec_cmd(discord, { workspace = "2" })
	hl.exec_cmd(gmusic, { workspace = "2" })
end)

hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

hl.config({
	cursor = {
		no_hardware_cursors = 0,
	},

	ecosystem = {
		no_donation_nag = true,
	},

	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 4,

		col = {
			active_border = "rgba(ffffff40)",
			inactive_border = "rgba(00000090)",
		},

		resize_on_border = true,

		allow_tearing = false,

		layout = "dwindle",
	},
	decoration = {
		rounding = 4,

		active_opacity = 1,
		inactive_opacity = 1,
		fullscreen_opacity = 1,

		shadow = {
			enabled = true,
			range = 16,
			color = "rgba(1a1a1aa0)",
		},
		blur = {
			enabled = true,
			size = 8,
			passes = 2,

			vibrancy = 0.1,
		},
	},
	animations = {
		enabled = true,
	},

	-- Layout configs

	dwindle = {
		preserve_split = true,
		smart_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},

	input = {
		kb_layout = "us, no",
		kb_options = "compose:ralt, altwin:swap_lalt_lwin",

		follow_mouse = 1,
		accel_profile = "flat",

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

local mainMod = "SUPER"

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(screenshot_5s_select))
hl.bind("Print", hl.dsp.exec_cmd(screenshot_select))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout logitech-logitech-g710-keyboard next"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + CTRL + H", hl.dsp.workspace.move({ monitor = "left" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.workspace.move({ monitor = "right" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + ALT_L", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	tile = true,
	match = {
		class = "Google-chrome",
	},
})

hl.window_rule({
	float = true,
	size = "monitor_w*0.8 monitor_h*0.8",
	match = {
		class = "org.remmina.Remmina",
	},
})

hl.window_rule({
	float = true,
	size = "monitor_w*0.8 monitor_h*0.8",
	match = {
		class = "libreoffice-calc",
	},
})

hl.window_rule({
	float = true,
	match = {
		class = "libreoffice-startcenter",
	},
})
