#/bin/sh
DIR="$PWD/config"
FONT="$PWD/font"
URL="https://raw.githubusercontent.com/yuan310979/env/master/config"
mkdir -p $DIR

sudo apt-get update
sudo apt-get install -y zsh vim tmux screen curl git htop p7zip-full

# git
rm -f $HOME/.gitconfig
ln -s $DIR/.gitconfig $HOME/.gitconfig

# ssh
mkdir -p $HOME/.ssh
curl -fsSL $URL/.ssh.conf > $DIR/.ssh.conf
ln -s $DIR/.ssh.conf $HOME/.ssh/config
sudo chmod 644 $HOME/.ssh/config

# zsh
sudo chsh -s /bin/zsh $USER
git clone https://github.com/robbyrussell/oh-my-zsh.git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp $FONT/Powerline.ttf /usr/local/share/fonts/
cp oh-my-zsh/oh-my-zsh.sh ../.oh-my-zsh/
rm ~/.zshrc
ln -s $DIR/.zshrc ~/.zshrc
source $HOME/.zshrc
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DIR/.vimrc $HOME/.vimrc
vim +PluginInstall +qall
sudo apt-get install silversearcher-ag

# tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
rm $HOME/.tmux.conf
ln -s $DIR/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# create wsl-terminal to desktop
read -p "What is your windows username?" WINUSER
cp ./wsl-terminal/ /mnt/c/User/$WINUSER/Desktop/

# java 
sudo apt-get install default-jdk
