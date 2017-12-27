module MovingAvg
  class Evaluator
    class << self
      def error(training_items:, teacher_data:, strategy:)
        trained = MovingAvg::Base.public_send(strategy, training_items)
        (trained - teacher_data).abs
      end

      def errors(training_items:, teacher_items:, window_size:, strategy:)
        trained = MovingAvg::Helper.build_with_sliding(
          items: training_items,
          window_size: window_size,
          strategy: strategy,
        )
        trained.zip(teacher_items).map { |trained, teacher|
          (trained - teacher).abs
        }
      end
    end
  end
end
