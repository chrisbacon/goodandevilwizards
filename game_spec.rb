require('minitest/autorun')
require('minitest/rg')
require_relative('wizard')
require_relative('question')
require_relative('player')
require_relative('board')
require_relative('game')

class TestGame < Minitest::Test
    def setup
        @good_wizard = Wizard.new(true, 2, [@question1, @question2], 32)
        @bad_wizard = Wizard.new(false, 2, [@question1, @question2], 74)
        @board = Board.new(100)
        @board.add_wizards_to_board([@good_wizard, @bad_wizard])
        @player1 = Player.new("Tegan")
        @player2 = Player.new("Chris")
        @game = Game.new(@board, [@player1, @player2])
    end



    def test_starts_at_player_one
        assert_equal(@player1, @game.current_player)
    end

    def test_player_moves__nil_tile
        assert_equal(nil, @game.move(6))
    end

    def test_player_moves__wizard_tile
        assert_equal(@good_wizard, @game.move(32))
    end

    def test_change_turn
        @game.change_turn()
        assert_equal(@player2, @game.current_player)
    end

    def test_winner?
        @game.move(100)
        assert_equal(true, @game.winner?())
    end

end