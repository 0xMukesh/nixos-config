{ pkgs, self, ... }:

{
  home.packages = [
    pkgs.i3lock
  ];

  home.file.".config/i3/config".source = "${self}/dotfiles/i3/config";
}
