#-- START ZCACHE GENERATED FILE
#-- GENERATED: Wed May 11 14:39:02 EET 2022
#-- ANTIGEN v2.2.2
_antigen () {
	local -a _1st_arguments
	_1st_arguments=('apply:Load all bundle completions' 'bundle:Install and load the given plugin' 'bundles:Bulk define bundles' 'cleanup:Clean up the clones of repos which are not used by any bundles currently loaded' 'cache-gen:Generate cache' 'init:Load Antigen configuration from file' 'list:List out the currently loaded bundles' 'purge:Remove a cloned bundle from filesystem' 'reset:Clears cache' 'restore:Restore the bundles state as specified in the snapshot' 'revert:Revert the state of all bundles to how they were before the last antigen update' 'selfupdate:Update antigen itself' 'snapshot:Create a snapshot of all the active clones' 'theme:Switch the prompt theme' 'update:Update all bundles' 'use:Load any (supported) zsh pre-packaged framework') 
	_1st_arguments+=('help:Show this message' 'version:Display Antigen version') 
	__bundle () {
		_arguments '--loc[Path to the location <path-to/location>]' '--url[Path to the repository <github-account/repository>]' '--branch[Git branch name]' '--no-local-clone[Do not create a clone]'
	}
	__list () {
		_arguments '--simple[Show only bundle name]' '--short[Show only bundle name and branch]' '--long[Show bundle records]'
	}
	__cleanup () {
		_arguments '--force[Do not ask for confirmation]'
	}
	_arguments '*:: :->command'
	if (( CURRENT == 1 ))
	then
		_describe -t commands "antigen command" _1st_arguments
		return
	fi
	local -a _command_args
	case "$words[1]" in
		(bundle) __bundle ;;
		(use) compadd "$@" "oh-my-zsh" "prezto" ;;
		(cleanup) __cleanup ;;
		(update|purge) compadd $(type -f \-antigen-get-bundles &> /dev/null || antigen &> /dev/null; -antigen-get-bundles --simple 2> /dev/null) ;;
		(theme) compadd $(type -f \-antigen-get-themes &> /dev/null || antigen &> /dev/null; -antigen-get-themes 2> /dev/null) ;;
		(list) __list ;;
	esac
}
antigen () {
  local MATCH MBEGIN MEND
  [[ "$ZSH_EVAL_CONTEXT" =~ "toplevel:*" || "$ZSH_EVAL_CONTEXT" =~ "cmdarg:*" ]] && source "/Users/ahmedosama/antigen.zsh" && eval antigen $@;
  return 0;
}
typeset -gaU fpath path
fpath+=(/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/github /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found /Users/ahmedosama/.antigen/bundles/oz/safe-paste /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-syntax-highlighting /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-autosuggestions /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-completions /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-history-substring-search) path+=(/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/github /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm /Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found /Users/ahmedosama/.antigen/bundles/oz/safe-paste /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-syntax-highlighting /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-autosuggestions /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-completions /Users/ahmedosama/.antigen/bundles/zsh-users/zsh-history-substring-search)
_antigen_compinit () {
  autoload -Uz compinit; compinit -d "/Users/ahmedosama/.antigen/.zcompdump"; compdef _antigen antigen
  add-zsh-hook -D precmd _antigen_compinit
}
autoload -Uz add-zsh-hook; add-zsh-hook precmd _antigen_compinit
compdef () {}

if [[ -n "/Users/ahmedosama/.oh-my-zsh" ]]; then
  ZSH="/Users/ahmedosama/.oh-my-zsh"; ZSH_CACHE_DIR="/Users/ahmedosama/.oh-my-zsh/cache"
fi
#--- BUNDLES BEGIN
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/github/github.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node/node.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm/npm.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/oz/safe-paste/safe-paste.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-completions/zsh-completions.plugin.zsh';
source '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh';

#--- BUNDLES END
typeset -gaU _ANTIGEN_BUNDLE_RECORD; _ANTIGEN_BUNDLE_RECORD=('https://github.com/robbyrussell/oh-my-zsh.git lib plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/git plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/github plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/node plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/npm plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/command-not-found plugin true' 'https://github.com/oz/safe-paste.git / plugin true' 'https://github.com/zsh-users/zsh-syntax-highlighting.git / plugin true' 'https://github.com/zsh-users/zsh-autosuggestions.git / plugin true' 'https://github.com/zsh-users/zsh-completions.git / plugin true' 'https://github.com/zsh-users/zsh-history-substring-search.git / plugin true')
typeset -g _ANTIGEN_CACHE_LOADED; _ANTIGEN_CACHE_LOADED=true
typeset -ga _ZCACHE_BUNDLE_SOURCE; _ZCACHE_BUNDLE_SOURCE=('/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/github' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/github/github.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node/node.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm/npm.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found' '/Users/ahmedosama/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/oz/safe-paste//' '/Users/ahmedosama/.antigen/bundles/oz/safe-paste///safe-paste.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-syntax-highlighting//' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-syntax-highlighting///zsh-syntax-highlighting.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-autosuggestions//' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-autosuggestions///zsh-autosuggestions.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-completions//' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-completions///zsh-completions.plugin.zsh' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-history-substring-search//' '/Users/ahmedosama/.antigen/bundles/zsh-users/zsh-history-substring-search///zsh-history-substring-search.plugin.zsh')
typeset -g _ANTIGEN_CACHE_VERSION; _ANTIGEN_CACHE_VERSION='v2.2.2'

#-- END ZCACHE GENERATED FILE
