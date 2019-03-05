parse_git_branch() {
     branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
     [[ -z "$branch" ]] || echo "($branch)"
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
export PS1='\[\033[38;5;14m\]\u\[\033[38;5;15m\] @ \w\[\033[38;5;15m\]$(parse_git_branch) \[\033[38;5;14m\]> $(tput sgr0)'
