# Jones Arch live shell defaults

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

alias ll='ls -lah'
alias cls='clear'
alias update='sudo pacman -Syu'
alias ports='ss -tulpn'
alias please='sudo'
