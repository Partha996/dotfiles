# path for rust binaries
export PATH=$PATH:/home/partha/.cargo/bin


# Starship themes
#eval "$(starship init zsh)"
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
   # echo "Load starship"
    eval "$(/usr/local/bin/starship init zsh)"
  }
# default editor
#export EDITOR="/bin/nvim"

#fzf theme(catppuccin)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

#for nix pakage manager
if [ -e /home/partha/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/partha/.nix-profile/etc/profile.d/nix.sh
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220} Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34} Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Plugin installations
zinit light zsh-users/zsh-completions
#zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode
### End of Zinit's installer chunk

# Load completions
autoload -U compinit && compinit

# Completion styling
zstyle ':completion=*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Keybinding for history cycle
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Fzf key bindings and completion
[ -f ~/.fzf/key-bindings.zsh ] && source ~/.fzf/key-bindings.zsh
[ -f ~/.fzf/completion.zsh ] && source ~/.fzf/completion.zsh

# Set 'esc' (or caps lock pressed ) to accept autosuggestion
#bindkey -M emacs '^[' autosuggest-accept
#bindkey '^[a' autosuggest-accept


#for zoxide
eval "$(zoxide init zsh)"

# Aliases
eval $(thefuck --alias)
alias home='cd ~'
#alias ls='exa' # replacement for ls a more colorful listing for the ls command
alias cd='z'
alias sl='sl|lolcat' 
alias ya='yazi'
alias see='bat'
alias homespace='ncdu'
