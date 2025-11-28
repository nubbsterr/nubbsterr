> [!NOTE]
> If you ever need wallpapers go here for some cool ones: https://github.com/dharmx/walls
> Wallhaven is also pretty nice.
> You can get some other cool/cozy/cute ones here: https://github.com/leanghok120/cozywalls/tree/master

Some Arch/AUR packages to install ahead of using my setup:

```bash
sudo pacman -S pavucontrol adw-gtk-theme harper clangd pyright bash-language-server chafa wf-recorder mate-polkit swww zathura zathura-pdf-poppler zathura-cb fzf zsh zoxide nvtop htop bat waybar ghostty sunsetr wireplumber pipwire-pulse noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd mandb man-pages mako unzip 7zip git helix
```

If you wish to run my Sway dots:

```bash
sudo pacman -S swaylock-effects swayidle sway
```

If you wish to run my Niri config:

```bash
sudo pacman -S niri xdg-desktop-portal-gnome xdg-desktop-portal-gtk swayidle swaylock-effects
```

If you wish to run virt-manager (for my own reference lol):

```bash
sudo pacman -S swtpm qemu-base virt-manager libvirt dnsmasq openbsd-netcat bridge-utils
```

```bash
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
# log in/out now
# follow this guide for making a win11 vm: https://www.youtube.com/watch?v=wxxP39cNJOs&t=193s
# make sure to use the emulated TPM module
# when you get to the MS sign in prompt, select organization/school/whatever the non-personal option is, then click sign-in options, then domain-joined!
# when you get to the point where it wants you to connect, just hit 'Open folder' on the entire CDROM of the virtio drivers
```

If you wish to run my rmpc/mpd setup (edit the directories in mpd.conf to your liking):

```bash
sudo pacman -S rmpc mpd nicotine+
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
