-- Environment Variables --
-- See https://wiki.hyprland.org/Configuring/Environment-variables/

-- === Defaults === --
hl.env("TERMINAL", "kitty")
hl.env("EDITOR", "micro")
hl.env("VISUAL", "micro")

-- ==== Cursor settings ==== -- 
--hl.env("HYPRCURSOR_THEME", "Furina")
--hl.env("XCURSOR_THEME", "Furina")
--hl.env("XCURSOR_SIZE", "30")
--hl.env("HYPRCURSOR_SIZE", "30")

-- ==== GDK Backends ==== --
hl.env("GDK_SCALE", "1.0")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- ==== XDG Desktop Portal ==== --
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- ==== QT configuration ==== --
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QUICK_CONTROLS_STYLE", "org.hyprland.style")

-- ==== Mozilla/Firefox ==== --
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("MOZ_DBUS_REMOTE", "1") -- For shared clipboard with Xwayland apps
hl.env("EGL_PLATFORM", "wayland")

-- === Fix electron apps flickering ==== --
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- ==== FOR VM and POSSIBLY NVIDIA ==== --
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

-- https://gist.github.com/kRHYME7/1d2574e8f3a4b7ad4059535503ce1eaa
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("WLR_RENDERER", "gles2")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
hl.env("GBM_BACKEND", "dri")
hl.env("WLR_DRM_NO_MODIFIERS", "1")
hl.env("__GL_VRR_ALLOWED", "0")

-- ==== NVIDIA ONLY ==== --
--hl.env("LIBVA_DRIVER_NAME", "nvidia")
--hl.env("GBM_BACKEND", "nvidia-drm")
--hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
--hl.env("__GL_GSYNC_ALLOWED", "1")
--hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
--hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
--hl.env("NVD_BACKEND", "direct")
