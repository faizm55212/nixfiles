{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx TERM xterm-kitty
      cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
    '';
    shellAliases = {
      ll = "ls -alF";
      vim = "nvim";
      v = "nvim";
      sv = "sudo -E nvim";

      # Docker, k8s, TF and TG related aliases
      d = "docker";
      k = "kubectl";
      tf = "terraform";
      tg = "terragrunt";
      
      # NixOS and home-manager related aliases
      update = "sudo nixos-rebuild switch --flake /home/unknown/nixfiles#unknown";
      update-boot = "sudo nixos-rebuild boot --flake /home/unknown/nixfiles#unknown";
      nix-gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      nix-store-o = "sudo nix store optimise && nix store optimise";
      flake-update = "cd ~/nixfiles && sudo nix flake update";
    };
    functions = {
      fish_greeting = "";
      sudo = {
        body = ''
          if test "$argv" = !!
            echo sudo $history[1]
            eval command sudo $history[1]
          else
            command sudo $argv
          end
        '';
        description = "Replacement for Bash 'sudo !!' command to run last command using sudo."; 
      };
    };
  };
}