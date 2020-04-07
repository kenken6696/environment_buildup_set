## install

```
# use apt
sudo apt update & sudo apt install -y git curl zsh python3-pip chrome-gnome-shell gnome-tweaks tree vim zsh-antigen unrar vscode
# manual install
# vivaldi-stable typora docker docker-compose
```
---

## setting

### change dic-language
```
LANG=C xdg-user-dirs-gtk-update
```

### clone repo
```
mkdir ~/Repository
cd $_
curl https://api.github.com/users/skyeanka/repos | jq -r '.[].html_url' | xargs -I{}  git clone {}.git
```

### change keymap

1. copy keymap  
   片手用配列へ変更
  ```
  sudo cp ./xkb_keymap/pc /usr/share/X11/xkb/symbols/pc
  sudo cp ./xkb_keymap/us /usr/share/X11/xkb/symbols/us
  ```

2. change system-keymap
    1. go settings>region&language>input sources
    2. remove all, and add English(US),Japanese(Mozc)

3. active the keymap change in vscode  
  vscodeはデフォルトだと独自キー配列なので片手用配列へ変更

    1. go Configur 
    2. "keyboard.dispatch": "keyCode"


### zsh setting
1. change login shell
```
which zsh
chsh
```
2. antigen config  
[ここ](https://qiita.com/t-yng/items/2f138968939b8f75ba6a)参考に

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