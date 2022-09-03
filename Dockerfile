FROM ruby:3-alpine

WORKDIR /app
RUN apk update && \
  apk upgrade && \
  apk add --update --no-cache build-base bash

COPY . .

RUN gem install bundler
RUN bundle install
