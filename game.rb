require_relative './board.rb'

class Game

    def initialize
        @board = Board.new
    end

    def play
        @board.import_puzzle
        @board.create_tiles
        while @board.solved == false


            @board.is_solved?
        end
        puts "You win! Would you like to play another puzzle?"

        # implement a loop to allow the user to play again

    end

end