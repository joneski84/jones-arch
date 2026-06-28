#!/usr/bin/env bash
set -euo pipefail

echo "[Jones] customize_airootfs.sh running"

# Locale
sed -i 's/^#fi_FI.UTF-8 UTF-8/fi_FI.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

cat > /etc/locale.conf <<'LOCALE'
LANG=fi_FI.UTF-8
LC_TIME=fi_FI.UTF-8
LC_COLLATE=C
LOCALE

# Finnish console keyboard
cat > /etc/vconsole.conf <<'VCONSOLE'
KEYMAP=fi
FONT=ter-132n
VCONSOLE

# Timezone
ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime

# Live user created during ISO build, not during boot
if ! id live >/dev/null 2>&1; then
    useradd -m -u 1000 -G wheel,audio,video,storage,optical,input,power,gamemode -s /bin/bash live
fi

usermod -aG gamemode live || true

passwd -d live || true
passwd -d root || true

cat > /etc/sudoers.d/99-live <<'SUDOERS'
live ALL=(ALL) NOPASSWD: ALL
SUDOERS
chmod 440 /etc/sudoers.d/99-live

# Make sure home exists and skel files are copied
cp -rT /etc/skel /home/live || true
chown -R live:live /home/live

echo "[Jones] customize_airootfs.sh done"
