# for Windows and Mac
1. Google Japanese Input
 change Key 'Eiso' mapping for Mode 'DirectInput' to 'Activate IME', and the mapping for the others to 'Deactivate IME'

# for Windows 10
import keyswap folder 

# foy Mac
## CUI
### start
- install homebrew and jq
- clone repo
```
mkdir ~/Repository
cd $_
curl https://api.github.com/users/skyeanka/repos | jq -r '.[].html_url' | xargs -I{}  git clone {}.git
```

### launchpad setting
```
defaults write com.apple.dock springboard-rows -int 9
defaults write com.apple.dock springboard-columns -int 7
killall Dock
```

### import karabiner folder
```
cp -r ~/Repository/environment_buildup_set/karabiner ~/.config/karabiner
```
### scr setting
```bash
mkdir ~/Desktop/scr
defaults write com.apple.screencapture location ~/Desktop/scr
defaults write com.apple.screencapture name ''
defaults write com.apple.screencapture type jpg
```
## GUI
- mactex
    - EnhancedでTeX動かす用
    - [ここ]()からMacTeX.pkgをインストール
- Zotero
    - 同期する
    - [zotfile](http://zotfile.com)をインストール
    - zotfileをonedriveに指定する
- Microsoft Office365(j)
[ここ](https://www.jaist.ac.jp/iscenter/software/microsoft/office365/#c1300)
    - autoupdateうざいので消す


# for Ubuntu 22.04

## install
dont forget to install vscode from [homepage](https://code.visualstudio.com)(because that from the others often makes trouble with japanese ime)
```
# use apt
sudo apt update & sudo apt install -y git curl zsh pip chrome-gnome-shell gnome-tweaks tree gh zsh-antigen unrar jq openssh-server

sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt update
sudo apt install google-drive-ocamlfuse

# manual or snap install
vivaldi-stable bluemail obsidian ticktick vlc vscode
```
---

## setting
### gdrive

```
mkdir ~/google-drive
google-drive-ocamlfuse ~/google-drive
```

### stop requesting password(not recommend)
```
sudo nano -w /etc/sudoers
```

%sudo  ALL=(ALL) ALL -> %sudo  ALL=(ALL:ALL) NOPASSWD:ALL

or

add yourusername ALL=(ALL) NOPASSWD: ALL

or

add timestamp_timeout=120

if you write incorrect sudoers, you can use `pkexec visudo`

### change dic-language from japanese to english
```
LANG=C xdg-user-dirs-gtk-update
```

### login github and clone repo
```
gh auth login

mkdir ~/Repository
cd $_
curl https://api.github.com/users/skyeanka/repos | jq -r '.[].html_url' | xargs -I{}  git clone {}.git
```
### change keymap

1. copy keymap  
   片手用配列へ変更
  ```
  sudo cp ~/Repository/environment_buildup_set/xkb_keymap/pc /usr/share/X11/xkb/symbols/pc
  sudo cp ~/Repository/environment_buildup_set/xkb_keymap/us /usr/share/X11/xkb/symbols/us

  # for magic keyboard
  sudo cp ~/Repository/environment_buildup_set/xkb_keymap_magickeyboard/pc /usr/share/X11/xkb/symbols/pc
  sudo cp ~/Repository/environment_buildup_set/xkb_keymap_magickeyboard/us /usr/share/X11/xkb/symbols/us
  ```

2. change system-keymap
    1. go settings>region&language>input sources
    2. remain only 'Japanese(Mozc)'
    3. go Keyboard shortcut>typing
    4. disable the settings like 'Switch input source...'
    5. setting Google Japanese Input
        
        change the mapping 'Eiso' for 'DirectInput' to 'Ctrl+Space' for 'Activate IME', and the mapping for the others mode to 'Deactivate IME'
3. active the keymap change in vscode  
  vscodeはデフォルトだと独自キー配列なので片手用配列へ変更

    1. go Configur 
    2. "keyboard.dispatch": "keyCode"


### zsh setting
1. change login shell
```
chsh $USER -s $(which zsh)
```
2. zsh/antigen config  
```
cp profiles/.zshrc ~/
source ~/.zshrc
```
when an error, check where to install antigen
```
dpkg -L zsh-antigen
```

### ssh setting
1. register pubkey
```
# on client pc
ssh-keygen -t rsa
ssh-copy-id ${user}@${server_host}
```
2. permit only pubkey-login
rewrite /etc/ssh/sshd_config
```:/etc/ssh/sshd_config
PermitRootLogin no
```

### docker install and setting
2022/08/04現在、すべて一括でインストールできるDocker DesktopはLinuxだけBeta版でハマったため、従来のやり方([Docker Engineのインストール](https://docs.docker.com/engine/install/ubuntu/))をおすすめする。  
ちなみにdocker-composeなどはv1の古いパッケージなのでもう不要。

1. add user  
Docker Engineのインストールでは本作業が必要
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
