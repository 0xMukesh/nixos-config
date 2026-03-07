{ pkgs, self, ... }:

{
  imports = [
    ../../modules/fish/fish.nix
    ../../modules/git/git.nix
    ../../modules/i3/i3.nix
    ../../modules/firefox/firefox.nix
    ../../modules/nano/nano.nix
  ];

  home.username = "mukesh";
  home.homeDirectory = "/home/mukesh";

  home.packages = with pkgs; [
    zed-editor
    fish
    nixd
    nil
    clang
    clang-tools
    lldb
    cmake
    ninja
    neocmakelsp
    pkg-config
    go
    gopls
    delve
    go-task
    air
    atlas
    bun
    nodePackages.typescript-language-server
    package-version-server
    python3
    sqls
    postgresql_18
    jq
    websocat
  ];

  home.file = {
    ".config/zed/settings.json".source = "${self}/dotfiles/zed/settings.json";
    ".config/zed/keymap.json".source = "${self}/dotfiles/zed/keymap.json";

    ".config/gpu-screen-recorder/config".source = "${self}/dotfiles/gpu-screen-recorder/config";
  };

  home.sessionVariables = {
    EDITOR = "nano";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
