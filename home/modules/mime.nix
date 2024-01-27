{ ... }: {
  # home.packages = with pkgs; [ libreoffice ];
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = "Helix.desktop";
        "application/zip" = "thunar.desktop";
        "application/rar" = "thunar.desktop";
        "application/7z" = "thunar.desktop";
        "application/*tar" = "thunar.desktop";
        "inode/directory" = "thunar.desktop";
        "application/pdf" = "draw.desktop";
        "image/*" = "firefox.desktop";
        "video/*" = "firefox.desktop";
        "audio/*" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/ftp" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
      };
    };
  };
}
