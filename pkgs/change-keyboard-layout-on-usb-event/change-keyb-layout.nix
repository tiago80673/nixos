{ config, pkgs, lib, ... }:

let
  script = pkgs.writeShellScript "change-gnome-keyboard-layout-script" ''
    #!/bin/sh
    gsettings set org.gnome.desktop.input-sources sources "[('xkb','$1')]"
  '';
in
{
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="444e", ATTRS{idProduct}=="1407", RUN+="${script} us"
    SUBSYSTEM=="input", ACTION=="remove", SUBSYSTEMS=="usb", ATTRS{idVendor}=="444e", ATTRS{idProduct}=="1407", RUN+="${script} pt"
  '';
}

#ACTION=="remove", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="444e", ATTRS{idProduct}=="1407", RUN+="${script} pt"
