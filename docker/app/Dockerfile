FROM ruby:3.0.1
RUN bundle config --global frozen 0

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get update && apt-get install -y nodejs postgresql-client

ENV APP_PATH /usr/src/app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY Gemfile* $APP_PATH/
COPY Gemfile.lock $APP_PATH/Gemfile.lock
RUN bundle install

COPY . $APP_PATH/

EXPOSE 3000
