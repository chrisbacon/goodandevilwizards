require('minitest/autorun')
require('minitest/rg')
require_relative('../wizard')
require_relative('../question')
require_relative('../player')

class TestWizard < Minitest::Test

    def setup
        @question1 = Question.new("Who is the next president?",  "trump")
        @question2 = Question.new("What is the capital of Scotland?", "edinburgh")
        @good_wizard = Wizard.new(true, 2, [@question1, @question2], 32)
        @bad_wizard = Wizard.new(false, 2, [@question1, @question2], 64)
        @player = Player.new("Tegan")
    end

def test_good_wizard_has_an_alignment
    assert_equal(true, @good_wizard.alignment)
end

def test_wizard_has_position
    assert_equal(32, @good_wizard.position)
end

def test_wizard_asks_question
    question = @good_wizard.ask_question()
    assert_equal(@question2, question)
end

def test_player_was_rewarded
    @good_wizard.reward(@player)
    assert_equal(2, @player.position)
end
    
def test_player_was_punished
    @player.position =10
    @bad_wizard.reward(@player)
    assert_equal(8, @player.position)
end

def test_player_position_not_below_zero
    @bad_wizard.reward(@player)
    assert_equal(0, @player.position)
end


end

