=begin
  
  Computer ->

    get move
      type of return is int
      int is within (0..6)
  
=end

require "computer"
require "board"

describe Computer do

  let(:comp){Computer.new(1)}
  let(:board){Board.new}

  describe "#get_move" do

    it "returns an integer" do
      expect(comp.get_move(board)).to be_a(Integer)
    end


    it "returns a number greater than or equal to zero" do
      expect(comp.get_move(board)).to be >= 0
    end

    it "returns a number less than 7" do
      expect(comp.get_move(board)).to be < 7
    end


  end


end