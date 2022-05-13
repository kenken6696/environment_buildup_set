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
    usage(){
        echo "
Usage: accna [options:<r|h>] <contest-id>/<problem-id>
    for example, accna abc123/e, accna -r abc123/d

Args:
    contest-id: you can find your contest-id in the URL
    problem-id: set problem-id you want to solve at first

Option:
    -r: use this option to review.
        make backup dir '/<problem-id>_bk_yyyymmdd_hhmmss' and init original dir using acc_config/py/main.py
        ">&2
    }
    DIR="$HOME/Repository/atcoder"
    flag_r=false
    # check args
    while getopts "rh" OPT
    do
        case $OPT in
            r) flag_r=true;;
            h) usage && return 0;;
            *) usage && return 1;;
        esac
    done
    # remove option args
    shift $((OPTIND - 1))

    if [ $# -ne 1 ]; then
        usage && return 1
    fi
    if echo $1 | grep / >/dev/null; then
        contest_id=$(echo $1|cut -f1 -d/)
        problem_id=$(echo $1|cut -f2 -d/)
    else
        usage && return 1
    fi

    if $flag_r; then
        echo 'preparing to Review...'
        if [ -d $DIR/$contest_id/$problem_id ];then
            bk_dir=$problem_id'_bk_'$(date "+%Y%m%d_%H%M%S")
            mkdir $DIR/$contest_id/$bk_dir
            cp -r $DIR/$contest_id/$problem_id/ $DIR/$contest_id/$bk_dir/
            cp $(acc config-dir)/py/main.py $DIR/$contest_id/$problem_id/
            cd $DIR/$contest_id/$problem_id
            code main.py
            return 0
        else
            echo 'cannot find previous directory:'$DIR/$contest_id/$problem_id && return 1
        fi
    fi

    if [ -d $DIR/$contest_id ];then
        echo 'You have already attended!'
        cd $DIR/$contest_id
        acc add
    else
        echo 'You are attending '$contest_id' ...'
        cd $DIR
        acc n $contest_id
    fi
    accr=$?
    if [ $accr = 0 ] && [ -d $DIR/$contest_id/$problem_id ]; then
       cd $DIR/$contest_id/$problem_id
       code main.py
    fi
}