require 'flow_cache'
require 'test/unit'

class TestPoisson < Test::Unit::TestCase
  def setup
    @flow = Poisson.new(1.0/40)
  end

  def test_average
    samples = []
    1000000.times { samples << @flow.next_time }
    average = (samples.inject(0.0) { |sum, value| sum += value })/1000000.0
    assert((average - 40.0).abs < 1, "The average was #{average}")
  end
end
