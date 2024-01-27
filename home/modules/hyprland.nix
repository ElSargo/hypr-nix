{ pkgs, ... }:
with builtins;
let
  change-wallpaper = import ./change_wall.nix { inherit pkgs; };
in
{
  home.file.".config/hypr/shader.glsl".text = # glsl
    ''
      precision mediump float;
      varying vec2 v_texcoord;
      uniform sampler2D tex;

      void main() {

          vec4 pixColor = texture2D(tex, v_texcoord);
          pixColor.xyz = smoothstep(0.,1.,pixColor.xyz);

          gl_FragColor = pixColor;
      }
    '';

  home.file.".config/hypr/shader_eye_saver.glsl".text = # glsl
    ''
      precision mediump float;
      varying vec2 v_texcoord;
      uniform sampler2D tex;

      void main() {

          vec4 pixColor = texture2D(tex, v_texcoord);

          pixColor.rgb = smoothstep(0.,1.,pixColor.rgb) * vec3(1, 0.5, .2) * 0.3;    

          gl_FragColor = pixColor;
      }
    '';

  wayland.windowManager.hyprland = {

    enable = true;
    settings = {

      bindm =
        [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];

      bind = [
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86Calculator, exec, galculator"
        ", XF86Mail, exec, thunderbird"
        ", XF86MonBrightnessDown, exec, sudo light -U 1"
        ", XF86MonBrightnessUp, exec, sudo light -A 1"
        "SUPER, 0, workspace, 10"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, B, exec, firefox"
        "SUPER, F, fullscreen,0"
        "SUPER, G, exec, unixchadbookmarks ~/nix-files/bookmarks"
        "SUPER, N, workspace, empty"
        "SUPER, Q, killactive, "
        "SUPER, Return, exec, [size 40% 40%] kitty"
        "SUPER, Space, layoutmsg, swapwithmaster"
        "SUPER, T, togglespecialworkspace"
        "SUPER, TAB, changegroupactive"
        "SUPER, V, layoutmsg, focusmaster"
        "SUPER, Y, exec, kitty"
        "SUPER, Y, exec, kitty"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "SUPER, p, exec, firefox search.nixos.org/packages?channel=23.05&query="
        "SUPERALT, Return, exec, [size 30% 30% ;silent;float] kitty"
        "SUPERCTRL, A, resizeactive, -60 0"
        "SUPERCTRL, D, resizeactive, 60 0"
        "SUPERCTRL, P, pseudo, # dwindle"
        "SUPERCTRL, S, resizeactive, 0 60"
        "SUPERCTRL, W, resizeactive, 0 -60"
        "SUPERSHIFT, 0, movetoworkspace, 10"
        "SUPERSHIFT, 1, movetoworkspace, 1"
        "SUPERSHIFT, 2, movetoworkspace, 2"
        "SUPERSHIFT, 3, movetoworkspace, 3"
        "SUPERSHIFT, 4, movetoworkspace, 4"
        "SUPERSHIFT, 5, movetoworkspace, 5"
        "SUPERSHIFT, 6, movetoworkspace, 6"
        "SUPERSHIFT, 7, movetoworkspace, 7"
        "SUPERSHIFT, 8, movetoworkspace, 8"
        "SUPERSHIFT, 9, movetoworkspace, 9"
        "SUPER, W, movefocus , u"
        "SUPER, A, movefocus , l"
        "SUPER, S, movefocus , d"
        "SUPER, D, movefocus , r"
        "SUPER, H, movefocus , l"
        "SUPER, J, movefocus , d"
        "SUPER, K, movefocus , u"
        "SUPER, L, movefocus , r"
        "SUPERSHIFT, W, movewindow, u"
        "SUPERSHIFT, A, movewindow, l"
        "SUPERSHIFT, S, movewindow, d"
        "SUPERSHIFT, D, movewindow, r"
        "SUPERSHIFT, H, movewindow, l"
        "SUPERSHIFT, J, movewindow, d"
        "SUPERSHIFT, K, movewindow, u"
        "SUPERSHIFT, L, movewindow, r"
        "SUPERSHIFT, B, exec, blueberry"
        "SUPERSHIFT, D, movewindow, r"
        "SUPERSHIFT, F, fakefullscreen"
        "SUPERSHIFT, J, layoutmsg, swapnext"
        "SUPERSHIFT, K, layoutmsg, swapprev"
        "SUPERSHIFT, L, exec, /nix/store/xdgqdqp29wsvf4dmcdcq7gbw1kpc2zya-fish-3.7.0/bin/fish -c toggle_layout"
        "SUPERSHIFT, Q, exit"
        "SUPERSHIFT, Return, exec, rofi -show drun"
        "SUPERSHIFT, Space, togglefloating, "
        "SUPERSHIFT, T, movetoworkspace,special"
        "SUPERSHIFT, TAB, togglegroup"
        "SUPERSHIFT, W, movewindow, u"
        "SUPERSHIFT, Z, exec, kitty fish '-c zn'"
      ];

      unbind = [ "SUPER, M" ];
      xwayland.force_zero_scaling = true;
      input = {
        kb_layout = "us";
        repeat_rate = 69;
        repeat_delay = 150;
        follow_mouse = 1;
        touchpad = { natural_scroll = true; };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 4;
        cursor_inactive_timeout = 5;
      };
      decoration = {
        rounding = 20;
        dim_inactive = true;
        dim_strength = 0.1;
        blur = {
          size = 4;
          passes = 3;
        };

        drop_shadow = true;
        shadow_range = 20;
        shadow_render_power = 3;
        shadow_offset = "[-10, -10]";
      };
      animations = {
        enabled = true;
        animation = [
          "windows, 1, 3, default, slide"
          "windowsOut, 1, 3, default, slide"
          "border, 1, 10, default"
          "fade, 1, 3, default"
          "workspaces, 1, 3, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
        new_on_top = true;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        workspace_swipe_cancel_ratio = 0.25;
      };
      misc = {
        enable_swallow = true;
        swallow_regex = "^(kitty)|(Alacritty)|(foot)$";
        animate_manual_resizes = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
      };
      exec-once = "eww open-many bar bar2";
      monitor = "DP-1,1920x1080@75,auto,1";
      # monitor=eDP-1,preferred,auto,1
      windowrule = [
        "float, ^(blueberry.py)$"
        "float, ^(nm-connection-editor)$"
        "float, ^(galculator)$"
      ];

      blurls = [ "gtk-layer-shell" "gtk4-layer-shell" "waybar" "rofi" ];
      layerrule = [ "ignorezero, gtk-layer-shell" "ignorezero, gtk4-layer-shell" "ignorezero, waybar" "ignorezero, rofi" ];
    };
  };
  home.packages = with pkgs; [
    swaybg
    lazygit
    light
    galculator
    thunderbird
    wlogout
    wireplumber
    change-wallpaper
  ];
}

