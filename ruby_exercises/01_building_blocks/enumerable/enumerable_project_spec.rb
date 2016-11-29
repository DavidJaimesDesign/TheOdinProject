require "enumerable_project"

describe Enumerable do
	describe "#my_each" do
		it "has a #my_each method" do
			expect([]).to respond_to(:my_each)
		end

		it "Go through an array and apply a block" do
			expect([1,2,3,4].my_each{|i| print i}).to eq([1,2,3,4])  
		end

		it "should return an Enumerator if there is no block" do
			expect([1,2,3,4].my_each).to be_an(Enumerator)
		end

	end

	describe "#my_each_with_index" do 
		it "has a #my_each_with_index method" do
			expect([]).to respond_to(:my_each_with_index)
		end

		it "goes through each index and value in an array" do
			expect(["a", "b", "c", "d"].my_each_with_index{|index, value| print "#{index}: #{value}"}).to eq(["a", "b", "c", "d"])
		end

		it "should return an Enumerator if there is no block" do
			expect(["a", "b", "c", "d"].my_each_with_index).to be_an(Enumerator)
		end

	end

	describe "#my_select" do
		it "has a #my_select method" do
			expect([]).to respond_to(:my_select)
		end

		it "should return an Enumerator if there is no block" do
			expect([1,2,3,4].my_select). to be_an(Enumerator) 
		end

		it "Returns an array w/ all elements of enum where the block is true" do
			expect([1,2,3,4].my_select{|i| i.even?}).to eq([2,4])
			expect([1,2,3,4].my_select{|i| i == 7}).to eq([])
		end
	end

	describe "#my_all?" do
		it "has a #my_all? method" do
			expect([]).to respond_to(:my_all?)
		end

		it "Goes through each element and returns true if there are no nil or false values in the block" do
			expect([1,2,3,4].my_all?{|int| int > 0}).to eq(true)
		end

		it "Returns false if there is a nil value" do 
			expect([nil, 1, 2, 3].my_all?{|int| int.is_a? Integer}).to eq(false)
		end

		it "Returns false if there is a false value" do
			expect([1,2,3,4].my_all?{|int| int > 1}).to eq(false)
		end

		it "Has a default block {|obj| obj} that returns true when there are no nil or false values" do
			expect([1,2,3,4].my_all?).to eq(true)
		end

		it "returns false in default block when there is a nil value" do 
			expect([1,nil,3,4].my_all?).to eq(false)
		end

		it "returns false in default block when ther is a false value" do
			expect([1,2,false,4].my_all?).to eq(false)
		end

	end

	describe "my_any?" do 
		it "has a #my_any? method" do
			expect([]).to respond_to(:my_any?)
		end

		it "Returns true if any value evaled by block returns true if not returns false" do
			expect([1,2,3,4].my_any?{|x| x == 1}).to eq(true)
			expect([1,1,1,1].my_any?{|x| x == 2}).to eq(false)
		end

		it "Has a default block {|obj| obj} that returns true if any value evals to true" do
			expect([false, false, true].my_any?).to eq(true)
			expect([false, false, nil].my_any?).to eq(false)
		end

	end

	describe "my_none?" do 
		it "has a #my_none? method" do
			expect([]).to respond_to(:my_none?)
		end

		it "returns true if none of the block evalutates to true" do
			expect([1,2,3,4].none?{|x| x == 7}).to eq(true)
			expect([1,2,3,4].none?{|x| x < 3}).to eq(false)
		end

		it "if there is no block it only returns true if all the values are false" do
			expect([false, false, false].none?).to eq(true)
			expect([true, false, false].none?).to eq(false)
		end

	end

	describe "my_count" do 
		it "has a #my_count method" do
			expect([]).to respond_to(:my_count)
		end

		it "returns the number of values through enumaration" do
			expect([1,1,1,1].count).to eq(4)
		end

		it "If there is a block given it counts the number of elements that evaluate to true" do
			expect([1,2,3,4].count{|x| x % 2 == 0}).to eq(2)
		end

		#it "Also takes an arg" do 
		#	expect([1,2,3].count(3)).to eq(3)
		#end
		#I don't see the point of this ability is this to find the size of the array? Idk	
	end

	describe "#my_map" do
		it "has a #my_map method" do
			expect([]).to respond_to(:my_map)
		end

		it "returns a new array where each element has been run through the block once" do
			expect([1,2,3,4].my_map{|x| x + 1}).to eq([2,3,4,5])
		end

		it "if there is no block it returns an enumerator" do
			expect([1,2,3,4].my_map).to be_an(Enumerator)
		end
	end

	describe "#my_inject" do
		it "has a #my_inject method" do
			expect([]).to respond_to(:my_inject)
		end

		it "Returns the relust of evaluating the block " do
			expect([1,2,3,4].my_inject{|x,y| x + y}).to eq(10)
			expect([3,3,3].my_inject{|x,y| x * y}).to eq(27)
		end

		it "Returns Enumerator if no block given" do
			expect([1,2,3,4].my_inject).to be_an(Enumerator)
		end

	end

	describe "multiply_els" do
		it "multiplies an array" do
			expect(multiply_els([3,3,3])).to eq(27)
		end
	end


end 
