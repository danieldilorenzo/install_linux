#!/bin/bash
#
# ======================================
# ||                                  ||
# || SCRIPT DE ATUALIZAÇÃO UNIVERSAL  ||
# ||                                  ||
# ======================================
#
# Para pegar o id da distro linux, rodar no terminal
#
# cat /etc/os-release
# Script de Atualização Universal
#
# Distros compatíveis com esse script
#
# Debian e baseadas
# openSUSE e baseadas
# Arch Linux e baseadas
# Fedora e baseadas
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
echo -e "${VERDE}[1/4] Atualizando pacotes do sistema ($NAME)...${RESET}"

case "$ID" in
    fedora)
        sudo dnf upgrade --refresh
        ;;
    solus)
        sudo eopkg up
        ;;
    opensuse-tumbleweed|opensuse-leap|opensuse)
        sudo systemctl stop --now packagekit 2>/dev/null || true
        sudo zypper ref
        sudo zypper dup
        ;;
    openmandriva)
        sudo dnf clean all
        sudo dnf distro-sync
        ;;
    ubuntu)
        sudo apt-get update
        sudo apt-get dist-upgrade
        if command -v snap &> /dev/null; then
            sudo snap refresh
        fi
        ;;
    debian|linuxmint|pop)
        sudo apt-get update
        sudo apt-get dist-upgrade
        ;;
    arch)
        echo -e "${AZUL}\nVeja as Latest News em archlinux.org para ver se não tem alguma necessidade de intervenção manual.\n${RESET}"
        read -p "$(echo -e "${AZUL}Deseja continuar com a atualização do Arch? (s/n): ${RESET}")" RESPOSTA
        RESPOSTA=$(echo "$RESPOSTA" | tr '[:upper:]' '[:lower:]')

        if [[ "$RESPOSTA" =~ ^(s|sim)$ ]]; then
            sudo pacman -Syu
        else
            echo -e "${VERMELHO}\nAtualização do sistema pulada pelo usuário. Prosseguindo com o restante...${RESET}"
        fi
        ;;
    *)
        echo -e "${VERMELHO}Distribuição ($ID) não mapeada explicitamente para update.${RESET}"
        ;;
esac

# 2. Atualizar Flatpaks
if command -v flatpak &> /dev/null; then
    echo -e " "
    echo -e "${VERDE}\n[2/4] Atualizando Flatpaks...${RESET}"
    flatpak update -y
    flatpak uninstall --unused -y
fi

# 3. Limpeza de Cache e Logs
echo -e " "
echo -e "${VERDE}\n[3/4] Iniciando limpeza de primavera...${RESET}"

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
    arch)
        # Remove pacotes órfãos (não explicitamente instalados e sem dependências)
        if pacman -Qdtq &> /dev/null; then
            echo -e "${AZUL}Removendo pacotes órfãos...${RESET}"
            sudo pacman -Rns $(pacman -Qtdq) --noconfirm
        else
            echo -e "${AZUL}Nenhum pacote órfão encontrado.${RESET}"
        fi

        # Limpa o cache antigo de pacotes do pacman (mantém apenas as versões atuais e a anterior)
        if command -v paccache &> /dev/null; then
            echo -e "${AZUL}Limpando cache antigo do Pacman (mantendo as 2 últimas versões)...${RESET}"
            sudo paccache -r
        else
            echo -e "${AZUL}Limpando cache do Pacman (removendo pacotes desinstalados)...${RESET}"
            sudo pacman -Sc --noconfirm
        fi
        ;;
    debian|ubuntu|linuxmint|pop)
        sudo apt-get autoremove -y
        sudo apt-get autoclean
        ;;
esac

# Atualiza o bootloader
echo -e " "
echo -e "${VERDE}\n[4/4] Atualizando bootloader...${RESET}"

if command -v clr-boot-manager >/dev/null 2>&1; then
        echo "Atualizando bootloader do Solus (clr-boot-manager)..."
        sudo clr-boot-manager update
    elif command -v grub-mkconfig >/dev/null 2>&1 && [ -d /boot/grub ]; then
        echo "Atualizando GRUB (Arch)..."
        sudo grub-mkconfig -o /boot/grub/grub.cfg
    elif command -v grub2-mkconfig >/dev/null 2>&1 && [ -d /boot/grub2 ]; then
        echo "Atualizando GRUB2 (Fedora/openSUSE)..."
        sudo grub2-mkconfig -o /boot/grub2/grub.cfg
    elif command -v bootctl >/dev/null 2>&1 && bootctl is-installed >/dev/null 2>&1; then
        echo "Atualizando systemd-boot..."
        sudo bootctl update
    else
        echo "Nenhum gerenciador de boot ativo detectado."
    fi

# Limpa logs antigos (mantém apenas os últimos 2 dias)

echo -e " "
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

# Pergunta sobre o reboot
echo -e " "
echo -e -n "${AZUL}\n\nTudo pronto! Deseja desligar ou reiniciar o sistema agora? (d/r/n): ${RESET}"
read RESPOSTA

RESPOSTA=$(echo "$RESPOSTA" | tr '[:upper:]' '[:lower:]')

if [[ "$RESPOSTA" =~ ^(d|D)$ ]]; then
    sudo shutdown
elif [[ "$RESPOSTA" =~ ^(r|R)$ ]]; then
    sudo reboot
else
    echo -e "\n${AZUL}Lembre-se de reiniciar mais tarde para aplicar todas as alterações :)${RESET}\n"
fi
