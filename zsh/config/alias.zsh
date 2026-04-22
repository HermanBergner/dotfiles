# Function
current_branch() { git symbolic-ref --quiet --short HEAD || git rev-parse --short HEAD 2>/dev/null; }
main_branch() { git rev-parse --abbrev-ref origin/HEAD 2>/dev/null | sed 's@^origin/@@'; }

gco() {
  if [[ "$1" == "-r" ]]; then
    # remote branches
    branch=$(git branch -r --format='%(refname:short)' | sed 's/^origin\///' | sort -u | fzf)
    [[ -n "$branch" ]] && git checkout -t "origin/$branch"
  else
    # local branches
    branch=$(git branch --format='%(refname:short)' | fzf)
    [[ -n "$branch" ]] && git checkout "$branch"
  fi
}

gpsup() { git push --set-upstream origin "$(current_branch)"; }
gcm() { git checkout "$(main_branch)"; }

# Aliases
alias n='nvim'
alias tf='terraform'
alias gss='git status --short'
alias gaa='git add --all'
alias gc='git commit'
alias gd='git diff'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch'
