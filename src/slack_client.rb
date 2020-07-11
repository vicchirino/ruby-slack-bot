require "slack-ruby-client"
require "values"
require "pry"

# Here you should include your bot token
SLACK_BOT_TOKEN = "xoxb-..."

class SlackClient

  def dispatch_message(user_id, message)
    client.chat_postMessage(channel: user_id, text: message)
  rescue Slack::Web::Api::Errors::SlackError, Slack::Web::Api::Errors::TooManyRequestsError, Faraday::ClientError => exception
    ErroredResponse.with(ok: false, message: exception.message)
  end

  def dispatch_blocks(user_id, blocks)
    response = client.im_open(user: user_id, return_im: true)
    client.chat_postMessage(channel: response["channel"]["id"], blocks: blocks)
  rescue Slack::Web::Api::Errors::SlackError, Slack::Web::Api::Errors::TooManyRequestsError, Faraday::ClientError => exception
    ErroredResponse.with(ok: false, message: exception.message)
  end

  def dispatch_open_modal(trigger_id, blocks)
    client.views_open({trigger_id: trigger_id, view: blocks})
  rescue Slack::Web::Api::Errors::SlackError, Slack::Web::Api::Errors::TooManyRequestsError, Faraday::ClientError => exception
    ErroredResponse.with(ok: false, message: exception.message)
  end

  private

  def client
    @client ||= Slack::Web::Client.new(token: SLACK_BOT_TOKEN)
  end
end

ErroredResponse = Value.new(:ok, :message)
