{ pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    # theme  = "Tokyo Night Storm";
    settings = {
      font_family = "JetbrainsMono Nerd Font";
      update_check_interval = 0;
      hide_window_decorations = "yes";
      resize_in_steps = "yes";
      confirm_os_window_close = 0;
      remember_window_size = "yes";
      background_opacity = lib.mkForce "0.85";
      allow_remote_control = "yes";
      map = "ctrl+shift+enter new_os_window_with_cwd";
      font_size = 13;
    };
  };
}
