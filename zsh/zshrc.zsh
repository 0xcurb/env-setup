function _bootstrap(){
	logp 'Bootstrapping environment ...';
	_find-homebrew || _install-homebrew && _set-homebrew-env;

}

function _find-homebrew(){
	default_homebrew_path='/opt/homebrew/bin/brew';
	return $(test -e $default_homebrew_path);
}


function _install-homebrew(){
	logp 'Installing Homebrew ...';
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
}

function _set-homebrew-env(){
	# Set PATH, MANPATH, etc., for Homebrew.
	eval "$(/opt/homebrew/bin/brew shellenv)";
}

function logp(){
	message=$1;
	log_level=${2='INFO'};

	printf '[%s] %s\n' $log_level $message;
}

_bootstrap;

source $HOME/.zshd/base-paths.zsh
source $HOME/.zshd/base-aliases.zsh
install-base-aliases;
install-base-paths;

source $HOME/.zshd/host-specific/$(hostname)/*.zsh
source $HOME/.zshd/prompts.zsh
