
# 🚀 Guia Pós-Instalação: Fedora KDE (Xeon & AMD Edition)

Guia de configuração otimizado para o hardware Xeon E5 2650 V4 e GPU RX 6600.



<br>

## 📑 Índice de Instalação e Configuração

* 🖥️ **1. Hardware e Boot**
    * [Above 4G Decoding](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#above-4g-decoding)
    * [Resizable BAR (Ajuste Visual do GRUB)](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#resizable-bar-ajuste-visual-do-grub)
    * [Drivers Broadcom (Wi-Fi)](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#drivers-broadcom-wi-fi)
* 🛠️ **2. Otimizações de Performance (DNF & Kernel)**
    * [Acelerar o Gerenciador de Pacotes (DNF)](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#acelerar-o-gerenciador-de-pacotes-dnf)
    * [Otimização do Kernel (Sysctl)](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#otimiza%C3%A7%C3%A3o-do-kernel-sysctl)

* 📦 **3. Repositórios e Codecs**
    * [Habilitar RPM Fusion](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#habilitar-rpm-fusion)
    * [Plugins de Áudio e Vídeo](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#plugins-de-%C3%A1udio-e-v%C3%ADdeo)
* 💻 **4. Apps e Desenvolvimento**
    * [Visual Studio Code](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#visual-studio-code)
    * [Node.js, Cypress e Python](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#nodejs-cypress-e-python)
    * [Instalação Cypress](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#instala%C3%A7%C3%A3o-cypress)
    * [Rodar Cypress](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#rodar-cypress)
    * [Fontes e Apps Essenciais](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#fontes-e-apps-essenciais)
* 🐚 **5. Customização do Terminal (ZSH)**
    * [Instalação e Oh My Zsh](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#instala%C3%A7%C3%A3o-e-oh-my-zsh)
    * [Plugins do ZSH](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#plugins-do-zsh)
* 🧹 **6. Limpeza de Bloatwares**
    * [Removendo apps não usados](https://github.com/danieldilorenzo/install_linux/blob/main/fedoraKDE.md#removendo-apps-n%C3%A3o-usados)

<br>

## 🖥️ 1. Hardware e Boot


### Above 4G Decoding

**O que é:** Uma configuração de endereçamento de dispositivos PCIe de 64 bits.

**O que faz no sistema:** Ela prepara o "terreno" para que o sistema operacional consiga enxergar dispositivos com grandes quantidades de memória. No seu setup, ela é o pré-requisito obrigatório para o Resizable BAR. Sem ela ativada, o Xeon fica limitado a endereçar apenas uma fração minúscula da memória da sua RX 6600, criando um gargalo de comunicação.

**Risco:** Baixo. Em casos raros, se o sistema operacional for muito antigo (32 bits), ele não dará boot. No seu Fedora 64 bits, é essencial.

```bash
Entrar na BIOS

Vá até a aba Advanced (usando as setas do teclado).

Procure por algo como PCI Devices Common Settings.

Dentro desse menu, você deve encontrar as duas opções principais:

Above 4G Decoding: Mude para Enabled.

Re-size BAR Support: Mude para Auto ou Enabled (essa opção só costuma aparecer depois que você ativa o Above 4G).
```

<br>

### Resizable BAR (Ajuste Visual do GRUB)

****O que é:** Uma tecnologia do protocolo PCI Express que permite ao processador acessar toda a memória de vídeo (VRAM) de uma vez.

**O que faz no sistema:** No seu caso, remove o limite de 256MB e entrega os 8GB da RX 6600 diretamente para o Xeon E5 2650 V4. Isso melhora a comunicação entre CPU e GPU, estabilizando o FPS em jogos pesados.

**Risco:** Baixo/Médio. Em placas X99, se o sistema não estiver em modo UEFI nativo, o PC pode dar tela preta no boot (exigindo um Reset de BIOS). Como o seu já validamos, o risco agora é inexistente.


```bash 
sudo nano /etc/default/grub
```

Mude/Adicione as linhas:


    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
    GRUB_DEFAULT=saved
    GRUB_DISABLE_SUBMENU=true
    # GRUB_TERMINAL_OUTPUT="console"
    GRUB_CMDLINE_LINUX="rhgb quiet"
    GRUB_DISABLE_RECOVERY="true"
    GRUB_ENABLE_BLSCFG=true
    GRUB_GFXMODE=1920x1080


Atualize a configuração: 


```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

### Drivers Broadcom (Wi-Fi)
```bash
sudo dnf install kernel-devel akmod-wl kmod-wl broadcom-wl
```

<br>

## 🛠️ 2. Otimizações de Performance (DNF & Kernel)

### Acelerar o Gerenciador de Pacotes (DNF)

Editar o arquivo

```bash
    sudo nano /etc/dnf/dnf.conf

```
Colando o conteúdo abaixo

```bash
    max_parallel_downloads=10
    fastestmirror=True
```


### Otimização do Kernel (Sysctl)

- **O que é:** O sysctl é uma interface que permite ler e modificar os parâmetros do Kernel do Linux em tempo de execução. Esses parâmetros ficam localizados em /proc/sys/. Quando falamos de "Otimização via Sysctl", estamos ajustando variáveis de rede, gerenciamento de memória (virtual memory) e sistema de arquivos para que o sistema se comporte de forma mais ágil para o seu uso específico (desktop, gaming ou servidor).
O que isso vai fazer no sistema?

- **O que faz no sistema:** Basicamente, ele altera as "regras de prioridade" do Kernel. Por exemplo:

    Swappiness: Define o quanto o sistema deve priorizar o uso da memória RAM antes de começar a jogar dados para o Swap (disco).

    Cache Pressure: Ajusta a rapidez com que o sistema recupera memória usada para cache de arquivos.

    Network Buffers: Melhora a latência e a velocidade de download ao aumentar o tamanho das janelas de recebimento de dados.

- **Nível de Risco:** Médio

<br>
<br>

>[!IMPORTANT]
>Por que médio? Se você colocar valores extremos (como zerar o swap completamente ou mexer em limites de processos), o sistema pode sofrer de Kernel Panic ou travar quando a memória estiver cheia. É preciso usar valores testados pela comunidade.

<br>
<br>

Editando o perfi

```bash
sudo nano /etc/sysctl.d/99-performance.conf
```


Cole o conteúdo

```bash

vm.swappiness=10
vm.vfs_cache_pressure=50
vm.dirty_ratio=10
vm.dirty_background_ratio=5

```

<br>


## 📦 3. Repositórios e Codecs

### Habilitar RPM Fusion

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
### Plugins de Áudio e Vídeo

```bash
sudo dnf install gstreamer1-plugins-{bad-*,good-*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel && sudo dnf install lame* --exclude=lame-devel
```

<br>




## 💻 4. Apps e Desenvolvimento

### Visual Studio Code
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && sudo dnf install code -y

### Node.js, Cypress e Python

```bash
sudo dnf install npm nodejs git curl python3-idle android-tools fastboot 
```

#### Instalação Cypress
    
```bash
npm install cypress --save-dev
```
#### Rodar Cypress

```bash
npx cypress open
```

### Fontes e Apps Essenciais
    sudo dnf install fira-code-fonts ibm-plex-mono-fonts jetbrains-mono-fonts-all steam ktorrent kweather 
    flatpak remote-add --if-not-exists flathub [https://flathub.org/repo/flathub.flatpakrepo](https://flathub.org/repo/flathub.flatpakrepo)
    sudo flatpak install flathub org.gnome.Boxes 

<br>


## 🐚 5. Customização do Terminal (ZSH)

### Instalação e Oh My Zsh

```bash
sudo dnf install zsh util-linux-user 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Plugins do ZSH

```bash
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting
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
```
<br>

## 🧹 6. Limpeza de Bloatwares

### Removendo apps não usados

```bash
sudo dnf remove kf5-akonadi* kamera kamoso krdc krfb kmail* kmines kmouth kolourpaint* kontact* konversation korganizer* libreoffice* pim-data-exporter* pim-sieve-editor* akregator.x86_64 akregator-libs.x86_64 kf5-akonadi-calendar.x86_64 kf5-akonadi-contacts.x86_64 kf5-akonadi-mime.x86_64 kf5-akonadi-notes.x86_64 kf5-akonadi-search.x86_64 kf5-akonadi-server.x86_64 kf5-akonadi-server-mysql.x86_64  kamera.x86_64 kamoso.x86_64 kdepim-addons.x86_64 krdc krfb kdepim-runtime.x86_64 kdepim-runtime-libs.x86_64 kmag.x86_64 kmahjongg.x86_64 kmail.x86_64 kmail-account-wizard.x86_64 kmail-libs.x86_64 kmines.x86_64 kmouth.x86_64 kolourpaint.x86_64 kolourpaint-libs.x86_64 kontact.x86_64 kontact-libs.x86_64 konversation.x86_64 korganizer.x86_64 korganizer-libs.x86_64 kwrite.x86_64 libreoffice-calc.x86_64 libreoffice-core.x86_64 libreoffice-data.x86_64 libreoffice-draw.x86_64 libreoffice-emailmerge.x86_64 libreoffice-graphicfilter.x86_64 libreoffice-gtk3.x86_64 libreoffice-gtk4.x86_64 libreoffice-help-en.x86_64 libreoffice-impress.x86_64 libreoffice-kf5.x86_64 libreoffice-langpack-en.x86_64 libreoffice-math.x86_64 libreoffice-ogltrans.x86_64 libreoffice-opensymbol-fonts.noarch libreoffice-pdfimport.x86_64 libreoffice-pyuno.x86_64 libreoffice-ure.x86_64 libreoffice-ure-common.x86_64 libreoffice-writer.x86_64 libreoffice-x11.x86_64 pim-data-exporter.x86_64 pim-data-exporter-libs.x86_64 pim-sieve-editor.x86_64
```
