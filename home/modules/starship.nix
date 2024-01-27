{ pkgs, config, ... }: {
  programs.starship = {
    enable = true;
    settings =
      let
        main_format = builtins.concatStringsSep
          "[](fg:bright-yellow bg:blue)[](fg:blue bg:bright-yellow)" [
          "[](fg:bright-yellow)[ ](bg:bright-yellow fg:bright-red)"
          "$directory"
          "[$git_branch$git_metrics$git_status](bg:bright-yellow)"
          "[$nix_shell $rust](bg:bright-yellow)"
          "$cmd_duration"
        ];
      in
      {
        format = ''
           ${main_format}[](fg:bright-yellow)
          $jobs$character'';

        directory = {
          format =
            "[ $path](bg:bright-yellow fg:red)[$read_only](bg:bright-yellow)";
          substitutions = {
            "Documents" = " ";
            "Downloads" = " ";
            "Music" = " ";
            "Pictures" = " ";
            "nix-files" = " ";
            "~/projects" = " ";
          };
        };
        shell = {
          disabled = false;
          bash_indicator = " ";
          fish_indicator = "󰈺 ";
          zsh_indicator = "󰫫 ";
          powershell_indicator = "󰨊 ";
          nu_indicator = "󰟆 ";
          unknown_indicator = "?";
          ion_indicator = " ";
          elvish_indicator = "λ";
          style = "bg:bright-yellow fg:magenta";
          format = "[ $indicator]($style)";
        };
        git_branch = {
          style = "bg:bright-yellow fg:cyan";
          format = "[ $symbol$branch($remote_branch)]($style)";
        };
        git_status = {
          style = "bg:bright-yellow fg:bright-orange";
          format = "[ \\[$all_status$ahead_behind\\]($style)]($style)";
        };
        git_metrics = {
          disabled = false;
          format =
            "[ +$added ](bg:bright-yellow fg:bright-green)[-$deleted](bg:bright-yellow fg:bright-red)";
        };
        rust.format =
          "[$symbol](bg:bright-yellow)[$version](fg:bright-orange bg:bright-yellow)";
        cmd_duration = {
          format = "[ took](bg:bright-yellow)[ $duration]($style)";
          style = "bg:bright-yellow fg:bright-purple";
        };
        nix_shell = { format = "[   $state shell](fg:cyan bg:bright-yellow)"; };
      };
  };
}
