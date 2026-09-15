-- === Game tags === --

hl.window_rule({
    match = {
        class = "^(gamescope)$",
    },
    tag = "+games",
})

hl.window_rule({
    match = {
        class = "^(steam_app_\\d+)$",
    },
    tag = "+games",
})

-- === Gamestore tags === --
hl.window_rule({
    match = {
        class = "^([Ss]team)$",
    },
    tag = "+gamestore",
})

hl.window_rule({
    match = {
        title = "^([Ll]utris)$",
    },
    tag = "+gamestore",
})

hl.window_rule({
    match = {
        class = "^(com.heroicgameslauncher.hgl)$",
    },
    tag = "+gamestore",
})

-- === Workspaces Rules === #
hl.window_rule({
    match = {
        title = "(Honkai: Star Rail)",
    },
    fullscreen = true,
})

hl.window_rule({
    match = {
        title = "(Zenless Zone Zero)",
    },
    fullscreen = true,
})

hl.window_rule({
    match = {
        title = "(Genshin Impact)",
    },
    fullscreen = true,
})

hl.window_rule({
    match = {
        class = "(moe.launcher.the-honkers-railway-launcher)",
        title = "^(The Honkers Railway Launcher)$",
    },
    float = true,
})
