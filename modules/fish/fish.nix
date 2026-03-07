{ self, ... }:

{
  home.file.".config/fish/config.fish".source = "${self}/dotfiles/fish/config.fish";
}
