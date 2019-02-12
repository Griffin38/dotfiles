#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# >>> Added by cnchi installer
EDITOR=/usr/bin/nano


#######MY adds #######
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

eval "$(direnv hook bash)"
eval "$(rbenv init -)"
source <(kitty + complete setup bash)

# BASH
export PS1="\[\033[38;5;38m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\e[31m\]@\[\e[m\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;226m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\e[31m\]*\[\e[m\]\[\033[38;5;32m\] \`parse_git_branch\`\n->\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
alias ls='ls -l --color=auto'

#GIT
alias gpush='git push'
alias gpull='git pull'
alias gckm='git checkout master'
alias gckb='git checkout -b'
alias gck='git checkout'
alias ggpush='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gbda='git branch --merged | grep -vE "master" | grep -vE "\*" | command xargs -n 1 git branch -d'

#work related
alias rs='./bin/rails s -b 127.0.0.1'
alias rc='./bin/rails c'
alias jek='bundle exec jekyll serve'
alias hrc='heroku run rails console -a'
# cd to projects
alias gv='cd ~/Documents/Code/viper'
alias gt='cd ~/Documents/Code/topnotes'
alias gg='cd ~/Documents/Code/grindhouse'

#music
alias pp='playerctl play-pause'
alias pn='playerctl next'
alias pb='playerctl previous'

#utility
alias checkKeys='xev -event keyboard'
alias clock='tty-clock -sScbn -C 6'
alias bell="echo $'\a'"

# sound output commands
alias listS='pacmd list-sinks | grep -e 'name:' -e 'index:''
alias setOH='pactl set-sink-port 1 analog-output-headphones'
alias setOS='pactl set-sink-port 1 analog-output-speaker'

# Protective owl
echo       '   _________ '
echo       '  /_  ___   \ '
echo       ' /3 \/8  \   \ '
echo       ' \__/\___/   / '
echo       '  \_\/______/ '
echo       '  /     /\\\\\ '
echo       ' |      \\\\\\\         Welcome '
echo       '  \      \\\\\\\ '
echo       '   \______/\\\\\ '
echo       '    _||_||_     '
