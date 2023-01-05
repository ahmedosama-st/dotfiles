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
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
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


# Github aliases
alias ghc="gh pr create"
alias ghv="gh pr view --web"
function ght() {
    local currentBranch=$(git branch --show-current --abbrev);
    local ticketNumber=$(echo "$currentBranch" | cut -d '-' -f1 -f2 | cut -d '_' -f1);
    open https://spryker.atlassian.net/browse/$ticketNumber;
}

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
    git restore phpstan.neon
    local message=${1:-}
    local skip=${2:-}
    local currentBranch=$(git branch --show-current --abbrev);
    local ticketNumber=$(echo "$currentBranch" | cut -d '-' -f1 -f2 | cut -d '_' -f1);

    git add -A;

    if [[ $skip == "-s" ]]; then
        git commit --no-verify -m "$ticketNumber: $message";
    else
        git commit -m "$ticketNumber: $message";
    fi
    cp ~/dotfiles/phpstan.neon .
}
#function gc() {
#      local skip=${1:-}
#
#      if [[ $skip == "-s" ]]; then
#          SKIP=1 git checkout 
#      else
#          git checkout 
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
alias spy="docker/sdk ";
alias sp:off="spy down; docker system prune -a --volumes -f; spy clean-data; spy clean; rm -rf src/Generated; rm -rf vendor; rm -rf node_modules; notify";
alias sp:on="spy boot deploy.dev.yml; spy up; notify";
alias sp:reset="sp:off && sp:on";
alias sp:cdo="docker/sdk cli composer dump-autoload -o";
alias sp:cr="docker/sdk cli composer require ";
alias sp:ci="docker/sdk cli composer install";
alias sp:ce="spy console c:e";
function  sp:cc
{
    spy cli composer dump-autoload -o;
    spy console cache:class-resolver:build;
    spy console search:setup:source-map;
    spy console cache:empty-all;
    spy console navigation:build-cache;
    spy console router:cache:warm-up:backoffice;
    spy console router:cache:warm-up:backend-gateway;
    spy console translator:clean-cache;
    spy console translator:generate-cache;
    spy console twig:cache:warmer;
    spy console dev:ide-auto-completion:client:generate;
    spy console dev:ide-auto-completion:glue:generate;
    spy console dev:ide-auto-completion:service:generate;
    spy console dev:ide-auto-completion:yves:generate;
    spy console dev:ide-auto-completion:zed:generate;
    spy console transfer:generate;
    spy console propel:install;
    sp:import;
}
function sp:install () {
	local repo="${1-}"

	hub clone spryker-projects/$repo
	cd $repo

    echo "Enter your git work email: "
    terminal-notifier -title "Terminal" -message "Prompt for work email" -sound "default" -activate com.apple.Terminal
    read work_email
    git config user.email $work_email

	git clone git@github.com:spryker/docker-sdk.git docker

    echo "Do you want to apply git hooks?";
    terminal-notifier -title "Terminal" -message "Prompt for applying git hooks" -sound "default" -activate com.apple.Terminal
    select yn in "Yes" "No"; do
        case $yn in
            Yes )
                rm .git/hooks/pre-commit.sample
                cp ~/dotfiles/spryker.pre-commit.sample .git/hooks/pre-commit
                cp ~/dotfiles/spryker.post-checkout.sample .git/hooks/post-checkout
                chmod +x .git/hooks/pre-commit
                chmod +x .git/hooks/post-checkout
                break;;
            No ) break;;
        esac
    done

    cd docker;
    echo "Which docker branch do you use?";
    terminal-notifier -title "Terminal" -message "Prompt for select docker branch" -sound "default" -activate com.apple.Terminal
    select branch in "master" "apple-m1-adjustments"; do
        case $branch in
            master ) git checkout master; break;;
            apple-m1-adjustments ) git checkout apple-m1-adjustments; break;;
        esac
    done
    cd ..;

    echo "Do you want to boot the project?";
    terminal-notifier -title "Terminal" -message "Prompt for booting project" -sound "default" -activate com.apple.Terminal

    select yn in "Yes" "No"; do
        case $yn in
            Yes ) spy boot deploy.dev.yml; spy up; notify; break;;
            No ) break;;
        esac
    done

    ps;
}
function sp:csc() {
    echo "=================== Validating propel files ===============";
    spy cli vendor/bin/console propel:schema:validate;
    spy cli vendor/bin/console propel:schema:validate-xml-names;

    echo "=================== Validating transfers ===============";
    spy cli vendor/bin/console transfer:validate;

    echo "=================== Fixing code styling ===============";
    spy cli vendor/bin/console code:sniff:style -f;

    echo "=================== Checking non-fixable code styling ===============";
    spy cli vendor/bin/console code:sniff:style;

    echo "=================== PHP MD ===============";
    spy cli vendor/bin/phpmd src/ text vendor/spryker/architecture-sniffer/src/ruleset.xml --minimumpriority 2;

    echo "=================== PHP Stan ===============";
    spy cli vendor/bin/phpstan analyze -l 5 -c phpstan.neon src/;

    notify;
}
function sp:import() {
    local importer="${1-}"

    if [ -z "$importer" ]
    then
        spy console data:import $@;
     else
         if [[ $importer == -* ]] || [[ $importer == --* ]]
         then
            spy console data:import $@;
        else
            spy console data:import:$importer ${@:2};
         fi
    fi

    spy console queue:worker:start -s;
    spy console cache:empty-all;
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
