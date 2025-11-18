> [!NOTE]
> If you ever need wallpapers go here for some cool ones: https://github.com/dharmx/walls
> Wallhaven is also pretty nice.
> You can get some other cool/cozy/cute ones here: https://github.com/leanghok120/cozywalls/tree/master

Some Arch/AUR packages to install ahead of using my setup:

```bash
sudo pacman -S harper clangd pyright bash-language-server chafa swww zathura zathura-pdf-poppler zathura-cb fzf zsh zoxide nvtop htop bat waybar ghostty sunsetr wireplumber pipwire-pulse noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd mandb man-pages mako unzip 7zip git helix
```

If you wish to run my Sway dots:

```bash
sudo pacman -S swaylock-effects swayidle sway
```

If you wish to run my Niri config:

```bash
sudo pacman -S niri xdg-desktop-portal-gnome xdg-desktop-portal-gtk swayidle swaylock-effects
```

If you wish to run my rmpc/mpd setup (edit the directories in mpd.conf to your liking):

```bash
sudo pacman -S rmpc mpd
```

```bash
paru -S matugen-bin kotofetch vicinae-bin
```

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

Arch packages (nvidia-dkms is for running the Zen kernel, refer to ArchWiki for more info!!!!!!!!!!!!):
```bash
sudo pacman -S libreoffice-still hunspell hunspell-en_ca virtualbox virtualbox-host-dkms nvidia-dkms nvidia-utils mpv feh
```
