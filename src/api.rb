require "sinatra/base"
require "sinatra/json"
require_relative "slack_client"
require "json"

class API < Sinatra::Base

  configure :development, :staging, :production do
    set :raise_errors, true
    set :show_exceptions, false
  end

  get "/status" do
    status 200
    json status: "ok"
  end

  post "/slack" do
    dispatch_acknowledge_response
    response = SlackClient.new().dispatch_message(params["user_id"], "Hello world! :wave:")
    puts "response #{response.inspect}"
    if response.ok
      dispatch_empty_success_response
    else
      render_response(success: "false", error: "ERROR_DESCRIPTION")
    end
  end

  private

  def render_response(data)
    status 200
    json data
  end

  def dispatch_empty_success_response
    status 204
  end

  def dispatch_acknowledge_response
    status 200
  end

end
