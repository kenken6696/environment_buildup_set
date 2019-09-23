## install

```
# use apt
sudo apt update
sudo apt install -y git curl zsh qbittorrent python3-pip chrome-gnome-shell gnome-tweaks wine-stable tree vim mcomix zsh-antigen unrar docker-compose
# use gui installer
# vscode vlc dropbox vivaldi-stable gitkraken typora docker docker-compose
```
---

## setting

### clone repo
```
sh clone_myrepo.sh
```

### change keymap

1. git clone

```
mkdir /home/ren/Repository
cd /home/ren/Repository
git clone https://github.com/skyeanka/environment_buildup_set.git
```

2. copy keymap

片手用配列へ変更
  ```
  sudo cp ./xkb_keymap/pc /usr/share/X11/xkb/symbols/pc
  sudo cp ./xkb_keymap/us /usr/share/X11/xkb/symbols/us
  ```

3. change system-lang
    1. go settings>region&language>input sources
    2. remove all, and add English(US),Japanese(Mozc)

 4. active the keymap change in vscode

  vscodeはデフォルトだと独自キー配列なので片手用配列へ変更

    1. go Configur 
    2. "keyboard.dispatch": "keyCode"

### change dic-language
```
LANG=C xdg-user-dirs-gtk-update
```

### zsh setting
1. change login shell
```
which zsh
chsh
```
2. antigen config 
[ここ](https://qiita.com/t-yng/items/2f138968939b8f75ba6a)参考に

### wine setting

wineの文字化け対応
```
sudo dpkg --add-architecture i386

wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt update
sudo apt install --install-recommends winehq-stable

winetricks allfonts
```

### docker setting
1. add user

```
sudo gpasswd -a $(whoami) docker
sudo chgrp docker /var/run/docker.sock
sudo service docker restart
```

2. docker run config

```
cat /etc/docker/daemon.json

{
     "default-runtime": "nvidia",
     "max-concurrent-downloads": 100,
     "runtimes": {
         "nvidia": {
             "path": "nvidia-container-runtime",
             "runtimeArgs": []
         }
     }
 }
```



