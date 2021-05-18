#!/bin/sh

# Personal todo.txt aliases.
alias todo-add='list-add -f ~/sync/todo/todo.txt'
alias todo-query='list-query -f ~/sync/todo/todo.txt'
alias todo-edit='${EDITOR} ~/sync/todo/todo.txt'
alias todo='todo-query -U'

# Task list.
alias task-query='todo-query -l task'
alias task-add='todo-add -l task'
alias task='task-query -U'

# School list.
alias school-query='todo-query -l school'
alias school-add='todo-add -l school'
alias school='school-query -U'

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

# Trip list.
alias trip-query='todo-query -l trip'
alias trip-add='todo-add -l trip'
alias trip='trip-query -U'

# Moving list.
alias moving-query='todo-query -l moving'
alias moving-add='todo-add -l moving'
alias moving='moving-query -U'

# Queue list.
alias queue-query='todo-query -l queue'
alias queue-add='todo-add -l queue'
alias queue='queue-query -U'
