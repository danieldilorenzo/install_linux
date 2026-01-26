## Pós Instalação OpenSUSE Tumbleweed KDE

### Instalar Zram

> sudo zypper in systemd-zram-service && sudo zramswapon

### Ver se zram está ativa

> sudo systemctl status zramswap

### Instalar Google Chrome

> sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome && wget https://dl.google.com/linux/linux_signing_key.pub && sudo rpm --import linux_signing_key.pub && sudo zypper ref -f && sudo zypper in google-chrome-stable

### Instalar Steam

> sudo zypper in steam

### Instalar VSCode

> sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && sudo sh -c 'echo -e "[code]\name=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo' && sudo zypper refresh && sudo zypper install code

### Instalar codecs do repositório Pacman

> sudo zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman && sudo zypper refresh && sudo zypper dist-upgrade --from packman --allow-downgrade --allow-vendor-change && sudo zypper install --from packman ffmpeg gstreamer-plugins-bad gstreamer-plugins-libav gstreamer-plugins-ugly libavresample4 vlc-codecs

### Instalar drivers adb

> sudo zypper addrepo https://download.opensuse.org/repositories/hardware/openSUSE_Tumbleweed/hardware.repo && sudo zypper refresh && sudo zypper install android-tools

### Instalar ZSH

> sudo zypper in zsh git
>
> sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



### Configurar ZSH

> cd .oh-my-zsh/plugins

> git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

> cd ~ && sudo nano .zshrc

> source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh <br>
> source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh <br>
> source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh <br>
> source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh <br>
> source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh <br>
> 
> 
>  plugins=( <br>
>     zsh-autosuggestions <br>
>     zsh-autocomplete <br>
>     zsh-syntax-highlighting <br>
> )


### Instalar wallpapers

> sudo zypper in breeze6-wallpapers plasma6-workspace-wallpapers

### Instalar FastFetch

> sudo zypper in fastfetch

### Instalar Idle (para códigos rápidos de Python)

> sudo zypper in python310-idle

### Instalar Spotify

> sudo flatpak install flathub com.spotify.Client

### Instalar Gnome Boxes

> sudo flatpak install flathub org.gnome.Boxes

### Instalar NPM

> sudo zypper in npm

### Instalar Git

> sudo zypper in git

### Instalar KDE Connect

> sudo zypper in kdeconnect-kde

### Instalar Papirus Icons & Folders

> sudo zypper in papirus-icon-theme papirus-folders

### Instalar Gerenciador de partições

> sudo zypper in partitionmanager

### Instalar Instalar KDE Imagewriter

> sudo zypper in imagewriter

### Instalar Instalar Elisa

> sudo zypper in elisa

### Instalar KTorrent

> sudo zypper in ktorrent

### Instalar KDE Weather

> sudo zypper in kweather

### Instalar Telegram

> sudo zypper in telegram-desktop

### Instalar mGBA

> sudo flatpak install flathub io.mgba.mGBA

### Instalar melonDS

> sudo flatpak install flathub net.kuribo64.melonDS


### Instalar Fontes

> sudo zypper in jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts




___



## Pós Instalação OpenSUSE Tumbleweed KDE




# Instalar Zram Generator

sudo zypper in zram-generator

sudo nano /etc/systemd/zram-generator.conf

```bash

[zram0]
zram-size = min(ram / 2, 8192)
compression-algorithm = zstd
swap-priority = 100
fs-type = swap

```

sudo systemctl daemon-reload 

sudo systemctl start /dev/zram0

zramctl


### 2. Otimização do Kernel (Sysctl)


sudo nano /etc/sysctl.d/99-performance.conf

```bash

vm.swappiness=10
vm.vfs_cache_pressure=50
vm.dirty_ratio=10
vm.dirty_background_ratio=5

```

### Instalar Thermald
sudo zypper in thermald
sudo systemctl enable --now thermald

### Instalar opi

sudo zypper in opi

opi codecs    
opi google-chrome
opi vscode
opi steam


### Instalar drivers adb

>  sudo zypper install android-tools

### Instalar ZSH

> sudo zypper in zsh git
>
> sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



### Configurar ZSH

> cd .oh-my-zsh/plugins

> git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

> cd ~ && sudo nano .zshrc


plugins=(
  git
  zsh-autosuggestions
  zsh-autocomplete
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


### Instalar wallpapers

> sudo zypper in breeze6-wallpapers plasma6-workspace-wallpapers

### Instalar FastFetch

> sudo zypper in fastfetch

### Instalar Idle (para códigos rápidos de Python)

> sudo zypper in python3-idle

### Instalar Spotify

> sudo flatpak install flathub com.spotify.Client

### Instalar Gnome Boxes

> sudo flatpak install flathub org.gnome.Boxes

### Instalar NPM

> sudo zypper in npm

### Instalar Git

> sudo zypper in git

### Instalar KDE Connect

> sudo zypper in kdeconnect-kde

### Instalar Papirus Icons & Folders

> sudo zypper in papirus-icon-theme papirus-folders

### Instalar Gerenciador de partições

> sudo zypper in partitionmanager

### Instalar Instalar KDE Imagewriter

> sudo zypper in imagewriter

### Instalar Instalar Elisa

> sudo zypper in elisa

### Instalar KTorrent

> sudo zypper in ktorrent

### Instalar KDE Weather

> sudo zypper in kweather

### Instalar Telegram

> sudo zypper in telegram-desktop

### Instalar mGBA

> sudo flatpak install flathub io.mgba.mGBA

### Instalar melonDS

> sudo flatpak install flathub net.kuribo64.melonDS


### Instalar Fontes

> sudo zypper in jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts
