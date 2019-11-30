FROM ruby:2.6.5

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /app

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
