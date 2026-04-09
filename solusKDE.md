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
sudo eopkg it ffmpeg

wget 
sudo eopkg it wget

curl 
sudo eopkg it curl

node
sudo eopkg it nodejs-22

git 
sudo eopkg it  git

zsh
sudo eopkg it zsh

zsh-autosuggestions
sudo eopkg it zsh-autosuggestions

zsh-syntax-highlighting
sudo eopkg it zsh-syntax-highlighting

breeze6-wallpapers plasma6-workspace-wallpapers
sudo eopkg it plasma-workspace-wallpapers

jetbrains-mono-fonts 
sudo eopkg it font-jetbrainsmono-ttf

google-droid-fonts 
sudo eopkg it font-droid-ttf

libertinus-fonts 
sudo eopkg it font-libertinus-otf

texlive-tex-gyre 
sudo eopkg it texlive-fonts-opentype texlive-fonts-truetype texlive-fonts-extra

ubuntu-fonts 
sudo eopkg it font-ubuntu-ttf font-ubuntu-sans-ttf

bitstream-vera-fonts 
sudo eopkg it font-bitstream-vera-ttf

fira-code-fonts 
sudo eopkg it fonts-firacode-ttf fonts-firacode-nerd

google-nobile-fonts 
sudo eopkg it font-nobile-ttf

inter-fonts 
sudo eopkg it font-inter-ttf

ibm-plex-fonts 
sudo eopkg it font-ibm-plex-ttf font-ibm-plex-otf


papirus-icon-theme papirus-folders
sudo eopkg it papirus-icon-theme 

Reversal-icon-theme  
sudo eopkg it reversal-icon-theme

flatpak 
sudo eopkg it flatpak

partitionmanager
sudo eopkg it partitionmanager

imagewriter
sudo eopkg it suse-imagewriter

kdeconnect-kde
sudo eopkg it kdeconnect

elisa
sudo eopkg it elisa

ktorrent
sudo eopkg it ktorrent

kweather
sudo eopkg it kweather

# --- FONTES --- #
https://help.getsol.us/docs/user/software/third-party/
