require_relative '.config.rb'
require 'slack-ruby-client'
require 'rb-inotify'

Slack.configure { |config| config.token = TOKEN }

client = Slack::Web::Client.new
notifier = INotify::Notifier.new

watched_file = './README.txt'
last_message_ts = nil

notifier.watch(watched_file, :modify) do
    begin
        client.chat_delete(channel: '#pingpong', ts: last_message_ts) if last_message_ts
        response = client.chat_postMessage(channel: '#pingpong', text: 'ping')
        last_message_ts = response['ts']
    rescue Slack::Web::Api::Error => e
        puts "Error sending/deleting message: #{e.message}"
    end
end

Thread.new { notifier.run }

sleep