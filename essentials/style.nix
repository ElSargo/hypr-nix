{ pkgs, ... }:
let

  theme =
    "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  # "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-storm.yaml";
  # "${pkgs.base16-schemes}/share/themes/catppuccin.yaml";
  wallpaper = pkgs.runCommand "image.png" { } ''
            COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
            COLOR="#"$COLOR
            ${pkgs.imagemagick}/bin/magick convert -size 1920x1080 xc:$COLOR $out
    # '';

in
{
  stylix.base16Scheme = theme;

  stylix.image = wallpaper;
  stylix.opacity = {
    applications = 0.85;
    terminal = 0.85;
    popups = 0.85;
    desktop = 0.85;
  };
  home-manager.sharedModules = [{
    stylix.targets.helix.enable = false;
    stylix.targets.firefox.profileNames = [ "sargo" ];
    stylix.opacity = {
      applications = 0.85;
      terminal = 0.85;
      popups = 0.85;
      desktop = 0.85;
    };
  }];
}

