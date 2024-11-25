## Pós instalação Fedora KDE

### Instalar RPM Fusion

>sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

### Instalando plugins de áudio e vídeo

>sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel && sudo dnf install lame\* --exclude=lame-devel

### Instalar drivers ADB

>sudo dnf install android-tools fastboot -y

### Instalar Steam

>sudo dnf install steam -y

### Instalar VSCode

>sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && sudo dnf install code -y

### Instalar FiraCode

>sudo dnf install fira-code-fonts -y

### Instalar IBM Plex Mono

>sudo dnf install ibm-plex-mono-fonts -y

### Instalar JetBrains

>sudo dnf install jetbrains-mono-fonts-all -y

### Instalar KTorrent

>sudo dnf install  ktorrent -y

### Instalar KDE Weather

>sudo dnf install kweather -y

### Instalar Telegram

>sudo dnf install  telegram-desktop -y

### Instalar Idle (para códigos rápidos de Python)

>sudo dnf install python3-idle -y

### Instalar Flatpack

>flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### Instalar mGBA

>sudo flatpak install flathub io.mgba.mGBA -y

### Instalar melonDS

>sudo flatpak install flathub net.kuribo64.melonDS -y

### Instalar Spotify (Flatpack)

>sudo flatpak install flathub com.spotify.Client -y

### Instalar Gnome Boxes

>sudo flatpak install flathub org.gnome.Boxes -y

### Instalar ZSH

>sudo dnf install zsh util-linux-user git -y
>
>sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Configurar ZSH

>cd .oh-my-zsh/plugins

>git clone https://github.com/zsh-users/zsh-autosuggestions.git && git clone https://github.com/marlonrichert/zsh-autocomplete.git  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

>sudo nano .zshrc

>source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh <br>
>source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh <br>
>source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh <br>
>source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh <br>
>source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh <br>
> 
> 
> plugins=( <br>
>    zsh-autosuggestions <br>
>    zsh-autocomplete <br>
>    zsh-syntax-highlighting <br>
>)

### Apps seguros para remover no Fedora KDE

sudo dnf remove akregator.x86_64 akregator-libs.x86_64 kf5-akonadi-calendar.x86_64 kf5-akonadi-contacts.x86_64 kf5-akonadi-mime.x86_64 kf5-akonadi-notes.x86_64 kf5-akonadi-search.x86_64 kf5-akonadi-server.x86_64 kf5-akonadi-server-mysql.x86_64  kamera.x86_64 kamoso.x86_64 kdepim-addons.x86_64 krdc krfb kdepim-runtime.x86_64 kdepim-runtime-libs.x86_64 kmag.x86_64 kmahjongg.x86_64 kmail.x86_64 kmail-account-wizard.x86_64 kmail-libs.x86_64 kmines.x86_64 kmouth.x86_64 kolourpaint.x86_64 kolourpaint-libs.x86_64 kontact.x86_64 kontact-libs.x86_64 konversation.x86_64 korganizer.x86_64 korganizer-libs.x86_64 kwrite.x86_64 libreoffice-calc.x86_64 libreoffice-core.x86_64 libreoffice-data.x86_64 libreoffice-draw.x86_64 libreoffice-emailmerge.x86_64 libreoffice-graphicfilter.x86_64 libreoffice-gtk3.x86_64 libreoffice-gtk4.x86_64 libreoffice-help-en.x86_64 libreoffice-impress.x86_64 libreoffice-kf5.x86_64 libreoffice-langpack-en.x86_64 libreoffice-math.x86_64 libreoffice-ogltrans.x86_64 libreoffice-opensymbol-fonts.noarch libreoffice-pdfimport.x86_64 libreoffice-pyuno.x86_64 libreoffice-ure.x86_64 libreoffice-ure-common.x86_64 libreoffice-writer.x86_64 libreoffice-x11.x86_64 pim-data-exporter.x86_64 pim-data-exporter-libs.x86_64 pim-sieve-editor.x86_64


