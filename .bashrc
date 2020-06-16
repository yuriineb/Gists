#
# ~/.bashrc
#

# 
# Prompt and colors
#

PS1='\[\033[01;35m\]\w\[\033[91m\]\$ '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(1)/''
}

export PS1='\[\033[01;35m\]\w \[\033[91m\] $ parse_git_branch\[\e[00mBlink\]$ "'

shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

#####################
#                   #
#       ALIAS       #
#                   #
#####################

# Stack size and common abbreviations
ulimit -s unlimited

# ----------------------
# WP CLI
# ----------------------
alias wpthl='wp theme list'
alias wppll='wp plugin list'

# ----------------------
# Git Command Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd="git diff -- . ':!*.min.js' ':!*.min.css' ':!*.min-rtl.css'"
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gpu='git pull origin'
alias gpr='git pull --rebase'
alias gpp='git push origin'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Grunt Aliases
# ----------------------
alias grr='grunt release'
alias grm='grunt minify'

# ----------------------
# PHPCS
# ----------------------
alias pb='phpcs'
alias pbf='phpcbf'
alias gh="cd G:Code/GitHub/"
alias Resources="G:/Code/GitHub/WeilerWebServices/Resources"
alias 1='ls -1 --color=always'
alias hist='history'
alias df="df -h | gawk '{print \$2,\$3,\$4,\$5,\$6}' OFS='\t'"
alias ed='nano'
alias less='less -SR'
alias open.='start .'
alias q='exit'
alias mk='mkdir'
alias notepad="/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"
alias pn="/g/Code/Editor/Programmer's Notepad/pn.exe"
alias np="/g/Code/Editor/Notepad++/notepad++.exe"
alias cpy='clip.exe'
alias paste='cat > '
alias ls='ls -apsh1 --color=auto'
alias lsr='ls -ahCFR --color=tty'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias mp4='youtube-dl -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
alias mp3='youtube-dl -f bestaudio[ext=mp3]/best -x --audio-format "mp3" --audio-quality 0 --embed-thumbnail $*'
alias webserver='python3 -m http.server'
alias cmesg='git diff --name-only'
alias gstore='git config credential.helper store'
alias gl='git log --pretty -n 2 --stat'
alias gl1='git log --pretty=oneline -n 2 --stat'
alias gl2='git log --graph --oneline --decorate --all'
alias la="!git config -l | grep alias | cut -c 7-"
alias a='add'
alias c = commit --verbose
alias ca = commit -a --verbose
alias ga="!git add -A && git add ."
alias gac='!git add -A && git commit -a -m'
alias gc='git clone'
alias gco="git checkout"
alias gs='git status -u'
alias mocp="mocp; mocp -x"
alias clear_cache="sudo paccache -rk0"
alias gpfw="python ~/GitHub/gopro_fw_dl/gopro-fw-dl.py"
alias inotify_increase="echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system"
alias fixadb="sudo adb kill-server && sudo adb devices"
alias dmenu_fixed="dmenu_run -fn '-xos4-terminus-medium-r-*-*-14-*' -h 26"
alias cleanphoto="exiftool -all= $*"
alias yt='youtube-dl'
alias mv='mv -v'
alias cp='cp -R'
alias rm='rm -rf'
alias np="'G:/Code/Editor/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
alias pn="'G:/Code/Editor/Programmer's\ \Notepad/pn.exe' -multiInst -notabbar -nosession -noPlugin"
alias meld="'G:/Code/Editor/MeldPortable' -multiInst -notabbar -nosession -noPlugin"

#####################
#                   #
#     SHORTCUTS     #
#                   #
#####################

alias d="cd ~/c/Users/natew/Downloads/"
alias gh="cd ~/g/Code/GitHub/"
alias res="cd ~/g/Code/GitHub/WeilerWebServices/Resources/"
alias h="cd ~"

#####################
#                   #
#     FUNCTIONS     #
#                   #
#####################

I'm using the Git Bash command shell for Windows, and as someone noted above, using clip is very annoying, because it also copies the carriage return at the end of the output of any command. So I wrote this function to address it:

function cpy {
while read data; do     # reads data piped in to cpy
    echo "$data" | cat > /dev/clipboard     # echos the data and writes that to /dev/clipboard
done
tr -d '\n' < /dev/clipboard > /dev/clipboard     # removes new lines from the clipboard
}

function paste() {
    printf $(</dev/stdin) | clip.exe
}
export -f paste

function open {
while read data; do
    echo "$data" | cat > /dev/clipboard
done
tr -d '\n' < /dev/clipboard > /dev/clipboard
}

sprunge() {
	if [[ $1 ]]; then
	curl -F 'sprunge=<-' "http://sprunge.us" <"$1"
	else
	curl -F 'sprunge=<-' "http://sprunge.us"
	fi
}

linx(){
	curl -T "$@" -H "Linx-Randomize: yes" https://linx.li/upload/  
}

mdd(){
	mkdir $1 && cd $1
}

webm(){
	ffmpeg -i $i -c:v libvpx -b:v 1M -c:a libvorbis $o
}

yturlfix(){
	url=$1;
	echo $url | sed 's/.be\//be.com\/watch?v=/g'
}

stfu() {
	exec "$@" 1>/dev/null 2>/dev/null &
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

update_fork() {
git fetch upstream
git rebase upstream/master
git push -f origin master
}

#####################
#                   #
#  NO-OUT COMMANDS  #
#                   #
#####################

alias gedit='stfu gedit'
alias gimp='stfu gimp'
alias chrome='stfu chrome'


#####################
#                   #
#  GLOBAL VARIABLES #
#                   #
#####################

BROWSER=/usr/bin/chrome
EDITOR=nano
export GREP_COLOR="1;32"
export PROMPT_DIRTRIM=2
export PS1='\[\033[01;35m\]\w \[\033[91m\] $ parse_git_branch\[\e[00mBlink\]$ "''
export PATH=$PATH:~/.npm-global/bin

###############################
#                             #
#  SHORTHAND DOCKER COMMANDS  #
#                             #
###############################

alias docker_start="systemctl start docker"
alias docker_debian="docker run -it debian /bin/bash"
alias docker_psh="docker run -it microsoft/powershell"


#####################
#                   #
#      TERMUX       #
#                   #
#####################

var=$0
if [ $var = "/data/data/com.termux/files/usr/bin/bash" ]
	then
		date

		alias t="tmux"
		alias c="cat"
		alias r="ra/nger"
		alias py="python3"
		alias python="python3"
		alias tree='tree -C'
		alias ls='ls -ash1 --color=auto'
	else
		alias grep='grep --color=auto'
		alias diff='diff --color=auto'
		alias dmesg='dmesg --color=auto'
		alias tree='tree -C'
		alias dir='dir --color=auto'
		alias egrep='egrep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias ip='ip -c'
		alias pcregrep='pcregrep --color=auto'
		alias vdir='vdir --color=auto'
		alias watch='watch --color'
		alias cower='cower --color=auto'
		alias mc="mc -b"
		alias mocp='mocp -T blackwhite'
fi

### MISC ###

shopt -s autocd

if [ -e ~/scripts/bash_private.sh ]; then
alias grep='grep --color=auto'
                alias diff='diff --color=auto'
                alias dmesg='dmesg --color=auto'
                alias tree='tree -C'
                alias dir='dir --color=auto'
                alias egrep='egrep --color=auto'
                alias fgrep='fgrep --color=auto'
                alias ip='ip -c'
                alias pcregrep='pcregrep --color=auto'
                alias vdir='vdir --color=auto'
                alias watch='watch --color'
                alias cower='cower --color=auto'
                alias mc="mc -b"
                alias mocp='mocp -T blackwhite'	. ~/scripts/bash_private.sh fi
