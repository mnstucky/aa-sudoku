require 'byebug'
require_relative './tile.rb'

class Board

    def initialize
        @board = Array.new(9) { Array.new(9) }
        @solved = false
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

    def render
        system('clear')
        @board.each do |row|
            row.each do |tile|
                print tile.value.to_s + " "
            end
            puts
        end
    end
    
    def is_solved?
        @board.each do |row|
            nums = []
            (0..9).each { |num| nums << num }
            row.each do |tile|
                if nums.include?(tile.value)
                    nums.delete(tile.value)
                else
                    return false
                end
            end
        end
        (0..8).each do |idx|
            nums = []
            (0..9).each { |num| nums << num }
            @board.each do |row|
                if nums.include?(row[idx].value)
                    nums.delete(row[idx].value)
                else
                    return false
                end
            end
        end
        true
    end

    def edit_tile(tile, value)
        tile.edit(value)
    end

end