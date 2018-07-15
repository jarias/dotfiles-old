setopt HIST_IGNORE_ALL_DUPS

[[ -s $HOME/.shell/aliases ]] && source $HOME/.shell/aliases
[[ -s $HOME/.shell/paths ]] && source $HOME/.shell/paths
[[ -s $HOME/.shell/config ]] && source $HOME/.shell/config
[[ -s $HOME/.shell/history-substring-search.zsh ]] && source $HOME/.shell/history-substring-search.zsh

os=$(uname -s)

autoload -U colors && colors

if [ $os = "Linux" ]; then
  eval $(dircolors ~/.dircolors)
  export LSCOLORS=$LS_COLORS
fi

if [ $os = "Linux" ] || [ $os = "FreeBSD" ]; then
  BASE16_SHELL=$HOME/.config/base16-shell/
  [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
fi

export CLICOLOR=1

# =============
#    HISTORY
# =============

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
# =============
#    PROMPT
# =============
fpath=( $HOME/.zfunctions $fpath )

autoload -U promptinit
promptinit
prompt pure

# ===================
#    AUTOCOMPLETION
# ===================
# enable completion
autoload -Uz compinit
compinit

zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

zstyle '*' single-ignored show

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# ===================
#    KEY BINDINGS
# ===================
bindkey -e

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[3~" delete-char

# ===================
#    Other
# ===================
unsetopt correct_all


eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#VIM_PROMPT="[I] ❯"
#
#PROMPT='%(12V.%F{242}%12v%f .)'
#PROMPT+='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '
#
#prompt_pure_update_vim_prompt() {
#    zle || {
#        print "error: pure_update_vim_prompt must be called when zle is active"
#        return 1
#    }
#    VIM_PROMPT=${${KEYMAP/vicmd/[N] ❯}/(main|viins)/[I] ❯}
#    zle .reset-prompt
#}
#
#function zle-line-init zle-keymap-select {
#    prompt_pure_update_vim_prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/jarias/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/jarias/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/jarias/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /home/jarias/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
source /usr/share/nvm/init-nvm.sh

#source <(doctl completion zsh)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.config/git-flow-completion.zsh
