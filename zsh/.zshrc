# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH=/usr/local/clamav/bin:/usr/local/clamav/sbin:$PATH
export HF_TOKEN="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"
ZSH_THEME="bira"

plugins=(
  git
  brew
  docker
)

source $ZSH/oh-my-zsh.sh
# ---- ALIASES  ----
alias pi_connect="kitten ssh -i ~/.ssh/id_rsa  silvan@192.168.178.29"
pi_copy() {
  scp -i ~/.ssh/id_rsa -r silvan@192.168.178.29:$1 $2
}
alias bfblog_connect="kitten ssh -v -i id_rsa root@78.47.164.41"
alias kitty_update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias brew_update="brew update && brew upgrade"
alias update_agts="/Users/silvanschermer/Steam/steamcmd +runscript /Users/silvanschermer/steam_cmd/agts.txt"
alias update_black_mesa="/Users/silvanschermer/Steam/steamcmd +runscript /Users/silvanschermer/steam_cmd/update_mesa.txt"

export PATH="/opt/homebrew/sbin:$PATH"

# HSTR
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel9k.zsh-theme 
source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
