require_relative './board.rb'
require_relative './tile.rb'

require 'byebug'

class Game

    def initialize
        @board = Board.new
        @position
            # note: format after get_move is [0, 1]
        @value
            # note: format after get_more is int
    end

    def play
        @board.import_puzzle
        @board.create_tiles
        while @board.solved == false
            @board.render

            @board.is_solved?
        end
        puts "You win! Would you like to play another puzzle?"

        # implement a loop to allow the user to play again

    end

    def get_move
        print "Enter a position and desired value (e.g., 01 9): "
        input = gets.chomp
        while self.validate_input(input) == false
            print "Wrong input. Use the format 01 9: "
            input = gets.chomp
        end
        self.validate_input(input)
        input_arr = input.split(" ")
        @position = input_arr[0].split("")
            @position.map!(&:to_i)
        @value = input_arr[1].to_i
    end

    def validate_input(input)
        nums = "0123456789"
        return false if !nums.include?(input[0])
        return false if !nums.include?(input[1])
        return false if input[2] != " "
        return false if !nums.include?(input[3])
        return false if !input.length == 4
        true
    end

end