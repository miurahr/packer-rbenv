FROM miurahr/rbenv-base
MAINTAINER miurahr@linux.com
ENV RUBY_VER 2.2.1
COPY setup-ruby.sh /tmp/
RUN chmod +x /tmp/setup-ruby.sh
RUN /tmp/setup-ruby.sh
