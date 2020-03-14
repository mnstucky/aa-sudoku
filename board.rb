require 'byebug'
require_relative './tile.rb'

class Board

    def initialize
        @board = Array.new(9) { Array.new(9) }
    end

    def import_puzzle
        puts "What puzzle would you like to play? Your options are as follows: "
        puts Dir.entries("./puzzles/")
        file_name = gets.chomp
        while (!File.exist?('./puzzles/' + file_name))
            print "Wrong input. Enter a valid file name: "
            file_name = gets.chomp
        end
        input_arr = File.read('./puzzles/' + file_name).split("\n")
        input_arr.map! { |row| row.split('') }
        input_arr.map! do |row|
            row.map! { |num| num.to_i }
        end
        return input_arr
    end

    def create_tiles
        input_arr = self.import_puzzle
        input_arr.each.with_index do |row, row_idx|
            row.each.with_index do |num, column_idx|
                @board[row_idx][column_idx] = Tile.new(num)
            end
        end
    end

end