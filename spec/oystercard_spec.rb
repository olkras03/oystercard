require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }

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
end
