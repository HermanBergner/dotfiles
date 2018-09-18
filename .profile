export TERM=xterm-256color
source dotfiles/.alias
. /usr/local/etc/profile.d/z.sh

function parse_git_branch {
  git branch 2> /dev/null | sed  -e 's/* \(.*\)/[\1]/'
}
export PS1="\e[34m</\e[39m\W\e[34m/>\e[39m\e[93m\$(parse_git_branch)\e[34m -> \e[39m"

