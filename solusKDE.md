# Pós Instalação Solus KDE


<br>

## 📑 Índice de Instalação e Configuração


* 🏗️ **Primeiros passos**
  * [Arrumar root](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#arrumar-root)
  * [Instalar pacote](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-pacote)
  * [Remover pacote](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#remover-pacote)
  * [Buscar pacote](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#buscar-pacote)
  * [Atualizar sistema](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#atualizar-sistema)
  * [Limpar cache](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#limpar-cache)
  * [Limpa logs do sistema](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#lipa-logs-do-sistema)

* 🔋 **Otimização para Notebooks**
   * [Instalar Thermald](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-thermald)
   * [Instalar TLP](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-tlp)
   * [Instalar Libsmbios](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-Libsmbios)


* 📦 **Gerenciamento de Pacotes**
  * [Instalar Google Chrome](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-google-chrome)
  * [Instalar Wget](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-wget)
  * [Instalar Curl](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-curl)
  * [Instalar NodeJS](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-nodejs)
  * [Instalar Git](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-git)
  * [Instalar Flatpak](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-flatpak)
  * [Instalar Gnome Boxes](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-gnome-boxes)
  * [Instalar Codecs e Plugins de Mídia](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-codecs-e-plugins-de-media)
  * [Instalar Wallpapers](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-wallpapers)
 
* 🎨 **ícones**
  * [Instalar Papirus Icon Theme](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-papirus-icon-theme)
  * [Instalar Reversal Icon Theme](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-reversal-icon-theme)

* 💻 **Terminal & Shell**
  * [Instalando e configurando ZSH](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalando-e-configurando-zsh)
 
* 🎵 **Multimídia & Apps KDE**
  * [Instalar Partitionmanager](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-partitionmanager)
  * [Instalar Balena Etcher](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-balena-etcher)
  * [Instalar VLC](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-vlc)
 
    
* ✒️ **Fontes**
  * [Instalar Jetbrains-mono-fonts](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-jetbrains-mono-fonts)
  * [Instalar Google-droid-fonts](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-google-droid-fonts)
  * [Instalar Texlive-tex-gyre](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-texlive-tex-gyre)
  * [Instalar Ubuntu-fonts](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-ubuntu-fonts)
  * [Instalar Inter-fonts](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-inter-fonts)
  * [Instalar Ibm-plex-fonts](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-ibm-plex-fonts)
  * [Instalar Fira-code-fonts](https://github.com/danieldilorenzo/install_linux/blob/main/solusKDE.md#instalar-fira-code-fonts)

<br>

## Arrumar root
```bash
sudo su #entrar em root
```
#### Se reclamar se senha errada

```bash
sudo passwd root
```
#### Adicionar usuário a root

```bash
usermod -aG wheel,sudo daniel 
```
<br>

## Instalar pacote

```bash
sudo eopkg it nome-do-pacote
```
<br>

## Remover pacote

```bash
sudo eopkg rm nome-do-pacote
```
<br>

## Buscar pacote

```bash
eopkg sr termo
```
<br>

## Atualizar sistema

```bash
sudo eopkg up
```
<br>

## Limpar cache

```bash
sudo eopkg delete-cache dc
```
<br>

## Limpa logs do sistema 

Limpa logs com mais de dois dias

```bash
sudo journalctl --vacuum-time=2d
```
<br>


## Instalar Thermald
```bash
sudo eopkg it thermald &&  sudo systemctl enable thermald --now
```
<br>

## Instalar TLP

```bash
sudo eopkg it tlp tlp-rdw
```

 Ativar serviços e desativar o conflito do KDE
```bash
sudo systemctl mask power-profiles-daemon && sudo systemctl enable tlp --now
```
<br>

## Instalar Libsmbios

```bash
sudo eopkg it libsmbios

```
<br>

## Instalar Google Chrome

```bash
sudo eopkg it python-eopkg
sudo eopkg.py3 bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it google-chrome-*.eopkg
```
<br>

## Instalar Wget

```bash
sudo eopkg it wget
```
<br>

### Instalar Curl 

```bash
sudo eopkg it curl
```
<br>

## Instalar NodeJS

```bash
sudo eopkg it nodejs-22
```
<br>

## Instalar Git 

```bash
sudo eopkg it  git
```

<br>

## Instalar Flatpak 

```bash
sudo eopkg it flatpak
```

<br>

## Instalar Gnome Boxes

```bash
sudo flatpak install flathub org.gnome.Boxes

```
<br>

## Instalar Codecs e Plugins de Mídia 

```bash
sudo eopkg it gstreamer-plugins-base gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-bad-extras ffmpeg
```

<br>

## Instalar wallpapers
```bash
sudo eopkg it plasma-workspace-wallpapers
```

<br>

## Instalar Papirus Icon Theme

```bash
sudo eopkg it papirus-icon-theme 
```

### Instalar Reversal Icon Theme  

```bash
 git clone https://github.com/yeyushengfan258/Reversal-icon-theme.git  && cd Reversal-icon-theme  && ./install.sh -t all
```

<br>

## Instalando e configurando ZSH

```bash
sudo eopkg it zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### Configurando

```bash
cd .oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && cd ~ && nano .zshrc
```

Cola na pasta

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

## Instalar Partitionmanager

```bash
sudo eopkg it partitionmanager
```


<br>

## Instalar Balena Etcher

```bash
sudo eopkg it etcher
```

<br>

## Instalar VLC

```bash
sudo eopkg it vlc
```

<br>

## Instalar Kweather

```bash
flatpak install flathub org.kde.kweather
```

<br>

## Instalar Jetbrains-mono-fonts 

```bash
sudo eopkg it font-jetbrainsmono-ttf
```

## Instalar Google-droid-fonts 

```bash
sudo eopkg it font-droid-ttf
```

## Instalar Texlive-tex-gyre 

```bash
sudo eopkg it texlive-fonts-opentype texlive-fonts-truetype texlive-fonts-extra
```

## Instalar Ubuntu-fonts 

```bash
sudo eopkg it font-ubuntu-ttf font-ubuntu-sans-ttf
```

## Instalar Inter-fonts 

```bash
sudo eopkg it font-inter-ttf
```

## Instalar Ibm-plex-fonts 

```bash
sudo eopkg it font-ibm-plex-ttf font-ibm-plex-otf
```

## Instalar Fira-code-fonts 

```bash
sudo eopkg it font-firacode-ttf
```

## Instalar todas as fontes de uma só vez
```bash
sudo eopkg it font-jetbrainsmono-ttf font-droid-ttf texlive-fonts-opentype texlive-fonts-truetype texlive-fonts-extra font-ubuntu-ttf font-ubuntu-sans-ttf font-inter-ttf font-ibm-plex-ttf font-ibm-plex-otf font-firacode-ttf
```

>[!TIP] 
> Google Fonts deve ser instalada através do site

