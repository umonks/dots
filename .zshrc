export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

###
## Prompt

PROMPT_VCS_INFO_COLOR=$FG[242]
# Set required options.
setopt promptsubst
# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info
# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info
# Set vcs_info parameters.
zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c (%a)"
zstyle ':vcs_info:*:*' formats "%S" "%r/%s/%b %u%c"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""
# Define prompts.
PROMPT="%F{214}> %f"
RPROMPT="%{$PROMPT_VCS_INFO_COLOR%}%(?..%? )"'$vcs_info_msg_1_'"%{$FX[reset]%}"

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

###
## Aliases

alias v=nvim
alias lg="lazygit"
alias refresh="source ~/.zshrc"
