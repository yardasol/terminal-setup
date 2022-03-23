BRC=$HOME/.bashrc

# Add git branch to prompt
echo "# Add git branch to prompt" >> $BRC
echo "parse_git_branch() {" >> $BRC
echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> $BRC
echo "}" >> $BRC
echo "" >> $BRC
echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\]$ "' >> $BRC

# Get conda working in non-interactive shell
CONDA_PATH=$(conda info | grep -i 'base environment' | awk '{print $4}')
source $CONDA_PATH/etc/profile.d/conda.sh

# Install pywal dependencies
# most of them are already installed

# Install pywal
conda create -n pywal
conda activate pywal

conda config --env --add channels conda-forge
conda config --env --set pip_interop_enabled True
conda install pip -y

pip install pywal

# Add local 'pip' to PATH:
echo '# Add local 'pip' to PATH:' >> $BRC
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

# Add Ruby Gems
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc

# Source
source ~/.bashrc

# Install Jekyll and Bundler
gem install jekyll bundler jekyll-scholar

# setup vimrc
git clone --depth=1 -b yardasol-custom git@github.com:yardasol/vimrc ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
bash ~/.vim_runtime/install_yardasol_vimrc.sh
