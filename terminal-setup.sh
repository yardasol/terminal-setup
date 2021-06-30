BRC=$HOME/.bashrc

# Add git branch to prompt
echo "parse_git_branch() {" >> $BRC
echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> $BRC
echo "}" >> $BRC
echo "" >> $BRC
echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\]$ "' >> $BRC

# Install pywal dependencies
# most of them are already installed

# Install pywal
conda create -n pywal
conda activate pywal

conda config --env --add channels conda-forge
conda config --env --set pip_interop_enabled True
conda install pip -y

pip3 install --user pywal

# Add local 'pip' to PATH:
echo 'export PATH="${PATH}:${HOME}/.local/bin/"' >> $BRC

# Create colorscheme
wal -i /usr/share/backgrounds/warty-final-ubuntu.png

# Apply theme to new terminals
echo "# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)" >> $BRC 

# Make colorscheme persist on reboot
echo "# -R restores the last colorscheme that was in use.
wal -R" >> $HOME/.xinitrc
