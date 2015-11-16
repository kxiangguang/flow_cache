class Poisson
  attr_reader :average_rate

  def initialize(average_rate)
    @average_rate = average_rate.to_f
    raise ArgumentError.new("Rate cannot be 0") if @average_rate ==  0.0
  end

  def next_time
    -Math.log(1.0 - rand)/@average_rate
  end
end

