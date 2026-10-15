#!/bin/bash

# Encerra o script se houver erro
set -e

# Cores e estilos para facilitar a leitura
VERDE='\033[0;32m'
VERDE_SUSE='\033[3;32m'
AZUL='\033[0;34m'
VERMELHO='\033[0;31m'
ITALICO_VERMELHO='\033[3;31m'
RESET='\033[0m'

echo -e " "
echo -e "${AZUL}------ ${VERDE_SUSE}OPENSUSE TUMBLEWEED ${AZUL}------${RESET}"
echo -e " "

echo -e "${VERDE}Bloqueando pacotes recomendados${RESET}"
echo -e " "
sudo tee /etc/zypp/zypp.conf.d/custom_requires.conf > /dev/null << 'EOF'
# Configuração criada para manter o sistema enxuto e sem bloat.
# Impede o Zypper de instalar pacotes 'Recommends' automaticamente (ex: KDE PIM, jogos).
# Para instalar algo com recomendações no futuro, use: sudo zypper in --with-recommends <pacote>

solver.onlyRequires = true
EOF

echo -e " "
echo -e "${VERDE}Instalando ZRAM${RESET}"
echo -e " "

sudo zypper in -y zram-generator

sudo tee /etc/systemd/zram-generator.conf > /dev/null << 'EOF'
[zram0]
zram-size = min(ram / 2, 8192)
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
EOF

echo -e " "
echo -e "${VERDE}Ativando a ZRAM${RESET}"
echo -e " "
sudo systemctl daemon-reload
sudo systemctl start /dev/zram0

# Captura a interface em letras minúsculas
DESKTOP=$(echo "${XDG_CURRENT_DESKTOP:-$DESKTOP_SESSION}" | tr '[:upper:]' '[:lower:]')

echo -e " "
echo -e "${AZUL}--- PARANDO PACKAGEKIT PARA EVITAR ERROS ---${RESET}"
sudo systemctl stop --now packagekit
echo -e " "

# ==========================================
# 1. PACOTES COMUNS (GNOME E KDE)
# ==========================================

echo -e " "
echo -e "${VERDE}Instalando e ativando Thermald${RESET}"
echo -e " "
sudo zypper in -y thermald && sudo systemctl enable --now thermald

echo -e " "
echo -e "${VERDE}Instalando OPI${RESET}"
echo -e " "
sudo zypper in -y opi

#
# Adicionando o -n após o comando opi,
# pois dessa forma, ele não para, e
# escolhe a fonte recomendada automaticamente
#

echo -e " "
echo -e "${VERDE}Instalando pacotes do OPI${RESET}"
echo -e " "
opi -n google-chrome
opi -n steam
opi -n vscode
opi -n codecs
opi -n ms-fonts

sudo zypper in -y \
    steam-devices \
    android-tools \
    android-udev-rules \
    wget \
    curl \
    npm \
    git \
    fastfetch \
    papirus-icon-theme \
    papirus-folders \
    python3-idle \
    zsh

echo -e "\n${AZUL}--- Configurando repositório Flathub ---${RESET}"
    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo	


if [[ "$DESKTOP" == *"gnome"* ]]; then
    echo -e "\n${AZUL}--- Configurando extras do GNOME ---${RESET}"
    sudo zypper in -y \
        gnome-backgrounds \
        imagewriter \
        breeze6-cursors

    echo -e "\n${AZUL}--- Instalando aplicativos Flatpak (GNOME) ---${RESET}"
    flatpak install --user -y flathub de.haeckerfelix.Fragments
    flatpak install --user -y flathub io.bassi.Amberol
    
elif [[ "$DESKTOP" == *"kde"* || "$DESKTOP" == *"plasma"* ]]; then
    echo -e "\n${AZUL}--- Configurando extras do KDE Plasma ---${RESET}"
    sudo zypper in -y \
     	breeze6-wallpapers \
     	plasma6-workspace-wallpapers \
		partitionmanager \
		imagewriter \
		kdeconnect-kde \
		elisa \
		ktorrent \
		kweather 	
else
    echo -e "\n${AZUL}Ambiente não especificado ou outro desktop detectado ($DESKTOP). Pulando pacotes específicos.${RESET}"
fi

echo -e " "
echo -e "${AZUL}--- APLICATIVOS INSTALADOS COM SUCESSO. ---${RESET}"
echo -e " "

# Pergunta sobre o reboot
read -p "Deseja reiniciar o sistema agora? (s/n): " RESPOSTA

# Converte a resposta para minúsculas
RESPOSTA=$(echo "$RESPOSTA" | tr '[:upper:]' '[:lower:]')

# Verifica a resposta
if [[ "$RESPOSTA" =~ ^(s|sim|y|yes)$ ]]; then
    echo -e "\n${VERDE}Reiniciando o sistema :)${RESET}\n"
    sudo reboot
else
    echo -e "\n${VERDE}Tudo pronto! Lembre-se de reiniciar mais tarde para aplicar todas as alterações :)${RESET}\n"
fi
