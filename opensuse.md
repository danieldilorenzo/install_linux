# Pós Instalação OpenSUSE Tumbleweed KDE


<br>

## 📌 Índice
  1. [Instalar Zram Generator](instalar-zram-generator)

## Instalar Zram Generator


- **O que é?** Um utilitário que cria dispositivos de swap comprimidos na RAM.

- **O que faz no sistema?** Melhora o multitarefa em sistemas com pouca memória, evitando que o PC trave ao usar o disco rígido como swap lento. No Fedora, isso já vem por padrão, mas no openSUSE pode ser um ajuste interessante.

- **Risco:** Baixo.

<br>

Instalação:

```sudo zypper in zram-generator```

Após isso, editar o arquivo:

```sudo nano /etc/systemd/zram-generator.conf```

<br>

```bash

[zram0]
zram-size = min(ram / 2, 8192)
compression-algorithm = zstd
swap-priority = 100
fs-type = swap

```

Reiniciar os serviços para iniciar a zram

```sudo systemctl daemon-reload ```

Iniciando a zram

```sudo systemctl start /dev/zram0```

Verificando se está iniciado

```sudo zramctl```

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

```sudo nano /etc/sysctl.d/99-performance.conf```


Cole o conteúdo

```bash

vm.swappiness=10
vm.vfs_cache_pressure=50
vm.dirty_ratio=10
vm.dirty_background_ratio=5

```

<br>

- **Como reverter:** edite novamente o perfil com

```sudo nano /etc/sysctl.d/99-performance.conf```

Em seguida, reinicie o sistema.

<br>
<br>

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

```sudo zypper remove thermald```

<br>
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

```sudo zypper in opi```

Instalando codecs, Chrome, VSCode e Steam e fontes da Microsoft:

```bash
opi codecs           # Codecs de áudio / vídeo
opi google-chrome    # Google Chrome
opi vscode           # Visual Studio Code
opi steam            # Steam
opi ms-fonts         # Fontes da Microsoft
```

<br>
<br>

- **Como reverter:** Para remover o que foi instalado, você usa o zypper remove. Se o OPI deixou um repositório ativado que você não quer mais, você deve removê-lo via YaST Software Repositories ou pelo comando ```sudo zypper rr <nome_do_repo>```.

<br>

>[!TIP]
>O OPI é famoso por facilitar a vida com softwares "chatos" no Linux. Além do opi codecs, ele tem comandos rápidos para o Google Chrome, Skype, Teamviewer e até drivers da NVIDIA. É a forma mais limpa de instalar esses apps sem baixar .rpm soltos da internet.

<br>
<br>

## Instalar drivers adb


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

```sudo zypper in android tools```

Ou

```opi android-tools```

<br>

- **Como reverter:** Executando no terminal ```sudo zypper rm android-tools```

<br>

>[!TIP]
>Configuração de Udev Rules: Muitas vezes o ADB instala, mas o comando adb devices retorna um erro de "no permissions". No openSUSE, a melhor forma de resolver isso permanentemente para quase todos os celulares do mercado é instalando o pacote android-udev-rules.

<br>

Para isso, executamos no terminal

```sudo zypper in android-udev-rules```

Ou

```opi android-udev-rules```

<br>
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

source $ZSH/oh-my-zsh.sh
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

```sudo zypper in breeze6-wallpapers plasma6-workspace-wallpapers```

<br>


## Instalar FastFetch

- **O que é:** Scripts de informação do sistema. Exibe o logo da sua distro  em ASCII junto com informações de hardware (CPU, GPU, RAM) e software (Kernel, Desktop Environment) de forma visual no terminal.
  
```sudo zypper in fastfetch```

<br>


## Instalar Idle 

- **O que é:** Editor simples para códigos de Python.

```sudo zypper in python3-idle```

<br>


## Instalar Gnome Boxes
.
- **O que é:** Programa de máquina virtual
  
```sudo flatpak install flathub org.gnome.Boxes```

<br>


## Instalar NPM

- **O que é:** Gerenciador de pacotes Node.js.

```sudo zypper in npm```

<br>


## Instalar Git

- **O que é:** O sistema de controle de versão mais usado no mundo. Gerencia o histórico de alterações em códigos e arquivos. No Linux, é essencial para baixar (clonar) projetos diretamente do GitHub ou GitLab.
  
```sudo zypper in git```

<br>

## Wget & Curl

- **O que é:** Ferramentas de linha de comando para transferência de dados. Permitem baixar arquivos e interagir com servidores via terminal. O curl é muito usado para instalar scripts (como o do NVM ou Docker), e o wget é o clássico para downloads diretos.

```sudo zypper in wget curl```


## Instalar KDE Connect

- **O que é:** Ferramenta de integração total que permite a comunicação sem fio entre o seu computador (Linux) e o seu dispositivo móvel (Android ou iOS). Ele utiliza protocolos de rede local para criar uma ponte segura entre os aparelhos.
  
```sudo zypper in kdeconnect-kde```

<br>


## Instalar Papirus Icons & Folders

- **O que é:** Pacote de ícone e pastas.
  
```sudo zypper in papirus-icon-theme papirus-folders```

<br>


## Instalar Gerenciador de partições

- **O que é:** Programa nativo do ambiente KDE que permite gerenciar, editando ou excluindo partições.

```sudo zypper in partitionmanager```

<br>


## Instalar Instalar KDE Imagewriter

- **O que é:** Grava imagens ISO em pendrives.

```sudo zypper in imagewriter```

<br>


## Instalar Instalar Elisa

- **O que é:** Reprodutor de músicas nativo do ambiente KDE..
  
```sudo zypper in elisa```

<br>


## Instalar KTorrent

- **O que é:** Cliente de BitTorrent e nativo do ambiente KDE.
  
```sudo zypper in ktorrent```

<br>


## Instalar KDE Weather

- **O que é:** Aplicativo de clima nativo do ambiente KDE..
  
```sudo zypper in kweather```


<br>


## Instalar Fontes

```sudo zypper in jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts```

<br>

## Instalar tudo junto

```bash
sudo zypper install android-tools zsh breeze6-wallpapers plasma6-workspace-wallpapers python3-idle npm git wget curl kdeconnect-kde papirus-icon-theme papirus-folders partitionmanager imagewriter elisa ktorrent kweather jetbrains-mono-fonts google-droid-fonts libertinus-fonts texlive-tex-gyre ubuntu-fonts bitstream-vera-fonts fira-code-fonts google-nobile-fonts inter-fonts ibm-plex-fonts ibm-plex-mono-fonts ibm-plex-sans-arabic-fonts ibm-plex-sans-condensed-fonts ibm-plex-sans-devanagari-fonts ibm-plex-sans-fonts
```
