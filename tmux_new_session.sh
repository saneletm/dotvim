#!/bin/bash                                                                                              

SESSIONNAME="reports"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
then
    tmux new-session -s $SESSIONNAME -n server -d
    tmux new-window -n dev -d
    tmux split-window -t server -h
    tmux new-window -n init -d
    tmux new-window -n bash -d
    tmux new-window -n bash -d
    tmux new-window -n view1 -d
    tmux new-window -n view2 -d
    tmux new-window -n templ1 -d
    tmux new-window -n templ2 -d
    tmux new-window -n ipython -d
    #tmux send-keys -t $SESSIONNAME "~/enthenergy/etireports/etirweb" C-m 
  fi

tmux attach -t $SESSIONNAME
