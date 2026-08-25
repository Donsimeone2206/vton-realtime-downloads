# VTON Realtime — downloads

Installers for **VTON Realtime**, a real-time virtual try-on desktop app.
This repository holds released binaries only; the source is private.

## Download

| Platform | Link |
|---|---|
| Windows 10/11 | [VTON-Realtime-Setup-windows.exe](https://github.com/Donsimeone2206/vton-realtime-downloads/releases/latest/download/VTON-Realtime-Setup-windows.exe) |
| macOS | [VTON-Realtime-macos.dmg](https://github.com/Donsimeone2206/vton-realtime-downloads/releases/latest/download/VTON-Realtime-macos.dmg) |

Both links always point at the newest release.

## First launch

These builds are not code-signed yet, so each system blocks them once.

### Windows

SmartScreen says the publisher is unknown. Choose **More info → Run anyway**.

### macOS

macOS 15 (Sequoia) and later show:

> "VTON Realtime.app" was not opened because it contains malware.

**This is not a malware detection.** macOS shows that wording for any app it
cannot verify, because the app is not signed and notarized with an Apple
Developer ID. Nothing scanned the app and found anything in it.

Apple removed the old right-click → Open shortcut in macOS 15, so use one of:

**System Settings** — try to open the app, then go to **System Settings →
Privacy & Security**, scroll to the bottom, and click **Open Anyway**.

**Terminal** — one command, then open the app normally:

```bash
xattr -dr com.apple.quarantine "/Applications/VTON Realtime.app"
```

## Virtual camera (optional)

To send the try-on output into Zoom, Meet or Discord, install
[OBS Studio](https://obsproject.com) and start/stop its Virtual Camera once so
the driver registers with your OS. The app then writes frames into it.
