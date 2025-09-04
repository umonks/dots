export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

###
## Prompt

export LC_ALL=en_US.UTF-8

sep=·
# Set required options.
setopt promptsubst
# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info
# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info
# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c (%a)"
zstyle ':vcs_info:*:*' formats "%S" "$sep %r/%s/%b %u%c"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""
# Define prompts.
PROMPT="%F{214}>%f "
RPROMPT="$FG[242]%(?..%? $sep) %~ "'$vcs_info_msg_1_'"%{$FX[reset]%}"


###
## Library path

append_libpath() {
	case ":$LIBRARY_PATH:" in
		*:"$1":*)
			;;
		*)
			LIBRARY_PATH="${LIBRARY_PATH:+$LIBRARY_PATH:}$1"
	esac
}

append_libpath /opt/homebrew/opt/openssl/lib/

###
## Path

append_path() {
	case ":$PATH:" in
		*:"$1":*)
			;;
		*)
			PATH="${PATH:+$PATH:}$1"
	esac
}

append_path /opt/homebrew/bin
append_path ~/go/bin
append_path ~/bin
append_path ~/tools/zig/
append_path ~/.cargo/bin
append_path ~/.local/bin/

###
## Aliases

alias v=nvim
alias z="zellij"
alias lg="lazygit"
alias refresh="source ~/.zshrc"

alias virt="source ./venv/bin/activate"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

###
## Vars

export EDITOR=nvim
export PAGER=less
