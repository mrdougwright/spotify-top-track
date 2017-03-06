require 'app'

class AppTest < Minitest::Test
  def test_route
    assert_routing("/")
  end
end
