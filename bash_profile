# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
alias ls='ls -G'
alias gt='git status'
alias gb='git branch'
alias em='emacs'


PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;31m\]\W\[\033[32m\]\$(parse_git_branch) \[\033[00m\]$ "

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
								    
function renamei2tab {
  echo -ne "\033]0;"$*"\007"
}
source /usr/local/bin/virtualenvwrapper.sh