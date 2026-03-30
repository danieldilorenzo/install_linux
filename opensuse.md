# Pós Instalação OpenSUSE Tumbleweed KDE


<br>

## 📑 Índice de Instalação e Configuração

* 🚀 **Performance & Kernel**
    * [Instalar Zram Generator](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-zram-generator)
    * [Otimização do Kernel (sysctl)](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#otimiza%C3%A7%C3%A3o-do-kernel-sysctl)
    * [Acelerar Downloads do Zypper](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#acelerar-downloads-do-zypper)
    * [Ajuste de Desligamento Rápido](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#ajuste-de-desligamento-r%C3%A1pido)
    * [Instalar Thermald](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-thermald)
    * [Arrumar periféricos que não iniciam com o sistema](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#arrumar-perif%C3%A9ricos-que-n%C3%A3o-iniciam-com-o-sistema)

* 🔄 **Backup e rollback**
    * [Gerenciando Snapper e Rollback](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#gerenciando-snapper-e-rollback)

* 📦 **Gerenciamento de Pacotes & Drivers**
    * [Instalar OPI](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-opi)
    * [Instalar drivers ADB](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-drivers-adb)
    * [Instalar Wget & Curl](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#wget--curl)
    * [Instalar NPM](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-npm)
    * [Instalar Git](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-git)

* 💻 **Terminal & Shell**
    * [Instalar ZSH](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-zsh)
        * └─ [Configurar ZSH](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-zsh)
    * [Instalar Fastfetch](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-fastfetch)

* 🌐 **Navegação & Web**
    * [Ajuste de Cores Estouradas no Chrome](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#ajuste-de-cores-estouradas-no-chrome)
        * └─ [No KDE Plasma](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#no-kde-plasma)
        * └─ [No Gnome](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#no-gnome)

* 🎨 **Interface & Customização**
    * [Instalar Wallpapers](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-wallpapers)
    * [Instalar Fontes](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-fontes)
    * [Instalar Papirus Icons & Folders](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-papirus-icons--folders)

* 🛠️ **Ferramentas & Utilidades**

    * [Instalar Flatpak](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-flatpak)
    * [Instalar Idle](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-idle)
    * [Instalar Gnome Boxes](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-gnome-boxes)
    * [Instalar Gerenciador de Partiçōes](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-gerenciador-de-parti%C3%A7%C3%B5es)
    * [Instalar KDE Imagewriter](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-kde-imagewriter)
    * [Instalar KDE Connect](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-kde-connect)
    * [Instalar ferramentas para controle Xbox](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-ferramentas-para-controle-xbox)

* 🎮 **Guia Técnico: GE-Proton no Linux**

   * [Proton: Instalando e configurando](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#proton-instalando-e-configurando)

* 🎵 **Multimídia & Apps KDE**
    * [Instalar Elisa](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-elisa)
    * [Instalar Ktorrent](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-ktorrent)
    * [Instalar KDE Weather](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-kde-weather)

* ⚡ **Instalação Expressa**
    * [Instalar tudo junto](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#instalar-tudo-junto)

* 🧹 **Atualização e limpeza do sistema**
    * [Script para atualização e limpeza do sistema (Sistema, Flatpak e Firmware)](https://github.com/danieldilorenzo/install_linux/blob/main/opensuse.md#script-para-atualiza%C3%A7%C3%A3o-e-limpeza-do-sistema-sistema-flatpak-e-firmware)

## Instalar Zram Generator


- **O que é?** Um utilitário que cria dispositivos de swap comprimidos na RAM.

- **O que faz no sistema?** Melhora o multitarefa em sistemas com pouca memória, evitando que o PC trave ao usar o disco rígido como swap lento. No Fedora, isso já vem por padrão, mas no openSUSE pode ser um ajuste interessante.

- **Risco:** Baixo.

<br>

Instalação:

```bash
sudo zypper in zram-generator
```

Após isso, editar o arquivo:

```bash
sudo nano /etc/systemd/zram-generator.conf
```

<br>

```bash

[zram0]
zram-size = min(ram / 2, 8192)
compression-algorithm = zstd
swap-priority = 100
fs-type = swap

```

Reiniciar os serviços para iniciar a zram

```bash
sudo systemctl daemon-reload
```

Iniciando a zram

```bash
sudo systemctl start /dev/zram0
```

Verificando se está iniciado

```bash
sudo zramctl
```

- **Revertendo:**

Editar o arquivo ```sudo nano /etc/systemd/zram-generator.conf```, salvando e reiniciando a máquina.
  
<br>
<br>


## Otimização do Kernel (Sysctl)

- **O que é:** O sysctl é uma interface que permite ler e modificar os parâmetros do Kernel do Linux em tempo de execução. Esses parâmetros ficam localizados em /proc/sys/. Quando falamos de "Otimização via Sysctl", estamos ajustando variáveis de rede, gerenciamento de memória (virtual memory) e sistema de arquivos para que o sistema se comporte de forma mais ágil para o seu uso específico (desktop, gaming ou servidor).
O que isso vai fazer no sistema?

- **O que faz no sistema:** Basicamente, ele altera as "regras de prioridade" do Kernel. Por exemplo:

    Swappiness: Define o quanto o sistema deve priorizar o uso da memória RAM antes de começar a jogar dados para o Swap (disco).

    Cache Pressure: Ajusta a rapidez com que o sistema recupera memória usada para cache de arquivos.

    Network Buffers: Melhora a latência e a velocidade de download ao aumentar o tamanho das janelas de recebimento de dados.

- **Nível de Risco:** Médio

<br>
<br>

> [!IMPORTANT]
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

- **Como reverter:** edite novamente o perfil com

```bash
sudo nano /etc/sysctl.d/99-performance.conf
```

Em seguida, reinicie o sistema.

<br>
<br>

## Acelerar Downloads do Zypper

*O que é:*  Uma alteração na configuração do gerenciador de pacotes libzypp.
*O que faz:* Permite que o Zypper baixe até 10 pacotes simultaneamente durante o `zypper dup`, em vez de baixar um por um. Isso reduz drasticamente o tempo de atualização em conexões rápidas.

```bash
sudo sed -i 's/# max_concurrent_connections = 0/max_concurrent_connections = 10/' /etc/zypp/zypp.conf
```

*Revertendo:* 

```bash
sudo sed -i 's/max_concurrent_connections = 10/# max_concurrent_connections = 0/' /etc/zypp/zypp.conf
```


## Ajuste de Desligamento Rápido


*O que é:* Uma modificação no tempo de espera (timeout) do gerenciador de serviços systemd.

*O que faz:* Reduz o tempo que o sistema espera por um serviço "travado" antes de forçar o desligamento. O padrão do Linux é 90 segundos; este ajuste reduz para 10 segundos, tornando o reboot/shutdown muito mais ágil.


```bash
sudo sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=10s/' /etc/systemd/system.conf
sudo systemctl daemon-reload
```

*Revertendo:*

```bash
sudo sed -i 's/DefaultTimeoutStopSec=10s/#DefaultTimeoutStopSec=90s/' /etc/systemd/system.conf
sudo systemctl daemon-reload
```




## Instalar Thermald


- **O que é:** O Thermald é um daemon (um serviço que roda em segundo plano) desenvolvido pela Intel para plataformas Linux. Ele monitora de forma inteligente os sensores de temperatura do processador e de outros componentes do hardware.
O que isso vai fazer no sistema?

Ele atua como um "gerente de crise térmica". Ao contrário do controle padrão do Kernel, que às vezes demora a reagir ou é agressivo demais, o Thermald usa algoritmos e tabelas de configuração específicas para:

    Prevenir o superaquecimento: Antes que o processador atinja uma temperatura crítica, o Thermald ajusta a frequência (throttling) de forma suave.

    Controle de Ventoinhas: Ele tenta equilibrar a performance com o ruído das ventoinhas.

    Prazos de Turbo: Ele gerencia o tempo que o processador pode ficar em "Turbo Boost" sem comprometer a integridade térmica do laptop.

- **Nível de Risco:** Baixo

É uma ferramenta oficial da Intel e muito segura. O pior que pode acontecer é uma leve queda de performance em tarefas pesadas se o daemon decidir que o notebook está quente demais, mas isso protege a vida útil do seu hardware.

<br>

>[!TIP] 
>Compatibilidade: Embora seja focado em CPUs Intel (Sandy Bridge em diante), ele funciona muito bem em laptops modernos. Se o usuário estiver usando um PC Desktop com um sistema de refrigeração robusto (Air Cooler gigante ou Water Cooler), o Thermald é menos necessário, sendo essencial apenas para usuários de notebooks.

<br>

Instalando e iniciando:

```bash
sudo zypper in thermald
sudo systemctl enable --now thermald
```

- **Revertendo:** Rode o comando abaixo, e após isso, reinicie o notebook

```bash
sudo zypper remove thermald
```

<br>



## Arrumar periféricos que não iniciam com o sistema


- **O que acontece:** Ao ligar o computador, o teclado e o mouse conectados via Hub USB permanecem desligados (sem LEDs acesos) e não respondem, sendo necessário reiniciar ou desconectar e conectar novamente para funcionarem.

- **Porque acontece:** O Kernel Linux, por padrão, tenta economizar energia suspendendo portas USB que ele interpreta como ociosas logo nos primeiros segundos do boot (*Autosuspend*). Isso pode impedir que o Hub "acorde" a tempo de alimentar os periféricos.

- **Resolução:** A forma mais definitiva de resolver é desativar o autosuspend globalmente através dos parâmetros do Kernel.


<br>
Abra o terminal e execute:

```bash
sudo nano /etc/default/grub
```

<br>
Localize a linha ```GRUB_CMDLINE_LINUX_DEFAULT``` e adicione o parâmetro usbcore.autosuspend=-1 ao final das opções, dentro das aspas.

```bash
GRUB_CMDLINE_LINUX_DEFAULT="splash=silent mitigations=auto quiet security=selinux selinux=1 amdgpu.ppfeaturemask=0xffffffff usbcore.autosuspend=-1"
```

<br>
No meu, ficou

```bash
GRUB_CMDLINE_LINUX_DEFAULT="splash=silent mitigations=auto quiet security=selinux selinux=1 amdgpu.ppfeaturemask=0xffffffff usbcore.autosuspend=-1"
```

<br>
Aplicar as configurações

```bash
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```
<br>

Reiniciar

<br>

## 🦎 Gerenciando Snapper e Rollback

### 1. O que é?
O **Snapper** é uma ferramenta de gerenciamento de snapshots (instantâneos) para sistemas de arquivos Linux. No openSUSE, ele vem integrado nativamente ao sistema de arquivos **Btrfs**, permitindo criar pontos de restauração do sistema de forma eficiente e automática.

### 2. O que faz no sistema?
Ele funciona como um seguro para o seu sistema operacional:
* **Snapshots Automáticos (Timeline):** Registra o estado do sistema periodicamente (de hora em hora).
* **Snapshots de Transação (Zypper):** Cria um ponto de restauração antes e depois de qualquer instalação ou atualização de pacotes.
* **Rollback Nativo:** Permite reverter o sistema inteiro para um estado anterior diretamente pelo menu de boot (GRUB).
* **Diferenciação de Arquivos:** Permite comparar o que mudou em arquivos de configuração entre dois momentos específicos.

### 3. Riscos

> [!CAUTION]
> **Snapshots não são backups!** Eles residem no mesmo disco físico. Se o seu SSD falhar, você perderá o sistema e os snapshots. Para segurança real, mantenha backups em drives externos ou nuvem.

* **Consumo de Espaço:** Sem limites configurados, os snapshots podem ocupar todo o espaço do disco.
* **Fragmentação:** Em discos mecânicos (HDDs), o excesso de snapshots pode causar fragmentação; em SSDs, o impacto é desprezível.


### 4. Guia de Configuração (Otimização)

Para evitar o consumo excessivo de disco, edite o arquivo de configuração da partição raiz:
`sudo nano /etc/snapper/configs/root`

#### Configurações Recomendadas para SSDs

| Parâmetro | Valor Sugerido | Descrição |
| :--- | :--- | :--- |
| **TIMELINE_LIMIT_HOURLY** | `3` | Mantém as últimas 3 horas de uso. |
| **TIMELINE_LIMIT_DAILY** | `5` | Mantém um snapshot por dia dos últimos 5 dias. |
| **TIMELINE_LIMIT_WEEKLY** | `1` | Mantém apenas um registro da semana anterior. |
| **TIMELINE_LIMIT_MONTHLY** | `0` | Desativa retenção mensal (recomendado para Rolling Release). |
| **NUMBER_LIMIT** | `4-10` | Mantém entre 4 e 10 pares de snapshots do Zypper. |
| **NUMBER_LIMIT_IMPORTANT** | `4` | Retém snapshots de atualizações grandes/críticas. |
| **FREE_LIMIT** | `0.2` | Inicia limpeza forçada se o espaço livre for menor que 20%. |

> [!TIP]
> Após salvar, você pode forçar a limpeza imediata com os comandos:
> `sudo snapper cleanup timeline` e `sudo snapper cleanup number`


### 5. Procedimento de Emergência: O Rollback 🔄

Se o sistema quebrar ou não iniciar corretamente após uma atualização ou modificação:

#### Parte A: O Boot em modo Snapshot
1. Reinicie o computador.
2. No menu do GRUB (tela de boot), selecione a opção **"Start bootloader from a read-only snapshot"**.
3. Escolha um snapshot da lista (geralmente o último funcional).
4. O sistema iniciará em modo de **apenas leitura**. Verifique se o erro desapareceu.

#### Parte B: Tornar a Reversão Permanente
Uma vez dentro do sistema (ainda no modo leitura):
1. Abra o terminal.
2. Execute o comando principal de restauração:
 
   ```bash
   sudo snapper rollback
   ```
   
3. O Snapper definirá este snapshot como o novo estado padrão ("root") do sistema.
4. Reinicie o computador para sair do modo de leitura e voltar ao sistema normal:

    ```bash
   sudo reboot
   ```

### 6. Comandos Úteis de Diagnóstico e Manutenção

| Comando | O que faz? |
| :--- | :--- |
| `snapper list` | Exibe todos os snapshots, IDs, datas e descrições. |
| `snapper diff ID1..ID2` | Mostra a diferença de conteúdo entre dois snapshots. |
| `snapper create -d "Nome"` | Cria um snapshot manual com uma descrição. |
| `sudo btrfs filesystem du -s /` | Calcula o uso de disco real (Btrfs). |
| `sudo snapper delete [ID]` | Remove um snapshot manualmente. |
| `sudo systemctl status snapper-cleanup.timer` | Verifica se o serviço de limpeza automática está ativo. |

<br>

## Instalar OPI

- **O que é:** O OPI é uma ferramenta de linha de comando que automatiza a busca e instalação de pacotes a partir do OBS (Open Build Service). Pense nele como uma ponte facilitada entre o seu terminal e os milhares de repositórios experimentais e comunitários do ecossistema openSUSE. Além disso, ele possui "atalhos" para instalar codecs e softwares proprietários.
O que isso vai fazer no sistema?

Ele simplifica a gestão de repositórios externos. Em vez de você ter que entrar no site software.opensuse.org, procurar o repositório correto, adicioná-lo manualmente via zypper ar e importar chaves GPG, o OPI faz tudo isso por você:

    Busca: Procura o nome do software no OBS.

    Seleção: Lista as versões disponíveis e de quais usuários/projetos elas vêm.

    Instalação: Adiciona o repositório temporário, instala o pacote e pergunta se você deseja manter ou remover o repositório depois.

    Codecs: Com um único comando (opi codecs), ele configura os repositórios Packman e instala todos os codecs necessários para vídeos e áudio.

- **Nível de Risco:** Médio

>[!WARNING]
>Por que médio? O risco não vem da ferramenta em si, mas do que você instala com ela. O OBS permite que qualquer usuário crie repositórios. Instalar algo de um repositório "home:usuario" aleatório pode causar conflitos de dependências ou instabilidade no sistema. Prefira sempre repositórios oficiais de projetos conhecidos.

Instalando:

```bash
sudo zypper in opi
```

Instalando codecs, Chrome, VSCode e Steam e fontes da Microsoft:

```bash
opi codecs                    # Codecs de áudio / vídeo
opi google-chrome             # Google Chrome
opi vscode                    # Visual Studio Code
opi steam                     # Steam
opi ms-fonts                  # Fontes da Microsoft
opi android-tools             # Ferramentas ADB
opi android-udev-rules        # Android Udev Rulas


```

<br>
<br>

- **Como reverter:** Para remover o que foi instalado, você usa o zypper remove. Se o OPI deixou um repositório ativado que você não quer mais, você deve removê-lo via YaST Software Repositories ou pelo comando ```sudo zypper rr <nome_do_repo>```.

<br>

>[!TIP]
>O OPI é famoso por facilitar a vida com softwares "chatos" no Linux. Além do opi codecs, ele tem comandos rápidos para o Google Chrome, Skype, Teamviewer e até drivers da NVIDIA. É a forma mais limpa de instalar esses apps sem baixar .rpm soltos da internet.

<br>
<br>

## Instalar drivers ADB


- **O que é:** O ADB é uma ferramenta de linha de comando que permite a comunicação entre o seu computador e um dispositivo Android. Ele faz parte do SDK Platform-Tools do Android e funciona como uma ponte para enviar comandos, transferir arquivos e acessar o shell do sistema do celular.
O que isso vai fazer no sistema?

A instalação dos drivers/ferramentas ADB no openSUSE habilita:

    Comunicação via USB/Wi-Fi: Permite que o sistema reconheça o celular em modo de depuração.

    Gerenciamento de Apps: Instalar (adb install) ou remover pacotes via terminal.

    Acesso ao Shell: Executar comandos diretamente no sistema operacional do Android.

    Fastboot: (Geralmente vem junto) Permite interagir com o celular em modo de bootloader para flashes de firmware ou desbloqueio de aparelhos.

- **Nível de Risco:** Baixo

Instalar as ferramentas não oferece risco ao Linux. O risco é apenas para o aparelho Android conectado, caso você execute comandos de modificação de sistema (como apagar partições ou dar flash em arquivos errados).

O openSUSE facilita muito isso, pois os pacotes estão nos repositórios oficiais.


    Configuração de Permissão (Crucial): Para que seu usuário comum consiga acessar o USB sem usar sudo, você deve adicionar seu usuário ao grupo udev ou dialout (dependendo da versão) ou garantir que as udev rules estejam instaladas.

<br>

- **Instalando:** 

Podemos rodar no terminal

```bash
sudo zypper in android tools
```

Ou

```bash
opi android-tools
```

<br>

- **Como reverter:** Executando no terminal
```bash
sudo zypper rm android-tools
```

<br>

>[!TIP]
>Configuração de Udev Rules: Muitas vezes o ADB instala, mas o comando adb devices retorna um erro de "no permissions". No openSUSE, a melhor forma de resolver isso permanentemente para quase todos os celulares do mercado é instalando o pacote android-udev-rules.

<br>

Para isso, executamos no terminal

```bash
sudo zypper in android-udev-rules
```

Ou

```bash
opi android-udev-rules
```

<br>

## Wget & Curl

- **O que é:** Ferramentas de linha de comando para transferência de dados. Permitem baixar arquivos e interagir com servidores via terminal. O curl é muito usado para instalar scripts (como o do NVM ou Docker), e o wget é o clássico para downloads diretos.

```bash
sudo zypper in wget curl
```


<br>


## Instalar NPM

- **O que é:** Gerenciador de pacotes Node.js.

```bash
sudo zypper in npm
```

<br>


## Instalar Git

- **O que é:** O sistema de controle de versão mais usado no mundo. Gerencia o histórico de alterações em códigos e arquivos. No Linux, é essencial para baixar (clonar) projetos diretamente do GitHub ou GitLab.
  
```bash
sudo zypper in git
```

<br>

## Instalar ZSH

```
sudo zypper in zsh git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


<br>


## Configurar ZSH

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

# Fazer a sugestão priorizar o que usamos por último
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

# Sources manuais para garantir o funcionamento
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Deixar as sugestões do autocomplete em ciano
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

```

<br>

## Instalar FastFetch

- **O que é:** Scripts de informação do sistema. Exibe o logo da sua distro  em ASCII junto com informações de hardware (CPU, GPU, RAM) e software (Kernel, Desktop Environment) de forma visual no terminal.
  
```bash
sudo zypper in fastfetch
```

<br>

## Ajuste de Cores Estouradas no Chrome 

Caso o navegador apresente cores "estouradas", superexposição ou brilho inconsistente em relação ao sistema, a solução é forçar o backend gráfico estável.

> [!IMPORTANT]
> O parâmetro `--use-gl=desktop` força o Chrome a usar o driver OpenGL nativo do sistema, ignorando pós-processamentos problemáticos do motor Chromium.

> [!WARNING]  
> **Consumo de Bateria:** Em laptops, isso pode gerar um consumo levemente superior, pois desativa algumas otimizações de economia de energia do navegador.

<br>


#### No KDE Plasma

**Método via interface gráfica (mais simples).**

1.  Abra o **Menu de Aplicativos** (Menu K).
2.  Localize o **Google Chrome** e clique com o **botão direito** > **Editar Aplicativo...**.
3.  Vá na aba **Aplicativo**.
4.  No campo **Comando**, localize a linha original:
    `google-chrome-stable %U`
5.  Altere para:
    ```bash
    google-chrome-stable --use-gl=desktop %U
    ```
6.  Clique em **OK**.

<br>

#### No GNOME

**Edição manual do arquivo .desktop via terminal.**

1.  **Copie o atalho para sua pasta local** (evita que atualizações do sistema resetem a configuração):
    ```bash
    cp /usr/share/applications/google-chrome.desktop ~/.local/share/applications/
    ```
2.  **Abra o arquivo para edição:**
    ```bash
    nano ~/.local/share/applications/google-chrome.desktop
    ```
3.  **Localize as linhas `Exec=`** (existem várias para modo anônimo, etc.).
4.  **Adicione o parâmetro** em todas elas. Exemplo:
    ```text
    Exec=/usr/bin/google-chrome-stable --use-gl=desktop %U
    ```
5.  **Salve e saia:** Pressione `Ctrl + O`, `Enter` e depois `Ctrl + X`.

> [!TIP]
> **Dica:** Caso a mudança não apareça de imediato no menu, force a atualização dos ícones com:
> `update-desktop-database ~/.local/share/applications/`


<br>

## Instalar wallpapers

```bash
sudo zypper in breeze6-wallpapers plasma6-workspace-wallpapers
```

<br>


## Instalar Fontes

```bash
sudo zypper in jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts
```

<br>


## Instalar Papirus Icons & Folders

- **O que é:** Pacote de ícone e pastas.
  
```bash
sudo zypper in papirus-icon-theme papirus-folders
```

<br>

## Instalar Flatpak

- **O que é:** Sistema de gerenciamento de pacotes focado em portabilidade e sandboxing

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```




## Instalar Idle 

- **O que é:** Editor simples para códigos de Python.

```bash
sudo zypper in python3-idle
```

<br>


## Instalar Gnome Boxes

- **O que é:** Programa de máquina virtual
  
```bash
sudo flatpak install flathub org.gnome.Boxes
```

<br>


## Instalar Gerenciador de partições

- **O que é:** Programa nativo do ambiente KDE que permite gerenciar, editando ou excluindo partições.

```bash
sudo zypper in partitionmanager
```

<br>

## Instalar KDE Imagewriter

- **O que é:** Grava imagens ISO em pendrives.

```bash
sudo zypper in imagewriter
```

<br>

## Instalar KDE Connect

- **O que é:** Ferramenta de integração total que permite a comunicação sem fio entre o seu computador (Linux) e o seu dispositivo móvel (Android ou iOS). Ele utiliza protocolos de rede local para criar uma ponte segura entre os aparelhos.
  
```bash
sudo zypper in kdeconnect-kde
```

<br>

## Instalar ferramentas para controle Xbox

- **O que é:** Configurar o sistema para garantir a total compatibilidade com o controle do Xbox Series S

Instalando dependências

```bash
sudo zypper install make bluez-devel kernel-devel kernel-default-devel curl dkms
```


Instalando o xpadneo

```bash
curl -L https://github.com/atar-axis/xpadneo/archive/master.zip -o xpadneo.zip && unzip xpadneo.zip && cd xpadneo-master && sudo ./install.sh
```

Mesmo com o driver, o controle de Xbox Series às vezes briga com o ERTM (um protocolo de retransmissão do Bluetooth). Para garantir que ele não fique desconectando:

Execute este comando para colocar o módulo para carregar, e desativar o ERTM permanentemente:

```bash
echo "hid_xpadneo" | sudo tee /etc/modules-load.d/xpadneo.conf && echo 'options bluetooth disable_ertm=1' | sudo tee /etc/modprobe.d/xbox_bt.conf
```

Após isso, ele deve pedir para reiniciar o PC / Notebook. Depois disso, já está pronto para usar.

<br>

## Proton: Instalando e configurando


O **GE-Proton** é uma ferramenta essencial para quem joga no Linux, especialmente em distribuições *rolling release* como o **openSUSE Tumbleweed** ou sistemas atualizados como o **Fedora**.

<br>

---

<br>

- **O que é:** O **GE-Proton** (GloriousEggroll Proton) é uma versão customizada do Proton da Valve. Ele é mantido por Thomas Crider (GloriousEggroll), um engenheiro da Red Hat. Ele combina as tecnologias da Valve com patches experimentais e correções que ainda não chegaram à versão oficial.

- **Pra que serve:** Ele atua como uma **camada de compatibilidade** avançada. Sua função é traduzir as instruções de jogos feitos para Windows (DirectX) para uma linguagem que o Linux entende (Vulkan). É o que permite que jogos como *Skyrim*, *Skyrim Special Edition* e *Cult of the Lamb* rodem com performance nativa no seu hardware.

- **Benefícios:** 
    * **Codecs de Vídeo:** Corrige problemas de telas pretas ou coloridas em cinemáticas (muito comum em jogos da Bethesda).
    * **FSR Integrado:** Permite usar o *AMD FidelityFX Super Resolution* em qualquer jogo, excelente para ganhar FPS em GPUs integradas como a **Intel Iris Xe**.
    * **Patches de Performance:** Inclui versões mais recentes do **DXVK** (DirectX 9/10/11 para Vulkan) e **VKD3D** (DirectX 12 para Vulkan).
    * **Estabilidade:** Resolve bugs de áudio e "crashes" específicos que a Valve pode demorar a atualizar na versão estável.


- **Como Instalar:** 

A forma mais simples de gerenciar versões no GNOME (openSUSE/Fedora) é via **Flatpak**:

1.  **Instalação do Gerenciador:**
#    ```bash
#    flatpak install flathub net.davidotti.emupower.ProtonUp-Qt
#    ```

   ```bash
   flatpak install flathub net.davidotek.pupgui2
   ```
    
2.  **Configuração do Diretório:**
    No openSUSE (RPM), garanta que o diretório de instalação no app aponte para:
    `~/.local/share/Steam/compatibilitytools.d/`

3.  **Adicionar Versão:** Clique em **"Add version"**, selecione **"GE-Proton"** e escolha a versão mais recente (ex: `GE-Proton10-34`).

<br>

> **Dica para openSUSE (Fix de Caminho):**
> Se o Steam não reconhecer a versão instalada, rode este comando no terminal para unir os diretórios:
> ```bash
> mkdir -p ~/.steam/root/compatibilitytools.d
> ln -s ~/.local/share/Steam/compatibilitytools.d/* ~/.steam/root/compatibilitytools.d/
> ```

<br>

- **Como Configurar na Steam:**

<br>

Após instalar e reiniciar a Steam completamente:

1.  Vá na sua **Biblioteca**.
2.  Clique com o botão direito no jogo > **Propriedades**.
3.  Acesse a aba **Compatibilidade**.
4.  Marque a caixa: **"Forçar o uso de uma ferramenta de compatibilidade do Steam Play específica"**.
5.  Selecione o **GE-Proton** desejado (geralmente ele aparece no final da lista).

<br>

### 🚀 Dica de Performance (Otimização Extra)
Para garantir que o sistema priorize o jogo, use o **GameMode** nas opções de inicialização (aba Geral):
`gamemoderun %command%`

<br>

## Instalar Elisa

- **O que é:** Reprodutor de músicas nativo do ambiente KDE..
  
```bash
sudo zypper in elisa
```

<br>


## Instalar KTorrent

- **O que é:** Cliente de BitTorrent e nativo do ambiente KDE.
  
```bash
sudo zypper in ktorrent
```

<br>


## Instalar KDE Weather

- **O que é:** Aplicativo de clima nativo do ambiente KDE..
  
```bash
sudo zypper in kweather
```


<br>



## Instalar tudo junto

```bash

sudo zypper in android-tools zsh breeze6-wallpapers plasma6-workspace-wallpapers python3-idle npm git wget curl kdeconnect-kde papirus-icon-theme papirus-folders partitionmanager imagewriter elisa ktorrent kweather jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts

```
<br>

## Script para atualização e limpeza do sistema (Sistema, Flatpak e Firmware)


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
    echo -e "${VERDE}[1/4] Atualizando pacotes do sistema (DNF)...${RESET}"
    # No Fedora, mantemos o -y se você preferir, ou removemos para ver o que será feito
    sudo dnf upgrade --refresh
elif [ -f /etc/os-release ] && grep -q "opensuse" /etc/os-release; then
    echo -e "${VERDE}[1/4] Atualizando pacotes do sistema (Zypper)...${RESET}"
    sudo zypper ref
    # REMOVIDO o -y para que ele pare nos conflitos e peça sua escolha (1, 2, 3...)
    sudo zypper dup
else
    echo "Sistema não identificado."
fi

# 2. Atualizar Flatpaks
if command -v flatpak &> /dev/null; then
    echo -e " "
    echo -e "${VERDE}[2/4] Atualizando Flatpaks...${RESET}"
    flatpak update -y
    flatpak uninstall --unused -y
fi

# 3. Atualizar Firmware
if command -v fwupdmgr &> /dev/null; then
    echo -e " "
    echo -e "${VERDE}[3/4] Verificando atualizações de Firmware...${RESET}"
    fwupdmgr get-updates
    fwupdmgr update
fi


# 4. Limpeza de Cache e Logs
    echo -e " "
    echo -e "${VERDE}[4/4] Iniciando limpeza de primavera...${RESET}"

# Limpa cache do gerenciador de pacotes
if [ -f /etc/fedora-release ]; then
    sudo dnf clean all
elif [ -f /etc/os-release ] && grep -q "opensuse" /etc/os-release; then
    sudo zypper clean -a
fi

# Limpa logs antigos (mantém apenas os últimos 2 dias)
sudo journalctl --vacuum-time=2d

# Limpa cache de miniaturas do usuário
rm -rf ~/.cache/thumbnails/*
    echo -e " "
    echo -e "${AZUL}--- Sistema Atualizado e Limpo! ---${RESET}"
    echo -e " "


```
