export ZSH="/Users/janhoon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias sleeplock="i3lock && echo mem > /sys/power/state"
alias k=kubectl
alias tf=terraform
alias cona='conda activate ${PWD##*/}'
alias conc='conda create -n ${PWD##*/}'
alias gocov="go test --short -coverprofile=coverage.out -tags=unit ./... && go tool cover -html=coverage.out && rm coverage.out"

eval $(kubectl completion zsh)
eval $(gh completion -s zsh)
 
eval $(thefuck --alias)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin:/$HOME/bin:$HOME/.local/bin
export COLORTERM=truecolor
export KIND_EXPERIMENTAL_PROVIDER=podman


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U compinit
compinit -i


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

alias dbt=meltano invoke dbt-redshift
alias dbt="meltano invoke dbt-redshift"
alias airflow="meltano invoke airflow"
alias activate-venv=". .venv/bin/activate"
alias airflow="meltano invoke airflow"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/janhoon/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/janhoon/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/janhoon/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/janhoon/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

alias gam="/Users/janhoon/bin/gam/gam"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
