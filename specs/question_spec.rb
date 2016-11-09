require('minitest/autorun')
require('minitest/rg')
require_relative('../question')

class TestQuestion < Minitest::Test
    def setup
        @question = Question.new('What is the capital of Spain?', 'madrid')
    end

    def test_question_has_question
        assert_equal('What is the capital of Spain?', @question.question)
    end

    def test_is_correct__right_answer
        player_answer = 'madrid'
        result = @question.is_correct?(player_answer)
        assert_equal(true, result)
    end

    def test_is_correct__wrong_answer
        player_answer = 'barcelona'
        result = @question.is_correct?(player_answer)
        assert_equal(false, result)
    end

    def test_is_correct__weird_casing
        player_answer = 'MaDrId'
        result = @question.is_correct?(player_answer)
        assert_equal(true, result)
    end
end