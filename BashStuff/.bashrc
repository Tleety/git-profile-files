
function git_color {
  local git_status="$(git status 2> /dev/null)"
  
  if [[ ! $git_status =~ "Changes not staged for commit:" ]]; then
	  if [[ $git_status =~ "Your branch is behind" ]]; then
		  echo $(tput setaf 9)
	  else
	  	  echo $(tput setaf 10)
	  fi
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
	  echo $(tput setaf 9)
    elif [[ $git_status =~ "nothing to commit" ]]; then
	  echo $(tput setaf 12)
    else
	  echo $(tput setaf 13)
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' 	# set window title
	#PS1="$PS1"'\n'                 	# new line
	PS1="$PS1"'\[\033[32m\]'       		# change to green
	#PS1="$PS1"'\u@\h '             	# user@host<space>
	#PS1="$PS1"'\[\033[35m\]'       	# change to purple
	#PS1="$PS1"'$MSYSTEM '          	# show MSYSTEM
	PS1="$PS1"'\[$(tput setaf 4)\]'      	# change color
	PS1="$PS1"'\D{[%d.%m.%Y }'		# show date Day.month.year
	PS1="$PS1"'\[$(tput setaf 12)\]'       	# change colour 
	PS1="$PS1"'\D{%H:%M:%S}'		# show time HH:MM:SS	
	PS1="$PS1"'\[$(tput setaf 4)\]'      	# change color
	PS1="$PS1"'] '				#
	PS1="$PS1"'\[$(tput setaf 11)\]'       	# change colour
	PS1="$PS1"'/\W'				# current working directory

	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[$(git_color)\]' # change color to cyan
			PS1="$PS1"'`__git_ps1`'   # bash function
		fi
	fi
	PS1="$PS1"'\[\033[0m\]'        # change color
	#PS1="$PS1"'\n'                 # new line
	PS1="$PS1"' $ '                 # prompt: always $
	fi

MSYS2_PS1="$PS1"               # for detection by MSYS3 SDK's bash.basr

