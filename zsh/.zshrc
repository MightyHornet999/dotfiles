

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_THEME="headline"

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh --cmd cd)"

export PATH="$PATH:$HOME/.cargo/bin"
