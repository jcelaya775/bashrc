# PATH
export PATH="$HOME/.local/bin/fd:$PATH"

# oh-my-posh
# eval "$(oh-my-posh init bash --config ~/.poshthemes/amro.omp.json)"

# Alases
alias c="clear"
alias v="nvim"
alias v.="nvim ."
alias ta="tmux attach"
alias tat="tmux attach -t"
alias t="tmux"
alias g="git"
alias n="npm"
alias y="yarn"
alias pn="pnpm"
alias p="python"
alias re="source ~/.bashrc"
alias gconf="nvim ~/.gitconfig"
alias e="exit"

# Directories
alias cc="cd /mnt/c"
alias cwh="cd /mnt/c/Users/jorgecelaya"
alias cdoc="cd /mnt/c/Users/jorgecelaya/Documents/"
alias cdocs="cd /mnt/c/Users/jorgecelaya/Documents/"
alias crepos="cd /mnt/c/repos"

function nt() {
  if [ -z "$1" ]; then
    num_tabs=1
  else
    num_tabs=$1
  fi

  local orig_win_idx
  orig_win_idx=$(tmux display-message -p '#I')

  for i in $(seq 1 "$num_tabs"); do
    tmux new-window
  done
  tmux select-window -t "$orig_win_idx"
}
function ns() {
  local num_sessions="${1:-1}"
  for i in $(seq 1 "$num_sessions"); do
    tmux new-session -d
  done
}

function vp() {
  cd "/mnt/c/repos/" || return
  dir="/mnt/c/repos/$(fd --type directory --max-depth 1 | fzf)"
  cd "$dir" || exit
  if [[ "$1" != "" ]]; then
      nt "$(($1 - 1))"
  fi
  nvim .
}

function vrepos() {
  cd "/mnt/c/repos/$1" || return
  nvim .
}

function vnotes() {
  cd /mnt/c/Users/jorgecelaya/Documents/ || return
  nvim notes.md
}

function cproj() {
  cd "/mnt/c/repos/" || return
  dir="/mnt/c/repos/$(fd --type directory --max-depth 1 | fzf)"
  cd "$dir" || exit
  if [[ "$1" != "" ]]; then
      nt "$(($1 - 1))"
  fi
}

# Edit config files
function vconf() {
  cd ~/.config/nvim || return
  nvim "$1"
}

function nconf() {
  cd ~/.config/nvim || return
  nvim "$1"
}

function gconf() {
  nvim ~/.gitconfig
}

function bconf() {
  nvim ~/.bashrc
}
