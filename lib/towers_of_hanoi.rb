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

end

class Disc
    attr_reader :size
    def initialize(size)
        @size = size
    end
end