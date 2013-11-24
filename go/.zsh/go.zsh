#!bin/zsh
export GOPATH=$HOME/projects/go
export GOROOT=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
alias gbr='go build && ./$(basename `pwd`)'
