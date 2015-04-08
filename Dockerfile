FROM ubuntu:14.04.2
MAINTAINER miurahr@linux.com
ENV RUBY_VER 2.0.0-p643
COPY setup-rbenv-base.sh /tmp/
RUN chmod +x /tmp/setup-rbenv-base.sh
RUN /tmp/setup-rbenv-base.sh
