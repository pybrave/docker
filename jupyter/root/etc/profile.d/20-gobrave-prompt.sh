# Global colourful prompt + handy aliases for *interactive* shells.
#
# Why here and not ~/.bashrc?
#   /config is the user's $HOME but it is also a *volume* in linuxserver.io
#   images.  Anything shipped in /config gets shadowed as soon as the user
#   mounts their own volume, and root / `docker exec` never reads it at all.
#
# This file is loaded by:
#   - login shells      : /etc/profile -> /etc/profile.d/*.sh
#   - non-login shells  : /etc/bash.bashrc (we source it from there too)
#
# ...so colours work for root, for `abc`, for `docker exec`, for the
# JupyterLab terminal and for code-server alike.

# Skip everything for non-interactive shells.
case $- in
    *i*) ;;
      *) return 2>/dev/null || exit 0 ;;
esac

# ---- coloured, highlighted prompt -------------------------------------------
if [ -n "${BASH_VERSION-}" ]; then
    PS1='\[\e[1;32m\]@\u\[\e[0m\] ➜  \[\e[1;34m\]\w\[\e[0m\] \[\e[1;33m\]\$\[\e[0m\] '
fi

# ---- colourised ls / grep ----------------------------------------------------
if command -v dircolors >/dev/null 2>&1; then
    test -r "$HOME/.dircolors" && eval "$(dircolors -b "$HOME/.dircolors")" \
                              || eval "$(dircolors -b)"
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ---- convenience listings ----------------------------------------------------
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ---- history ----------------------------------------------------------------
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend checkwinsize 2>/dev/null || true
