FROM ruby:2.5

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends postgresql-client \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

# Pre-install gems with native extensions
RUN gem install nokogiri -v "1.9.1"

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD rm -f /usr/src/app/tmp/pids/server.* && rails server -b 0.0.0.0
