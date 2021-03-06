#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# >>> Added by cnchi installer
EDITOR=vim


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

# BASH
export PS1="\[\033[38;5;38m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\e[31m\]@\[\e[m\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;226m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\e[31m\]*\[\e[m\]\[\033[38;5;32m\] \`parse_git_branch\`\n~>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
alias ls='ls -l --color=auto'

#GIT
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  __git_complete gck _git_checkout
  __git_complete gm __git_merge
fi
alias gpush='git push'
alias gpull='git pull'
alias gckm='git checkout master'
alias gckb='git checkout -b'
alias gck='git checkout'
alias gmerge='git checkout'
alias ggpush='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gbda='git branch --merged | grep -vE "master" | grep -vE "\*" | command xargs -n 1 git branch -d'
#work related
export PATH_TO_PROJECTS="$HOME/Documents/code"
alias rs='./bin/rails s -b 127.0.0.1'
alias rc='./bin/rails c'
alias jek='bundle exec jekyll serve'
alias hrc='heroku run rails console -a'
# cd to projects
alias gv="cd $PATH_TO_PROJECTS/viper"
alias gt="cd $PATH_TO_PROJECTS/topnotes"
alias gg="cd $PATH_TO_PROJECTS/grindhouse"
alias gk="cd $PATH_TO_PROJECTS/kopi"
#music
alias pp='playerctl play-pause'
alias pn='playerctl next'
alias pb='playerctl previous'

#utility
alias checkKeys='xev -event keyboard'
alias clock='tty-clock -sScbn -C 6'
alias bell="echo $'\a'"

echo '    z '
echo '     z ,_,       _'
echo '      (-,-)    |/ '
echo ' \|   {`"`}   // '
echo '  \`--´-"-"~^´/ '
echo '   ``````\ \´´  _`/   '
echo '         | |   /~´   ,_,'
echo '         | \__//    (o,o)'
echo '          \ | |     {`"`}    _'
echo '           \\ \     /"-"----´ | '
echo '            `\ `---/ /´´´´´´´´'
echo '              `-.  /|'
echo '                 \ `\'
echo '             ____/_|.\____'

source <(kitty + complete setup bash)
source /usr/share/nvm/init-nvm.sh
eval "$(direnv hook bash)"
eval "$(rbenv init -)"

