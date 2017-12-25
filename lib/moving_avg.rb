require "moving_avg/version"

require "pry"

module MovingAvg
  class Base
    class << self
      # SMA - Simple Moving Average
      def simple_moving_average(u)
        sum_vector(u).to_f / u.size
      end
      alias_method :sma, :simple_moving_average

      # WMA - Weighted Moving Average
      def weighted_moving_average(u)
        weights = (1..u.size).to_a.reverse # [n, n-1, n-2 ... 2, 1]
        weighted = weights.zip(u).map { |w, x| w * x  }
        sum_vector(weighted).to_f / sum_vector(weights)
      end
      alias_method :wma, :weighted_moving_average

      private

      def sum_vector(u)
        u.reduce(0) { |x, y| x + y }
      end
    end
  end
end
