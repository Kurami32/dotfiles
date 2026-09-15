## Send files to your phone from thunar `send to` option

### 01. Just in case first check if the handler exists

```bash
which kdeconnect-handler
```

### 02. Create the `.desktop` file

```bash
mkdir -p ~/.local/share/applications
```

`~/.local/share/applications/kdeconnect-sendfile.desktop`

```bash
[Desktop Entry]
Type=Application
Version=0.1
Exec=kdeconnect-handler %F
Icon=kdeconnect
NoDisplay=true # this hides it from the app launcher
Name=Send via KDE Connect
Name[es]=Enviar via KDE Connect
```

### 03. Once the `.desktop`file is created, for the 'send to' menu in thunar:

```
mkdir -p ~/.local/share/Thunar/sendto/
ln -s ~/.local/share/applications/kdeconnect-sendfile.desktop ~/.local/share/Thunar/sendto/
```

