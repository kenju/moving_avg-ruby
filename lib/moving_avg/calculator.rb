module MovingAvg
  class Calculator
    attr_reader :strategy, :options

    def initialize(strategy:, options: {})
      @strategy = strategy
      @options = options
    end

    def moving_avg(items)
      MovingAvg::Base.public_send(strategy, items)
    end
  end
end
