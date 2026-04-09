# Pós Instalação OpenSUSE Tumbleweed KDE


<br>

## 📑 Índice de Instalação e Configuração


* 🏗️ **Primeiros passos**
  * [Arrumar root]
  * [Instalar pacote]
  * [Remover pacote]
  * [Buscar pacote]
  * [Atualizar sistema]
  * [Limpar cache]
  * [Limpa logs do sistema]

* 📦 **Gerenciamento de Pacotes**
  * [Instalar Google Chrome]
  * [Instalar Wget]
  * [Instalar Curl]
  * [Instalar NodeJS]
  * [Instalar Git]
  * [Instalar Flatpak]
  * [Instalar Gnome Boxes]
  * [Codecs e Plugins de Mídia]
  * [Instalar Wallpapers]
 
* 🎨 **ícones**
  * [Instalar Papirus Icon Theme]
  * [Instalar Reversal Icon Theme]

* 💻 **Terminal & Shell**
  * [Instalando e configurando ZSH]
 
* 🎵 **Multimídia & Apps KDE**
  * [Instalar Partitionmanager]
  * [Instalar Balena Etcher]
  * [Instalar VLC]
 
    
* ✒️ **Fontes**
* ⚡ **Instalação Expressa**


### Arrumar root
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
___

### Instalar pacote

```bash
sudo eopkg it nome-do-pacote
```


### Remover pacote

```bash
sudo eopkg rm nome-do-pacote
```
### Buscar pacote

```bash
eopkg sr termo
```

### Atualizar sistema

```bash
sudo eopkg up
```

### Limpar cache

```bash
sudo eopkg delete-cache dc
```
### Limpa logs do sistema 

Limpa logs com mais de dois dias

```bash
sudo journalctl --vacuum-time=2d
```

### Instalar Google Chrome

```bash
sudo eopkg it python-eopkg
sudo eopkg.py3 bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it google-chrome-*.eopkg
```

### Instalar Wget

```bash
sudo eopkg it wget
```

### Instalar Curl 

```bash
sudo eopkg it curl
```

### Instalar NodeJS

```bash
sudo eopkg it nodejs-22
```

### Instalar Git 

```bash
sudo eopkg it  git
```

### Instalar Flatpak 

```bash
sudo eopkg it flatpak
```

### Instalar Gnome Boxes

```bash
sudo flatpak install flathub org.gnome.Boxes

```
### Codecs e Plugins de Mídia 

```bash
sudo eopkg it gstreamer-plugins-base gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-bad-extras ffmpeg
```

### Instalar wallpapers
```bash
sudo eopkg it plasma-workspace-wallpapers
```

### Instalar Papirus Icon Theme

```bash
sudo eopkg it papirus-icon-theme 
```

### Instalar Reversal Icon Theme  

```bash
 git clone https://github.com/yeyushengfan258/Reversal-icon-theme.git  && cd Reversal-icon-theme  && ./install.sh -t all
```

### Instalando e configurando ZSH

```bash
sudo eopkg it zsh
```
#### Configurando

```bash
cd .oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && cd ~ && sudo nano .zshrc
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



### Instalar Partitionmanager

```bash
sudo eopkg it partitionmanager
```


### Instalar Balena Etcher

```bash
sudo eopkg it etcher
```

### Instalar VLC

```bash
sudo eopkg it vlc
```

### Instalar Kweather
```bash
flatpak install flathub org.kde.kweather
```



### Fontes

#### Instalar Jetbrains-mono-fonts 

```bash
sudo eopkg it font-jetbrainsmono-ttf
```

#### Instalar Google-droid-fonts 

```bash
sudo eopkg it font-droid-ttf
```
#### Instalar Texlive-tex-gyre 

```bash
sudo eopkg it texlive-fonts-opentype texlive-fonts-truetype texlive-fonts-extra
```

#### Instalar Ubuntu-fonts 

```bash
sudo eopkg it font-ubuntu-ttf font-ubuntu-sans-ttf
```

#### Instalar Inter-fonts 

```bash
sudo eopkg it font-inter-ttf
```

#### Instalar Ibm-plex-fonts 

```bash
sudo eopkg it font-ibm-plex-ttf font-ibm-plex-otf
```

#### Instalar Fira-code-fonts 

```bash
sudo eopkg i font-firacode-ttf
```

>[!TIP] 
> Google Fonts deve ser instalada através do site




















kweather


# --- FONTES --- #
https://help.getsol.us/docs/user/software/third-party/
