FROM ruby:2.3-slim
# Installing dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential libpq-dev
# Setting the path
ENV INSTALL_PATH /chatbot
# Creates the directory
RUN mkdir -p $INSTALL_PATH
# Our path is the main directory
WORKDIR $INSTALL_PATH
# Copy Gemfile to container
COPY Gemfile ./
# Install Gems
RUN bundle install
# Copy code to container
COPY . .
# Run the server
CMD rackup config.ru -o 0.0.0.0
