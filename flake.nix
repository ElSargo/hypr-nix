{
  description = "NixOS hyprland config";

  outputs = inputs@{ self, nixpkgs, utils, home-manager, stylix, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      channelsConfig.allowUnfree = true;
      channels.nixpkgs.config.packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
      };
      hostDefaults = {
        modules = [
          ./desktop
          ./essentials
          ./home
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
        ];
      };

      hosts = {
        Basato = { modules = [ ./basato ]; };
        Wojak = { modules = [ ./wojak ]; };
      };


      outputsBuilder = channels: {
        formatter = channels.nixpkgs.nixpkgs-fmt;
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/release-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    stylix.url = "github:danth/stylix";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };
}
