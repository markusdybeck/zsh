# Load version control information
autoload -Uz vcs_info compinit && compinit
precmd() { vcs_info }

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

setopt PROMPT_SUBST
NEWLINE=$'\n' 
PROMPT='%F{10}%n %f%F{13}%D %*%f %F{14} %~%f %k %F{6}${vcs_info_msg_0_} %f${NEWLINE}λ '

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git   
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '|uncommited'
zstyle ':vcs_info:*' unstagedstr '|unstaged'                                           
zstyle ':vcs_info:git*' formats '[%b%c%u]'

# Aliases
alias ls="ls -lGH"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../"

# Git stuff
alias gs="git status"
alias gc="git add . && git commit -m"
alias gco="git checkout"
alias gbr="git branch --sort=-committerdate"

grc() { # Reset all commits in branch
git reset --soft $(git merge-base master $(git rev-parse --abbrev-ref HEAD))
}

# Programing stuff
alias mci="mvn clean install"
alias mcv="mvn clean verify"
alias test="mvn clean verify -P it"

intellij() {
  /Users/markus.dybeck/tools/intellij/idea $PWD
}

set_java_version() {
  echo "setting java version to $1"
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
  echo $JAVA_HOME
}
