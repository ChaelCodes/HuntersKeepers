FROM ruby:2.6.4
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update -qq && apt-get install -y build-essential nodejs postgresql-client yarn
RUN apt-get update -qq && apt-get install -y build-essential nodejs postgresql-client yarn \
 && rm -rf /var/lib/apt/lists/* \
 && curl -o- -L https://yarnpkg.com/install.sh | bash
RUN mkdir /hunterskeepers
WORKDIR /hunterskeepers
COPY Gemfile /hunterskeepers/Gemfile
COPY Gemfile.lock /hunterskeepers/Gemfile.lock
RUN gem install bundler:2.1.4 && bundle install
COPY . /hunterskeepers

# Rails App is Setup
