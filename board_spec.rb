require('minitest/autorun')
require('minitest/rg')
require_relative('wizard')
require_relative('board')

class TestBoard < Minitest::Test
    def setup
        @good_wizard = Wizard.new(true, 2, [@question1, @question2], 32)
        @bad_wizard = Wizard.new(false, 2, [@question1, @question2], 74)
        @board = Board.new(100)
    end

    def test_board_size
        assert_equal(100, @board.size)
    end

    def test_start_is_empty
        assert_equal(nil, @board.tiles[0])
    end

    def test_end_is_empty
        assert_equal(nil, @board.tiles[100])
    end

    def test_add_wizards_to_board
        wizards = [@good_wizard, @bad_wizard]
        @board.add_wizards_to_board(wizards)
        assert_equal(@good_wizard, @board.tiles[32])
        assert_equal(@bad_wizard, @board.tiles[74])
    end

end