require('minitest/autorun')
require('minitest/rg')
require_relative('../player')

class TestPlayer < Minitest::Test


def setup
@player = Player.new("Tegan")
end

def test_player_has_a_name
    assert_equal("Tegan", @player.name)
end

def test_player_can_change_position
    @player.position += 2
    assert_equal(2, @player.position )
end

end


