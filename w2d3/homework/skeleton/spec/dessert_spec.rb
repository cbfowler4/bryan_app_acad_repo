require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new("brownie", 100, chef)}

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("brownie")
    end 

    it "sets a quantity" do 
      expect(dessert.quantity).to eq(100)
    end 

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect {Dessert.new("brownie", "lots of food", chef)}.to raise_error(ArgumentError)
    end 
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient("eggs")
      expect(dessert.ingredients).to include('eggs')
    end 
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      new_ing = %w(eggs flour sugar chocolate milk)
      
      new_ing.each do |ing|
        dessert.add_ingredient(ing)
      end
        
      expect(dessert.ingredients).to eq(new_ing)
      dessert.mix!
      expect(dessert.ingredients).to_not eq(new_ing)
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(dessert.quantity).to eq(100)
      dessert.eat(50)
      expect(dessert.quantity).to eq(50)
    end 

    it "raises an error if the amount is greater than the quantity" do 
      expect(dessert.quantity).to eq(100)
      expect {dessert.eat(200)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("Chef Bryan The Great Baker")
      expect(dessert.serve).to include("Chef Bryan The Great Baker has made 100 brownies!")
    end 
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      allow(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end 
  end
end
