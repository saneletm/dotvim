#!/bin/bash                                                                                              

SESSIONNAME="reports"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
then
    tmux new-session -s $SESSIONNAME -n server -d  'cd ~/enthenergy/etireports/etirweb; bash -i'
    tmux new-window -n dev -d   'cd ~/enthenergy/etireports/etirweb; bash -i'
    tmux split-window -t server -h  
    tmux new-window -n init -d 'cd ~/enthenergy/etireports/etirweb; bash -i'
    tmux new-window -n bash -d 'cd ~/enthenergy/etireports/etirweb/etirweb/static; bash -i'
    tmux new-window -n bash -d 'cd ~/enthenergy/etireports/etirweb/etirweb/static; bash -i'
    tmux new-window -n view1 -d 'cd ~/enthenergy/etireports/etirweb/etirweb/views; bash -i'
    tmux new-window -n view2 -d 'cd ~/enthenergy/etireports/etirweb/etirweb/views; bash -i'
    tmux new-window -n templ1 -d 'cd ~/enthenergy/etireports/etirweb/etirweb/templates; bash -i'
    tmux new-window -n templ2 -d 'cd ~/enthenergy/etireports/etirweb/etirweb/templates; bash -i'
    tmux new-window -n ipython -d
    #tmux send-keys -t $SESSIONNAME "~/enthenergy/etireports/etirweb" C-m 
  fi

tmux attach -t $SESSIONNAME
