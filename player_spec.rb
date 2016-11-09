require('minitest/autorun')
require('minitest/rg')
require_relative('player')

class TestPlayer < Minitest::Test


def setup
@player = Player.new("Tegan")
end

def test_player_has_a_name
    assert_equal("Tegan", @player.name)
end


end


