require "oystercard"

describe Oystercard do
  subject(:oystercard) { Oystercard.new }
  let(:station1) {double :entry_station}
  let(:station2) {double :exit_station}
  
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

  it "shows if card was touched in" do
    oystercard.top_up(10)
    oystercard.touch_in(station1)
    expect(oystercard).to be_in_journey
  end

  it "shows if card tas touched out" do
    oystercard.top_up(10)
    oystercard.touch_in(station1)
    oystercard.touch_out(station2)
    expect(oystercard).not_to be_in_journey
  end

  it "raises exception if balance < £1" do
    expect{ oystercard.touch_in(station1) }.to raise_error "Not enough balance"
  end

  it "deducts the correct amount from the balance" do
    oystercard.top_up(10)
    oystercard.touch_in(station1)
    expect{ oystercard.touch_out(station2) }. to change { oystercard.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end

  it "expects card to remember the entry station" do
    oystercard.top_up(10)
    oystercard.touch_in(station1)
    expect(oystercard.entry_station).to eq(station1)
  end

  it "expects card the reset to nil" do
    oystercard.top_up(10)
    oystercard.touch_in(station1)
    oystercard.touch_out(station2)
    expect(oystercard.entry_station).to eq(nil)
  end

  it "checks if card has empty list of journeys" do
  expect(oystercard.journeys).to be_empty
  end

  it "creates list of journey after touch out" do
    oystercard.top_up(10)
    oystercard.touch_in(station1)
    oystercard.touch_out(station2)
    p oystercard.journeys
    expect(oystercard.journeys).to include [station1, station2]
  end
end
