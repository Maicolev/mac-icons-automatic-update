# Update Icons Script

## Sample image

<img width="2556" alt="Screenshot 2025-03-30 at 11 44 01" src="https://github.com/user-attachments/assets/e15041f2-221a-4362-bcbf-a73ad7842a77" />

Icons edited:
  - WhatsApp
  - Teams
  - Slack
  - Messages
  - Mail
  - Photos
  - FaceTime
  - Pages
  - IINA
  - Spotify
  - OBS
  - DataGrip
  - Visual Studio Code
  - IntelliJ IDEA
  - WebStorm
  - Internal and external disks
<img width="2560" alt="Screenshot 2025-03-30 at 11 55 07" src="https://github.com/user-attachments/assets/d2a6f3e6-16de-40fa-8fc3-2123c402e77d" />


## Overview

This script automates the process of replacing the default icons of Spotify, Slack, and Warp applications on macOS with custom icons. It updates both the internal application resources and the Finder alias icons.

## Features

- **Spotify**: Replaces `Icon.icns` inside `/Contents/Resources/` and updates the Finder alias. (Example of an application stored on an external disk)
- **Slack**: Replaces `electron.icns` inside `/Contents/Resources/` and updates the Finder alias. (Example of an application stored on the main disk)
- **Warp**: Replaces `Warp.icns` inside `/Contents/Resources/` and updates `Blue.png` inside `/Contents/PlugIns/WarpDockTilePlugin.docktileplugin/Contents/`. (Example of an application stored on the main disk but with icons loaded from two different locations)

## Requirements

- macOS system
- Custom icons in `.icns` and `.png` formats (Download from: [macosicons.com](https://macosicons.com/#/))
- AppleScript execution permissions
- Applications installed in `/Applications` or external disks

## Installation

1. **Download the script** and place it in a directory.
2. **Ensure you have custom icons** in the correct directory (e.g., `~/Documents/icons/`).
3. **Run the script** using Automator or from the Terminal.
4. **Place the script in the Applications folder** for better accessibility.

## Usage

### Running with Automator

1. Open **Automator** and create a new application.
2. Drag **Run AppleScript** into the workflow.
3. Copy and paste the script contents.
4. Save the application and execute it.

### Running from Terminal

```sh
osascript /path/to/your/script.scpt
```

### Running at Startup

To run the script automatically at system startup:
1. Place the `script.app` inside the `/Applications` folder.
2. Go to **System Settings** > **Users & Groups** > **Login Items**.
3. Add the script application to the list.

## Notes

- The script requires **full disk access** to modify application resources.
- Both the script and Automator need explicit permissions to make system changes.
- If the Dock icon does not update, try removing and re-adding the application to the Dock.
- The Finder cache might need a refresh; restarting macOS can help.
- For **system applications**, the process is different, and an update with these steps will be provided soon.

## Repository

Find the project on GitHub: [Mac-icons-update](https://github.com/Maicolev/Mac-icons-update.git)

## License

This project is licensed under the MIT License.

---

Made with ❤️ by **Maicol Orejuela** (GitHub: [Maicolev](https://github.com/Maicolev)) for macOS customization enthusiasts.
