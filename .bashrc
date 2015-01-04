cd ~
set -o vi

alias rm='rm -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

parse_perforce() {
   p4 info | grep 'Client root' | cut -f5 -d'/'
}
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
PS1="\$(parse_git_branch) | \$(parse_perforce) | \W $ "

function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
            *.jar)        jar -xvf $1     ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh

# make bash autocomplete with up/down arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias grep='grep --color=auto -r'

pjson () {
        python -c "import json; import sys; print json.dumps(json.loads(sys.stdin.read()), sort_keys=True, indent=2)"
}

pxml () {
    python -c "import sys; from xml.dom.minidom import parseString; s = sys.stdin.read(); parseString(s).toprettyxml()"
}

export TERM=xterm-256color
