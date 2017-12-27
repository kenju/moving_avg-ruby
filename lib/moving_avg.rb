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

      # EWMA - Exponentially Weighted Moving Average
      def exponentially_weighted_moving_average(u)
        factor = 2.0 / (u.size + 1) # 2 / (N + 1) a.k.a. smoothing factor
        weighted = exponentially_weighting(u, factor)
        weighted.last
      end
      alias_method :ewma, :exponentially_weighted_moving_average

      # MMA - Modified Moving Average
      def modified_moving_average(u)
        factor = 1.0 / u.size # 1 / N
        weighted = exponentially_weighting(u, factor)
        weighted.last
      end
      alias_method :mma, :modified_moving_average

      private

      def exponentially_weighting(u, factor)
        u.inject([]) { |acc, x|
          acc << factor * x + (1 - factor) * (acc.last || x)
        }
      end

      def sum_vector(u)
        u.reduce(0) { |x, y| x + y }
      end
    end
  end
end
