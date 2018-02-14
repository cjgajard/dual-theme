# Helpers
local r="%{$reset_color%}"
local a="%{$fg[blue]%}"
local b="%{$fg_bold[cyan]%}"
local tf="%(?:$b:$a)"

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=" $b"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=''

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED="w"
ZSH_THEME_GIT_PROMPT_DELETED="d"
ZSH_THEME_GIT_PROMPT_RENAMED="r"
ZSH_THEME_GIT_PROMPT_MODIFIED="m"
ZSH_THEME_GIT_PROMPT_ADDED="a"
ZSH_THEME_GIT_PROMPT_UNTRACKED="u"

# Format for git_prompt_status_ext()
ZSH_THEME_GIT_STATUS_EXT_BEFORE="($r$a"
ZSH_THEME_GIT_STATUS_EXT_AFTER="$r$b)$r"

function git_prompt_status_ext() {
    local STATUS=$(git_prompt_status)
    [[ -n $STATUS ]] && echo "$ZSH_THEME_GIT_STATUS_EXT_BEFORE$STATUS$ZSH_THEME_GIT_STATUS_EXT_AFTER"
}

# Prompt
PROMPT="$a%c$r\$(git_prompt_info)\$(git_prompt_status_ext) $a=>$r "
RPROMPT="$tf%D{%a-%d %R}$r"
