# syntax=docker/dockerfile:1
FROM ruby:2.7.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /cryptobot-app
COPY Gemfile /cryptobot-app/Gemfile
COPY Gemfile.lock /cryptobot-app/Gemfile.lock
RUN bundle install
RUN yarn install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4242

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
