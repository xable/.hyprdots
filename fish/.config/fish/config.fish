set -g fish_greeting

if status is-interactive
	starship init fish | source
end

# ENV
set -gx TERMINAL xterm-kitty
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BAT_THEME Coldark-Dark
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx RHISK_COMM zenbu
set -gx npm_config_prefix $HOME/.local
set -gx PATH $HOME/.bin $PATH
set -gx PATH $HOME/.local/bin $PATH

# kitty
if test "$TERM" = xterm-kitty
    alias icat="kitty +kitten icat"
    alias diff="kitty +kitten diff"
    alias ssh="kitty +kitten ssh"
end

# SHH agent
if test -z "$SSH_ENV"
    set -xg SSH_ENV "$HOME/.ssh/ssh_agent_env.fish"
end

if not _ssh_agent_is_started
    _ssh_agent_start
end

# Theme
set -q MY_THEME; or set -gx MY_THEME dracula
fish_config theme choose $MY_THEME

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Single key
abbr -a -- c clear
abbr -a -- h history
abbr -a -- l 'ls -UF'
abbr -a -- q exit

# Better ls
alias ls='eza --color=always --group-directories-first --git --icons --no-user --no-time --no-permissions'
alias la='eza -al --color=always --group-directories-first --git --icons --no-user --no-time --no-permissions'

# Pacman
abbr -a -- upd "paru -Syu"
abbr -a -- pac "sudo pacman -S"
abbr -a -- pacq "pacman -Q | grep"
abbr -a -- pkgcnt "pacman -Q | wc -l"

# PATH
abbr -a -- ~ 'cd $HOME'
abbr -a -- .bin 'cd $HOME/.bin'
abbr -a -- .dot 'cd $HOME/.hyprdots'

# GIT
abbr -a gs "git status"
abbr -a ga "git add"
abbr -a gm "git commit -m"
abbr -a gp "git push"
abbr -a gap "git add -p"

# FFF
export FFF_GIT_CHANGES=1
export FFF_FILE_ICON=1
export FFF_LS_COLORS=1
export FFF_COL1=4
export FFF_COL2=0
export FFF_COL3=3
export FFF_COL4=8
export FFF_COL5=7

# ETC
alias v='nvim'
alias vim='nvim'
alias mixer='alsamixer'
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -vr'
alias df='df -h'
alias ps='ps -ef'
alias free='free -m'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias wttr='curl wttr.in'
alias rtx='curl rate.sx'
alias rss='newsboat'
alias ytdl='yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
