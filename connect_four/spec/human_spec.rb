=begin
  
  Human ->

    get move
      type of return is int
      int is within (0..6)
  
=end

require "human"
require "board"

describe Human do

  let(:player){Human.new(1)}
  let(:board){Board.new}


  describe "#get_move" do
    
    context "when first input is good" do

      before do
      player.stub(:gets).and_return("1", "8")
      end

      it "returns an integer" do
        expect(player.get_move(board)).to be_a(Integer)
      end


      it "returns a number between 0 and 6" do
        expect(player.get_move(board)).to be_between(0, 6).inclusive
      end

    end

    context "when first input is bad" do

      before do
      player.stub(:gets).and_return("8", "1")
      end

      it "returns 0 when prompted with 8 and then 1" do
        expect(player.get_move(board)).to eq(0)
      end

    end

  end


end