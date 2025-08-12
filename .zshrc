# --- 基本設定 ---
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export EDITOR='code -w'  # VSCode をデフォルトエディタに
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# --- プロンプトを見やすく（色つき + Git連携）---
autoload -Uz promptinit
promptinit
prompt pure  # or "prompt walters", "prompt adam1" など（oh-my-zsh未使用でもOK）

# --- 補完機能の強化 ---
autoload -Uz compinit
compinit

# --- ヒストリ（履歴）設定 ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history        # 複数ターミナル間で履歴を共有
setopt hist_ignore_dups     # 同じコマンドの連続保存をスキップ
setopt inc_append_history   # 実行後すぐ履歴に保存

# --- 補完の表示形式を改良 ---
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

# --- 補完候補をファジー検索（便利！）---
bindkey '^I' expand-or-complete
autoload -Uz compinit && compinit

# --- Gitがあるディレクトリでブランチ名表示（oh-my-zshを使わない場合）---
# Gitブランチの表示形式をカスタム（ブランチ名だけ）
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
PS1='%F{cyan}[%n%f:%F{blue}%~%f %F{green}${vcs_info_msg_0_}%f%F{cyan}]$%f '

# --- エイリアス（よく使うコマンド短縮）---
alias ll='ls -alF'
alias la='ls -A'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias ..='cd ..'
alias ...='cd ../..'

# --- Homebrew経由の設定があれば（例: nvm, pyenvなど）---
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- cd後にディレクトリ内のファイル一覧を表示 ---
function chpwd() {
  ls -a
}

# --- zinitやoh-my-zsh使う場合はここに書く ---
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zinit/bin/zinit.zsh
# source $ZSH/oh-my-zsh.sh
