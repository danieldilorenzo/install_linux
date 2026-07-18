#!/bin/bash
#
# Rodar no terminal
# cat /etc/os-release
#
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
    sudo dnf upgrade --refresh
elif [ -f /etc/os-release ] && grep -q "solus" /etc/os-release; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Eopkg)...${RESET}"
    sudo eopkg up
elif [ -f /etc/os-release ] && grep -q "opensuse" /etc/os-release; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Zypper)...${RESET}"
    sudo zypper ref
    # REMOVIDO o -y para que ele pare nos conflitos e peça sua escolha (1, 2, 3...)
    sudo zypper dup
elif grep -q "ID=OpenMandriva Lx" /etc/os-release 2>/dev/null; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (DNF)...${RESET}"
    sudo dnf clean all
    sudo dnf distro-sync
elif grep -q "ID=linuxmint" /etc/os-release 2>/dev/null; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Apt)...${RESET}"
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
elif grep -q "ID=debian" /etc/os-release 2>/dev/null; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Apt)...${RESET}"
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
elif grep -q "ID=ubuntu" /etc/os-release 2>/dev/null; then
    echo -e "${VERDE}[1/3] Atualizando pacotes do sistema (Apt)...${RESET}"
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    sudo snap refresh
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
elif [ -f /etc/os-release ] && grep -q "solus" /etc/os-release; then
    sudo eopkg delete-cache # Deletar cache
    sudo eopkg rmo # Remover pacotes orfãos
elif [ -f /etc/os-release ] && grep -q "opensuse" /etc/os-release; then
    sudo zypper clean -a
elif grep -q "ID=linuxmint" /etc/os-release 2>/dev/null; then
    sudo apt-get autoremove -y
    sudo apt-get autoclean
elif grep -q "ID=ubuntu" /etc/os-release 2>/dev/null; then
    sudo apt-get autoremove -y
    sudo apt-get autoclean
elif grep -q "ID=debian" /etc/os-release 2>/dev/null; then
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


