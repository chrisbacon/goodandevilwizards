class Question
    attr_reader :question
    def initialize(question, answer)
        @question = question
        @answer = answer
    end

    def is_correct?(player_answer)
        return @answer == player_answer.downcase
    end
end