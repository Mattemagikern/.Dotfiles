exec 3>&2
exec 2> /dev/null
export TERM=xterm
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)" 
purple="$(tput setaf 5)"
cyan="$(tput setaf 6)"
white="$(tput setaf 7)"

bold="$(tput bold)"
underline="$(tput smul)"
reset="$(tput sgr0)"

parse_git_branch() {
	local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	local status=$(git status -s 2>/dev/null)
	local color=$cyan

	[ ${#status} -ne 0 ] && color=$yellow

	[[ -z "$branch" ]] || echo -e " [\001${color}${bold}\002${branch}\001${reset}\002]"
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi


source ~/.aliases
stty sane

export PROMPT_DIRTRIM=2

PROMPT_COMMAND=__prompt_command

__prompt_command() {
	local curr_exit="$?"
	local BRed='\[\e[0;91m\]'
	local RCol='\[\e[0m\]'
	PS1='\001${cyan}${bold}\002\w\001${reset}\002\[${reset}\]$(parse_git_branch)' 

	if [ "$curr_exit" != 0 ]; then
		PS1="$PS1(${BRed}$curr_exit${RCol})"
	fi
	PS1="$PS1 \[${bold}${red}\]>\[${reset}\] "
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin/:/opt/SEGGER/JLink/
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin/
export PATH=$PATH:$HOME/.local/bin/
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s histappend

export PATH=$PATH:$HOME/Downloads/zig-linux-x86_64-0.6.0/

ssh-add -l &>/dev/null
if [ "$?" == 2 ]; then
	test -r ~/.ssh-agent && \
		eval "$(<~/.ssh-agent)" &> /dev/null

	ssh-add -l &>/dev/null
	if [ "$?" == 2 ]; then
		(umask 066; ssh-agent -a ~/agent.sock &> ~/.ssh-agent)
		eval "$(<~/.ssh-agent)" &> /dev/null
		ssh-add &> /dev/null
	fi
fi
exec 2>&3
export PATH=$PATH:/opt/JLink
