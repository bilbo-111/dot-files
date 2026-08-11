# Use nvim as the default editor so Claude Code's external editor (C-g) opens LazyVim
set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    ### THEME ###
    # Set theme only once per sesion (currently using coolbeans)
    if not set -q __fish_theme_set
        set -g __fish_theme_set 1
        fish_config theme choose coolbeans
    end

    ### ALIAS ###
    alias c='clear'
    alias d='docker'
    alias g='git'
    alias p='ipython'
    alias py='python3'
    alias v='nvim'

    ### TMUX AUTO-START ###
    # NOTE: Keep this block at the end
    # `exec` is intentionally NOT used so that detaching from tmux returns to a usable shell
    # If `exec` is used, detaching from tmux will close the terminal session
    if not set -q TMUX
        and not set -q SSH_TTY
        and type -q tmux
        tmux new-session -A -s main
        #exec tmux new-session -A -s main
    end
end
export PATH="$HOME/.local/bin:$PATH"
