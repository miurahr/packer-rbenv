#! /bin/bash
set -e

if [ "RUBY_VERSION" == "" ]; then
  RUBY_VERSION=1.9.3-p551
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y install \
  build-essential \
  curl \
  unzip \
  git-core \
  gcc \
  g++ \
  make
apt-get clean

git clone https://github.com/sstephenson/rbenv.git /opt/rbenv

# Add rbenv to the path:
echo '# rbenv setup' > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/opt/rbenv' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

chmod +x /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

# Install ruby-build:
pushd /tmp
  git clone git://github.com/sstephenson/ruby-build.git
  cd ruby-build
  ./install.sh
popd

# install ruby
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

# Rehash:
rbenv rehash

ruby -v
gem update --system
gem -v
gem install bundler --no-rdoc --no-ri
bundle -v
