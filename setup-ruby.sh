#! /bin/bash
set -e

# How to use
#
#  You can use it by sourcing /etc/profile.d/rbenv.sh from your login shell.
#

# part1: install ruby versions and cleanup


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

##########################################
# dependencies
#
env DEBIAN_FRONTEND=noninteractive apt-get update
env DEBIAN_FRONTEND=noninteractiv apt-get -y install \
  build-essential \
  curl \
  unzip \
  git-core \
  gcc \
  g++ \
  make \
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

source /etc/profile.d/rbenv.sh

##########################################
# install ruby versions
#
# function to install ruby version $ver, gem and bundler
# gem and bundler will be installed in global directory.
#
install_ruby_version () {
  local ver=$1

  rbenv install $ver
  rbenv global $ver
  gem update --system
  gem install bundler --no-rdoc --no-ri
}

# install ruby versions
if [ "${RUBY_VERS}" == "" ]; then
  # single version install
  install_ruby_version ${RUBY_VER}
else
  # install ruby versions in ${RUBY_VERS} list
  for v in ${RUBY_VERS} ; do
    install_ruby_version $v
  done
fi

# set default version: ${RUBY_VER}
rbenv global ${RUBY_VER}

# Rehash:
rbenv rehash


###########################################
# cleanup
#
env DEBIAN_FRONTEND=noninteractive apt-get -y remove \
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

env DEBIAN_FRONTEND=noninteractive apt-get clean
env DEBIAN_FRONTEND=noninteractive apt-get -y autoremove
