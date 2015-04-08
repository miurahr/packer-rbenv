packer-rbenv
=============

Rbenv base template for Ruby application development


Ruby versions
--------------

* Ruby 1.9.3 p551
* Ruby 2.0.0 p643
* Ruby 2.1.5
* Ruby 2.2.1

Dependency
------------

* Pakcer 0.7.5 and later
* Docker 1.3.3 and later

Directories and files
----------------------

* /opt/rbenv  -  git cloned  rbenv
* /etc/profile.d/rbenv.sh - activate rbenv for all shell sessions

How to build
--------------------

Simply run packer with target definition file;

```bash
$ packer build rbenv-1.9.3.json
```

OR

```bash
$ docker build -t rbenv:1.9.3-p551 1.9.3/
```

You will get docker commit tagged with `rbenv:<ruby version>-p<ruby patch level>`
