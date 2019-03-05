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
     [[ -z "$branch" ]] || echo -e "\001${cyan}${bold}\002(${branch})\001${reset}\002"
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


export XKB_DEFAULT_LAYOUT=se
export XKB_DEFAULT_VARIANT=svdvorak
export LC_CTYPE=sv_SE.UTF-8
export EDITOR=nvim

export http_proxy=http://wwwproxy:3128
export https_proxy=http://wwwproxy:3128
export ftp_proxy=http://wwwproxy:3128

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

cd() { builtin cd "$@" && ls; }
stty sane

setxkbmap se svdvorak
source ~/.aliases

export PS1='\[$reset$white\][\W]\[$reset\]$(parse_git_branch) \[$red\]> \[$reset\]'
