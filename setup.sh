BRC=$HOME/.bashrc

# Add git branch to prompt
echo "parse_git_branch() {" >> $BRC
echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> $BRC
echo "}" >> $BRC
echo "" >> $BRC
echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\]$ "' >> $BRC


