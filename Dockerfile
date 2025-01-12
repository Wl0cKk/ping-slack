FROM ruby:3.4.1

RUN gem install slack-ruby-client
RUN gem install rb-inotify
RUN apt-get update && apt-get install -y inotify-tools

WORKDIR /app
COPY . .

CMD ["ruby", "bot.rb"]
