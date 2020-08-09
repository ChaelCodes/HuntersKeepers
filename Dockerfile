FROM ruby:2.6.4

# The first three lines are necessary for the `apt-get install ... yarn` later on to propertly install yarn,
#  vs. installing `cmdtest` instead.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 # Installing NodeJS, Postgres, and Yarn
 && apt-get install -y build-essential nodejs postgresql-client yarn \
 # Clearing cached files
 && rm -rf /var/lib/apt/lists/*

WORKDIR /hunterskeepers
COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler:2.1.4 && bundle install

COPY . /hunterskeepers

# This resolves "Couldn't find an integrity file" / "Your Yarn packages are out of date!"
#   (this issue did not preclude a successful app startup)
RUN rm -fr node_modules \
 && rm yarn.lock \
 && yarn install --check-files

# Rails App is Setup

