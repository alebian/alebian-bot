FROM ruby:2.6.6-alpine

RUN apk add --update \
	build-base \
	libxml2-dev \
	libxslt-dev

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install --without development test -j 12

COPY . .

CMD ["ruby", "main.rb"]

