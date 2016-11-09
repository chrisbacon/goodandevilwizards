require_relative('wizard')
require_relative('question')
require_relative('player')
require_relative('board')
require_relative('game')

question1 = Question.new("What is the longest river in the world", "nile")
question2 = Question.new("What is the capital of Scotland?", "edinburgh")
question3 = Question.new("How many students are there in cohort 8?", "19")
question4 = Question.new("What is the french word for Tuesday?", "mardi")
question5 = Question.new("Who is the current tennis number one?", "andy murray")
question6 = Question.new("how planets in the solar system", "9")

question7 = Question.new("Who is the next president?",  "trump")
question8 = Question.new("How many continents are there?", "7")


questions = [question1, question2,question3,question4,question5,question6,question7,question8]

good_wizard1 = Wizard.new(true, 2, questions, 7)
good_wizard2 = Wizard.new(true, 2, questions, 10)
good_wizard3 = Wizard.new(true, 2, questions, 16)
good_wizard4 = Wizard.new(true, 2, questions, 22)

bad_wizard1 = Wizard.new(false, 2, questions, 3)
bad_wizard2 = Wizard.new(false, 2, questions, 6)
bad_wizard3 = Wizard.new(false, 2, questions, 19)
bad_wizard4 = Wizard.new(false, 2, questions, 22)

board = Board.new(25)
board.add_wizards_to_board([good_wizard1, good_wizard2, good_wizard3, good_wizard4, bad_wizard1, bad_wizard2, bad_wizard3, bad_wizard4])
player1 = Player.new("Tegan")
player2 = Player.new("Chris")
game = Game.new(board, [player1, player2])

game.run_game()