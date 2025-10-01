> [!NOTE]
> My NixOS config is outdated so don't use it; you can take the packages and other settings from it but do NOT copy over the NixOS version setting as that may brick stuff!

Some Arch packages to install ahead of using my setup (some are QoL and not strictly required!):

```
btop tree bat fastfetch waybar fuzzel foot hyprland hyprsunset hyprlock hyprpaper hypridle neovim xorg-xwayland wireplumber pipwire-pulse noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd mandb man-pages dunst unzip 7zip git neovim
```

Some **AUR** packages to install:

```
python-pywal16
```

---

Note that I use Paru as my AUR helper; install as follows:

```
git cloen https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

---

Below are some more AUR/Arch packages that I have for my setup, but aren't strictly needed for configuring my dots:

AUR:
```
vesktop binaryninja-free
```

Arch packages:
```
libreoffice-still hunspell hunspell-en_ca virtualbox virtualbox-host-dkms nvidia-dkms nvidia-utils qutebrowser python-adblock mpv feh
```
