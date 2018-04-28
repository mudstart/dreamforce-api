FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /marketplace
WORKDIR /marketplace

ADD Gemfile /marketplace/Gemfile
ADD Gemfile.lock /marketplace/Gemfile.lock

RUN bundle install

ADD . /marketplace
