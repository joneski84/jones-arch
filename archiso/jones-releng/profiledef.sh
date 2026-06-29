#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="jones-arch"
iso_label="JONES_ARCH"
iso_publisher="Arch Linux <https://archlinux.org>"
iso_application="Arch Linux Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/jones-gaming-check"]="0:0:755"
  ["/etc/skel/Desktop/zen-browser.desktop"]="0:0:755"
  ["/etc/skel/Desktop/faugus-launcher.desktop"]="0:0:755"
  ["/etc/skel/Desktop/steam.desktop"]="0:0:755"
  ["/etc/skel/Desktop/keepassxc.desktop"]="0:0:755"
  ["/usr/local/bin/jones-welcome"]="0:0:755"
  ["/usr/local/bin/jones-gaming-setup"]="0:0:755"
  ["/usr/local/bin/jones-first-login"]="0:0:755"
  ["/etc/skel/Desktop/jones-welcome.desktop"]="0:0:755"
  ["/etc/skel/.config/autostart/jones-first-login.desktop"]="0:0:755"
  ["/usr/local/bin/jones-install-refind-theme"]="0:0:755"
  ["/usr/local/bin/jones-boot-sound"]="0:0:755"
)
