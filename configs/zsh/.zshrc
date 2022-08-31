autoload -U colors && colors
echo $USER@$HOST on EndeavourOS Linux $(date)
setopt prompt_subst
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b "
RPROMPT="%{$fg[red]%} %(?..[%?])" 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export HISTFILE=~/.zhistory
export SAVEHIST=1000
