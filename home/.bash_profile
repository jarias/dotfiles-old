if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

 if [[ -s /Users/jarias/.rvm/scripts/rvm ]] ; then source /Users/jarias/.rvm/scripts/rvm ; fi
