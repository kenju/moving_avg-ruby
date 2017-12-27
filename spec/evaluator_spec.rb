RSpec.describe MovingAvg::Evaluator do
  describe ".error_sum" do
    it "(print error result just for debugging)" do
      training_items = [100, 300, 350, 280, 500]
      teacher_items = [110.0, 200.0, 300.0]
      %i(sma wma ewma mma).each { |strategy|
        error = MovingAvg::Evaluator.error_sum(
          training_items: training_items,
          teacher_items: teacher_items,
          window_size: 3,
          strategy: strategy,
        )
        puts "#{strategy.to_s.ljust(4).rjust(10)} = #{error}"
      }
    end

    it do
      training_items = [100, 200, 300, 400, 500]
      teacher_items = [100.0, 100.0, 100.0, 100.0]
      actual = MovingAvg::Evaluator.error_sum(
        training_items: training_items,
        teacher_items: teacher_items,
        window_size: 2,
        strategy: :simple_moving_average,
      )
      expected = 800.0 # 50.0 + 150.0 + 250.0 + 250.0
      expect(actual).to eq expected
    end

    context "when NaN included" do
      it "just ignore NaN" do
        nan = 0.0 / 0.0
        training_items = [100, 300, nan] # SMA() gonna be 200.0
        teacher_items = [100.0, 100.0]
        actual = MovingAvg::Evaluator.error_sum(
          training_items: training_items,
          teacher_items: teacher_items,
          window_size: 2,
          strategy: :simple_moving_average,
        )
        expected = 100.0 # |200 - 100| + |NaN - 100|
        expect(actual).to eq expected
      end
    end
  end

  describe ".errors" do
    it do
      training_items = [100, 200, 300, 400, 500] # SMA() gonna be 200.0
      teacher_items = [100.0, 100.0, 100.0, 100.0]
      actual = MovingAvg::Evaluator.errors(
        training_items: training_items,
        teacher_items: teacher_items,
        window_size: 2,
        strategy: :simple_moving_average,
      )
      expected = [
        MovingAvg::Base.sma([100, 200]) - teacher_items[0],
        MovingAvg::Base.sma([200, 300]) - teacher_items[1],
        MovingAvg::Base.sma([300, 400]) - teacher_items[2],
        MovingAvg::Base.sma([400, 500]) - teacher_items[3],
      ]
      expect(actual).to eq expected
    end
  end
end
