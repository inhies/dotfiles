#!bin/zsh
export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
alias gbr='go build && ./$(basename `pwd`)'
