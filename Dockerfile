FROM ruby:3.0.2

ENV NODE_VERSION 16
ENV INSTALL_PATH /opt/app

RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends nodejs \
      locales postgresql-client

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . $INSTALL_PATH
