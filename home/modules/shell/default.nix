{ pkgs, ... }: {
  imports = [ ./task.nix ./completion.nix ];
  home.packages = with pkgs; [
    ripgrep
    wl-clipboard
    unzip
    eza
    wget
    trash-cli
    delta
    htop
    nixfmt
    typos
    pastel
    cargo
  ];
  programs.nushell = {
    enable = true;
    configFile.text = # nu
      ''
        $env.config = {
          table: {
            mode: rounded
          }
          show_banner: false,
          ls: {
            use_ls_colors: true
            clickable_links: true
          }
          # cd: {
          #   abbreviations: true  
          #  }
          rm: {
            always_trash: true
          }
          hooks: {
              command_not_found: {
                  |cmd| ( 
                     let foundCommands = (nix-locate --minimal --no-group --type x --type s --top-level --whole-name --at-root ("/bin/" + $cmd) | lines | str replace ".out" "");
                     if ($foundCommands | length) == 0  {
                       print "Command not found"
                    } else if $cmd != "wl-copy" {
                        print "Command is avalible in the following packages"
                        print $foundCommands 
                        print ("nix-shell -p " + $foundCommands.0 + " coppied to clipboard") 
                        echo ("nix-shell -p " + ($foundCommands | get 0) )| wl-copy;
                    }
                  )
              }
          }
        }
        $env.PATH = ($env.PATH | split row (char esep) | append "~/.cargo/bin")
      '';
  };
}

