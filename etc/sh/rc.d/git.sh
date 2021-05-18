#!/bin/sh
# git - aliases to make working with git(1) smoother

alias am='git am'
alias add='git add -v'
alias addall='git addall'
alias addp='git addp'
alias unadd='git unadd'
alias checkout='git checkout'
alias restore='git restore'
alias com='git commit'
alias amend='git commit -v --amend'
alias clone='git clone -vv'
alias push='git push -vv'
alias pull='git pull --rebase -vv'
alias status='git status --show-stash'
alias log='git log --patch-with-stat --summary -M -C -C'

alias rbc='git rbc'
alias re='git re'
alias ri='git ri'
alias merge='git merge'
alias stash='git stash'
alias pop='git stash pop'
alias branch='git branch'
alias amendall='addall;EDITOR=cat amend >/dev/null'

alias commits='PAGER=cat git local-commits --reverse --oneline'

alias rebase='git rebase'
alias reset='git reset'

# Alias used for my `me` dotfiles repository.
alias me='git --git-dir="${HOME}"/src/me.git --work-tree="${HOME}"'

