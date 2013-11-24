# Easily get back to the root of our git repo
function cdgr {
    cd `git root`
}
alias gfreq='history | cut -c 8- | grep git | sort | uniq -c  | sort -n -r | head -n 5'
alias mdev='git checkout master && git merge --log --no-ff development -m "" && git push origin master && git checkout development'
alias findgits='find . -name .git -type d -prune'
