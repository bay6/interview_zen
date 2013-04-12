require 'rspec'
load 'fibonacci.rb'

describe 'fibonacci cal' do
  it 'should retrun 55 input 55' do
    fibonacci(10).should eq 55
  end

  it 'should return 0 input 0' do
    fibonacci(0).should eq 0
  end
  
  it 'should return 1 input 1' do
    fibonacci(1).should eq 1
  end

  it 'should return error input -1' do
    expect {fibonacci(-1)}.to raise_error
  end

  it "should raise error while input 'abc'" do
    expect {fibonacci('abc')}.to raise_error
  end

  it 'should return error input nothing' do
    expect {fibonacci}.to raise_error
  end
end