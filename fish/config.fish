if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Keep aliases the same as bash.
source ~/.bash_aliases

# Set the fonts and theme.
set -g theme_nerd_fonts yes
set -g theme_color_scheme base16-solarized-dark
set -g theme_powerline_fonts yes

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/field/miniconda/bin/conda
    eval /home/field/miniconda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/field/miniconda/etc/fish/conf.d/conda.fish"
        . "/home/field/miniconda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/field/miniconda/bin" $PATH
    end
end
# <<< conda initialize <<<

