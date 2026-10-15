
#!/bin/bash

# Cores para facilitar a leitura
VERDE='\033[0;32m'
AZUL='\033[0;34m'
RESET='\033[0m'

# Captura a interface em letras minúsculas
DESKTOP=$(echo "${XDG_CURRENT_DESKTOP:-$DESKTOP_SESSION}" | tr '[:upper:]' '[:lower:]')

echo -e "${AZUL}--- INICIANDO INSTALAÇÃO DE APLICATIVOS ---${RESET}\n"

# ==========================================
# 1. PACOTES COMUNS (GNOME E KDE)
# ==========================================

# Atualizando repositório
sudo eopkg ur

echo -e "${VERDE}Instalando Google Chrome${RESET}"
sudo eopkg it -y python-eopkg
sudo eopkg.py bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it -y google-chrome-*.eopkg
sudo rm -f google-chrome-*.eopkg

echo -e "\n${VERDE}Instalando utilitários do sistema, dev e mídia${RESET}"
sudo eopkg it -y \
    steam \
    steam-devices \
    vscode \
    wget \
    curl \
    nodejs \
    git \
    zsh \
    fastfetch \
    flatpak \
    gstreamer-plugins-base gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-bad-extras ffmpeg \
    papirus-icon-theme \
    font-jetbrainsmono-ttf font-droid-ttf texlive-fonts-opentype texlive-fonts-truetype texlive-fonts-extra font-ubuntu-ttf font-ubuntu-sans-ttf font-inter-ttf font-ibm-plex-ttf font-ibm-plex-otf font-firacode-ttf

echo -e "\n${VERDE}Instalando Flatpaks comuns${RESET}"
flatpak install flathub org.gnome.Boxes org.videolan.VLC -y

# ==========================================
# 2. PACOTES ESPECÍFICOS POR AMBIENTE
# ==========================================

if [[ "$DESKTOP" == *"gnome"* ]]; then
    echo -e "\n${AZUL}--- Configurando extras do GNOME ---${RESET}"
    sudo eopkg it -y breeze-light-cursor-theme gnome-backgrounds
    flatpak install flathub io.gitlab.adhami3310.Impression -y

elif [[ "$DESKTOP" == *"kde"* || "$DESKTOP" == *"plasma"* ]]; then
    echo -e "\n${AZUL}--- Configurando extras do KDE Plasma ---${RESET}"
    sudo eopkg it -y plasma-workspace-wallpapers partitionmanager isoimagewriter ktorrent
    flatpak install flathub org.kde.kweather -y

else
    echo -e "\n${AZUL}Ambiente não especificado ou outro desktop detectado ($DESKTOP). Pulando pacotes específicos.${RESET}"
fi

# ==========================================
# 3. LIMPEZA FINAL
# ==========================================

echo -e "\n${VERDE}Removendo LibreOffice${RESET}"
sudo eopkg rm -y libreoffice-calc libreoffice-common libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer

echo -e "\n${AZUL}Tudo instalado, aproveite! :)${RESET}\n"
