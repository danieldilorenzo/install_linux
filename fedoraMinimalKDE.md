# 🚀 Instalação: Fedora KDE Minimal

<br>

## 📑 Índice de Instalação e Configuração
- 🖥️ **Instalação**
  - [Baixar a ISO](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#baixar-a-iso)
  - Instalando
    - [Instalando KDE](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#instalando-kde)
    - [Habilitando serviços](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#habilitando-servi%C3%A7os)

- 🌐 **Navegadores**
  - [Instalar Firefox](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#instalar-firefox)
  - [Instalar Google Chrome](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#instalar-google-chrome)

- 📦 **Repositórios e Codecs**
  - [Habilitar RPM Fusion](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#habilitar-rpm-fusion)
  - [Plugins de Áudio e Vídeo](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#plugins-de-%C3%A1udio-e-v%C3%ADdeo)

- 🎨 **Interface & Customização**
  - [Instalar Papirus Icons](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#instalar-papirus-icons--folders)

- 💻 **Apps e Desenvolvimento**
  - [Flatpak](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#instalar-flatpak)
  - [Gnome Boxes](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#gnome-boxes)
  - [Visual Studio Code](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#visual-studio-code)
  - [Node.js e Python](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#nodejs-e-python)
  - [Fontes e Apps Essenciais](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#fontes-e-apps-essenciais)

- 🐚 **Customização do Terminal (ZSH)**
  - [Instalação e Oh My Zsh](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#instala%C3%A7%C3%A3o-e-oh-my-zsh)
  - [Plugins do ZSH](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#plugins-do-zsh)

- 🧹 **Limpeza de Bloatwares**
  - [Script para atualização e limpeza do sistema (Sistema, Flatpak e Firmware)](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraMinimalKDE.md#script-para-atualiza%C3%A7%C3%A3o-e-limpeza-do-sistema-sistema-flatpak-e-firmware)

  <br>

- 🖥️ **Instalação**

## Baixar a ISO

Baixar a Iso [Fedora Everything](https://fedoraproject.org/misc/#everything)

## Instalando

Durante a instalação, instalar como `Fedora Custom Operating System`.

Depois de instalado, vamos cair no terminal, onde devemos instalar o desejado

#### Instalando KDE

```bash
sudo dnf install plasma-desktop plasma-workspace-wayland plasma-login-manager kscreen plasma-nm konsole dolphin pipewire-pulseaudio plasma-pa brightnessctl bluez bluedevil spectacle plasma-systemmonitor NetworkManager-wifi joystick kernel-modules-extra ark wireplumber kate hwinfo kinfocenter udisks2 plasma-disks  mesa-va-drivers kde-gtk-config flatpak
```

Os apps acima são o mínimo para um sistema funcionar sem problemas. Se houver a possibilidade de instalar alguns outros apps, podemos executar o comando abaixo

```bash
sudo dnf install plasma-workspace-wallpapers kde-connect emoji-picker plasma-browser-integration fastfetch plasma-discover plasma-discover-flatpak
``` 

#### Habilitando serviços

```bash
sudo systemctl enable plasmalogin
sudo systemctl set-default graphical.target
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
```

Reiniciar o sistema com

```bash
sudo reboot
```

<br>

- 🌐 **Navegadores**

### Instalar Firefox

```bash
sudo dnf install firefox
```

<br>

### Instalar Google Chrome

```bash
sudo dnf install fedora-workstation-repositories &&
sudo dnf config-manager setopt google-chrome.enabled=1 &&
sudo dnf install google-chrome-stable
```

<br>

- 📦 **Repositórios e Codecs**

### Habilitar RPM Fusion

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

<br>

### Plugins de Áudio e Vídeo

```bash
sudo dnf install gstreamer1-plugins-{bad-*,good-*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel && sudo dnf install lame* --exclude=lame-devel && sudo dnf install ffmpeg-libs libva-utils
```

<br>

## 🎨 Interface & Customização

### Instalar Papirus Icons & Folders

```bash
sudo dnf install papirus-icon-theme
```

<br>

## 💻 Apps e Desenvolvimento

### Instalar Flatpak

```bash
sudo dnf install flatpak
```

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

Após isso, reiniciar para começar a usar

### Gnome Boxes

```bash
flatpak install flathub org.gnome.Boxes

```

<br>

### Visual Studio Code

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && sudo dnf install code -y
```

<br>

### Node.js e Python

```bash
sudo dnf install npm nodejs git curl python3-idle android-tools fastboot
```

### Fontes e Apps Essenciais

```bash
sudo dnf install fira-code-fonts ibm-plex-mono-fonts jetbrains-mono-fonts-all steam steam-devices ktorrent kweather
```

<br>

## 🐚 Customização do Terminal (ZSH)

### Instalação e Oh My Zsh

```bash
sudo dnf install zsh util-linux-user git && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Plugins do ZSH

```bash
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/marlonrichert/zsh-autocomplete && git clone https://github.com/zsh-users/zsh-syntax-highlighting
```

<!--

Se o comando acima quebrar, olhar a documentação aqui

https://ohmyz.sh/#install

-->

<br>

```bash
cd ~ && sudo nano .zshrc
```

Colar

```bash
plugins=(
    git
    zsh-autosuggestions
    zsh-autocomplete
    zsh-syntax-highlighting
)

# Fazer a sugestão priorizar o que usamos por último
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

# Sources manuais para garantir o funcionamento
#source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Colorindo o autocomplete
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

```

<br>

## 🧹 Limpeza de Bloatwares

### Script para atualização e limpeza do sistema (Sistema, Flatpak e Firmware)

```bash


#!/bin/bash

# Cores para facilitar a leitura
VERDE='\033[0;32m'
AZUL='\033[0;34m'
RESET='\033[0m'


    echo -e " "
    echo -e "${AZUL}--- Iniciando Atualização Completa ---${RESET}"
    echo -e " "

# 1. Detectar o Gerenciador de Pacotes
if [ -f /etc/fedora-release ]; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (DNF)...${RESET}"
    # No Fedora, mantemos o -y se você preferir, ou removemos para ver o que será feito
    sudo dnf upgrade --refresh
elif [ -f /etc/os-release ] && grep -q "opensuse" /etc/os-release; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Zypper)...${RESET}"
    sudo zypper ref
    # REMOVIDO o -y para que ele pare nos conflitos e peça sua escolha (1, 2, 3...)
    sudo zypper dup
elif grep -q "ID=linuxmint" /etc/os-release 2>/dev/null; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Apt)...${RESET}"
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
else
    echo "Sistema não identificado."
fi

# 2. Atualizar Flatpaks
if command -v flatpak &> /dev/null; then
    echo -e " "
    echo -e "${VERDE}[2/3] Atualizando Flatpaks...${RESET}"
    flatpak update -y
    flatpak uninstall --unused -y
fi
# 3. Limpeza de Cache e Logs
    echo -e " "
    echo -e "${VERDE}[3/3] Iniciando limpeza de primavera...${RESET}"

# Limpa cache do gerenciador de pacotes
if [ -f /etc/fedora-release ]; then
    sudo dnf clean all
elif [ -f /etc/os-release ] && grep -q "opensuse" /etc/os-release; then
    sudo zypper clean -a
elif grep -q "ID=linuxmint" /etc/os-release 2>/dev/null; then
    sudo apt-get autoremove -y
    sudo apt-get autoclean
fi

# Limpa logs antigos (mantém apenas os últimos 2 dias)
sudo journalctl --vacuum-time=2d

# Limpa cache de miniaturas do usuário
rm -rf ~/.cache/thumbnails/*
    echo -e " "
    echo -e "${AZUL}--- Sistema Atualizado e Limpo! ---${RESET}"
    echo -e " "
    fastfetch

```
