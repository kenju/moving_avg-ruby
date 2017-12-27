module MovingAvg
  class Helper
    class << self
      # repeatedly calculate moving average
      # separating items by window size.
      # the first N-1 items should be padded
      # or calculated from inconvinient data
      def build_with_sliding(items:, window_size:, strategy:)
        map_with_sliding(
          items: items,
          window_size: window_size,
        ).map { |data|
          MovingAvg::Base.public_send(strategy, data)
        }
      end

      def map_with_sliding(items:, window_size:)
        items.each_with_object([]) { |val, acc|
          if acc.last.nil?
            # the first time
            acc << [val]
          elsif acc.last.size < window_size
            # the first window
            acc.last << val
          else
            # the following windows
            next_window = acc.last.dup
            next_window.shift
            next_window << val
            acc << next_window
          end
        }
      end
    end
  end
end
