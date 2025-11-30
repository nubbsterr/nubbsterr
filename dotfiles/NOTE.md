> [!tip]
> Check the pkglist file for packages to install to run my stuff >:)
> make sure to change up the nvidia driver stuff if you 1) aren't running NVIDIA hardware or 2) aren't running the zen kernel/another kernel other than LTS/'linux' kernel


> [!tip]
> below are commands for running my virt-manager setup
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

---

Note that I use Paru as my AUR helper; install as follows:

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
