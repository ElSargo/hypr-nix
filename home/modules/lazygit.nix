{
  lazygit = {
    enable = true;
    settings = {
      git = {
        autofetch = true;
        paging = {
          colorarg = "always";
          colorArg = "always";
          pager = # bash
            "delta --dark --paging=never --24-bit-color=never";
        };
      };
    };
  };
}
