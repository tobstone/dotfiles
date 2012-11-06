source /usr/local/Library/Contributions/brew_bash_completion.sh
alias cl='clear'
alias ls='ls -G'
alias ll='ls -alhfG'       
alias up='cd ..'           
alias mate='sudo mate'
alias vi='vim'
alias R8='mogrify -resize 800x800 -quality 80% *.jpg *.JPG'
alias R10='mogrify -resize 1024x1024 -quality 80% *.jpg *.JPG'
alias cdf='eval `osascript /Applications/OpenTerminal.app/ Contents/Resources/Scripts/OpenTerminal.scpt `'
alias SL='pmset sleepnow'
alias t='todo.sh'
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
# export EDITOR='mate -w'
export EDITOR='/usr/local/bin/mvim -f'
# export EDITOR='mvim -f -c"au VimLeave * !open -a Terminal"'
export PAGER=/usr/local/bin/vimpager 
alias less=$PAGER
alias more=$PAGER
alias gca='git commit -a'
alias gp='git push'
complete -F _todo t


function git_diff() {
  git diff --no-ext-diff -w "$@" | mvim -R -
}
BASHISHDIR="/usr/local/Cellar/bashish/2.2.4/share/bashish"                 ## line added by bashish
TTY=`tty 2>/dev/null` && if test "x$BASHISHDIR" != x;then       ## line added by bashish
test "$BASHISH_OLDPATH"||BASHISH_OLDPATH="$PATH"                ## line added by bashish
PATH="$HOME/.bashish/launcher:$BASHISHDIR/lib:$BASHISH_OLDPATH" ## line added by bashish
BASHSISH_CP=437                                                 ## line added by bashish
TEST_TERM="$TERM" _bashish_utfcheck && BASHISH_CP=utf8          ## line added by bashish
ENV="$HOME/.profile"                                            ## line added by bashish
export BASHISH_CP BASHISH_OLDPATH TTY ENV                       ## line added by bashish
. "$BASHISHDIR/main/prompt/sh/init"                             ## line added by bashish
fi  ## line added by bashish

PATH="/usr/local/bin:/usr/local/sbin:/Users/tobias/bin:$PATH"

