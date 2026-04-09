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


# --- FONTES --- #
https://help.getsol.us/docs/user/software/third-party/
