## KDE Connect on Hyprland with DMS on Arch

To install it:

```bash
sudo pacman -S kdeconnect sshfs # sshfs is optional, is for browsing but doesn't work for me (idk why).
```

Add it to your hyprland config file to the auto-startup

```conf
exec-once = /usr/bin/kdeconnectd
# exec-once = /usr/bin/kdeconnect-indicator # this is also optional, is not needed with DMS, this just creates a (almost unusable) tray icon
```

Lua ver

```lua
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/bin/kdeconnectd")
end)
```

- Then go to DMS Settings -> Plugins -> Browse -> and install `Phone connect`.
- Then you can edit your quick actions panel and add the `Phone connect` widget there!

That's all, then just install the kde connect app on your phone and link it from the widget, it should appear automatically.

### Some issues

- If the phone isn't detected, maybe some firewall might be enabled. I use UFW so I do this to allow the ports that kde connects needs:

```bash
sudo ufw allow 1714:1764/tcp comment 'KDE Connect TCP'
sudo ufw allow 1714:1764/udp comment 'KDE Connect UDP'
sudo ufw reload
sudo ufw status verbose # this one just to verify if the ufw rule applied
```

- The clipboard doesn't sync from phone -> desktop (works the other way around).

That's fault of an android limitation, you need to click `send clipboard` from the kde app. To workaround that I run this ADB commands:

```bash
adb -d shell pm grant org.kde.kdeconnect_tp android.permission.READ_LOGS
adb -d shell appops set org.kde.kdeconnect_tp SYSTEM_ALERT_WINDOW allow
adb -d shell am force-stop org.kde.kdeconnect_tp # this stops the app, open it again
```

After that the clipboard sync works both ways, but it gets lost after a phone restart.

- This might be useful too, is to see what's KDE conenct is exposing:

```bash
kdeconnect-cli -l # to get the device id and run the command below
busctl --user introspect org.kde.kdeconnect /modules/kdeconnect/devices/<device-id>/connectivity_report
```
### With tailscale

> This was on mobile data with a shared hotspot to my laptop, the only thing should matter is that both devices are connected to the same tailscale network
> and have `Allow LAN Access` activated in the tailscale dashboard.

- Get the tailscale IP, should be like `100.x.x.x`

```bash
tailscale ip -4
```

- Open KDE Connect on mobile, then go to settings and add a device by IP adress and use the IP you got above

Then it should work just like when using WiFi on local network