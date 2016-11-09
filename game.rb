class Game

attr_reader :turn, :current_player

    def initialize(board, players)
        @board = board
        @players = players
        @current_player = players[0]  
        @game_running = true
    end

    def run_game()
        puts "Game starting!"
        while @game_running
            puts "#{current_player.name} is up! press enter to roll"
            gets.chomp
            roll = roll_dice()
            puts "#{@current_player.name} rolled a #{roll}!"
            wizard = move(roll)
            print_current_player_position()
            if wizard
                puts "A wizard appears!"
                if wizard.alignment
                    puts "He is a good wizard! Answer correctly for a reward"
                else
                    puts "He is a bad wizard! Answer correctly to avoid punishment"
                end
                question = wizard.ask_question()
                puts question.question
                player_answer = gets.chomp
                if question.is_correct?(player_answer)
                    puts "Correct!"
                    wizard.reward(@current_player) if wizard.alignment
                else 
                    puts "Incorrect!"
                    wizard.reward(@current_player) unless wizard.alignment
                end
                print_current_player_position()
            end
            if winner?()
                puts "#{@current_player.name} is the winner!"

                @game_running = false
            end
            change_turn()
            "#It is now {@current_player.name}"
        end

    end

    def print_current_player_position()
        puts "#{@current_player.name} is at #{@current_player.position}"
    end

    def move(roll)
        @current_player.position += roll
        return @board.tiles[@current_player.position]
    end

    def change_turn()
        old_player = @players.shift()
        @players.push(old_player)
        @current_player = @players[0]  
    end

    def winner?()
                return true if @current_player.position >= @board.size
    end

    def roll_dice()
        return rand(1..6)
    end
end
