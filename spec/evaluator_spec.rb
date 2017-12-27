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
end
