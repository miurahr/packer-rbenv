packer-rbenv
=============

Rbenv base template for Ruby application development

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

Simply run such as

```bash
$ packer build rbenv-1.9.3.json
```

You will get docker commit tagged with `rbenv:<ruby version>-p<ruby patch level>`
