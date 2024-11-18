## Instalação e pós instalação Arch Linux KDE

### Desbloquear WiFi para instalar sem cabo de rede

>rfkill unblock wlan
>
>iwctl
>device list
>
>station wlan0 scan
>
>station wlan0 get-networks
>
>station wlan0 connect <nome_da_rede>

### Teclado em Pt-Br

>loadkeys br-abnt2

### Verificar conexão

>ping -c 3 archlinux.org

### Verificar o particionamento

>fdisk -l

### Particionar

>cfdisk /dev/nvme0n1

### Verificar se o particionamento está correto

>fdisk -l

### Criar as partições

>mkfs.fat -F32 /dev/nvme0n1p1
>
>mkswap /dev/nvme0n1p2
>
>swapon /dev/nvme0p2
>
>mkfs.btrfs /dev/nvme0n1p3

### Iniciar a instalação do sistema

>pacman -Syy
>
>pacman -Sy archlinux-keyring
>
>mount -o compress=zstd /dev/nvme0n1p3 /mnt/
>
>pacstrap /mnt base base-devel linux linux-firmware sudo nano


### Configurar o sistema instalado

>genfstab -U /mnt >> /mnt/etc/fstab
>
>arch-chroot /mnt

### Configurar Timezone

>ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

### Configurar Locale.gen

>nano /etc/locale.gen

Descomentar

>- en_US.UTF-8 UTF-8
>- en_US ISO-8859-1
>- pt_BR.UTF-8 UTF-8
>- pt_BR ISO-8859-1

>locale-gen

>echo LANG=pt_BR.UTF-8 > /etc/locale.conf

>export LANG=pt_BR.UTF-8


### Configurar nome da máquina

>echo arch > /etc/hostname

### Configurar hosts

>nano /etc/hosts

Colar

>127.0.0.1      	localhost
>::1          		localhost
>127.0.1.1      	arch

### Configurar senha

>passwd

### Instalar Grub

>pacman -S grub efibootmgr os-prober mtools
>
>mkdir /boot/efi
>
>mount /dev/nvme0n1p1 /boot/efi
>
>grub-install --target=x86_64-efi --bootloader-id=grub_uefi
>
>grub-mkconfig -o /boot/grub/grub.cfg

### Instalar kde

>pacman -S plasma sddm dolphin kwalletmanager fastfetch wget git plasma-workspace konsole spectacle power-profiles-daemon gnome-boxes partitionmanager ktorrent kate ffmpegthumbs acpi telegram-desktop vlc android-tools ttf-fira-code ntfs-3g ffmpegthumbnailer gst-libav gst-plugins-ugly noto-fonts-emoji packagekit-qt6 firefox firefox-i18n-pt-br pipewire pipewire-pulse kdeconnect libva-mesa-driver vulkan-radeon xf86-video-amdgpu mesa xf86-video-ati amd-ucode btrfs-progs kasts fwupd e2fsprogs

### Habilitar SDDM e NetworkManager

>systemctl enable sddm
>
>systemctl enable NetworkManager

### Criar usuário

>useradd -m -G wheel daniel
>
>passwd daniel

>EDITOR=nano visudo

Descomentar a linha abaixo

>%wheel ALL=(ALL) ALL

### Habilitar bluetooth

>nano /etc/bluetooth/main.conf

(mudar autoenable para true)


>sudo systemctl enable bluetooth.service

### Reniniciar
>exit
>umount -R /mnt
>reboot

<br>

___
___
___
<br>


## Pós instalação


### Mudar mirror 


Acessar

>https://archlinux.org/mirrorlist/

Pegar os mirrors do Brasil e EUA

Descomentar todos e colar em 

>sudo nano /etc/pacman.d/mirrorlist
>
>sudo pacman -Syyu


### Instalar Google Chrome

>git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome/ && makepkg -si


### Instalar Spotify

>git clone https://aur.archlinux.org/spotify.git && cd spotify/ && curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import - && makepkg -s && sudo pacman -U *.zst 


### Instalar Vscode

>git clone https://aur.archlinux.org/visual-studio-code-bin.git && cd visual-studio-code-bin/ && makepkg -si

### Instalar ZSH

>sudo pacman -S zsh

>sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Instalar Plugins


>cd .oh-my-zsh/plugins

>git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git


>nano .zshrc<br><br>
>source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh<br>
>source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh<br>
>source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh<br>
>source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh<br>
>source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh<br>
>
>plugins=(<br>
>    zsh-autosuggestions<br>
>    zsh-autocomplete<br>
>    zsh-syntax-highlighting<br>
>)

## Instalar Fish

sudo pacman -S fish

# Instalar Tide (prompt melhor para o Fish)

set -l _tide_tmp_dir (command mktemp -d) curl https://codeload.github.com/ilancosman/tide/tar.gz v6 | tar -xzC $_tide_tmp_dir command cp -R $_tide_tmp_dir/*/{completions,conf.d,functions} $__fish_config_dir fish_path=(status fish-path) exec $fish_path -C "emit _tide_init_install"

### Instalar Papirus Icon theme

>sudo pacman -S papirus-icon-theme

### Instalar várias fontes

>sudo pacman -S otf-codenewroman-nerd && sudo pacman -S otf-comicshanns-nerd && sudo pacman -S otf-commit-mono-nerd  && sudo pacman -S otf-droid-nerd  && sudo pacman -S otf-firamono-nerd  && sudo pacman -S otf-geist-mono-nerd  && sudo pacman -S otf-hasklig-nerd  && sudo pacman -S otf-hermit-nerd  && sudo pacman -S otf-monaspace-nerd  && sudo pacman -S otf-opendyslexic-nerd  && sudo pacman -S otf-overpass-nerd  && sudo pacman -S ttf-0xproto-nerd  && sudo pacman -S ttf-3270-nerd  && sudo pacman -S ttf-agave-nerd  && sudo pacman -S ttf-anonymouspro-nerd  && sudo pacman -S ttf-arimo-nerd  && sudo pacman -S ttf-bigblueterminal-nerd  && sudo pacman -S ttf-bitstream-vera-mono-nerd  && sudo pacman -S ttf-cascadia-code-nerd  && sudo pacman -S ttf-cascadia-mono-nerd  && sudo pacman -S ttf-cousine-nerd  && sudo pacman -S ttf-d2coding-nerd  && sudo pacman -S ttf-daddytime-mono-nerd  && sudo pacman -S ttf-dejavu-nerd  && sudo pacman -S ttf-envycoder-nerd  && sudo pacman -S ttf-fantasque-nerd  && sudo pacman -S ttf-firacode-nerd  && sudo pacman -S ttf-go-nerd  && sudo pacman -S ttf-hack-nerd  && sudo pacman -S ttf-heavydata-nerd  && sudo pacman -S ttf-iawriter-nerd  && sudo pacman -S ttf-ibmplex-mono-nerd  && sudo pacman -S ttf-inconsolata-go-nerd  && sudo pacman -S ttf-inconsolata-lgc-nerd  && sudo pacman -S ttf-inconsolata-nerd  && sudo pacman -S ttf-intone-nerd  && sudo pacman -S ttf-iosevka-nerd  && sudo pacman -S ttf-iosevkaterm-nerd  && sudo pacman -S  ttf-jetbrains-mono-nerd   && sudo pacman -S  ttf-lekton-nerd && sudo pacman -S ttf-liberation-mono-nerd  && sudo pacman -S ttf-lilex-nerd  && sudo pacman -S ttf-martian-mono-nerd  && sudo pacman -S ttf-meslo-nerd  && sudo pacman -S ttf-monofur-nerd  && sudo pacman -S ttf-monoid-nerd  && sudo pacman -S ttf-mononoki-nerd  && sudo pacman -S ttf-mplus-nerd  && sudo pacman -S ttf-nerd-fonts-symbols  && sudo pacman -S ttf-nerd-fonts-symbols-common  && sudo pacman -S ttf-nerd-fonts-symbols-mono  && sudo pacman -S ttf-noto-nerd  && sudo pacman -S ttf-profont-nerd  && sudo pacman -S ttf-proggyclean-nerd  && sudo pacman -S ttf-roboto-mono-nerd  && sudo pacman -S ttf-sharetech-mono-nerd  && sudo pacman -S ttf-sourcecodepro-nerd  && sudo pacman -S ttf-space-mono-nerd  && sudo pacman -S ttf-terminus-nerd  && sudo pacman -S ttf-tinos-nerd  && sudo pacman -S ttf-ubuntu-mono-nerd  && sudo pacman -S ttf-ubuntu-nerd  && sudo pacman -S ttf-victor-mono-nerd  ttf-croscore ttf-dejavu  ttf-droid ttf-dejavu ttf-liberation libertinus-font noto-fonts gsfonts tex-gyre-fonts ttf-ubuntu-font-family ttf-bitstream-vera 
