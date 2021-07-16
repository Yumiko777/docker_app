FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN gem install bundler
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
