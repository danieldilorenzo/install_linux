# Arrumar root

sudo su #entrar em root

# Se reclamar se senha errada
sudo passwd root

# Adicionar usuário a root
usermod -aG wheel,sudo daniel 

___

# Instalar pacote
sudo eopkg it nome-do-pacote

# Atualizar sistema
sudo eopkg up

# Remover pacote
sudo eopkg rm nome-do-pacote

# Buscar pacote
eopkg sr termo

# Limpar cache de downloads
sudo eopkg delete-cache

# Limpa o cache de downloads do eopkg (O que mais ocupa espaço)
sudo eopkg dc

# Limpa o cache de miniaturas e temporários do seu usuário
rm -rf ~/.cache/*

# Limpa logs do sistema com mais de 2 dias
sudo journalctl --vacuum-time=2d

# Instalar Google Chrome
sudo eopkg it python-eopkg
sudo eopkg.py3 bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it google-chrome-*.eopkg



# --- FONTES --- #
https://help.getsol.us/docs/user/software/third-party/
