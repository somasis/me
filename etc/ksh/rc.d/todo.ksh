#!/bin/ksh

# Personal todo.txt aliases.
alias todo-add='list-add -f ~/sync/todo/todo.txt'
alias todo-query='list-query -f ~/sync/todo/todo.txt'
alias todo-edit='${EDITOR} ~/sync/todo/todo.txt'
alias todo='todo-query -U'

# Grocery list.
alias grocery-query='todo-query -l grocery'
alias grocery-add='todo-add -l grocery'
alias grocery='grocery-query -U'

# Wish list.
alias wish-query='todo-query -l wish'
alias wish-add='todo-add -l wish'
alias wish='wish-query -U'

# To-listen list.
alias listen-query='todo-query -l listen'
alias listen-add='todo-add -l listen'
alias listen='listen-query -U'

# To-watch list.
alias film-query='todo-query -l watch -t film'
alias film-add='todo-add -l watch -t film'
alias film='film-query -U'
alias tv-query='todo-query -l watch -t tv'
alias tv-add='todo-add -l watch -t tv'
alias tv='tv-query -U'

