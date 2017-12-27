RSpec.describe MovingAvg::Evaluator do
  describe ".error_sum" do
    it do
      training_items = [100, 200, 300, 400, 500] # SMA() gonna be 200.0
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
