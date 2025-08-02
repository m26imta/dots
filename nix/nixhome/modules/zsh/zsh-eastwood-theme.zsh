# zsh-eastwood-theme.zsh
ZSH_THEME="eastwood"

# Tuỳ chỉnh màu sắc và prompt
PROMPT='%F{green}%n@%m%f %F{blue}%D{[%X]}%f %F{white}[%~]%f $(git_prompt_info)%F{blue}»%f '
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%f "
