#!/bin/ksh

alias todo-add='list-add -f ~/sync/todo/todo.txt'
alias todo-query='list-query -U -f ~/sync/todo/todo.txt'
alias todo-edit='${EDITOR} ~/sync/todo/todo.txt'

alias todo='todo-query'

alias grocery='todo-query -l grocery'
alias grocery-add='todo-add -l grocery'
alias wishlist='todo-query -l wishlist'
alias wishlist-add='todo-add -l wishlist'
