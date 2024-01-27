{ pkgs, config, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "window,run,drun,filebrowser,ssh";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
    };
  };
  home.file."${config.programs.rofi.configPath}".text = ''
    * {
        spacing:                     5px;
        padding:                     5px;
        border:                      0px solid;
        border-radius:               10px 10px 10px 10px;
        background-color:            transparent;
    }
  '';
}
