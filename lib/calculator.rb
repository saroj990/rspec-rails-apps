require 'spec_helper'
class Calculator
  def add(x,y)
    x + y 
  end

  def sub(x,y)
    x-y
  end
end

RSpec.describe 'Calculator' do 
  
  it ".add" do
    calc =  Calculator.new
    result =  calc.add(2,3)
    expect(result).to eq(5)
  end

  it '.subtract' do 
    calc = Calculator.new
    result = calc.sub(3,2)
    expect(result).to eq(1)
  end
end