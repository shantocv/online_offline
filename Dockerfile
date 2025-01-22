FROM ruby:3.3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up the working directory
WORKDIR /myapp
ADD . /myapp

# Install gems
RUN gem install bundler
RUN bundle install

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose the port the app will run on
EXPOSE 3000

# Set the entrypoint for the container
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
