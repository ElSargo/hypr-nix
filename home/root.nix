{ ... }: {
  # Disable root login
  users.users.root.hashedPassword = "!";
  home-manager.users.root = { lib, ... }: { home.homeDirectory = "/root"; };
}
