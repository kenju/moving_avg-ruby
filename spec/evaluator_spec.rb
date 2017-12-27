RSpec.describe MovingAvg::Evaluator do
  describe ".error" do
    it do
      items = [100, 200, 300] # SMA() gonna be 200.0
      actual = MovingAvg::Evaluator.error(
        training_items: items,
        teacher_data: 210.0,
        strategy: :simple_moving_average,
      )
      expected = 10.0 # |200.0 - 210.0|
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
