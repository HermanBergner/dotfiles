# config
autoload -Uz colors && colors
setopt PROMPT_SUBST


# functions
short_path() {
  local parts=(${(s:/:)PWD/#$HOME/\~})
  if (( ${#parts} <= 2 )); then
    echo "${(j:/:)parts}"
  else
    echo "${parts[1]}/.../${parts[-1]}"
  fi
}

git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  echo "%F{140}(%{%G%} $branch)%f "
}

prompt='%F{111}%{󰣇%G%}%f %F{250}$(short_path) $(git_branch)'
