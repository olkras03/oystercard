require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it "should be an instance of Oystercard" do
    expect(oystercard).to be_instance_of Oystercard
  end

  it "should respond to balance" do
    expect(oystercard).to respond_to(:balance)
  end

  it "should show initial balance as 0" do
    expect(oystercard.balance).to eq(0)
  end

  it "should top up balance" do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq(10)
  end
end
