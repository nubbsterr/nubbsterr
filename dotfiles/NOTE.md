> [!NOTE]
> My NixOS config is outdated so don't use it; you can take the packages and other settings from it but do NOT copy over the NixOS version setting as that may brick stuff!

> [!NOTE]
> If you ever need wallpapers go here for some cool ones: https://github.com/dharmx/walls

Some Arch packages to install ahead of using my **HYPRLAND** setup (some are QoL and not strictly required!):

```bash
sudo pacman -S python-setuptools zoxide htop tree bat fastfetch waybar fuzzel foot hyprland sunsetr hyprlock hyprpaper hypridle neovim xorg-xwayland wireplumber pipwire-pulse noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd mandb man-pages dunst unzip 7zip git neovim
```

If you want to run my Niri dots, install the following:

```bash
sudo pacman -S niri swaybg swayidle xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal
```

And if you wanna rock LSPs with my nvim config:

```bash
sudo pacman -S bash-language-server lua-language-server marksman clang pyright
```

> [!NOTE]
> `xdg-desktop-portal-gnome` legit isn't installing for me soooooooooo screensharing just won't work LOL. If you want Hyprland screensharding, get `xdg-desktop-portal` and `xdg-desktop-portal-hyprland`.
> [!NOTE]
> `niri validate` is a lil broken and i'm like 90% certain the Wiki docs on GitHub are out-of-date lol.

---

Note that I use Paru as my AUR helper; install as follows:

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

---

Below are some more AUR/Arch packages that I have for my setup, but aren't strictly needed for configuring my dots:

AUR:
```bash
paru -S swaylock-effects-git python-pywal16 python-haishoku ani-cli vesktop newscheck binaryninja-free code-marketplace
```

**Note for newscheck, run `sudo usermod -a -G newscheck $USER` per the package note.**

Arch packages:
```bash
sudo pacman -S code libreoffice-still hunspell hunspell-en_ca virtualbox virtualbox-host-dkms nvidia-dkms nvidia-utils mpv feh
```
