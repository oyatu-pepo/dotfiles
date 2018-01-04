# path
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

# Homebrew Completions
BREW_SCRIPTS="$(brew --prefix)/etc/bash_completion.d"
if [ -d "$BREW_SCRIPTS" ]; then
    for script in $(find $BREW_SCRIPTS -type l);
    do
        . $script;
    done
fi

if [ -f "$BREW_SCRIPTS/git-prompt.sh" ]; then
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1='\[\033[01;34m\][\u@\h \w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\]]\$ \[\033[00m\]'
fi

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# history系
export HISTSIZE=999
export HISTIGNORE="fg*:bg*:history*:pwd:gh*:hg*"
export HISTCOTROL="ignoredups"
export HISTTIMEFORMAT="%Y-%m-%d %T  "

# sudo コマンドの後ろで他コマンドの補完が効くように
complete -cf sudo

# cd コマンドでディレクトリ移動する度に ls を行う
function cd() {
    builtin cd $@;
    # 移動先のディレクトリを表示
    ls -a -F
    # cd の引数を絶対パスにして .bash_history に残す
    local s=$?
    if [[ ($s -eq 0) && (${#FUNCNAME[*]} -eq 1) ]]; then
        history -s cd $(printf "%q" "$PWD")
    fi
    return $s
}
