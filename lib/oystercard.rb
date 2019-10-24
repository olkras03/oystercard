class Oystercard
  attr_reader :balance, :in_use, :entry_station, :journeys

  LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @current_journey = []
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot top up : #{LIMIT} reached" if over_limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough balance" if @balance < MINIMUM_CHARGE
    @in_use = true
    @entry_station = station
    @current_journey << @entry_station
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @in_use = false
    @entry_station = nil
    @current_journey << station
    @journeys << @current_journey
  end

  def in_journey?
    if entry_station == nil
      false
    else
      true
    end
  end

  private

  def over_limit?(amount)
    return (@balance + amount) > LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end
end
