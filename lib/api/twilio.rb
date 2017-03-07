require 'twilio-ruby'

class TwilioApi
  attr_reader :client
  DEFAULT_FROM = ENV['TWILIO_DEFAULT_FROM']

  def initialize
    @client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

# body = "#{artist.name}'s top track: #{track.name}"
  def send_message(from=DEFAULT_FROM, to, body)
    client.account.messages.create({
      :from => from, :to => to,
      :body => body
      })
    puts "Texted #{to}"
    return true
  end
end
