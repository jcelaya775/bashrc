# oh-my-posh
eval "$(oh-my-posh init bash --config ~/.poshthemes/amro.omp.json)"

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

# Directories
alias cc="cd /mnt/c"
alias cwh="cd /mnt/c/Users/jorgecelaya"
alias cdoc="cd /mnt/c/Users/jorgecelaya/Documents/"
alias cdocs="cd /mnt/c/Users/jorgecelaya/Documents/"

function nt() {
  local num_tabs="${1:-1}"
  for i in $(seq 1 "$num_tabs"); do
    tmux new-window
  done
}
function ns() {
  local num_sessions="${1:-1}"
  for i in $(seq 1 "$num_sessions"); do
    tmux new-session -d
  done
}

function crepos() {
  cd /mnt/c/repos || return
  nvim "$1"
}
function vnotes() {
  cd /mnt/c/Users/jorgecelaya/Documents/ || return
  nvim notes.md
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
