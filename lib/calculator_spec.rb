require 'spec_helper'
  class Calculator
    def add(x,y)
      x + y 
    end

    def sub(x,y)
      x-y
    end

    def self.print_name
      "simple calculator"
    end
  end

  RSpec.describe 'testing calculators' do    
   context "operations" do 
    it "adds 2 and 3 and gives us 5" do 
      calc = Calculator.new
      expect(calc.add(2,3)).to eq(5)
    end

    it "subtracts 2 from 3 and gives us 1" do 
      calc = Calculator.new
      expect(calc.sub(3,2)).to eq(1)
    end
   end
  end

