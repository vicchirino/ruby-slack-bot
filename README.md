## Slack bot client

Little project to serve a slack client.
The intention of this repo is to apply/learn how to serve a client in ruby.

Gems:
• [puma](https://github.com/puma/puma)
• [sinara](https://github.com/sinatra/sinatra)
• [slack-ruby-client](https://github.com/slack-ruby/slack-ruby-client)

### Create a slack app

First of all you will need a slack app.
This can be created in the slack web api dashboard https://api.slack.com/apps.

![alt text](https://github.com/vicchirino/ruby-slack-bot/blob/master/assets/img-1.png)

Then you will need to add some scopes in the [slack app dashboard](https://api.slack.com/apps/your-slack-app-id/oauth)

![alt_text](https://github.com/vicchirino/ruby-slack-bot/blob/master/assets/img-2.png)

For the propuse of this repo we will need the scopes:
- `commands` 
- `mpim:write`
- `im:write`
- `chat:write`

You can read more about [slack app scopes here](https://api.slack.com/scopes)

Next step will be to install the app in one of your workspace (I recommend a testing workspace)

![alt_text](https://github.com/vicchirino/ruby-slack-bot/blob/master/assets/img-3.png)
![alt_text](https://github.com/vicchirino/ruby-slack-bot/blob/master/assets/img-4.png)

Finally you need to create a slack slash command `/hello` [Here you can read more about slash commands](https://api.slack.com/interactivity/slash-commands)
Set up command URL. (slack needs a https url, so i'm using [ngrok](https://ngrok.com/) to generate it)
The URL need to finish with `/slack` since that is the endpoint that i'm using in `api.rb`. 

![alt_text](https://github.com/vicchirino/ruby-slack-bot/blob/master/assets/img-5.png)

## Run

In `slack_client.rb` update the `SLACK_BOT_TOKEN` with yours.
For real word examples this should be secret and storaged in a different place.

Behind the repo run `bundle exec puma --port <your-port>` (your-port) should be same that you used for ngrok and slack urls.

![](https://github.com/vicchirino/ruby-slack-bot/blob/master/assets/slack-bot.gif)
