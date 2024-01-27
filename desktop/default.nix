{ pkgs, ... }: {
  imports = [
    ./audio.nix
    ./fonts.nix
    ./network.nix
    ./power-management.nix
    ./remaps.nix
    ./settings.nix
    ./hyprland.nix
  ];

  services.preload.enable = true;
  users.defaultUserShell = pkgs.nushell;
  system.stateVersion = "23.11";
}
