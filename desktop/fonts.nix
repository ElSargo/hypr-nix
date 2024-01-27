{ pkgs, ... }: {
  fonts.packages =
    [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Ubuntu" ]; }) ];
  fonts.enableDefaultPackages = true;
}
