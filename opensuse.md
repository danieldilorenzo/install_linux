# Pós Instalação OpenSUSE Tumbleweed KDE


<br>


### Instalar Zram Generator

<br>
<br>

```sudo zypper in zram-generator```

```sudo nano /etc/systemd/zram-generator.conf```

```bash

[zram0]
zram-size = min(ram / 2, 8192)
compression-algorithm = zstd
swap-priority = 100
fs-type = swap

```

```sudo systemctl daemon-reload ```

```sudo systemctl start /dev/zram0```

```zramctl```


<br>


### Otimização do Kernel (Sysctl)


```sudo nano /etc/sysctl.d/99-performance.conf```

```bash

vm.swappiness=10
vm.vfs_cache_pressure=50
vm.dirty_ratio=10
vm.dirty_background_ratio=5

```

<br>


### Instalar Thermald

```bash
sudo zypper in thermald
sudo systemctl enable --now thermald
```

<br>


### Instalar opi

sudo zypper in opi

```bash
opi codecs    
opi google-chrome
opi vscode
opi steam
```

<br>



### Instalar drivers adb

```sudo zypper install android-tools```

<br>


### Instalar ZSH

```
bashsudo zypper in zsh git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


<br>


### Configurar ZSH

```bash
cd .oh-my-zsh/plugins

git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

cd ~ && sudo nano .zshrc
```

```bash
plugins=(
  git
  zsh-autosuggestions
  zsh-autocomplete
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
```

<br>


### Instalar wallpapers

```sudo zypper in breeze6-wallpapers plasma6-workspace-wallpapers```

<br>


### Instalar FastFetch

```sudo zypper in fastfetch```

<br>


### Instalar Idle (para códigos rápidos de Python)

```sudo zypper in python3-idle```

<br>


### Instalar Gnome Boxes

```sudo flatpak install flathub org.gnome.Boxes```

<br>


### Instalar NPM

```sudo zypper in npm```

<br>


### Instalar Git

```sudo zypper in git```

<br>


### Instalar KDE Connect

```sudo zypper in kdeconnect-kde```

<br>


### Instalar Papirus Icons & Folders

```sudo zypper in papirus-icon-theme papirus-folders```

<br>


### Instalar Gerenciador de partições

```sudo zypper in partitionmanager```

<br>


### Instalar Instalar KDE Imagewriter

```sudo zypper in imagewriter```

<br>


### Instalar Instalar Elisa

```sudo zypper in elisa```

<br>


### Instalar KTorrent

```sudo zypper in ktorrent```

<br>


### Instalar KDE Weather

```sudo zypper in kweather```

<br>


### Instalar mGBA

```sudo flatpak install flathub io.mgba.mGBA```

<br>


### Instalar melonDS

```sudo flatpak install flathub net.kuribo64.melonDS```

<br>


### Instalar Fontes

```sudo zypper in jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts```

<br>

### Instalar tudo junto

```bash
sudo zypper install android-tools zsh breeze6-wallpapers plasma6-workspace-wallpapers python3-idle npm git kdeconnect-kde papirus-icon-theme papirus-folders partitionmanager imagewriter elisa ktorrent kweather jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts
```
