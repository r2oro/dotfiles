#############################################################
# Generic configuration that applies to all shells
#############################################################

# RVM Ruby Selector
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# RVM suggests using gcc instead of llvm (which Apple now symlinks gcc to)
export CC="/usr/bin/gcc-4.2"
export CFLAGS="-O2 -arch x86_64"
export LDFLAGS="-L/opt/local/lib"
export CPPFLAGS="-I/opt/local/include"

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases

source ~/.iterm2_shell_integration.`basename $SHELL`

# Private/Proprietary shell aliases (not to be checked into the public repo) :)
#source ~/Dropbox/Private/Boxes/osx/.shellaliases
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
