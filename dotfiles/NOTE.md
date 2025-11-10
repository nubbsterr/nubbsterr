> [!NOTE]
> If you ever need wallpapers go here for some cool ones: https://github.com/dharmx/walls
> Wallhaven is also pretty nice.
> You can get some other cool/cozy/cute ones here: https://github.com/leanghok120/cozywalls/tree/master

Some Arch/AUR packages to install ahead of using my setup:

```bash
sudo pacman -S zellij harper clangd pyright bash-language-server chafa swww zathura zathura-pdf-poppler zathura-cb fzf zsh python-setuptools zoxide nvtop htop bat waybar fuzzel kitty sunsetr hyprlock hypridle wireplumber pipwire-pulse noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd mandb man-pages mako unzip 7zip git helix niri xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal
```

```bash
paru -S matugen-bin kotofetch vicinae-bin
```

Note that Nautilus will install by default. If you want dark theme for it and other GTK4 apps, run `$ gsettings set org.gnome.desktop.interface color-scheme prefer-dark`.

---

Note that I use Paru as my AUR helper; install as follows:

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```


Below are some more AUR/Arch packages that I have for my setup, but aren't strictly needed for configuring my dots:

AUR:
```bash
paru -S quran-companion ani-cli vesktop newscheck binaryninja-free
```

**Note for newscheck, run `sudo usermod -a -G newscheck $USER` per the package note.**

Arch packages:
```bash
sudo pacman -S libreoffice-still hunspell hunspell-en_ca virtualbox virtualbox-host-dkms nvidia-dkms nvidia-utils mpv feh
```
