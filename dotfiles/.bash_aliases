#!/bin/bash

######################
# General aliases    #
######################

reload_bash() { source ~/.bashrc;}
alias reload=reload_bash

reload_inpturc() { bind -f ~/.inputrc; }
alias reloadin=reload_inpturc

# ls aliases
alias ll='ls -lh'
alias ll.='ls -Alh'
alias ll..='ls -alh'
alias l.='ls -dh .?[^.]* 2>/dev/null'
alias l.l='ls -dlh .?[^.]* 2>/dev/null'
alias l..='ls -dh .*'
alias l..l='ls -dlh .*'
alias l='ls'
alias sl='ls'
alias s='ls'

# So python opens 3 not 2
alias python='python3'
alias py='python3'
alias cl='clear -x'
alias ex='exit'

function vim_space() { vim $1; echo ""; } 
# alias v=vim_space
alias v=vim

function less_space() { less $1; echo ""; } 
alias les=less_space

alias em='emacs -nw'

# $1 = source; $2 = target
function symbolic_link() { ln -s "$1" "$2"; }
alias lns=symbolic_link

######################
# CD Aliases & Utils #
######################

# String that holds last directory visited
if [[ $opw == "" ]] ; then  
	opw=$PWD
fi

cd_dotdot_1() { opw=$PWD; cd ..; }
cd_dotdot_2() { opw=$PWD; cd ../..; }
cd_dotdot_3() { opw=$PWD; cd ../../..; }
cd_dotdot_4() { opw=$PWD; cd ../../../..; }

alias ..=cd_dotdot_1
alias ....=cd_dotdot_2
alias ......=cd_dotdot_3
alias ........=cd_dotdot_4

# cd ../ * N where N = $1
up() { local old="$PWD"; cd $(eval printf '../'%.0s {1..$1}); opw="$old"; }

cd_to_home() { opw="$PWD"; cd ~; } 
alias h=cd_to_home

cd_to_dir() { opw="$PWD"; cd "$1"; ls; }
alias c=cd_to_dir

# Go to last directory
go_to_last_dir(){ local hold=$PWD; cd $opw; opw=$hold; }
alias ow=go_to_last_dir

# Bookmark directory and return
if [[ $bookmark == "" ]]; then  
	bookmark=$PWD
fi

set_bookmark()  { bookmark=$PWD; echo $"bookmark: $PWD"; }
alias bm=set_bookmark

goto_bookmark() { if [ $PWD != $bookmark ] ; then opw=$PWD; fi; cd $bookmark; }
alias gbm=goto_bookmark

# handy directory aliases
go_to_repos() { opw=$PWD; cd ~/projects/repos; }
alias repos=go_to_repos
alias re=go_to_repos

# WSL File Explorer
open_file_explorer() { explorer.exe . ; }
alias exp=open_file_explorer

# expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//----/g' -e 's/^//' -e 's/--/|/'"

alias duh='du -hs'

# List by file size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"):    $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'; } 

######################
# Git Aliases        #
######################

git_add_commit() { git add .; git commit -m "$1"; }
alias gitac=git_add_commit

git_add_commit_date() { git add . ; git commit --date="$2" -m "$1"; } 
alias gitacd=git_add_commit_date

git_add_commit_push() { git add .; git commit -m "$1"; git push; }
alias gitap=git_add_commit_push

git_push() { git push; } 
alias gitp=git_push
alias gitpush=git_push 

git_pull() { git pull; }
alias gitpl=git_pull
alias gitpull=git_pull

######################
# Permission Aliases #
######################

alias meprotect='chmod 400'
alias meonly='chmod 700'
alias shareread='chmod 750'
alias shareex='chmod 770'
alias shareall='chmod 777'

######################
# Build Aliases      #
######################

alias makef='make -f'

######################
# Slurm Aliases      #
######################

alias sq='squeue -me'

######################
# Config Aliases     #
######################

alias rc='code ~/projects/repos/bash/bash.code-workspace'
alias rca='vim ~/.bash_aliases'
alias vimrc='code ~/projects/repos/vimrc/vimrc.code-workspace'
alias nanorc='code ~/projects/repos/nanorc/nanorc.code-workspace'
alias inputrc='vim ~/.inputrc'
