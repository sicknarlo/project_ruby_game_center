=begin
  
   Board ->

    init
      returns a 7 x 6 array populated with 0s

    move
      changes correct spot on board

    victory?
      true when vertical victory present
      true when horizontal victory present
      true when diaganol victory present, \
      true when diaganol victory present, /
      false when no victory present
      (many edge cases)
  
=end

require "board"

describe Board do

  let(:board){Board.new}

  describe "#initialize" do

    it "creates a game board populated with 0s" do
      empty_array = Array.new(7) { Array.new(6) { 0 }  }
      expect(board.game).to eq(empty_array)
    end

  end

  describe "#move" do

    it "adds the move to the last position of an empty column" do
      result = board.move(0,1)
      expect(board.game[0][-1]).to eq(1)
    end

    it "adds the move to the right place in a non-full column" do
      board.game[0][-1] = 1
      result = board.move(0,2)
      expect(board.game[0][-2]).to eq(2)
    end

  end

  describe "#victory?" do

    it "is false when no victory is present" do
      expect(board.victory?).to be false
    end

    it "is true when a vertical victory is present" do
      4.times do |i|
        board.game[i][0] = 1
      end
      expect(board.victory?).to be true

    end

    it "is true when a horizontal victory is present" do
      board.game[0] = [1,1,1,1,0,0]
      expect(board.victory?).to be true
    end

    it "is true when a horizontal victory is present among opponent pieces" do
      board.game[0] = [2,1,2,2,2,2]
      expect(board.victory?).to be true
    end

    it "is true when a \\ diagonal victory is present" do
      board.game = [
        [1,0,0,0,0,0],
        [0,1,0,0,0,0],
        [0,0,1,0,0,0],
        [0,0,0,1,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0]
      ]
      expect(board.victory?).to be true
    end

    it "is true when a / diagonal victory is present" do
      board.game = [
        [0,0,0,0,0,0],
        [0,0,0,0,0,1],
        [0,0,0,0,1,0],
        [0,0,0,1,0,0],
        [0,0,1,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0]
      ]
      expect(board.victory?).to be true
    end

  end
  
end