FROM miurahr/rbenv-base
MAINTAINER miurahr@linux.com
ENV RUBY_VER 1.9.3-p484
COPY setup-ruby.sh /tmp/
RUN chmod +x /tmp/setup-ruby.sh
RUN /tmp/setup-ruby.sh
