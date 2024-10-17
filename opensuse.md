## Pós Instalação OpenSUSE Tumbleweed KDE

### Instalar Zram

> sudo zypper in systemd-zram-service && sudo zramswapon

### Instalar Google Chrome

> sudo zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome && wget https://dl.google.com/linux/linux_signing_key.pub && sudo rpm --import linux_signing_key.pub && sudo zypper ref -f && sudo zypper in google-chrome-stable

### Instalar Steam

> sudo zypper in steam

### Instalar VSCode

> sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && sudo sh -c 'echo -e "[code]\name=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo' && sudo zypper refresh && sudo zypper install code

