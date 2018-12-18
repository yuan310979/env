sudo apt-get install -y libreadline-dev libssl-dev ruby-all-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.5.3
rbenv global 2.5.3

gem install rails
