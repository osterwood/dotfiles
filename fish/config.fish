set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

set -x -g TERM "xterm-256color"

set -x -g LC_ALL en_GB.UTF-8
set -x -g LANG en_GB.UTF-8

# Coreutils bin and man folders
set -x -g PATH (brew --prefix coreutils)/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

# Findutils bin and man folders
set -x -g PATH (brew --prefix findutils)/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix findutils)/libexec/gnuman $MANPATH

# go bin folder
# set -x -g PATH ~/go/bin $PATH

# User bin folder
set -x -g PATH ~/bin ~/.local/bin ~/.cargo/bin ~/Library/Python/3.7/bin $PATH /usr/local/sbin

if test -e ~/anaconda3/
	set -x -g PATH ~/anaconda3/bin $PATH

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	eval /Users/chris/anaconda3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end

# Composer
# set -x -g PATH ~/.composer/vendor/bin $PATH

# fnm
# set -x -g PATH /home/rosco/.fnm $PATH
# fnm env --multi | source

set fish_greeting

set -g fish_user_paths "(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc" $fish_user_paths
set -gx  LC_ALL en_US.UTF-8 
set -gx  LANG en_US.UTF-8 

set fish_prompt_pwd_dir_length 40

if test -e ~/.localrc
  . ~/.localrc
end
