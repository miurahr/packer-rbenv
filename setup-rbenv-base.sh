#! /bin/bash
set -e

# How to use
#
#  You can use it by sourcing /etc/profile.d/rbenv.sh from your login shell.
#

# Environment variable for building
#
# if RUBY_VERS is not empty, it build all of RUBY versions.
#  and set RUBY_VER as default.
#
#  only RUBY_VER defined, it build with RUBY with RUBY_VER
#
#  no varialble defined, it set default as follows:

if [ "${RUBY_VER}" == "" ]; then
  RUBY_VER=1.9.3-p551
fi

if [ "${RUBY_VERS}" == "" ]; then
  echo "setup rbenv with Ruby ${RUBY_VER}."
else
  echo "setup rbenv with Ruby versions: ${RUBY_VERS}."
  echo "default version is ${RUBY_VER}."
fi

env DEBIAN_FRONTEND=noninteractive apt-get update
env DEBIAN_FRONTEND=noninteractiv apt-get -y install \
  build-essential \
  curl \
  unzip \
  git-core \
  gcc \
  g++ \
  make
env DEBIAN_FRONTEND=noninteractive apt-get -y install \
  bison \
  libgdbm-dev \
  libncursesw5-dev \
  libncurses5-dev \
  libreadline6-dev \
  tcl8.5-dev \
  tk8.5-dev \
  zlib1g-dev \
  libssl-dev \
  procps \
  libffi-dev \
  libyaml-dev \
  chrpath
env DEBIAN_FRONTEND=noninteractive apt-get clean

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

# install ruby versions
if [ "${RUBY_VERS}" == "" ]; then
rbenv install ${RUBY_VER}
else
  for v in ${RUBY_VERS} ; do
    rbenv install $v
  done
fi
rbenv global ${RUBY_VER}

# Rehash:
rbenv rehash

ruby -v
gem update --system
gem -v
gem install bundler --no-rdoc --no-ri
bundle -v


apt-get -y remove \
  bison \
  libgdbm-dev \
  libncursesw5-dev \
  libncurses5-dev \
  libreadline6-dev \
  tcl8.5-dev \
  tk8.5-dev \
  zlib1g-dev \
  libssl-dev \
  libffi-dev \
  libyaml-dev \
  chrpath

apt-get -y autoremove
