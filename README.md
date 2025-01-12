## simple bot to monitor file changes, with slack notification
----
#### Create slack bot,
#### manage scopes in https://api.slack.com and add the bot to your channel - in channel chat using `@` mark your bot and hit Enter
#### the bot will be added to the channel🎉
```bash
$ git clone https://github.com/Wl0cKk/ping-slack.git
$ cd ping-slack
```
create a `.config.rb` file and put the following lines in it
```ruby
# Of course replace it with your own
TOKEN = 'Bot User OAuth Token'
CHANNEL = '#here_is_your_channel_name'
```

```bash
$ docker build -t ping-slack .
# Replace PATH with the path to the file you want to monitor e.g ~/logs.txt
$ docker run -v PATH:/watched_file -v./:/app --restart always ping-slack
```
