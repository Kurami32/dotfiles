-- Window Rules
-- See https://wiki.hyprland.org/Configuring/Window-Rules
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules

-- === Ignore maximize requests from apps === --

hl.window_rule({
    name = "windowrule-3",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- === Kitty Floating === --
hl.window_rule({
    name = "windowrule-1",
    match = {
        class = "^(kitty)$",
        title = "kitty",
    },
    float = true,
})

-- === Fix some dragging issues with XWayland === --
hl.window_rule({
    name = "windowrule-2",
    match = {
        class = "^$",
        title = "^$",
        xwayland = 1,
        float = 1,
        fullscreen = 0,
        pin = 0,
    },
    no_focus = true,
})

-- === Avoid idle for fullscreen apps === --
hl.window_rule({
    name = "windowrule-7",
    match = {
        class = "^.*$",
    },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    name = "windowrule-8",
    match = {
        title = "^.*$",
    },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    name = "windowrule-9",
    match = {
        fullscreen = 1,
    },
    idle_inhibit = "fullscreen",
})

-- === Thunar === --
hl.window_rule({
    name = "windowrule-6",
    match = {
        class = "([Tt]hunar)",
        title = "negative:(.*[Tt]hunar.*)",
    },
    center = true,
    float = true,
})

hl.window_rule({
    name = "windowrule-10",
    match = {
        class = "(xdg-desktop-portal-gtk)",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-11",
    match = {
        class = "^([Rr]ofi)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-13",
    match = {
        class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-14",
    match = {
        class = "^(nwg-look|qt5ct|qt6ct)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-16",
    match = {
        class = "^(nm-applet|nm-connection-editor|blueman-manager)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-17",
    match = {
        class = "^([Bb]aobab|org.gnome.[Bb]aobab)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-18",
    match = {
        class = "^(org.kde.polkit-kde-authentication-agent-1)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-20",
    match = {
        class = "(codium|codium-url-handler|VSCodium)",
        title = "negative:(.*codium.*|.*VSCodium.*)",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-21",
    match = {
        class = "^([Ss]team)$",
        title = "negative:^([Ss]team)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-22",
    match = {
        class = "(electron)",
        title = "(Add Folder to Workspace)",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-23",
    match = {
        class = "^(gamescope)$",
    },
    fullscreen = true,
})

-- Default floats
hl.window_rule({
    name = "windowrule-24",
    match = {
        title = "^(pavucontrol)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-25",
    match = {
        title = "^(blueman-manager)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-26",
    match = {
        title = "^(nm-connection-editor)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-27",
    match = {
        title = "^(qalculate-gtk)$",
    },
    float = true,
})

hl.window_rule({
    name = "windowrule-28",
    match = {
        class = "(.*org.pulseaudio.pavucontrol.*)",
    },
    float = true,
    size = "700 600",
    center = true,
})

hl.window_rule({
    name = "windowrule-32",
    match = {
        class = "([window])",
    },
    idle_inhibit = "fullscreen",
})

-- === nwg-look === --
hl.window_rule({
    name = "windowrule-33",
    match = {
        class = "(nwg-look)",
    },
    float = true,
    size = "700 600",
    move = "((monitor_w*0.1)) ((monitor_h*0.2))",
    pin = true,
})

-- === Mission Center === --
hl.window_rule({
    name = "windowrule-34",
    match = {
        class = "(io.missioncenter.MissionCenter)",
    },
    float = true,
    pin = true,
    center = true,
    size = "900 600",
})

-- === Mission Center Preference Window === --
hl.window_rule({
    name = "windowrule-35",
    match = {
        class = "(missioncenter)",
        title = "^(Preferences)$",
    },
    float = true,
    pin = true,
    center = true,
})

-- === Float and center file pickers === --
hl.window_rule({
    name = "windowrule-36",
    match = {
        class = "xdg-desktop-portal-gtk",
        title = "^(Open.*Files?|Save.*Files?|All Files|Save)",
    },
    float = true,
    center = true,
})

-- === Browser PIP === --
hl.window_rule({
    name = "windowrule-37",
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
    pin = true,
    move = "((monitor_w*0.695)) ((monitor_h*0.04))",
})

-- ===================== --
-- === DMS Defaults ==== --
-- ===================== --
hl.window_rule({ match = { class = "^(org\\.wezfurlong\\.wezterm)$" }, tile = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.)" }, rounding = 12 })
hl.window_rule({ match = { class = "^(gnome-control-center)$" }, tile = true })
hl.window_rule({ match = { class = "^(pavucontrol)$" }, tile = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, tile = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.Calculator)$" }, float = true })
hl.window_rule({ match = { class = "^(gnome-calculator)$" }, float = true })
hl.window_rule({ match = { class = "^(galculator)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.Nautilus)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal)$" }, float = true })
hl.window_rule({ match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" }, float = true })

hl.window_rule({ match = { class = "^(zoom)$" }, float = true })
hl.layer_rule({ match = { namespace = "^(quickshell)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^dms:.*" }, no_anim = true })
hl.window_rule({ match = { class = "^com.danklinux.dms$" }, float = false })
