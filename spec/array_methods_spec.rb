require 'rspec'
require 'array_methods'

describe Array do
    describe "#my_uniq" do
        let(:test) { [0,1,1,2,2,3,4,4] }
        let(:test2) { [0,1,0,2,4,1,4,3,1] }
        it "returns an array" do
            expect(test.my_uniq).to be_a(Array)
        end
        it "returns the unique items from the array" do
            expect(test.my_uniq).to eq([0,1,2,3,4])
            
        end
        it "sorts items" do
            expect(test2.my_uniq).to eq([0,1,2,3,4])
        end
        it "makes a new array" do
            expect(test.my_uniq).not_to be(test)
        end
    end

    describe "#two_sum" do
        it "returns the pairs that add to zero" do
            expect([-2,4,0,2,3,-4].two_sum).to include([0,3],[1,5])
        end
        it "returns the pairs in dictionary order (lowest index first)" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
        end
        it "returns an empty array when no pairs are found" do
            expect([-1,-3,4,2].two_sum).to eq([])
        end
    end
end