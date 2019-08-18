## install

```
//use apt
sudo apt update
sudo apt install git curl zsh qbittorrent python3-pip chrome-gnome-shell gnome-tweaks wine-stable tree vim mcomix zsh-antigen unrar
// use gui installer
# vscode vlc dropbox vivaldi-stable gitkraken
// add repo and use apt
# typora docker docker-compose
```



---

## setting

### change keymap

1. git clone
```
mkdir /home/ren/Repository
cd /home/ren/Repository
git clone https://github.com/skyeanka/environment_buildup_set.git
```

2. copy keymap

  ```
  sudo cp ./xkb_keymap/pc /usr/share/X11/xkb/symbols/pc
  sudo cp ./xkb_keymap/us /usr/share/X11/xkb/symbols/us
  ```

3. change system-lang
    1. go settings>region&language>input sources
    2. remove all, and add English(US),Japanese(Mozc)

 4. active the keymap change in vscode

    1. go Configur 
    2. "keyboard.dispatch": "keyCode"

### change dic-language
```
LANG=C xdg-user-dirs-gtk-update
```

### change login shell
```
which zsh
chsh
```

### wine setting

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

```
cat /etc/docker/daemon.json
# {
#     "default-runtime": "nvidia",
#     "max-concurrent-downloads": 100,
#     "runtimes": {
#         "nvidia": {
#             "path": "nvidia-container-runtime",
#             "runtimeArgs": []
#         }
#     }
# }
```



