#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Add additional repositories

curl -Lo /etc/yum.repos.d/_copr_secureblue_bubblejail.repo https://copr.fedorainfracloud.org/coprs/secureblue/bubblejail/repo/fedora-${RELEASE}/secureblue-bubblejail-fedora-${RELEASE}.repo
curl -Lo /etc/yum.repos.d/_copr_alternatived_keyd.repo https://copr.fedorainfracloud.org/coprs/alternateved/keyd/repo/fedora-${RELEASE}/alternateved-keyd-fedora-${RELEASE}.repo
curl -Lo /etc/yum.repos.d/tailscale.repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

rpm-ostree install clevis-dracut clevis-luks clevis-udisks2 clevis-systemd \
    byobu duperemove fish mosh podman-compose tailscale \
    keyd adw-gtk3-theme bubblejail gamemode goverlay mangohud protontricks steam vkbasalt