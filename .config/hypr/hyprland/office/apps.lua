local discord = "flatpak run com.discordapp.Discord"

local youtubemusic =
	"/usr/bin/chromium-browser --profile-directory=Default --app-id=--app-id=cinhimbnkkaeohfgghhklpknlkffjgod"
local teams = "/usr/bin/chromium-browser --profile-directory=Default --app-id=cifhbcnohmdccbgoicgdjpfamggdegmo"

-- Autostart programs and environment setup
hl.exec_cmd(discord, { workspace = "1" })
hl.exec_cmd(youtubemusic, { workspace = "1" })
hl.exec_cmd(teams, { workspace = "1" })
-- System environment and D-Bus integration

hl.exec_cmd("systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_cmd(
	"hash dbus-update-activation-environment 2>/dev/null && dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
)

hl.exec_cmd("systemctl --user start hyprland-session.target")
