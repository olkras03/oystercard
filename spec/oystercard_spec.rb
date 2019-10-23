require "oystercard"

describe Oystercard do
  subject(:oystercard) { Oystercard.new }
  let(:station) {double :entry_station}
  
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

  it "raises an error if top up +balance more  then 90" do
    expect { oystercard.top_up(91) }.to raise_error "Cannot top up : #{Oystercard::LIMIT} reached"
  end

  it "tests card is not in use when it's initialized" do
    expect(oystercard).not_to be_in_journey
  end

  xit "shows if card was touched in" do
    oystercard.top_up(10)
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  xit "shows if card tas touched out" do
    oystercard.top_up(10)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end

  xit "raises exception if balance < £1" do
    expect{ oystercard.touch_in }.to raise_error "Not enough balance"
  end

  xit "deducts the correct amount from the balance" do
    oystercard.top_up(10)
    oystercard.touch_in
    expect{ oystercard.touch_out }. to change { oystercard.balance }.by(-Oystercard::MINIMUM_CHARGE)
end

  it "expects card to remember the entry station" do
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect(oystercard.entry_station).to eq(station)
  end
end
