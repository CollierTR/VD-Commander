# VD Commander

VD Commander is a command-line interface wrapper for the pyvda library, designed to facilitate Windows Virtual Desktop management through keybinding applications like AutoHotkey. 

This project was inspired by the workspace management behavior of the Hyprland tiling window manager.

## Overview

The primary goal of VD Commander is to allow users to trigger virtual desktop actions via scripts. By passing arguments to `main.py`, you can perform various actions such as switching desktops, moving windows, or pinning applications.

## Keybinding Examples

While you can use any keybinding software, the provided `vd-commander.ahk` script demonstrates a setup inspired by Hyprland:

- **Meta + [1-6]**: Switch to workspace 1-6.
- **Alt + [1-6]**: Move the active window to workspace 1-6.
- **Meta + Alt + [1-6]**: Move the active window to workspace 1-6 and switch to that workspace (follows the window).
- **Meta + P**: Pin or unpin the active window to all workspaces.

## Setup

1. Install the dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Configure your keybinding application to execute `python main.py` with the desired flags.

## Command Line Arguments

- `--switch <number>`: Switch to a specific desktop.
- `--move <number>`: Move the active window to a specific desktop.
- `--follow <number>`: Move the active window and switch focus to the target desktop.
- `--pin`: Toggle the pinned status of the active window across all desktops.
