require "oystercard"

describe Oystercard do
  subject(:oystercard) { Oystercard.new }

  it "should be an instance of Oystercard" do
    expect(oystercard).to be_instance_of Oystercard
  end

  it "responds to balance" do
    expect(oystercard).to respond_to(:balance)
  end

  it "shows initial balance as 0" do
    expect(oystercard.balance).to eq(0)
  end

  it "tops up balance" do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq(10)
  end

  it "raises an error if top up more then 90" do
    expect { oystercard.top_up(91) }.to raise_error "Cannot top up : #{Oystercard::LIMIT} reached"
  end

  it "deducts money from the card" do
    oystercard.deduct(5)
    expect(oystercard.balance).to eq(-5)
  end

  it "tests card is not in use when it's initialized" do
    expect(oystercard.in_use).to eq false
  end

  it "shows if card was touched in" do
    expect(oystercard.in_use).to eq true
  end
end
