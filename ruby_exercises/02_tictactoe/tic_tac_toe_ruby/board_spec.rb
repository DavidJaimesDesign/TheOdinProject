require "Board"

describe "The move board" do 
  it "Places either x or 0 on the board given the posisition" do
    board = Array.new(9, nil)
    expect(move(board, 1, "X")).to eq(board[1] = "X")
  end
end

describe "the victory conditions method" do 
  it "returns false uness victory conditions have been met" do
    board = Array.new(9, nil)
    expect(victory_conditions(board, "X")).to eq(false)
    board2 = Array.new(9, nil)
    board2[0] = "X"
    board2[1] = "X"
    board2[2] = "X"
    expect(victory_conditions(board2, "X")).to eq(true)
    board3 = Array.new(9, nil)
    board3[0] = "X"
    board3[1] = "O"
    board3[2] = "X"
    board3[3] = "O"
    board3[4] = "O"
    board3[5] = "X"
    board3[6] = "O"
    board3[7] = "X"
    board3[8] = "O"
    expect(victory_conditions(board3, "X")).to eq(false)
  end
end
