require File.expand_path('../test_helper', __FILE__)
require 'app'


class TwilioApiTest < Minitest::Test
  def setup
    @obj = TwilioApi.new
  end

  def test_send_message
    msg_sent = @obj.send_message("+1(323) 894-1622", "+13232068549", 'Testing')
    assert msg_sent == true
  end
end
