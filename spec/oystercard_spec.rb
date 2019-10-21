require 'oystercard'

describe Oystercard do
  it 'should be an instance of Oystercard' do
    expect(subject).to be_instance_of Oystercard
  end
  
  it 'should respond to balance' do
    expect(subject).to respond_to(:balance)
  end
end