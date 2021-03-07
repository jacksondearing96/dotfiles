set -o vi
bind '"jk":vi-movement-mode'

case $- in
    *i*) ;;
      *) return;
esac

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Set the prompt.
case "$TERM" in
    xterm-color|xterm-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# Useful colours for the terminal.
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

alias start='tmux a -t start'

alias copy-dotfiles='cp ~/.vimrc ~/dotfiles/ \
    ~/.tmux.conf ~/dotfiles/ \
    ~/.bashrc ~/dotfiles/ \
    ~/.bash_profile ~/dotfiles/'
