require "moving_avg/version"

module MovingAvg
  class Base
    class << self
      # SMA - Simple Moving Average
      #
      # https://en.wikipedia.org/wiki/Moving_average#Simple_moving_average
      def simple_moving_average(u)
        sum_vector(u).to_f / u.size
      end
      alias_method :sma, :simple_moving_average

      # WMA - Weighted Moving Average
      #
      # https://en.wikipedia.org/wiki/Moving_average#Weighted_moving_average
      def weighted_moving_average(u)
        weights = (1..u.size).to_a.reverse # [n, n-1, n-2 ... 2, 1]
        weighted = weights.zip(u).map { |w, x| w * x  }
        sum_vector(weighted).to_f / sum_vector(weights)
      end
      alias_method :wma, :weighted_moving_average
      alias_method :lwma, :weighted_moving_average

      # EWMA - Exponentially Weighted Moving Average
      #
      # https://en.wikipedia.org/wiki/Moving_average#Exponential_moving_average
      def exponentially_weighted_moving_average(u)
        factor = 2.0 / (u.size + 1) # 2 / (N + 1) a.k.a. smoothing factor
        weighted = exponentially_weighting(u, factor)
        weighted.last
      end
      alias_method :ewma, :exponentially_weighted_moving_average

      # MMA - Modified Moving Average
      #
      # https://en.wikipedia.org/wiki/Moving_average#Modified_moving_average
      def modified_moving_average(u)
        factor = 1.0 / u.size # 1 / N
        weighted = exponentially_weighting(u, factor)
        weighted.last
      end
      alias_method :mma, :modified_moving_average

      # SMM - Simple Moving Median
      #
      # https://en.wikipedia.org/wiki/Moving_average#Moving_median
      def simple_moving_median(u)
        sorted = u.sort
        len = sorted.length
        (sorted[(len - 1) / 2] + sorted[len / 2]) / 2
      end
      alias_method :smm, :simple_moving_median

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
