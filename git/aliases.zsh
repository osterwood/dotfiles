# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

## http://mjk.space/git-aliases-i-cant-live-without/

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD' 

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
# Changes that have been staged
alias gdc='git diff --cached' 

alias gc='git commit'
alias gca='git commit -a'
alias gca!='git commit -a --amend'

alias gcl='git clone'
alias gco='git checkout'
alias gcm='git checkout master'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'
alias gf='git fetch'
alias ga='git add'
alias glr='git pull --rebase'

# alias ggrh = 'git reset --hard origin/$(current_branch)'

alias gsta='git stash'
alias gstp='git stash pop'

# Function takes a name of a file you want to “uncommit”, removes all changes made 
# to this file from the HEAD commit, but leaves it untouched in the working directory. 
# Then it’s ready to be staged again, maybe as a separate commit.
gfr() { 
    git reset @~ "$@" && git commit --amend --no-edit 
}