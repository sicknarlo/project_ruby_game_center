=begin
  
  Player ->
    
    valid_move?
      returns true if move within (0..6) and col not full
      returns false if move outside (0..6)
      returns false if col full
  
=end

require "board"
require "player"

describe Player do

  let(:player){Player.new(1)}
  let(:board){Board.new}

  describe "#num" do

    it "has a player number method" do
      expect(player).to respond_to(:num)
    end

    it "has a player number 2" do
      player2 = Player.new(2)
      expect(player2.num).to eq(2)
    end

  end


  describe "valid_move?" do

    it "returns true if move is within 0 and 6 and board[col] not full" do
      result = player.valid_move?(board, 4)
      expect(result).to be true
    end

    it "returns false if move not between 0 and 6" do
      result = player.valid_move?(board, 7)
      expect(result).to be false
    end

    it "returns false if board[col] is full" do
      board.game[4] = [1,1,1,1,1,1]
      result = player.valid_move?(board,4)
      expect(result).to be false
    end

  end

end
