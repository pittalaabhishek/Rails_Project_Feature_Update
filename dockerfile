FROM ruby:2.3

# Set working directory inside the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the app
COPY . .

# Start the Rails server (or whatever command you need)
CMD ["rails", "server", "-b", "0.0.0.0"]
