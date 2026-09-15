-- Things that run at startup

local terminal = "kitty"
local scripts = "/home/kurami/.config/hypr/scripts"

hl.on("hyprland.start", function()
    -- Disable NVIDIA GPU (make it idle) --
    hl.exec_cmd("bash -c \"echo auto > /sys/bus/pci/devices/0000:01:00.0/power/control\"")

    -- Session environment / systemd integration --
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user start hyprland-session.target")

    -- Clipboard X11 to Wayland sync --
    hl.exec_cmd("~/.config/hypr/scripts/clipboard-x11-to-wayland.sh")

    -- Polkit --
    --hl.exec_cmd(scripts .. "/Polkit.sh")
    --hl.exec_cmd(scripts .. "/PortalHyprland.sh")

    -- Cliphist + rofi
    -- hl.exec_cmd("wl-paste --type text  --watch cliphist store") -- text data
    -- hl.exec_cmd("wl-paste --type image --watch cliphist store") -- image data

	-- KDE Connect
	hl.exec_cmd("/usr/bin/kdeconnectd")
    --hl.exec_cmd("/usr/bin/kdeconnect-indicator") -- this is optional, not needed with DMS.
end)
