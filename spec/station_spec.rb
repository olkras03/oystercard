require "station"

describe Station do
  it "created an instance of station" do
    station = Station.new("name", "zone")
    expect(station).to be_kind_of Station
  end

  it "has two variables: name and zone" do
    station = Station.new("name", "zone")
    expect(station.name).not_to be nil
    expect(station.zone).not_to be nil
  end
end
