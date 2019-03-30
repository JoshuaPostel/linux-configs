alias ll='ls $LS_OPTIONS -lA --color=auto'
alias grep='grep --color=auto'
alias lt='ls -lt'

ssh_search()
{
nmap -p 22 --open -sV 192.168.0.*
}
"ssh user@ip
