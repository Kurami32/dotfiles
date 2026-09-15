local mainMod = "SUPER"
local fileManager = "thunar"
local browser = "DRI_PRIME=0 zen-browser"
--local scripts = "/home/kurami/.config/hypr/scripts"
local AndroidST = "prime-run android-studio"

-- Reload Hyprland configuration --
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Open Android Studio --
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(AndroidST))

-- Shortcuts --
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Color Selection and Hyprpicker --
--hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a / –autocopy")) -- not needed, DMS has color picker
--hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(scripts .. "/RofiEmoji.sh")) -- same thing
