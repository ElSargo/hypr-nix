{ ... }: {
  imports = [ ./root.nix ./sargo.nix ];
  home-manager.sharedModules = [
    ./modules
    {
      home.stateVersion = "23.11";
      programs.nix-index.enable = true;
      programs.home-manager.enable = true;
    }
  ];
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = ".bak";
}
