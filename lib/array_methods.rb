require 'byebug'

class Array

    def my_uniq
        output = []
        # debugger
        self.each do |item|
            output << item if !output.include?(item)
        end
        output.sort
    end

    def two_sum
        output = []
        self.each_with_index do |item1,index1|
            index2 = index1+1
            # debugger
            break if index1 >= self.length-1
            until index2 == self.length
                # debugger
                output << [index1,index2] if -item1 == self[index2]
                index2+=1
            end
        end
        output
    end



end