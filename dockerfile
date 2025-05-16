FROM ruby:2.3

# Set working directory inside the container
WORKDIR /rails5_app

# Copy Gemfile
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the app
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]
