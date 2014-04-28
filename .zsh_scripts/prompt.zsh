# Git prompt delimiters
ZSH_GIT_PROMPT_PREFIX="%F{248}["
ZSH_GIT_PROMPT_SUFFIX="]%f"
ZSH_GIT_DIRTY_PREFIX="%F{197}{"
ZSH_GIT_DIRTY_SUFFIX="}%f"

# Show git ref
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# Show git prompt
git_custom_prompt() {
  local git_where="$(parse_git_branch)"
  if command git diff-index --quiet HEAD 2> /dev/null; then
      [ -n "$git_where" ] && echo "$ZSH_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_GIT_PROMPT_SUFFIX"
  else
      [ -n "$git_where" ] && echo "$ZSH_GIT_DIRTY_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_GIT_DIRTY_SUFFIX"
  fi
}

# Set prompts
PS1='%F{244}$(_current_venv)%f%F{240}%M%f %F{227}$(_pwd_short)%f$ '
RPS1='$(git_custom_prompt) $EPS1'
