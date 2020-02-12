red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)" purple="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"

bold="$(tput bold)"
underline="$(tput smul)"
reset="$(tput sgr0)"

parse_git_branch() {
     local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	 [[ -z "$branch" ]] || echo -e "(\001${cyan}${bold}\002${branch}\001${reset}\002)"
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


export EDITOR=nvim


export PATH=$PATH:/usr/local/go/bin/
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin/
export PATH=$PATH:$HOME/.local/bin/

source ~/.aliases

cd() { builtin cd "$@" && ls ; }
stty sane
export PROMPT_DIRTRIM=2

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local curr_exit="$?"

    local BRed='\[\e[0;91m\]'
    local RCol='\[\e[0m\]'
PS1='[\001${cyan}${bold}\002\w\001${reset}\002]\[${reset}\]$(parse_git_branch)' 

    if [ "$curr_exit" != 0 ]; then
		PS1="$PS1(${BRed}$curr_exit${RCol})"
	fi
	PS1="$PS1 \[${bold}${red}\]> \[${reset}\]"
}

export playtime="$HOME/.local/share/lxc/playtime/rootfs/"

#Zephyr
export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
export ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk/
export GNUARMEMB_TOOLCHAIN_PATH=~/libs/gcc-arm-none-eabi-8-2019-q3-update/

export PATH=$PATH:/opt/SEGGER/JLink/
export PATH=~/.local/bin:"$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export HISTFILESIZE=10000
bonsai -m "$(fortune)"
