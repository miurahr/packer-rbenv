FROM ubuntu:14.04.2
MAINTAINER miurahr@linux.com
ENV RUBY_VER 1.9.3-p551
COPY setup-rbenv-base.sh /tmp/
RUN chmod +x /tmp/setup-rbenv-base.sh
RUN /tmp/setup-rbenv-base.sh
