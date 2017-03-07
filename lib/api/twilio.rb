require 'twilio-ruby'

class TwilioApi
  attr_reader :client
  DEFAULT_FROM = ENV['TWILIO_DEFAULT_FROM']

  def initialize
    @client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_message(to, body, from=DEFAULT_FROM)
    client.account.messages.create({
      :from => from, :to => to,
      :body => body
      })
    puts "Texted #{to}"
    return true
  end
end
