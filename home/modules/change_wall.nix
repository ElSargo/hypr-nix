{ pkgs }:
pkgs.writeScriptBin "change-wallpaper" ''
  WP_FILE=$HOME/.config/wallpaper.jpg
  wget -q -O "$WP_FILE" https://source.unsplash.com/1920x1080/?wallpapers
  pkill swaybg
  ${pkgs.swaybg}/bin/swaybg -i ~/.config/wallpaper.jpg &
  disown
''

