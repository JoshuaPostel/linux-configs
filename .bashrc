
export VISUAL=vim
export EDITOR="$VISUAL"

alias ll='ls $LS_OPTIONS -lA --color=auto'
alias grep='grep --color=auto'
alias lt='ls -lt'
alias la='ls -lA'
alias lt='ls -lt'
alias lx='ls -lX'


ssh_search()
{
nmap -p 22 --open -sV 192.168.0.*
}
"ssh user@ip


source-activate()
{
source ~/envs/$1/bin/activate
}
