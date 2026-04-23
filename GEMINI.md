# Gemini Mandates for Nix Multi-Host Configuration

This project manages a unified Nix flake configuration for NixOS and Nix-on-Droid (Android/Termux), maximizing code reuse via Home Manager.

## Project Structure

- `hosts/`: Host-specific entry points.
    - `nix-on-droid/`: Android-specific configuration.
        - `configuration.nix`: System-level settings.
        - `home.nix`: Host-specific Home Manager profile.
        - `proot-static`: Binary workaround for proot issues on prerelease.
    - `unknown/`: NixOS (PC) configuration.
        - `configuration.nix`: System-level settings.
        - `home.nix`: Host-specific Home Manager profile.
- `modules/`: Reusable logic.
    - `home/`: Home Manager modules (shared across all platforms).
        - `programs/`: Opt-in application modules (Fish, Neovim, Hyprland, etc.).
        - `services/`: User-level services (Gammastep, XDG, etc.).
    - `nixos/`: NixOS-only system modules.
- `flake.nix`: Central entry point for all configurations and inputs.

## Engineering Standards

- **Unified Flake:** All configurations must live in the root `flake.nix`.
- **Opt-in Modules:** All modules in `modules/home/` must use `lib.mkEnableOption`. They are disabled by default and must be explicitly enabled in the host's `home.nix` (e.g., `modules.programs.fish.enable = true;`).
- **Cross-Platform Compatibility:** 
    - Keep `modules/home/` generic enough to run on both x86_64-linux and aarch64-linux.
    - Use host-specific `home.nix` files to handle platform differences (e.g., GUI apps on PC vs. CLI tools on Android).
- **Proot Workaround:** On Nix-on-Droid, the `zz_unfuck_proot` activation script is mandatory to bypass binary compatibility issues in the prerelease channel by overwriting `.proot-static.new` with a known working version.

## Common Operations

- **Update All Inputs:** `nix flake update`
- **Switch NixOS:** `sudo nixos-rebuild switch --flake .#unknown`
- **Switch Nix-on-Droid:** `nix-on-droid switch --flake .#nix-on-droid`

## Current Status
- [x] Merge nix-on-droid into main flake.
- [x] Refactor Home Manager modules to use `mkEnableOption`.
- [x] Split `home.nix` into host-specific profiles.
- [x] Implement Nix-on-Droid proot workaround.
