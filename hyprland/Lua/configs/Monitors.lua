-- Monitors config
-- See https://wiki.hyprland.org/Configuring/Monitors/

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = "1.2",
--  vrr = 1,
})

-- Created this inorder for the monitor display to not wake up if not intended.
-- See here: https://github.com/hyprwm/Hyprland/issues/4090
