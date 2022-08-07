# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ahmedosama/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# zsh aliases
alias ps="phpstorm ."
alias ws="webstorm ."
alias zshrc="vim $HOME/.zshrc"
alias ohmyzsh="vim $HOME/.oh-my-zsh"
alias src="source $HOME/.zshrc"
alias cpssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias ports="sudo lsof -PiTCP -sTCP:LISTEN"
alias notify='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?" -sound "default"' -activate com.apple.Terminal

#hugo
export PATH="$HOME/.symfony/bin:$HOME/.composer/vendor/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/opt/homebrew/bin:$PATH"

# Artisan aliases
alias pa="php artisan"
alias par:l='php artisan route:list'
alias pam='php artisan migrate'
alias pam:f="php artisan migrate:fresh"
alias pam:r='php artisan migrate:refresh'
alias pam:fs="php artisan migrate:fresh --seed"
alias pam:rs='php artisan migrate:refresh --seed'
alias serve="pa serve"
alias pat="pa tinker"


# Testing aliases
alias unit="./vendor/bin/phpunit "
alias pf="phpunit --filter "


# GIT aliases
alias gr="git remote add"
alias gp="git push"
alias gs="git status"
alias gb="git checkout -b"
alias gi="git add -A && git commit -m"
alias gpl="git pull"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah="git reset --hard;git clean -df"
alias dracarys="git reset --hard;git clean -df"
function gpo() { git push origin $(git symbolic-ref HEAD --short) }
function gpu() {git push --set-upstream origin $(git symbolic-ref HEAD --short)}
function gc() {
      local branches branch
      branches=$(git branch -vv) &&
      branch=$(echo "$branches" | fzf +m) &&
      git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Composer aliases
alias cdo="composer dump-autoload -o"
alias ci="composer install"
alias cu="composer update"
alias cr="composer require"

# Youtube aliases
alias mp3="youtube-dl --extract-audio --audio-format mp3 "
alias mp4="youtube-dl -f 'bestvideo+bestaudio/best' "
alias ydl="youtube-dl "

# Spryker aliases
alias sp:off="docker/sdk down; docker system prune --all --volumes -f; docker/sdk clean-data; rm -rf src/Generated; rm -rf vendor; rm -rf node_modules; notify";
alias sp:on="docker/sdk boot deploy.dev.yml; docker/sdk up; notify";
alias sp:dd="git clone git@github.com:spryker/docker-sdk.git docker; cd docker; git checkout apple-m1-adjustments; cd ../; gsed -i 's/export COMPOSE_CONVERT_WINDOWS_PATHS=1/export COMPOSE_CONVERT_WINDOWS_PATHS=0/g' 'docker/bin/environment/docker-compose.sh'"
function replaceSprykerGitHook()
{
    gsed -i 's/# To enable this hook, rename this file to "pre-commit"./echo "======== Fixing code style ======";\n docker\/sdk console c:s:s -f;\n echo "===== Checking non-fixable code style =========";\n docker\/sdk console c:s:s;\n echo "============ PHP MD ==========";\n docker\/sdk cli vendor\/bin\/phpmd src\/ text vendor\/spryker\/architecture-sniffer\/src\/ruleset.xml --minimumpriority 2;\n echo "============ PHP Stan ===========";\n docker\/sdk cli vnedor\/bin\/phpstan analyze -l 4 -c phpstan.neon src\/ --debug; /g' ".git/hooks/pre-commit"
}
function sp:install() {
    local repo="${1-}";

    hub clone spryker-projects/$repo;
    cd $repo;
    sp:dd;
    mv .git/hooks/pre-commit.sample .git/hooks/pre-commit;
    replaceSprykerGitHook();
    sp:on;
}


function sp:csc() {
    echo "=================== Fixing code styling ===============";
    docker/sdk console c:s:s -f;

    echo "=================== Checking non-fixable code styling ===============";
    docker/sdk console c:s:s;

    echo "=================== PHP MD ===============";
    docker/sdk cli vendor/bin/phpmd src/ text vendor/spryker/architecture-sniffer/src/ruleset.xml --minimumpriority 2

    echo "=================== PHP Stan ===============";
    docker/sdk cli vendor/bin/phpstan analyze -l 4 -c phpstan.neon src/ --debug
}
function sp:import() {
    local importer="${1-}"
    if [ -z "$importer" ] 
    then
        docker/sdk console data:import $@;
     else 
         if [[ $importer == -* ]] || [[ $importer == --* ]]
         then
            docker/sdk console data:import $@;
        else
            docker/sdk console data:import:$importer ${@:2};
         fi
    fi
   
    docker/sdk console queue:worker:start -s;
    docker/sdk console cache:empty-all;
}

# Symfony aliases
alias sc="symfony console "
alias ss="symfony serve -d"
alias sss="symfony server:stop"
alias sc:dr="symfony console debug:router"
alias sc:dc="symfony console debug:config "
alias sc:dco="symfony console debug:container "
alias sc:ddd="symfony console doctrine:database:drop --force"
alias sc:ddc="symfony console doctrine:database:create"
alias sc:dmm="symfony console doctrine:migrations:migrate"
alias sc:dfl="symfony console doctrine:fixtures:load"
alias sc:mm="symfony console make:migration"
alias sc:me="symfony console make:entity"
alias sc:mf="symfony console make:factory"
alias sc:mu="symfony console make:user"
alias sc:mc="symfony console make:controller"
alias sc:mv="symfony console make:voter"
alias sc:ms="symfony console make:subscriber"
alias sc:msn="symfony console make:serializer:normalizer"


function wlop() {
    lsof -nP -i4TCP:"$1" | grep LISTEN
}

export GITHUB_TOKEN=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

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Fig post block. Keep at the bottom of this file.
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    . "$HOME/.fig/shell/zshrc.post.zsh"
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
