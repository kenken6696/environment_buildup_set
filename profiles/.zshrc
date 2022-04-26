# Created by newuser for 5.8
# completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

alias d='cd ~/Repository/'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias ai='sudo apt update && sudo apt install -y'
alias ap='sudo apt purge'
alias aud='sudo apt update'
alias aup='sudo apt upgrade'

alias t='tree -C'

alias cr='cargo run'

# atcoder
alias accn='acc n'
alias acct='oj t -c "python3 main.py"'
alias accs='acc submit main.py -- -y --guess-python-interpreter pypy'

# func
accna() {
    if [ $# != 1 ]; then
        echo accna abc123/d のように入力してください
        return 1
    fi
    if echo $1 | grep / >/dev/null; then
        contest=$(echo $1|cut -f1 -d/)
    else
        echo accna abc123/d のように入力してください
        return 1
    fi

    DIR="$HOME/Repository/atcoder/"
    if [ -d $DIR$contest ];then
        echo 参加済みです
        cd $DIR$contest
        acc add
        return 0
    else
        echo 初参加です､フォルダを作成します
        cd $DIR
        acc n $contest
    fi
    sleep 3
    python3 ~/Repository/atcoder/acc_config/auto_acc.py toggle $2
}
