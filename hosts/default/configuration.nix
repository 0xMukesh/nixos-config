{
  pkgs,
  self,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./services/services.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-other-than 30d";
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs self; };
    users = {
      "mukesh" = import ./home.nix;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModprobeConfig = ''
      options snd-hda-intel model=dell-headset-multi
    '';
  };

  programs.fish.enable = true;
  users.users.mukesh = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
    firewall = {
      trustedInterfaces = [ "wlp1s0" ];
    };
  };

  security = {
    rtkit.enable = true;
    wrappers.gsr-kms-server = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+ep";
      source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = "gtk";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    nano
    curl
    neofetch
    btop
    kitty
    git
    xclip
    maim
    libinput
    xmodmap
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    networkmanager
    iw
    alsa-utils
    direnv
  ];

  system.stateVersion = "25.11";
}
