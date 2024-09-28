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
ZSH_THEME="bira"

plugins=(
  git
  brew
  docker
)

source $ZSH/oh-my-zsh.sh
# ---- ALIASES  ----
alias pi_connect="kitten ssh -i ~/.ssh/id_rsa  silvan@192.168.178.29"

## --- PACKAGE MANAGER

identify_package_manager() {
    if [[ -z "$PKG_MANAGER" ]]; then
        os_name=$(uname)

        # Check for macOS and Homebrew
        if [[ "$os_name" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
            export PKG_MANAGER="brew"

        # Check for Linux and apt-get
        elif [[ "$os_name" == "Linux" ]] && command -v apt-get >/dev/null 2>&1; then
            export PKG_MANAGER="apt-get"

        # Check for Linux and dnf
        elif [[ "$os_name" == "Linux" ]] && command -v dnf >/dev/null 2>&1; then
            export PKG_MANAGER="dnf"

        else
            echo "No known package manager found!"
        fi
    else
        echo "PKG_MANAGER is already set to: $PKG_MANAGER"
    fi
}
identify_package_manager()

alias bfblog_connect="kitten ssh -v -i id_rsa root@78.47.164.41"
alias kitty_update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"

update_system() {
    if [[ -z "$PKG_MANAGER" ]]; then
        echo "Package manager is not set. Please run identify_package_manager first."
        return 1
    fi

    case "$PKG_MANAGER" in
        brew)
            brew update && brew upgrade
            ;;
        apt-get)
            sudo apt-get update && sudo apt-get upgrade -y
            ;;
        dnf)
            sudo dnf update -y && sudo dnf upgrade -y
            ;;
        *)
            echo "Unknown package manager: $PKG_MANAGER"
            return 1
            ;;
    esac
}

install_package() {
    if [[ -z "$PKG_MANAGER" ]]; then
        echo "Package manager is not set. Please run identify_package_manager first."
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo "Please specify a package to install."
        return 1
    fi

    package_name=$1

    case "$PKG_MANAGER" in
        brew)
            brew install "$package_name"
            ;;
        apt-get)
            sudo apt-get install -y "$package_name"
            ;;
        dnf)
            sudo dnf install -y "$package_name"
            ;;
        *)
            echo "Unknown package manager: $PKG_MANAGER"
            return 1
            ;;
    esac
}

remove_package() {
    if [[ -z "$PKG_MANAGER" ]]; then
        echo "Package manager is not set. Please run identify_package_manager first."
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo "Please specify a package to remove."
        return 1
    fi

    package_name=$1

    case "$PKG_MANAGER" in
        brew)
            brew uninstall "$package_name"
            ;;
        apt-get)
            sudo apt-get remove --purge -y "$package_name"
            ;;
        dnf)
            sudo dnf remove -y "$package_name"
            ;;
        *)
            echo "Unknown package manager: $PKG_MANAGER"
            return 1
            ;;
    esac
}


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
