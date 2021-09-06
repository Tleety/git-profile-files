
#Shell
alias ls='ls -F'
alias ll='ls -lh'
alias gh='history|grep'

#Paths
alias cdworkspace='cd /mnt/c/Workspace'
alias cdrepos='cdworkspace; Repos'
alias cdopensearch='cdrepos; cd OpenSearch/OpenSearch'
alias cdecarx='cd /mnt/c/Users/tobia/Documents/Ecarx'
alias cdecarxrepo='cdecarx;cd repo'
alias cdnotes='cd /mnt/c/Workspace/Note_vault'

#git
alias gs='git status'
alias ga='git add '
alias gc='git commit '
alias gcm='git commit -m '

#ssh 
alias sshAgent='eval $(ssh-agent);ssh-add'
alias sshecarx='eval $(ssh-agent);ssh-add /mnt/c/Users/tobia/Documents/Ecarx/repo/Ecarx_gitlab'

#autocorrect
alias got='git'
alias gut='git'

#Programs
alias bcomp='/mnt/c/Program\ Files/Beyond\ Compare\ 4/BCompare.exe'

# Kubernetes
## Get admin password for argocd
alias argocdPassword='kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo'

