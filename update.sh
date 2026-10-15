#!/bin/bash
#
# Rodar no terminal
# cat /etc/os-release



#!/bin/bash
#
# Script de Atualização Universal
#

# Sair imediatamente se algum comando falhar
set -e

# Cores para facilitar a leitura
VERDE='\033[0;32m'
AZUL='\033[0;34m'
VERMELHO='\033[0;31m'
RESET='\033[0m'

echo -e " "
echo -e "${AZUL}--- Iniciando Atualização Completa ---${RESET}"
echo -e " "

# Carrega as variáveis do sistema (/etc/os-release)
if [ -f /etc/os-release ]; then
    source /etc/os-release
else
    echo -e "${VERMELHO}Arquivo /etc/os-release não encontrado. Não foi possível identificar o sistema.${RESET}"
    exit 1
fi

# 1. Atualizar Pacotes do Sistema
echo -e "${VERDE}[1/3] Atualizando pacotes do sistema ($NAME)...${RESET}"

case "$ID" in
    fedora)
        sudo dnf upgrade --refresh -y
        ;;
    solus)
        sudo eopkg up -y
        ;;
    opensuse-tumbleweed|opensuse-leap|opensuse)
        sudo systemctl stop --now packagekit 2>/dev/null || true
        sudo zypper ref
        sudo zypper dup
        ;;
    openmandriva)
        sudo dnf clean all
        sudo dnf distro-sync -y
        ;;
    ubuntu)
        sudo apt-get update
        sudo apt-get dist-upgrade -y
        if command -v snap &> /dev/null; then
            sudo snap refresh
        fi
        ;;
    debian|linuxmint|pop)
        sudo apt-get update
        sudo apt-get dist-upgrade -y
        ;;
    *)
        echo -e "${VERMELHO}Distribuição ($ID) não mapeada explicitamente para update.${RESET}"
        ;;
esac

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

case "$ID" in
    fedora|openmandriva)
        sudo dnf clean all
        ;;
    solus)
        sudo eopkg delete-cache
        sudo eopkg rmo -y
        ;;
    opensuse-tumbleweed|opensuse-leap|opensuse)
        sudo zypper clean -a
        ;;
    debian|ubuntu|linuxmint|pop)
        sudo apt-get autoremove -y
        sudo apt-get autoclean
        ;;
esac

# Limpa logs antigos (mantém apenas os últimos 2 dias)
echo -e "${VERDE}Limpando logs com mais de 2 dias...${RESET}"
sudo journalctl --vacuum-time=2d

# Limpa cache de miniaturas do usuário
echo -e "${VERDE}Limpando cache de thumbnails...${RESET}"
rm -rf ~/.cache/thumbnails/*

echo -e " "
echo -e "${AZUL}--- Sistema Atualizado e Limpo! ---${RESET}"
echo -e " "

if command -v fastfetch &> /dev/null; then
    fastfetch
fi

# Pergunta sobre desligar ou reiniciar
echo -e " "
echo -e -n "${VERDE}Tudo pronto! Deseja desligar ou reiniciar o sistema agora? (d/r/n): ${RESET}"
read RESPOSTA

# Converte a resposta para minúsculas
RESPOSTA=$(echo "$RESPOSTA" | tr '[:upper:]' '[:lower:]')

if [[ "$RESPOSTA" =~ ^(d|desligar|shutdown)$ ]]; then
    echo -e "\n${VERDE}A desligar o sistema... Atempadamente! :)${RESET}\n"
    sudo shutdown now
elif [[ "$RESPOSTA" =~ ^(r|reiniciar|reboot)$ ]]; then
    echo -e "\n${VERDE}A reiniciar o sistema... :)${RESET}\n"
    sudo reboot
else
    echo -e "\n${VERDE}Lembre-se de reiniciar ou desligar mais tarde para aplicar todas as alterações :)${RESET}\n"
fi
