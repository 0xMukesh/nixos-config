{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
        ];
      };
      xkb = {
        layout = "us";
        options = "caps:escape";
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };

    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql_18;
    };

    pulseaudio.enable = false;
    displayManager.defaultSession = "none+i3";
    dbus.enable = true;
    openssh.enable = true;
  };
}
