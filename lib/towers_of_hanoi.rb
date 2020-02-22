require_relative 'array_methods'

class Game
    def initialize
        @board = Board.new
    end
end

class Board
    attr_accessor :columns
    def initialize
        @columns = Array.new(3) { Array.new(4) }
        fill_board
    end

    def fill_board
        disc_size = @columns[0].length
        @columns[0].each_with_index do |_,index|
            @columns[0][index] = disc_size
            disc_size -= 1
        end
    end

    def render
        transposed_cols = @columns.transpose
        transposed_cols.each do |print_row|
            print_string = ""
            print_row.each do |char|
                if char.nil? then
                    print_string += "_ "
                else
                    print_string = char.to_s + " "
                end
            end
            puts print_string
        end
    end

end

class Disc
    attr_reader :size
    def initialize(size)
        @size = size
    end
end