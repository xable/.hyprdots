set -g fish_greeting

# ENV
set -gx TERMINAL xterm-kitty
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BAT_THEME Coldark-Dark
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx RHISK_COMM zenbu
set -gx npm_config_cache $HOME/.local
set -gx PATH $HOME/.bin $PATH
set -gx PATH $HOME/.local/bin $PATH

# FZF (PatrickF1/fzf.fish)
set -gx FZF_DEFAULT_OPTS "\
--height 60% \
--border \
--layout=reverse \
--info=inline \
--bind 'ctrl-y:accept,ctrl-t:toggle-preview'"

# Preview: bat for files, eza for directories
set fzf_preview_file_cmd "bat --color=always --line-range :200"
set fzf_preview_dir_cmd "eza --tree --color=always --icons {} | head -50"

# fd: hidden files, exclude .git/node_modules/target
set fzf_fd_opts --hidden --no-ignore --exclude=.git --exclude=node_modules --exclude=target

# Diff highlighting with bat
set fzf_diff_highlighter "bat --color=always --plain --language=diff"



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
abbr -a -- upd "yay -Syu"
abbr -a -- pac "sudo pacman -S"
abbr -a -- remove "sudo pacman -Rns"
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
