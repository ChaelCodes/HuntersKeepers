# Generating a generic Rails image.
# Just for caching.
FROM ruby:2.7.3-alpine AS rails

# `apk` is like `apt`, but for Alpine Linux.
RUN apk add --update --no-cache --quiet \
    build-base \
    nodejs-current \
    postgresql-dev \
    python2 \
    tzdata \
    yarn

# Uses the image above as the base for a builder image.
# This will **include** development and testing gems.
FROM rails as rails-builder

# Set the value of `pwd` for all following operations.
WORKDIR /app/

# Add the Gemfile and Gemfile.lock from this application.
COPY Gemfile Gemfile.lock /app/

# Installs gems, quietly, in 4 threads, and retry if broken.
RUN bundle install --quiet -j4 --retry 3 \
    # Remove unneeded files (cached *.gem, *.o, *.c)
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

# This image is used to build assets and delete side effects.
# This will **include** development and test gems.
FROM rails-builder AS builder

# Copy in the Gemfile and Gemfile.lock files in.
COPY Gemfile Gemfile.lock /app/
# Delete the existing bundle.
RUN rm -rf /usr/local/bundle \
    # Configure bundle to freeze gems.
    && bundle config --global frozen 1 \
    # Configure bundle to exclude development and test environments.
    && bundle config set without 'development test' \
    # Installs gems, quietly, in 4 threads, and retry if broken.
    && bundle install --quiet -j4 --retry 3 \
    # Remove unneeded files (cached *.gem, *.o, *.c)
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the npm package.json and yarn.lock to install packages.
COPY package.json yarn.lock /app/
# Use yarn to install node dependencies.
RUN yarn install

# Copy in everything from the current directory.
COPY ./ /app/

# Compile assets in Production mode.
RUN RAILS_ENV=production SECRET_KEY_BASE=not_for_prod bundle exec rake assets:precompile

# Clean up temporary files.
RUN rm -rf node_modules tmp/cache vendor/assets lib/assets spec

# Final, production, image.  Minimum footprint.
FROM ruby:2.7-alpine AS final

# Set rails to production mode.
ENV RAILS_ENV production
# Tell Rails to log to STDOUT so it shows in Docker logs.
ENV RAILS_LOG_TO_STDOUT true
# Tell Rails to server static files, rather than using a
# reverse proxy. 
ENV RAILS_SERVE_STATIC_FILES true
# Tell Rails not to worry about the ExecJS Runtime, since
# the assets are already compiled.
ENV EXECJS_RUNTIME Disabled

# Still need postgres libraries and timezone data.
RUN apk add --update --no-cache postgresql-client tzdata

# Add the user `app` so we are not running privileged.
RUN addgroup -g 1000 -S app \
    && adduser -u 1000 -S app -G app

# Switch to the user named `app`.  All following commands
# will be run as the `app` user.
USER app

# Change our working directory to /app
WORKDIR /app

# Copy gems from the builder image to this image.
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

# Copy the compiled app (with assets) from the builder image
# to this image.
COPY --from=builder --chown=app:app /app /app

# When starting this container, run the rails server
# binding to all IP's, and port 5000.
CMD bundle exec rails server -b 0.0.0.0 -p 5000
