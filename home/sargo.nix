{ pkgs, ... }: {
  users.users.sargo = {
    shell = pkgs.nushell;
    isNormalUser = true;
    initialHashedPassword =
      "$6$Z7Ty/RzwsUJtd43I$6dCbqpYN1HOhTr5EoEgu6XyctK8lCYu6OqJGzREOjR5L0i6mn12vl2wF.nJzrAxqTCIl5idftqSOPI8WLNVky0";
    description = "Oliver Sargison";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  security.sudo.extraRules = [{
    users = [ "sargo" ];
    commands = [
      {
        command = "/etc/profiles/per-user/sargo/bin/light";
        options = [ "NOPASSWD" ];
      }
      {
        command = "/run/current-system/sw/bin/nixos-rebuild";
        options = [ "NOPASSWD" ];
      }
    ];
  }];
  home-manager.users.sargo = { lib, ... }: {
    programs = {
      git = {
        enable = true;
        userName = "Oliver Sargison";
        userEmail = "sargo@sargo.cc";
        delta.enable = true;
      };
    };

    home.username = "sargo";
    home.homeDirectory = "/home/sargo";
  };
}

