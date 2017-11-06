#/bin/sh

sudo apt-get install -y zsh vim tmux curl
# git
rm ~/.gitconfig
ln -s $PWD/.gitconfig ~/.gitconfig

# ssh
ln -s $PWD/.ssh.conf ~/.ssh/config

# zsh
chsh -s /bin/zsh $USER
git clone https://github.com/robbyrussell/oh-my-zsh.git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp Powerline.ttf /usr/local/share/fonts/
cp oh-my-zsh/oh-my-zsh.sh ../.oh-my-zsh/
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
source ~/.zshrc
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $PWD/.vimrc ~/.vimrc
vim +PluginInstall +qall

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

