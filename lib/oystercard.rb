class Oystercard
  attr_reader :balance, :in_use

  LIMIT = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Cannot top up : #{LIMIT} reached" if over_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def in_journey?
    return @in_use
  end

  private def over_limit?(amount)
    return (@balance + amount) > LIMIT
  end
end
