# PowerShell Profile

## Directory Overview

This directory contains PowerShell profile scripts for customizing the shell environment. The main file is `Microsoft.PowerShell_profile.ps1`.

## Key Files

*   `Microsoft.PowerShell_profile.ps1`: This script is executed when PowerShell starts. It currently:
    *   Defines a function `y` as a wrapper for the `yazi` file manager, which also changes the current directory to `yazi`'s last working directory.
    *   Initializes `zoxide`, a tool for smarter directory navigation.
    *   Initializes `starship`, a customizable prompt for any shell.

## Usage

The scripts in this directory are automatically sourced by PowerShell on startup. To add or modify shell behavior, edit the `Microsoft.PowerShell_profile.ps1` file.
