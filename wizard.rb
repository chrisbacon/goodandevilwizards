class Wizard

attr_reader :alignment
    def initialize(alignment, power, questions)
        @alignment = alignment
        @power = power
        @questions = questions
    end

    def ask_question()
        question_to_ask = @questions.pop()
        @questions.unshift(question_to_ask)
        return question_to_ask
    end

    def reward(player)
        if @alignment
            player.position += @power
        elsif player.position > @power
            player.position -= @power
        else
            player.position = 0
        end
    end



end
