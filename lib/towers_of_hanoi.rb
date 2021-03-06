require_relative 'array_methods'
require 'byebug'

class Game
    def initialize(size)
        @board = Board.new(size)
    end

    def play
        while !@board.won? do
            @board.render
            puts "Whats the move man?"
            move = gets.chomp.split(",").map(&:to_i)
            # debugger
            begin
                @board.move(*move)
            rescue => exception
                puts exception.message
                sleep(2)
            end
            system 'clear'
        end
        @board.render
        puts "WINNER"
    end
end

class Board
    attr_accessor :columns
    def initialize(size)
        @size = size
        @columns = Array.new(3) { Array.new(size) }
        fill_board
    end

    def fill_board
        disc_size = 1
        @columns[0].each_with_index do |_,index|
            self[[0,index]] = Disc.new(disc_size,[0,index])
            disc_size += 1
        end
    end

    def move(from,to)
        # debugger
        from_item = pickup_disc(from)
        raise ArgumentError.new "Invalid pickup column" if from_item == nil
        place_index = place_index(from_item,to)
        self[place_index] = from_item
        self[from_item.pos] = nil
        from_item.pos = place_index
    end

    def won?
        return true if @columns.last() == [1..@size]
        last_col = @columns.last()
        last_col.each_with_index do |item,index|
            return false if item.nil?
            return false if item.size != index+1
        end 
        true
    end

    def []=(pos,val)
        @columns[pos[0]][pos[1]] = val
    end

    def [](pos)
        @columns[pos[0]][pos[1]]
    end

    def place_index(move_item,to_column)
        col = @columns[to_column]
        place_index = nil
        col.each_with_index do |item,index|
            if item.is_a?(Disc)
                raise ArgumentError.new "Stack is full" if index == 0
                raise ArgumentError.new "Cannot place disc on smaller disc" if item.size < move_item.size
                return place_index
            else
                place_index = [to_column,index]
            end
        end
        place_index
    end

    def pickup_disc(from_column)
        col = @columns[from_column]
        col.each do |item|
            return item if item.is_a?(Disc)
        end
        nil
    end

    def render
        transposed_cols = @columns.transpose
        # debugger
        transposed_cols.each do |print_row|
            print_string = ""
            print_row.each do |item|
                if item.nil? then
                    print_string += "_ "
                else
                    print_string += item.size.to_s + " "
                end
            end
            puts print_string
        end
    end

end

class Disc
    attr_reader :size
    attr_accessor :pos
    def initialize(size,pos)
        @size = size
        @pos = pos
    end
end