#personal bash profile

test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

alias cdrepo="cd /c/workspace/repos/"
alias cdgit="cd /c/workspace/repos/Fixturlaser/fixturlaser-ex-app-unity/"
alias gs="git status" gd="git diff" gp="git pull" gf="git fetch" gau="git add -u" 
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -lAh'

export repo="/c/workspace/repos/" fix="/c/workspace/repos/Fixturlaser/fixturlaser-ex-app-unity/" tool="/c/workspace/repos/Fixturlaser/androidTool/" door="/c/Workspace/repos/consat/door-bell-client/"

