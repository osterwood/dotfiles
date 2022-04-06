set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"
set -x -g TERM "xterm-256color"

set default_path /usr/bin /usr/sbin /bin /sbin

if test -e /opt/homebrew
	set homebrew /opt/homebrew/bin /opt/homebrew/sbin
else
	set homebrew /usr/local/bin /usr/local/sbin
end

set local_path ~/bin ~/.local/bin ~/.cargo/bin
set -x -g PATH $homebrew $local_path $default_path

if test -e ~/anaconda3/
	set -x -g PATH ~/anaconda3/bin $PATH

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	eval ~/anaconda3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end

if test -e /Library/Frameworks/Mono.framework/Versions/Current/Commands
  set -x -g PATH $PATH /Library/Frameworks/Mono.framework/Versions/Current/Commands
  alias renode="mono /Applications/Renode.app/Contents/MacOS/bin/Renode.exe"
end

set fish_greeting

# set -g -x "CLOUDSDK_PYTHON" "/usr/local/opt/python@3.8/libexec/bin/python"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

if test -e /opt/homebrew/opt/asdf/libexec/asdf.fish
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

set -gx  LC_ALL en_US.UTF-8 
set -gx  LANG en_US.UTF-8 

set fish_prompt_pwd_dir_length 40

# Coreutils bin and man folders
set -x -g PATH /usr/local/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

# Findutils bin and man folders
set -x -g PATH /usr/local/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix findutils)/libexec/gnuman $MANPATH

if test -e ~/.localrc
  . ~/.localrc
end
