require "bubblesort_array_methods"

describe "the bubble_sort method" do
  it "bubble sorts arrays" do
    expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
  end

  it "bubble sorts even more arrays" do
  	expect(bubble_sort([1,0,0,0,0])).to eq([0,0,0,0,1])
  end
end

describe "the bubble_sort_by method" do
  it "sorts arrays but accepts a block" do
    expect(bubble_sort_by(["hi","hello","hey"]) do |left,right| left.length - right.length end).to eq(["hi","hey","hello"])
 end
end
