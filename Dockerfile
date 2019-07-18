FROM ruby:2.6.3

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get update -qq && \
  apt-get install -y build-essential \
  default-libmysqlclient-dev \
  nodejs \
  mysql-client \
  xvfb \
  redis-tools && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  lsof \
  vim

ENV APP_ROOT /opt/webapp
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

RUN ["chmod", "+x", "startup.sh"]
