#####################################
##==> Variables
#####################################
function shenv; set -gx $argv; end
source ~/.env

#####################################
##==> Aliases
#####################################
alias cls="clear"
alias g="git"
alias v="nvim"

alias ls='lsd'
alias l='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias lt='ls --tree'

#####################################
##==> Custom Functions
#####################################
function wget
    command wget --hsts-file="$XDG_DATA_HOME/wget-hsts" $argv
end

function nvidia-settings
    mkdir -p $XDG_CONFIG_HOME/nvidia/
    command nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings" $argv
end

#####################################
##==> Interactive Session Settings
#####################################
if status is-interactive

end

#####################################
##==> Shell Customization
#####################################
starship init fish | source
set fish_greeting

#####################################
##==> Development Tools
#####################################
##==> Pyenv
pyenv init - | source

#####################################
##==> Fun Stuff
#####################################
#pokemon-colorscripts --no-title -s -r 1,3,6
pokemon-colorscripts --no-title --name pikachu --form starter


