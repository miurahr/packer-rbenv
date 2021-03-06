packer-rbenv
=============

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=miurahr&url=https://github.com/miurahr/packer-rbenv)

Rbenv base template for Ruby application development


Ruby versions
--------------

* Ruby 1.9.3 p551
* Ruby 1.9.3 p484
* Ruby 2.0.0 p643
* Ruby 2.0.0 p598
* Ruby 2.1.5
* Ruby 2.2.1

How to use
-----------

You can get the image that includes specified ruby version.

```
$ docker pull miurahr/rbenv:2.2.1
```

You can get the image that includes all stable ruby versions.
include

* old stable 2.0.0p643
* previous stable 2.1.5
* current stable 2.2.1

```
$ docker pull miurahr/rbenv:latest
```

before using ruby in docker guest, please include rbenv by

```
source /etc/profile.d/rbenv
```


Directories and files
----------------------

* /opt/rbenv  -  git cloned  rbenv
* /etc/profile.d/rbenv.sh - activate rbenv for all shell sessions


Branches
---------------------

Master branch has all packer configurations and Dockerfile 
that is configured to install all stable versions.

versions branch has commits and tags that is configured to 
install specific ruby version in each.


How to build
--------------------

Simply run packer with target definition file;

```
$ packer build rbenv-1.9.3.json
$ packer build rbenv-2.0.0.json
$ packer build rbenv-2.1.5.json
$ packer build rbenv-2.2.1.json
$ packer build rbenv-stables.json
```

OR

```
$ git checkout master
$ docker build -t rbenv:latest .
$ git checkout 1.9.3-p551
$ docker build -t rbenv:1.9.3-p551 .
$ git checkout 2.2.1
$ docker build -t rbenv:2.2.1 .
```

Dependency
------------

* Pakcer 0.7.5 and later
* Docker 1.3.3 and later


License
-----------------
The MIT License (MIT)

Copyright (c) 2015 Hiroshi Miura

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

