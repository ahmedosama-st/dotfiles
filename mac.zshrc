export ZSH="/Users/ahmedosama/.oh-my-zsh"
ZSH_THEME="spaceship"
ZSH_DISABLE_COMPFIX=true
export EDITOR=vim

source $ZSH/oh-my-zsh.sh

# zsh aliases
alias ps="phpstorm ."
alias ws="webstorm ."
alias zshrc="vim $HOME/.zshrc"
alias omz="vim $HOME/.oh-my-zsh"
alias src="source $HOME/.zshrc"
alias cpssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias ports="sudo lsof -PiTCP -sTCP:LISTEN"
alias notify='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?" -sound "default"' -activate com.apple.Terminal
alias act="act --container-architecture linux/amd64";

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
alias gs="git status "
alias gc="git checkout "
alias gb="git checkout -b"
alias gpl="git pull"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah="git reset --hard;git clean -df"
alias dracarys="git reset --hard;git clean -df"
function gfl () {
    local pre_to_head="${1-}"

    if [[ -z "$pre_to_head" ]]; then
        git diff-tree --no-commit-id --name-only -r HEAD
    else
        git diff-tree --no-commit-id --name-only -r HEAD~$pre_to_head
    fi
}
function gi() {
    local message=${1:-}
    local skip=${2:-}

    git add -A;

    if [[ $skip == "-s" ]]; then
        git commit --no-verify -m $message;
    else
        git commit -m $message;
    fi
}
#function gc() {
#      local branches branch
#      local skip=${1:-}
#
#      branches=$(git branch -a -vv) &&
#      branch=$(echo "$branches" | fzf +m) &&
#      if [[ $skip == "-s" ]]; then
#          SKIP=1 git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
#      else
#          git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
#      fi
#}

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
function  sp:cc
{
    docker/sdk console cache:class-resolver:build;
    docker/sdk console cache:empty-all;
    docker/sdk console navigation:build-cache;
    docker/sdk console router:cache:warm-up:backoffice;
    docker/sdk console router:cache:warm-up:backend-gateway;
    docker/sdk console translator:clean-cache;
    docker/sdk console translator:generate-cache;
    docker/sdk console twig:cache:warmer;
    docker/sdk console dev:ide-auto-completion:client:generate;
    docker/sdk console dev:ide-auto-completion:glue:generate;
    docker/sdk console dev:ide-auto-completion:service:generate;
    docker/sdk console dev:ide-auto-completion:yves:generate;
    docker/sdk console dev:ide-auto-completion:zed:generate;
    docker/sdk console transfer:generate;
    docker/sdk console propel:install;
}
function sp:install () {
	local repo="${1-}"
	local env="$(uname -m)"
	hub clone spryker-projects/$repo
	cd $repo
	git clone git@github.com:spryker/docker-sdk.git docker
	rm .git/hooks/pre-commit.sample
	cp ~/dotfiles/spryker.pre-commit.sample .git/hooks/pre-commit
	cp ~/dotfiles/spryker.post-checkout.sample .git/hooks/post-checkout
    chmod +x .git/hooks/pre-commit
    chmod +x .git/hooks/post-checkout
    if [[ $env == "arm64" ]]
	then
		cd docker
		git checkout apple-m1-adjustments
		cd ../
		#gsed -i 's/export COMPOSE_CONVERT_WINDOWS_PATHS=1/export COMPOSE_CONVERT_WINDOWS_PATHS=0/g' 'docker/bin/environment/docker-compose.sh'
	fi
	docker/sdk boot deploy.dev.yml
	docker/sdk up
	terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?" -sound "default"
}
function sp:csc() {
    local module="${1-}"

    echo "=================== Fixing code styling ===============";
    docker/sdk console c:s:s -f -m $module;

    echo "=================== Checking non-fixable code styling ===============";
    docker/sdk console c:s:s -m $module;

    echo "=================== PHP MD ===============";
    docker/sdk console c:s:a -m $module -p 2 -vv;

    echo "=================== PHP Stan ===============";
    docker/sdk console code:phpstan -l 5 -m $module;

    rm architecture-baseline.json

    notify;
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


export GITHUB_TOKEN=

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(starship init zsh)"
