## Arrumar root
```bash
sudo su #entrar em root
```
### Se reclamar se senha errada

```bash
sudo passwd root
```
### Adicionar usuário a root

```bash
usermod -aG wheel,sudo daniel 
```
___

## Instalar pacote

```bash
sudo eopkg it nome-do-pacote
```
## Atualizar sistema

```bash
sudo eopkg up
```

## Remover pacote

```bash
sudo eopkg rm nome-do-pacote
```
## Buscar pacote

```bash
eopkg sr termo
```
## Limpar cache de downloads

```bash
sudo eopkg delete-cache
```
## Limpa o cache de downloads do eopkg (O que mais ocupa espaço)

```bash
sudo eopkg dc
```
## Limpa o cache de miniaturas e temporários do seu usuário

```bash
rm -rf ~/.cache/*
```
## Limpa logs do sistema com mais de 2 dias

```bash
sudo journalctl --vacuum-time=2d
```
## Instalar Google Chrome

```bash
sudo eopkg it python-eopkg
sudo eopkg.py3 bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it google-chrome-*.eopkg
```

ffmpeg

```bash
sudo eopkg it ffmpeg
```

wget

```bash
sudo eopkg it wget
```

curl 

```bash
sudo eopkg it curl
```

node

```bash
sudo eopkg it nodejs-22
```

git 

```bash
sudo eopkg it  git
```

zsh

```bash
sudo eopkg it zsh
```

zsh-autosuggestions

```bash
sudo eopkg it zsh-autosuggestions
```

zsh-syntax-highlighting

```bash
sudo eopkg it zsh-syntax-highlighting
```

breeze6-wallpapers plasma6-workspace-wallpapers

```bash
sudo eopkg it plasma-workspace-wallpapers
```

jetbrains-mono-fonts 

```bash
sudo eopkg it font-jetbrainsmono-ttf
```

google-droid-fonts 

```bash
sudo eopkg it font-droid-ttf
```
texlive-tex-gyre 

```bash
sudo eopkg it texlive-fonts-opentype texlive-fonts-truetype texlive-fonts-extra
```

ubuntu-fonts 

```bash
sudo eopkg it font-ubuntu-ttf font-ubuntu-sans-ttf
```

inter-fonts 

```bash
sudo eopkg it font-inter-ttf
```

ibm-plex-fonts 

```bash
sudo eopkg it font-ibm-plex-ttf font-ibm-plex-otf
```

papirus-icon-theme papirus-folders

```bash
sudo eopkg it papirus-icon-theme 
```

Reversal-icon-theme  

```bash
sudo eopkg it reversal-icon-theme
```

flatpak 

```bash
sudo eopkg it flatpak
```

partitionmanager

```bash
sudo eopkg it partitionmanager
```

fira-code-fonts 

```bash
sudo eopkg i font-firacode-ttf
```

Reversal-icon-theme  

Balena Etcher

```bash
sudo eopkg it etcher
```

kweather


## Instalar fontes faltantes (Google / Bitstream / Libertinus)

### 1. Garantir que a pasta existe

```bash
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
```

### 2. Google Nobile (Regular, Bold, Italic, BoldItalic)

```bash
wget https://github.com/google/fonts/raw/main/ofl/nobile/Nobile-Regular.ttf -P ~/.local/share/fonts/
wget https://github.com/google/fonts/raw/main/ofl/nobile/Nobile-Bold.ttf -P ~/.local/share/fonts/
wget https://github.com/google/fonts/raw/main/ofl/nobile/Nobile-Italic.ttf -P ~/.local/share/fonts/
wget https://github.com/google/fonts/raw/main/ofl/nobile/Nobile-BoldItalic.ttf -P ~/.local/share/fonts/
```

### 3. Bitstream Vera (O set completo: Sans, Serif e Mono)

```bash
wget https://github.com/liberationfonts/bitstream-vera/raw/master/Vera.ttf -P ~/.local/share/fonts/
wget https://github.com/liberationfonts/bitstream-vera/raw/master/VeraBd.ttf -P ~/.local/share/fonts/
wget https://github.com/liberationfonts/bitstream-vera/raw/master/VeraIt.ttf -P ~/.local/share/fonts/
wget https://github.com/liberationfonts/bitstream-vera/raw/master/VeraMono.ttf -P ~/.local/share/fonts/
```
### 4. Libertinus (As principais para o sistema)

```bash
wget https://github.com/alerque/libertinus/raw/master/static/OTF/LibertinusSerif-Regular.otf -P ~/.local/share/fonts/
wget https://github.com/alerque/libertinus/raw/master/static/OTF/LibertinusSans-Regular.otf -P ~/.local/share/fonts/
wget https://github.com/alerque/libertinus/raw/master/static/OTF/LibertinusMono-Regular.otf -P ~/.local/share/fonts/
```
### 5. Atualizar o cache do sistema

```bash
fc-cache -fv
```


# --- FONTES --- #
https://help.getsol.us/docs/user/software/third-party/
