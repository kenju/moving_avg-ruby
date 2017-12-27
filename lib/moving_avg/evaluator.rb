module MovingAvg
  class Evaluator
    class << self
      def error_sum(training_items:, teacher_items:, window_size:, strategy:)
        errors = self.errors(
          training_items: training_items,
          teacher_items: teacher_items,
          window_size: window_size,
          strategy: strategy,
        )
        errors.reduce(0) { |x, y| x + y }
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
