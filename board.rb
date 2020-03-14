require 'byebug'

class Board

    def initialize
        
    end

    def import_puzzle
        # debugger
        puts "What puzzle would you like to play? Your options are as follows: "
        puts Dir.entries("./puzzles/")
        file_name = gets.chomp
        while (!File.exist?('./puzzles/' + file_name))
            print "Wrong input. Enter a valid file name: "
            file_name = gets.chomp
        end
        first_input = File.read('./puzzles/' + file_name).split("\n")
        first_input.map! { |row| row.split('') }
        return first_input  
    end

    def create_cards
        first_input = self.import_puzzle

        # make 30 squares "fixed" and displayed to the user

end

b = Board.new
b.import_puzzle