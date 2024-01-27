{
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    stevenblack = {
      block = [ "fakenews" "gambling" "porn" ];
      enable = true;
    };
  };
}
