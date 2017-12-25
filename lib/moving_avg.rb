require "moving_avg/version"

module MovingAvg
  class Base
    class << self
      # SMA - Simple Moving Average
      def simple_moving_average(u)
        total = u.reduce(0) { |x, y| x + y }
        total.to_f / u.length
      end
      alias_method :sma, :simple_moving_average
    end
  end
end
