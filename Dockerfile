FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /mujin
WORKDIR /mujin
ADD Gemfile /mujin/Gemfile
ADD Gemfile.lock /mujin/Gemfile.lock
RUN bundle install
ADD . /mujin
