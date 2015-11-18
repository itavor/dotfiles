# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Use extended pattern matching when globbing
shopt -s extglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Allow editing of history substitution result
shopt -s histverify

# Allow editing of failed history substitution
shopt -s histreedit

# Save all lines of a multiline command in one history entry
shopt -s cmdhist

# do not search $PATH when a completion is attempted on an empty line
shopt -s no_empty_cmd_completion

# `.` and `source` commands search $PATH in order to find the file to read
shopt -s sourcepath

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Autocd, e.g. `**/qux` will enter `./foo/bar/baz/qux`
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Add virtualenvwrapper commands
[ $WORKON_HOME ] && [ -f .virtualenvwrapper_bashrc ] && source $WORKON_HOME/.virtualenvwrapper_bashrc

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
