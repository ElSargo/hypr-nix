{ pkgs, ... }:
let pk = name: "${pkgs.${name}}/bin/${name}";
in {
  home.packages = with pkgs; [ networkmanagerapplet playerctl ];
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        spacing = 4;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" "mpris" ];
        modules-right = [
          "custom/eye_saver"
          "network"
          "cpu"
          "memory"
          "battery"
          "custom/logout"
          "tray"
          "wireplumber"
        ];
        "custom/logout" = {
          format = "⏼";
          on-click = "${pk "wlogout"}";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          sort-by-number = true;
        };
        "clock" = {
          interval = 1;
          format = "{:%T}";
        };
        "cpu" = {
          format = " {usage}%";
          tooltip = false;
          on-click = "kitty -e htop";
        };
        "memory" = {
          format = " {}%";
          on-click = "kitty -e htop";
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 1;
          };
          format = "{capacity}% {icon} ";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        "network" = {
          format-wifi = "";
          format-ethernet = "";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          on-click = "nm-connection-editor";
        };
      };
    };
    style = # css
      ''
        * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 15px;
            transition: all 0.1s cubic-bezier(.55,-0.68,.48,1.68);
        }

        #workspaces {
          border-radius: 0.5rem;
        }

        #workspaces button {
          border-radius: 0.5rem;
        }
        #workspaces button.active {
          border-radius: 0.5rem;
        }
        #workspaces button.focus {
          border-radius: 0.5rem;
        }
        #workspaces button:hover {
          border-radius: 0.5rem;
        }

        #cpu,
        #memory,
        #label
        #tray,
        #network,
        #backlight,
        #clock,
        #battery,
        #pulseaudio,
        #idle_inhibitor,
        #custom-eye_saver,
        #custom-gttfg,
        #custom-lock,
        #custom-logout,
        #custom-power {
          margin: 3px 5px 5px 3px ;
          padding: 2px;
          border-radius: 0.5rem;
        }

        window > box {
        	margin: 5px 7px 0px 7px;
          background: @base;
          padding: 0px;
          border-radius: 0.5rem;
        }

        window#waybar {
          background: transparent
        }


        #custom-power {
            border-radius: 0.5rem;
            margin-bottom: 0.5rem;
        }
        #tray {
          border-radius: 0.5rem;
        }
        tooltip {
            background: @base;
            border: 1px solid @yellow;
        }
      '';
  };
}
