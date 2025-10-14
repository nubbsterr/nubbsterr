> [!NOTE]
> If you ever need wallpapers go here for some cool ones: https://github.com/dharmx/walls
> Wallhaven is also pretty nice.

Some Arch packages to install ahead of using my **HYPRLAND** setup (some are QoL and not strictly required!):

```bash
sudo pacman -S fzf zsh python-setuptools zoxide nvtop htop bat waybar fuzzel foot hyprland sunsetr hyprlock hyprpaper hypridle xdg-desktop-portal-hyprland neovim xorg-xwayland wireplumber pipwire-pulse noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd mandb man-pages mako unzip 7zip git neovim
```

If you want to run my Niri dots, install the following:

```bash
sudo pacman -S niri swaybg xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal
```

And if you wanna rock LSPs with my nvim config:

```bash
sudo pacman -S bash-language-server clang pyright
```

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
