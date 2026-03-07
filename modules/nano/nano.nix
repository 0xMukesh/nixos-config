{ pkgs, ... }:

{
  home.packages = [ pkgs.nano ];

  home.file.".nanorc".text = ''
    set tabsize 4
    set tabstospaces
  '';
}
